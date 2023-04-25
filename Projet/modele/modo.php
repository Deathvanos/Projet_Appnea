<?php


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
        WHERE typeUser like :deltypeUserUser
          AND firstName like :firstName
          AND lastName like :lastName
          AND mail like :mail
          AND birthday like :birthday
          AND phoneNumber like :phoneNumber
          AND country like :country
          AND city like :city
          AND address like :address
          AND ".($_POST['cardiaqueStat']==$txt['adminGestionUser_Active']? "(heart.isUsed is true and heart.isNotBroken is true)": 
                ($_POST['cardiaqueStat']==$txt['adminGestionUser_Lock']? '(heart.isUsed is false or heart.isNotBroken is false)':  
                ($_POST['cardiaqueStat']=='.'? '(heart.id_sensor is null)': 
                "(heart.id_sensor is null OR heart.id_sensor is not null)")))."
          AND ".($_POST['sonorStat']==$txt['adminGestionUser_Active']? "(sound.isUsed is true and sound.isNotBroken is true)": 
                ($_POST['sonorStat']==$txt['adminGestionUser_Lock']? '(sound.isUsed is false or sound.isNotBroken is false)':  
                ($_POST['sonorStat']=='.'? '(sound.id_sensor is null)': 
                "(sound.id_sensor is null OR sound.id_sensor is not null)")))."
          AND ".($_POST['temperatureStat']==$txt['adminGestionUser_Active']? "(temp.isUsed is true and temp.isNotBroken is true)": 
                ($_POST['temperatureStat']==$txt['adminGestionUser_Lock']? '(temp.isUsed is false or temp.isNotBroken is false)':  
                ($_POST['temperatureStat']=='.'? '(temp.id_sensor is null)': 
                "(temp.id_sensor is null OR temp.id_sensor is not null)")))."
          AND ".($_POST['humidityStat']==$txt['adminGestionUser_Active']? "(hum.isUsed is true and hum.isNotBroken is true)": 
                  ($_POST['humidityStat']==$txt['adminGestionUser_Lock']? '(hum.isUsed is false or hum.isNotBroken is false)':  
                  ($_POST['humidityStat']=='.'? '(hum.id_sensor is null)': 
                  "(hum.id_sensor is null OR hum.id_sensor is not null)")))."
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