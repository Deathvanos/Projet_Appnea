<?php 

    function printDataBase($x1, $x2){
        // Création de la connection à la base de données
        include("Projet/modele/infoDB.php");
        $conn = connectionToDB();
        
        // commence à la ligne x1+1 et prend x2 lignes 
        $sql =  'SELECT * FROM user LIMIT '.$x1.', '.$x2; 
        $res = $conn->query($sql);

        // Fermeture de la base de données
        $conn = null;
    
        return $res;


    }


?>