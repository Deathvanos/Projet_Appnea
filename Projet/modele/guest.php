<?php


function FAQextraction() {
     /*****requetes SQL *****/
        // Création de la connection à la base de données
        require("Projet/modele/infoDB.php");
        $conn = connectionToDB();
        
        // Regarde si le mail et le mdp existent dans la base de données
        $sql =  'SELECT '.$_SESSION['lang'].'_question, '.$_SESSION['lang'].'_response FROM FAQ'; 
        $commande = $conn->prepare($sql);
        $bool = $commande->execute();
        $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);


        

        // Récupération des questions depuis la base de données
    /*$query = "SELECT * FROM FAQ";
    $result = mysqli_query($conn, $query);

    if (!$result) {
        die('Erreur lors de l\'exécution de la requête : ' . mysqli_error($conn));
    }
*/
        
        // Fermeture de la base de données
        $conn = null;

        return $resultat;
}

?>