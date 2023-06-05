<?php 


    function removeUser($mailUser) {
        // Début Connection BdD
        include_once("Projet/modele/infoDB.php");
        $conn = connectionToDB();
        // Requete : Suppression de l'utilisateur
        $query = $conn->prepare("DELETE FROM utilisateur WHERE mail = :mail");
        $query->bindParam(':mail', $mailUser);
        $query->execute();

        // Fin Connection BdD
        $conn = null;
    }


    function createNewBox($nameBox) {
        try {
            // Début Connection BdD
            include_once("Projet/modele/infoDB.php");
            $conn = connectionToDB();
            // Regarde si le mail et le mdp existent dans la base de données
            $sql =  'INSERT INTO sensorbox (`id_Box`) VALUES (:nameBox)'; 
            $commande = $conn->prepare($sql);
            $commande->bindParam(':nameBox', $nameBox);
            $bool = $commande->execute();
            // Fin Connection BdD
            $conn = null;
            return "ok";
        } catch (PDOException $e) {
            if ($e->getCode() == '23000') {return "Cette référance est déjà pris";} 
            else {return "Erreur lors de l'insertion dans la base de données";}
        }
    }

    
    function createNewSensor($nameSensor, $typeSensor) {
        try {
            // Début Connection BdD
            include_once("Projet/modele/infoDB.php");
            $conn = connectionToDB();
            // Regarde si le mail et le mdp existent dans la base de données
            $sql =  'INSERT INTO sensor (`id_sensor`, `typeSensor`) VALUES (:nameSensor, :typeSensor)'; 
            $commande = $conn->prepare($sql);
            $commande->bindParam(':nameSensor', $nameSensor);
            $commande->bindParam(':typeSensor', $typeSensor);
            $bool = $commande->execute();
            // Fin Connection BdD
            $conn = null;
            return "ok";
        } catch (PDOException $e) {
            if ($e->getCode() == '23000') {return "Cette référance est déjà pris";} 
            else {return "Erreur lors de l'insertion dans la base de données";}
        }
    }

    function getIdBoxDispo(){
        include_once("Projet/modele/infoDB.php");
        $conn = connectionToDB();
        try{
            $sql = "SELECT sensorbox.id_Box FROM sensorbox LEFT JOIN utilisateur ON sensorbox.id_Box = utilisateur.id_Box WHERE id_utilisateur is NULL;";
            $commande = $conn->prepare($sql);
            $commande->execute();

        }
        catch (PDOException $e) {
            echo "Erreur de requête : " . $e->getMessage();
        }
        $conn = null;
        $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
        return $resultat;
    }


    function getBoxList() {
        // Début Connection BdD
        include_once("Projet/modele/infoDB.php");
        $conn = connectionToDB();
        # Requete
        $sql =  'SELECT sensorbox.id_Box, NVL(utilisateur.mail, "notUsed") as "isUsed", COUNT(sensor.id_sensor) as "nbSensor"
                 FROM `sensorbox` 
                 LEFT JOIN `utilisateur` ON sensorbox.id_Box=utilisateur.id_Box
                 LEFT JOIN `sensor` ON sensorbox.id_Box=sensor.id_Box
                 GROUP BY sensorbox.id_Box'; 
        $query = $conn->prepare($sql);
        $query->execute();
        $resultat = $query->fetchAll(PDO::FETCH_ASSOC);
        // Fin Connection BdD
        $conn = null;
        return $resultat;
    }


    function getSensorFromBox($refBox) {
                // Début Connection BdD
        include_once("Projet/modele/infoDB.php");
        $conn = connectionToDB();
        # Requete
        $sql =  'SELECT sensor.*, NVL(utilisateur.mail, "notUsed") as "User"
                 FROM `sensor` 
                 LEFT JOIN `utilisateur` ON sensor.id_Box=utilisateur.id_Box
                 WHERE sensor.id_Box=:refBox'; 
        $query = $conn->prepare($sql);
        $query->bindParam(':refBox', $refBox);
        $query->execute();
        $resultat = $query->fetchAll(PDO::FETCH_ASSOC);
        // Fin Connection BdD
        $conn = null;
        return $resultat;
    }

    function getBoxUser($refBox) {
        // Début Connection BdD
        include_once("Projet/modele/infoDB.php");
        $conn = connectionToDB();
        # Requete
        $sql =  'SELECT sensorbox.id_Box, NVL(utilisateur.mail, "notUsed") as "User"
                 FROM `sensorbox` 
                 LEFT JOIN `utilisateur` ON sensorbox.id_Box=utilisateur.id_Box
                 WHERE sensorbox.id_Box=:refBox'; 
        $query = $conn->prepare($sql);
        $query->bindParam(':refBox', $refBox);
        $query->execute();
        $resultat = $query->fetch(PDO::FETCH_ASSOC);
        // Fin Connection BdD
        $conn = null;
        return $resultat;
    }
    
    function getSensorNotUsed() {
        // Début Connection BdD
        include_once("Projet/modele/infoDB.php");
        $conn = connectionToDB();
        # Requete
        $sql =  'SELECT sensor.id_sensor, sensor.id_Box, sensor.typeSensor
                 FROM `sensor` 
                 WHERE sensor.id_Box IS NULL'; 
        $query = $conn->prepare($sql);
        $query->execute();
        $resultat = $query->fetchAll(PDO::FETCH_ASSOC);
        // Fin Connection BdD
        $conn = null;
        return $resultat;
    }

    function getSensorSelect($refSensor) {
        // Début Connection BdD
        include_once("Projet/modele/infoDB.php");
        $conn = connectionToDB();
        # Requete
        $sql =  'SELECT sensor.id_sensor, sensor.isUsed
                 FROM `sensor` 
                 WHERE sensor.id_sensor = :refSensor'; 
        $query = $conn->prepare($sql);
        $query->bindParam(':refSensor', $refSensor);
        $query->execute();
        $resultat = $query->fetch(PDO::FETCH_ASSOC);
        // Fin Connection BdD
        $conn = null;
        return $resultat;
    }
    

    function removeBox($refBox) {
        // Début Connection BdD
        include_once("Projet/modele/infoDB.php");
        $conn = connectionToDB();
        // Requete : Suppression
        $query = $conn->prepare("DELETE FROM sensorbox WHERE id_Box = :refBox");
        $query->bindParam(':refBox', $refBox);
        $query->execute();

        // Fin Connection BdD
        $conn = null;
    }


    function removeSensor($refSensor) {
        // Début Connection BdD
        include_once("Projet/modele/infoDB.php");
        $conn = connectionToDB();
        // Requete : Suppression
        $query = $conn->prepare("DELETE FROM sensor WHERE id_sensor = :refSensor");
        $query->bindParam(':refSensor', $refSensor);
        $query->execute();

        // Fin Connection BdD
        $conn = null;
    }


    function removelinkSensorFromBox($refBox) {
        // Début Connection BdD
        include_once("Projet/modele/infoDB.php");
        $conn = connectionToDB();
        // Requete : suppression des liens sensor avec la box
        $sql =  'UPDATE sensor
                 SET id_Box = NULL
                 WHERE id_Box = :refBox'; 
        $query = $conn->prepare($sql);
        $query->bindParam(':refBox', $refBox);
        $query->execute();
        // Fin Connection BdD
        $conn = null;
    }

    function addNewlinkSensorFromBox($refBox, $tempSensor, $humSensor, $heartSensor, $soundSensor) {
        // Début Connection BdD
        include_once("Projet/modele/infoDB.php");
        $conn = connectionToDB();

        // Requete 1: Ajout des liens du capteur 1 avec la box
        if ($tempSensor['id_sensor'] != "**Inexistant**") {
            $sql =  'UPDATE sensor
                    SET id_Box = :refBox,
                        isUsed = :isUsed
                    WHERE id_sensor = :id_sensor'; 
            $query = $conn->prepare($sql);
            $query->bindParam(':refBox', $refBox);
            $query->bindParam(':id_sensor', $tempSensor['id_sensor']);
            $query->bindParam(':isUsed', $tempSensor['isUsed']);
            $query->execute();
        }

         // Requete 2: Ajout des liens du capteur 2 avec la box
         if ($humSensor['id_sensor'] != "**Inexistant**") {
            $sql =  'UPDATE sensor
                        SET id_Box = :refBox,
                            isUsed = :isUsed
                        WHERE id_sensor = :id_sensor'; 
            $query = $conn->prepare($sql);
            $query->bindParam(':refBox', $refBox);
            $query->bindParam(':id_sensor', $humSensor['id_sensor']);
            $query->bindParam(':isUsed', $humSensor['isUsed']);
            $query->execute();
        }

        // Requete 3: Ajout des liens du capteur 3 avec la box
        if ($heartSensor['id_sensor'] != "**Inexistant**") {
            $sql =  'UPDATE sensor
                        SET id_Box = :refBox,
                            isUsed = :isUsed
                        WHERE id_sensor = :id_sensor'; 
            $query = $conn->prepare($sql);
            $query->bindParam(':refBox', $refBox);
            $query->bindParam(':id_sensor', $heartSensor['id_sensor']);
            $query->bindParam(':isUsed', $heartSensor['isUsed']);
            $query->execute();
        }

        // Requete 4: Ajout des liens du capteur 4 avec la box
        if ($soundSensor['id_sensor'] != "**Inexistant**") {
            $sql =  'UPDATE sensor
                        SET id_Box = :refBox,
                            isUsed = :isUsed
                        WHERE id_sensor = :id_sensor'; 
            $query = $conn->prepare($sql);
            $query->bindParam(':refBox', $refBox);
            $query->bindParam(':id_sensor', $soundSensor['id_sensor']);
            $query->bindParam(':isUsed', $soundSensor['isUsed']);
            $query->execute();
        }
        
        // Fin Connection BdD
        $conn = null;
    }
?>