<?php

function getInfoSensorUserLastDate($userMail) {
    include_once("Projet/modele/infoDB.php");
    $conn = connectionToDB();
    $sql = "SELECT s.id_sensor, NVL(MAX(d.date_end), '2000-01-01 00:00:00') as lastRegister, s.typeSensor
            FROM utilisateur u
            LEFT JOIN sensor s ON u.id_Box=s.id_Box
            LEFT JOIN datasensor d ON s.id_sensor=d.id_sensor
            WHERE u.mail =:mail
            GROUP BY s.id_sensor";
    $commande = $conn->prepare($sql);
    $commande->bindValue(':mail', $userMail);
    $bool = $commande->execute();
    $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
    return $resultat;
}

function insertNewNightSensordata($newSensordata) {
    // Création de la connection à la base de données
    include_once("Projet/modele/infoDB.php");
    $conn = connectionToDB();
    // Requete SQL
    try{
        $sql = "INSERT INTO datasensor (id_data, id_sensor, dataFile, date_start, date_end)
        VALUES (:idData, :idSensor, :dataFile, :dateStart, :dateEnd)";
        $commande = $conn->prepare($sql);
        $commande->bindValue(':idData', $newSensordata['id_data']);
        $commande->bindValue(':idSensor', $newSensordata['id_sensor']);
        $commande->bindValue(':dataFile', $newSensordata['dataFile']);
        $commande->bindValue(':dateStart', $newSensordata['date_start']);
        $commande->bindValue(':dateEnd', $newSensordata['date_end']);
        $commande->execute();    
    }
    catch(PDOException $e){
        echo utf8_encode("Echec de connection passerelle-serveur : Des données sont déjà dans la base de données" . "\n");
        //echo utf8_encode("Echec de connection passerelle-serveur : " . $e->getMessage() . "\n");
      //  die();
    }
    // Fermeture de la base de données
    $conn = null;
}


