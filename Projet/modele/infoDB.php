<?php

    function connectionToDB() {
        $servername = "db";
        $username = getenv('MYSQL_USER');
        $password = getenv('MYSQL_PASSWORD');
        $dbname = getenv('MYSQL_USER');

        try {
            $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $conn;
        } 
        catch (PDOException $e) {
            header('Location: '.$GLOBALS['errorPage']);
            //echo "Connection failed: " . $e->getMessage();return false;
        }
    }


/*
    // Methode 1 : afficher toutes les lignes
    echo '<br>';
    $sql =  'SELECT * FROM user';
    $result = $conn->query($sql);
    foreach  ($result as $row) {
        print $row['id'] . "\t";
        print  $row['mail'] . "\t";
        print $row['typeUser'] . "\n";
        print $row['H_password'] . "\n";
        echo '<br>';
    }
*/
/*
    $sql =  'SELECT * FROM user';
    $commande = $conn->prepare($sql);
    //$commande->bindParam(':id', $id); // pour les requetes sql avec variables externe
    $bool = $commande->execute();
    $resultat = $commande->fetch(PDO::FETCH_ASSOC);
    if ($resultat) { echo 'cette user existe';}
    else {echo "user inconnu";}
*/
?>