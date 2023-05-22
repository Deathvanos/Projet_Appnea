<?php


    /********************************************/
    /************** Edition Profil **************/
    /********************************************/


    function getProfil($mail){
        include_once("./Projet/modele/infoDB.php");
        $conn = connectionToDB();
        $sql = "SELECT firstName, lastName, birthday, phoneNumber, mail, country, city, address, photo, id_utilisateur FROM utilisateur
                WHERE mail = :mail";
        try{
            $commande = $conn->prepare($sql);
            $commande->bindParam(':mail', $mail, PDO::PARAM_STR);
            $bool = $commande->execute();
            if($bool){
                $resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
                return $resultat;
            }
        }catch(PDOException $e){
            echo utf8_encode("Echec de la récupération du profil : " . $e->getMessage() . "\n");
            die();
        }
    }

    function updateUser($tab, $id){
        include_once("./Projet/modele/infoDB.php");
        $conn = connectionToDB();   
        $sql = "UPDATE utilisateur 
                    SET lastName = :lastName,
                        firstName = :firstName,
                        phoneNumber = :phoneNumber,
                        mail = :mail,
                        address = :adresse,
                        city = :city,
                        country = :country,
                        photo = :photo
                    WHERE id_utilisateur=:id";
        try{
            $commande = $conn->prepare($sql);
            $commande->bindParam(':lastName', $tab['Nom']);
            $commande->bindParam(':firstName', $tab['Prénom']);
            $commande->bindParam(':phoneNumber', $tab['Tel']);
            $commande->bindParam(':mail', $tab['Mail']);
            $commande->bindParam(':adresse', $tab['Adresse']);
            $commande->bindParam(':city', $tab['Ville']);
            $commande->bindParam(':country', $tab['Pays']);
            $commande->bindParam(':photo', $tab['Photo']);
            $commande->bindParam(':id', $id);
            $commande->execute();
        }catch(PDOException $e){
            echo utf8_encode("Echec de la mise à jour du profil : " . $e->getMessage() . "\n");
            die();
        }
    }





    /********************************************/
    /************* Find user search *************/
    /********************************************/


    /*
     * FROM et WHERE parts of the SQL
     * Use by printDataBase() and nbUserFind()
    */
    function requeteFindUser(){
        $txt = $GLOBALS['translat'];
        return "
        FROM utilisateur u
            LEFT JOIN sensor heart ON u.id_Box = heart.id_Box AND heart.typeSensor = 'heartSensor'
            LEFT JOIN sensor hum ON u.id_Box = hum.id_Box AND hum.typeSensor = 'humiditySensor'
            LEFT JOIN sensor sound ON u.id_Box = sound.id_Box AND sound.typeSensor = 'soundSensor'
            LEFT JOIN sensor temp ON u.id_Box = temp.id_Box AND temp.typeSensor = 'temperatureSensor'
        WHERE typeUser LIKE :deltypeUserUser
          AND firstName LIKE :firstName
          AND lastName LIKE :lastName
          AND mail LIKE :mail
          AND birthday LIKE :birthday
          AND phoneNumber LIKE :phoneNumber
          AND country LIKE :country
          AND city LIKE :city
          AND address LIKE :address
          AND ".($_POST['cardiaqueStat']==$txt['adminGestionUser_Active']? "(heart.isUsed is true AND heart.isNotBroken is true)":
                ($_POST['cardiaqueStat']==$txt['adminGestionUser_Lock']? '(heart.isUsed is false OR heart.isNotBroken is false OR (heart.id_sensor is null AND typeUser LIKE "user"))':
                "(heart.id_sensor is null OR heart.id_sensor is not null)"))."
          AND ".($_POST['sonorStat']==$txt['adminGestionUser_Active']? "(sound.isUsed is true AND sound.isNotBroken is true)":
                ($_POST['sonorStat']==$txt['adminGestionUser_Lock']? '(sound.isUsed is false OR sound.isNotBroken is false OR (sound.id_sensor is null AND typeUser LIKE "user"))':
                "(sound.id_sensor is null OR sound.id_sensor is not null)"))."
          AND ".($_POST['temperatureStat']==$txt['adminGestionUser_Active']? "(temp.isUsed is true AND temp.isNotBroken is true)":
                ($_POST['temperatureStat']==$txt['adminGestionUser_Lock']? '(temp.isUsed is false OR temp.isNotBroken is false OR (temp.id_sensor is null AND typeUser LIKE "user"))':
                "(temp.id_sensor is null OR temp.id_sensor is not null)"))."
          AND ".($_POST['humidityStat']==$txt['adminGestionUser_Active']? "(hum.isUsed is true AND hum.isNotBroken is true)":
                  ($_POST['humidityStat']==$txt['adminGestionUser_Lock']? '(hum.isUsed is false OR hum.isNotBroken is false OR (hum.id_sensor is null AND typeUser LIKE "user"))':
                  "(hum.id_sensor is null OR hum.id_sensor is not null)"))."
    ";}



    /*
     * bindValue() filter to interupt SQL injection
     * Use by printDataBase() and nbUserFind()
    */
    function requeteFindUser_bind($query){
        $query->bindValue(':deltypeUserUser', $_POST['typeUser']==null ? '%':$_POST['typeUser']);
        $query->bindValue(':firstName', ($_POST['firstName']==null ? '':$_POST['firstName']).'%');
        $query->bindValue(':lastName', ($_POST['lastName']==null ? '':$_POST['lastName']).'%');
        $query->bindValue(':mail', ($_POST['mail']==null? '':$_POST['mail']).'%');
        $query->bindValue(':birthday', ($_POST['birthday']==null? '':$_POST['birthday']).'%');
        $query->bindValue(':phoneNumber', ($_POST['phoneNumber']==null? '':$_POST['phoneNumber']).'%');
        $query->bindValue(':country', ($_POST['country']==null? '':$_POST['country']).'%');
        $query->bindValue(':city', ($_POST['city']==null? '':$_POST['city']).'%');
        $query->bindValue(':address', ($_POST['address']==null? '':$_POST['address']).'%');
    }




    /*
     * Affiche les éléments de la table User
     * A partir de $x1 jusqu'à $x1+$x2
     * Et en fonction des filtres de requeteFindUser()
     */
    function printDataBase($x1, $x2){
        // Début Connection BdD
        include_once("Projet/modele/infoDB.php");
        $conn = connectionToDB();

        $sql = "SELECT u.typeUser, u.firstName, u.lastName, u.birthday, u.phoneNumber, u.mail, u.country, u.city, u.codePostal, u.address, u.id_Box,
                      heart.id_sensor AS heart_id, heart.isUsed AS heart_isUsed, heart.isNotBroken AS heart_isNotBroken,
                      hum.id_sensor AS hum_id, hum.isUsed AS hum_isUsed, hum.isNotBroken AS hum_isNotBroken,
                      sound.id_sensor AS sound_id, sound.isUsed AS sound_isUsed, sound.isNotBroken AS sound_isNotBroken,
                      temp.id_sensor AS temp_id, temp.isUsed AS temp_isUsed, temp.isNotBroken AS temp_isNotBroken
                      ".requeteFindUser()."
                          Order by id_utilisateur
                          LIMIT ".$x1.", ".$x2;
        $commande = $conn->prepare($sql);
        requeteFindUser_bind($commande);
        $commande->execute();

        // Fin Connection BdD
        $conn = null;
        // Renvoi le resultat de la Requete
        return $commande->fetchAll(PDO::FETCH_ASSOC);
        }



    /*
     * Compte le nombre d'éléments dans la table User
     * En fonction des filtres de requeteFindUser()
     */
    function nbUserFind(){
        // Début Connection BdD
        include_once("Projet/modele/infoDB.php");
        $conn = connectionToDB();
        // Requete
        $sql = "SELECT COUNT(mail) ".requeteFindUser()." Order by id_utilisateur";
        $query = $conn->prepare($sql);
        requeteFindUser_bind($query);
        $query->execute();

        // Fin Connection BdD
        $conn = null;
        // Renvoi le resultat de la Requete
         return $query->fetch()[0];
    }

    
?>