function reloadUserData($userMail) {
    $txt = $GLOBALS['translat'];
    // Récupération des datas de la passerelle
    $ch = curl_init(); 
    curl_setopt($ch, CURLOPT_URL, "http://projets-tomcat.isep.fr:8080/appService?ACTION=GETLOG&TEAM=G075"); 
    curl_setopt($ch, CURLOPT_HEADER, FALSE); 
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE); 
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
    $data = curl_exec($ch); 
    curl_close($ch);

    // Segmentation de la donnée en trame de données
    $data = str_split($data,33);

    // Récuperation des infos des sensorUser
    $infoUser = getInfoSensorUserLastDate($userMail);

   // print_r($infoUser);
   // echo "<br><br><br>";
    //print_r($data);
    
    // Filtre pour n'avoir que les données de l'user et qui ne soit pas déjà dans la BDD
    $data = array_filter($data, function($trame) use ($infoUser){
        // Info trame
        $typeTrame = substr($trame,0,1); 
        $numOjet = substr($trame,1,4); 
        $typeRequete = substr($trame,5,1); 
        // Info sensor
        $typeSensor = substr($trame,6,1); 
        $numSensor = substr($trame,7,2); 
        // Info date + convert string to date
        $thedate = substr($trame, 19,14); 
        $thedate = strtotime($thedate);
        $thedate = date("Y-m-d H:i:s", $thedate);

        // Recherches afin de savoir si la trame est un des capteurs de l'user
        $isUserSensor = false;
        foreach($infoUser as $sensorU) {
            // Lie des valeurs des sensorType de la BDD à la passerelle
            $idSensor = 0;
            switch ($sensorU['typeSensor']) {
                case 'temperatureSensor': $idSensor = "3"; break;
                case 'humiditySensor': $idSensor = "4"; break;
                case 'soundSensor': $idSensor = "7"; break;
                case 'heartSensor': $idSensor = "9"; break;
            };
            // Si la trame est un des capteurs de l'user
            if ($typeSensor==$idSensor && $numSensor==$sensorU['id_sensor'] && $thedate > $sensorU['lastRegister']) {$isUserSensor=true;}
        }
        // Si toutes les conditions sont validées alors on conserve l'element
        return $typeTrame == "1" && $typeRequete == "1" && $isUserSensor;//&& $numOjet == "G7C1" 
    });

    //echo '<br>';echo '<br>';
   // foreach  ($data as $valeur) {print_r($valeur);echo '<br>';}

    // Pour chaque trame de données
    $result = array();  
    foreach  ($data as $valeur) {
        // décodage de la trame de donnée 
        list($t, $o, $r, $typeSensor, $numSensor, $valueSensor, $a, $x, $year, $month, $day, $hour, $min, $sec) =  
            sscanf($valeur,"%1s%4s%1s%1s%2s%4s%4s%2s%4s%2s%2s%2s%2s%2s"); 
        // Info date + convert string to date
        $dateValue = substr($valeur, 19,14); 
        $dateValue = strtotime($dateValue);
        $dateValue = date("Y-m-d H:i:s", $dateValue); 
        // Si le capteur n'a pas encore été enregistré dans la liste
        if (!isset($result[$typeSensor.$numSensor])) {
            // date start/end
            $date_start = $dateValue;
            $date_end = $dateValue;
            // Add value
            $result[$typeSensor.$numSensor] = ['id_data'=>$typeSensor.$numSensor.substr($valeur, 19,12), 'id_sensor'=>$numSensor, 
                                               'dataFile'=>[['date'=>hexdec("0x".$valueSensor), "time"=>$dateValue]], 
                                               'date_start'=>$date_start, 'date_end'=>$date_end];
        } 
        // Sinon l'etape precedante a déjà été faite
        else {
            // Il faut simplement ajouter la valeur à la liste
            array_push($result[$typeSensor.$numSensor]['dataFile'], ['date'=>hexdec("0x".$valueSensor), "time"=>$dateValue]);
            // Si la date est plus vielle alors changer date_start
            if ($dateValue < $result[$typeSensor.$numSensor]['date_start']) {
                $result[$typeSensor.$numSensor]['date_start'] = $dateValue; // n'est pas MaJ
            }
            // Si la date est plus recente alors changer date_start
            if ($dateValue > $result[$typeSensor.$numSensor]['date_end']) {
                $result[$typeSensor.$numSensor]['date_end'] = $dateValue;

            }
        }
    }

    //echo '<br><br><h4>[beta] New data incomming :</h4><br>';
    // Encode dataFile en json pour chaque capteurs et les inscrit dans la base de données
    foreach($result as $sensor) {
        // Trie des dates
        $dataSort = $sensor['dataFile'];
        usort($dataSort, function($a, $b) {
            $dateA = $a[3];
            $dateB = $b[3];
            return $dateA <=> $dateB;
        });

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //!!!!!!Le cas le plusieurs nuit n'est pas traité ici!!!!!!!!
        //!!!!!!si entre date et date-1 il y a 6h de décalage!!!!!!!
        //!!!!!!!!!!!!!!!!Alors c'est une nouvelle nuit!!!!!!!!!!!!!
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //echo '<br><br>';print_r($dataSort);echo '<br><br>';

        // Pour chaque dataSensor -> suppression de sa date
        foreach ($dataSort as &$sousArray) {unset($sousArray['time']);}
        $dataSort = array_column($dataSort, "date");
        // Encodage
        $sensor['dataFile'] = json_encode(["values"=>$dataSort]);
        // Envoye vers la base de données
        insertNewNightSensordata($sensor);
        // Vérification
        //print_r($sensor);echo '<br>';
        echo '<red style="color:red;">'. $txt['newData'] .$sensor['id_sensor'].'</red><br>';
    }
    if (count($result)==0) {
        echo '<body">'. $txt['notNewData'].'</body><br>';
    }
    //echo '<red style="color:red;">Aucune de ces données n\'ont été ajouté dans la base de données</red><br><br>';



    
   
    }
?>