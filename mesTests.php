<?php 

/*

SELECT u.*, 
       s1.id_sensor AS sensor1_id, s1.isUsed AS sensor1_isUsed, s1.isNotBroken AS sensor1_isNotBroken,
       s2.id_sensor AS sensor2_id, s2.isUsed AS sensor2_isUsed, s2.isNotBroken AS sensor2_isNotBroken,
       s3.id_sensor AS sensor3_id, s3.isUsed AS sensor3_isUsed, s3.isNotBroken AS sensor3_isNotBroken,
       s4.id_sensor AS sensor4_id, s4.isUsed AS sensor4_isUsed, s4.isNotBroken AS sensor4_isNotBroken
FROM utilisateur u
LEFT JOIN sensor s1 ON u.id_Box = s1.id_Box AND s1.typeSensor = 'soundSensor'
LEFT JOIN sensor s2 ON u.id_Box = s2.id_Box AND s2.typeSensor = 'humiditySensor'
LEFT JOIN sensor s3 ON u.id_Box = s3.id_Box AND s3.typeSensor = 'heartSensor'
LEFT JOIN sensor s4 ON u.id_Box = s4.id_Box AND s4.typeSensor = 'temperatureSensor';



SELECT utilisateur.*, sensor1.*, sensor2.*, sensor3.*, sensor4.*
            FROM utilisateur
            LEFT JOIN sensor sensor1 ON utilisateur.id_Box = sensor1.id_Box
            LEFT JOIN sensor sensor2 ON utilisateur.id_Box = sensor2.id_Box
            LEFT JOIN sensor sensor3 ON utilisateur.id_Box = sensor3.id_Box
            LEFT JOIN sensor sensor4 ON utilisateur.id_Box = sensor4.id_Box
            WHERE (sensor1.typeSensor='soundSensor')
              AND (sensor2.typeSensor='humiditySensor')
              AND (sensor3.typeSensor='heartSensor')
              AND (sensor4.typeSensor='temperatureSensor')
*/


/*
soundSensor - humiditySensor - heartSensor - temperatureSensor

          
              
                WHERE 
                (
                    (typeSensor = 'soundSensor' 
                    " .($cardiaqueStat=='Active' ? " AND (isUsed=TRUE AND isNotBroken=TRUE)": 
                       ($cardiaqueStat=='Lock' ? " AND (isUsed=FALSE OR isNotBroken=FALSE)": 
                       ""))."
                    )
                OR
                    (typeSensor = 'humiditySensor' 
                    " .($sonorStat=='Active' ? " AND (isUsed=TRUE AND isNotBroken=TRUE)": 
                       ($sonorStat=='Lock' ? " AND (isUsed=FALSE OR isNotBroken=FALSE)": 
                       ""))."
                    )
                OR
                    (typeSensor = 'heartSensor' 
                    " .($temperatureStat=='Active' ? " AND (isUsed=TRUE AND isNotBroken=TRUE)": 
                       ($temperatureStat=='Lock' ? " AND (isUsed=FALSE OR isNotBroken=FALSE)": 
                       ""))."
                    )
                OR
                    (typeSensor = 'temperatureSensor' 
                    " .($humidityStat=='Active' ? " AND (isUsed=TRUE AND isNotBroken=TRUE)": 
                       ($humidityStat=='Lock' ? " AND (isUsed=FALSE OR isNotBroken=FALSE)": 
                       ""))."
                    )
                )


*/

/*
    function new_requeteFindUser($x1, $x2){
        // Début Connection BdD
        include_once("Projet/modele/infoDB.php");
        $conn = connectionToDB();

        $cardiaqueStat = "Active";
        $sonorStat = "Active";
        $temperatureStat = "Active";
        $humidityStat = "Active";

        $sql = "SELECT typeUser, firstName, lastName, birthday, phoneNumber, mail, country, city, codePostal, address, utilisateur.id_Box,
                        GROUP_CONCAT(id_sensor, '-', typeSensor, '-', isUsed, '-', isNotBroken ORDER BY id_sensor SEPARATOR ';') as id_sensor_typeSensor_isUsed_isNotBroken
                FROM utilisateur
                LEFT JOIN sensor 
                ON utilisateur.id_Box = sensor.id_Box
    
                GROUP BY mail
                Order by id_utilisateur
                LIMIT ".$x1.", ".$x2; 

        $res = $conn->query($sql);
        // Fin Connection BdD
        $conn = null;
        // Renvoi le resultat de la Requete
        return $res->fetchAll(PDO::FETCH_ASSOC); //->fetchAll(PDO::FETCH_ASSOC)
    }
    */

/*

    function new_requeteFindUser($x1, $x2){
        // Début Connection BdD
        include_once("Projet/modele/infoDB.php");
        $conn = connectionToDB();

        $cardiaqueStat = "Active";
        $sonorStat = "Active";
        $temperatureStat = "Active";
        $humidityStat = "Active";

        $sql = "SELECT typeUser, firstName, lastName, birthday, phoneNumber, mail, country, city, codePostal, address, utilisateur.id_Box,
                        GROUP_CONCAT(id_sensor, '-', typeSensor, '-', isUsed, '-', isNotBroken ORDER BY id_sensor SEPARATOR ';') as sensor_1,
                        SUBSTRING_INDEX(GROUP_CONCAT(id_sensor, '-', typeSensor, '-', isUsed, '-', isNotBroken ORDER BY id_sensor SEPARATOR ';'), ';', 1) as sensor_2,
                        SUBSTRING_INDEX(GROUP_CONCAT(id_sensor, '-', typeSensor, '-', isUsed, '-', isNotBroken ORDER BY id_sensor SEPARATOR ';'), ';', -2) as sensor_3,
                        SUBSTRING_INDEX(GROUP_CONCAT(id_sensor, '-', typeSensor, '-', isUsed, '-', isNotBroken ORDER BY id_sensor SEPARATOR ';'), ';', -1) as sensor_4

                        
                FROM utilisateur
                LEFT JOIN sensor 
                ON utilisateur.id_Box = sensor.id_Box
    
                GROUP BY mail
                Order by id_utilisateur
                LIMIT ".$x1.", ".$x2; 

        $res = $conn->query($sql);
        // Fin Connection BdD
        $conn = null;
        // Renvoi le resultat de la Requete
        return $res->fetchAll(PDO::FETCH_ASSOC); //->fetchAll(PDO::FETCH_ASSOC)
    }

*/

