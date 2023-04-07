<?php 



    function requeteFindUser(){
        // Est utilisé par les deux fonctions suivant (printDataBase et nbUserFind) pour filter les datas
        return "
        FROM utilisateur u
                LEFT JOIN sensor heart ON u.id_Box = heart.id_Box AND heart.typeSensor = 'heartSensor'
                LEFT JOIN sensor hum ON u.id_Box = hum.id_Box AND hum.typeSensor = 'humiditySensor'
                LEFT JOIN sensor sound ON u.id_Box = sound.id_Box AND sound.typeSensor = 'soundSensor'
                LEFT JOIN sensor temp ON u.id_Box = temp.id_Box AND temp.typeSensor = 'temperatureSensor'
        WHERE typeUser like '".($_POST['typeUser']==null? '%':htmlspecialchars($_POST['typeUser']))."'
        AND firstName like '".($_POST['firstName']==null? '%':htmlspecialchars($_POST['firstName']))."%'
        AND lastName like '".($_POST['lastName']==null? '%':htmlspecialchars($_POST['lastName']))."%'
        AND mail like '".($_POST['mail']==null? '%':htmlspecialchars($_POST['mail']))."%'
        AND birthday like '".($_POST['birthday']==null? '%':htmlspecialchars($_POST['birthday']))."'
        AND phoneNumber like '".($_POST['phoneNumber']==null? '%':htmlspecialchars($_POST['phoneNumber']))."%'
        AND country like '".($_POST['country']==null? '%':htmlspecialchars($_POST['country']))."%'
        AND city like '%".($_POST['city']==null? '%':htmlspecialchars($_POST['city']))."%'
        AND address like '".($_POST['address']==null? '%':htmlspecialchars($_POST['address']))."%'
        AND ".($_POST['cardiaqueStat']=='Active'? "(heart.isUsed is true and heart.isNotBroken is true)": 
                ($_POST['cardiaqueStat']=='Lock'? '(heart.isUsed is false or heart.isNotBroken is false)':  
                ($_POST['cardiaqueStat']=='.'? '(heart.id_sensor is null)': 
                "(heart.id_sensor is null OR heart.id_sensor is not null)")))."
        AND ".($_POST['sonorStat']=='Active'? "(sound.isUsed is true and sound.isNotBroken is true)": 
                ($_POST['sonorStat']=='Lock'? '(sound.isUsed is false or sound.isNotBroken is false)':  
                ($_POST['sonorStat']=='.'? '(sound.id_sensor is null)': 
                "(sound.id_sensor is null OR sound.id_sensor is not null)")))."
        AND ".($_POST['temperatureStat']=='Active'? "(temp.isUsed is true and temp.isNotBroken is true)": 
                ($_POST['temperatureStat']=='Lock'? '(temp.isUsed is false or temp.isNotBroken is false)':  
                ($_POST['temperatureStat']=='.'? '(temp.id_sensor is null)': 
                "(temp.id_sensor is null OR temp.id_sensor is not null)")))."
        AND ".($_POST['humidityStat']=='Active'? "(hum.isUsed is true and hum.isNotBroken is true)": 
                ($_POST['humidityStat']=='Lock'? '(hum.isUsed is false or hum.isNotBroken is false)':  
                ($_POST['humidityStat']=='.'? '(hum.id_sensor is null)': 
                "(hum.id_sensor is null OR hum.id_sensor is not null)")))."
    ";}




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

        $res = $conn->query($sql);
        // Fin Connection BdD
        $conn = null;
        // Renvoi le resultat de la Requete
        return $res->fetchAll(PDO::FETCH_ASSOC);
        }
    


    /**
     * Compte le nombre d'éléments dans la table User
     * En fonction des filtres de requeteFindUser()
     */
    function nbUserFind(){
        // Début Connection BdD
        include_once("Projet/modele/infoDB.php");
        $conn = connectionToDB();
        // Requete
        $sql = "SELECT COUNT(mail) ".requeteFindUser()." Order by id_utilisateur"; 
        $res = $conn->query($sql);
        // Fin Connection BdD
        $conn = null;
        // Renvoi le resultat de la Requete
        return $res->fetch()[0];
    }


    
    /**
     * Suppression d'un utilisateur
     */
    function removeUser() {
        echo '<div style="color:white;">Confirmation de la suppresion : '.$_POST['delUser'].'</div>';
        // Début Connection BdD
        include_once("Projet/modele/infoDB.php");
        $conn = connectionToDB();
        // Requete : Suppression de l'utilisateur
        $query = $conn->prepare("DELETE FROM utilisateur WHERE mail = :mail");
        $query->bindParam(':mail', $_POST['delUser']);
        $query->fetch_assoc();

        // Fin Connection BdD
        $conn = null;
    }
    

