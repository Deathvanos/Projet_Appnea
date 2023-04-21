<?php 

    // On get la langue de la page : defaut="fr"
    $_SESSION['lang'] = isset($_GET['lang']) ? $_GET['lang'] : (isset($_SESSION['lang'] ) ? $_SESSION['lang']  : 'fr');

    // Vérifie si le fichier de langue existe pour le charger en mémoire - pour *
    $fileLang = 'Ressources/lang/text_' . $_SESSION['lang'] . '.json';
    if (file_exists($fileLang)) {
        $translat = json_decode(file_get_contents($fileLang), true);
    } // Redirection vers une page d'erreur
    else {header("Location: Projet/view/error.php"); exit;
    }
?>