function new_requeteFindUser($x1, $x2){
    // Début Connection BdD
    include_once("Projet/modele/infoDB.php");
    $conn = connectionToDB();

    $cardiaqueStat = "";
    $sonorStat = "";
    $temperatureStat = "";
    $humidityStat = "";

    $sql = "SELECT u.typeUser, u.firstName, u.lastName, u.birthday, u.phoneNumber, u.mail, u.country, u.city, u.codePostal, u.address, u.id_Box,
                   heart.id_sensor AS heart_id, heart.typeSensor AS heart_typeSensor, heart.isUsed AS heart_isUsed, heart.isNotBroken AS heart_isNotBroken,
                   hum.id_sensor AS hum_id, hum.typeSensor AS hum_typeSensor, hum.isUsed AS hum_isUsed, hum.isNotBroken AS hum_isNotBroken,
                   sound.id_sensor AS sound_id, sound.typeSensor AS sound_typeSensor, sound.isUsed AS sound_isUsed, sound.isNotBroken AS sound_isNotBroken,
                   temp.id_sensor AS temp_id, temp.typeSensor AS temp_typeSensor, temp.isUsed AS temp_isUsed, temp.isNotBroken AS temp_isNotBroken
            FROM utilisateur u
            LEFT JOIN sensor heart ON u.id_Box = heart.id_Box AND heart.typeSensor = 'heartSensor'
            LEFT JOIN sensor hum ON u.id_Box = hum.id_Box AND hum.typeSensor = 'humiditySensor'
            LEFT JOIN sensor sound ON u.id_Box = sound.id_Box AND sound.typeSensor = 'soundSensor'
            LEFT JOIN sensor temp ON u.id_Box = temp.id_Box AND temp.typeSensor = 'temperatureSensor'

            WHERE 
            
            ".($cardiaqueStat=='Active'? "heart.isUsed is true and heart.isNotBroken is true": 
                ($cardiaqueStat=='Lock'? 'heart.isUsed is false or heart.isNotBroken is false':  
                ($cardiaqueStat=='.'? 'heart.id_sensor is null': 
                "heart.id_sensor is null OR heart.id_sensor is not null")))."

            AND ".($sonorStat=='Active'? "hum.isUsed is true and hum.isNotBroken is true": 
                ($sonorStat=='Lock'? 'hum.isUsed is false or hum.isNotBroken is false':  
                ($sonorStat=='.'? 'hum.id_sensor is null': 
                "hum.id_sensor is null OR hum.id_sensor is not null")))."

            AND ".($temperatureStat=='Active'? "sound.isUsed is true and sound.isNotBroken is true": 
                ($temperatureStat=='Lock'? 'sound.isUsed is false or sound.isNotBroken is false':  
                ($temperatureStat=='.'? 'sound.id_sensor is null': 
                "sound.id_sensor is null OR sound.id_sensor is not null")))."

            AND ".($humidityStat=='Active'? "temp.isUsed is true and temp.isNotBroken is true": 
                ($humidityStat=='Lock'? 'temp.isUsed is false or temp.isNotBroken is false':  
                ($humidityStat=='.'? 'temp.id_sensor is null': 
                "temp.id_sensor is null OR temp.id_sensor is not null")))."


            ORDER BY id_utilisateur
            LIMIT ".$x1.", ".$x2; 

    $res = $conn->query($sql);
    // Fin Connection BdD
    $conn = null;
    // Renvoi le resultat de la Requete
    return $res->fetchAll(PDO::FETCH_ASSOC); //->fetchAll(PDO::FETCH_ASSOC)
}







function printInfoSensor($sensorTable, $typeSensor) {
    // The User have a sensorBox
    if ($sensorTable[0]!=null) {
        // Find the right in the Array
        $resSensor = array_filter($sensorTable, function($values) use ($typeSensor) {
            return  strpos($values, $typeSensor); });
        // if sensor exist -> affiche sensorStat
        if (count($resSensor)!=0) {
            // Index à 0 et String to Array
            $resSensor = reset($resSensor);
            $resSensor = explode('-', $resSensor);
            // If isUsed and isNotBroken
            if ($resSensor[2] & $resSensor[3]) {echo 'active<br>';}
            else {echo 'lock<br>';}
        }
        else {echo 'raté<br>';}
    }
    else {echo 'raté<br>';}
}









$result = new_requeteFindUser(0, 1000); //pos, nbEle

foreach  ($result as $row) {
   echo print_r($row).'<br><br>';
}

/*
foreach  ($result as $row) {
echo print_r($row);echo '<br>';

$sensorList = explode(';', $row["id_sensor_typeSensor_isUsed_isNotBroken"]);

printInfoSensor($sensorList, "heartSensor");
printInfoSensor($sensorList, "soundSensor");
printInfoSensor($sensorList, "temperatureSensor");
printInfoSensor($sensorList, "humiditySensor");

echo '<br><br>';}*/



?>