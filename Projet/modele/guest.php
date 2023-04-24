<?php

    /*
    1 jeanbon@yahoo.fr user jeanbon123ABC!!!
    2 adminthebest@gmail.com admin admin123ABC!!!
    3 modothwoth@yahoo.fr modo modo123ABC!!!
    4 pinpon@lespompiers.fr user user123ABC!!!
    5 bobleponge@lamere.fr user bob123ABC!!!
    */

    function tryLogin(){
        // Création de la connection à la base de données
        require("Projet/modele/infoDB.php");
        $conn = connectionToDB();
        
        // Regarde si le mail et le mdp existent dans la base de données
        $sql =  'SELECT * FROM utilisateur WHERE mail=:mail AND password=:password';
        $commande = $conn->prepare($sql);
        $commande->bindParam(':mail', $_POST['mail']); // pour les requetes sql avec variables externe
        $commande->bindParam(':password', $_POST['mdp']); // pour les requetes sql avec variables externe
        $bool = $commande->execute();
        $resultat = $commande->fetch(PDO::FETCH_ASSOC);

        if ($resultat) {
            $_SESSION['userInfo'] = $resultat;
        }
        else {
            $_SESSION['errorLog'] = "Nom d'utilisateur ou mot de passe incorrect.";
           header('Location: ' . $_SERVER['HTTP_REFERER']);
        }
        // Fermeture de la base de données
        $conn = null;
    }
?>