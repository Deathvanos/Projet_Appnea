﻿<!--******************************************************
* APP - Projet Système Numérique - Composante Informatique
* ISEP - A1 - G7C
* Semestre 2
* Auteur : - MAILLEY_Charles 
           - MAIZA_Fares
           - MARTINEZ_Eliot
           - PAVIOT-ADET_Flore
           - SPASOJEVIC_Fanny
           - VINGADASSAMY_Prasanaa
* Date de rendu  : 05/06/2023
********************************************************-->

<!-- A mettre seulement sur la first page du site 
(Permet l'utilisation de variables inter page) -->
<!--
<?php //**session_start(); ?>
-->

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>APNEA</title>
    <link rel="icon" type="image/x-icon" href="Ressources/img/Logo_Appea-color.svg">
    <link rel="stylesheet" href="Ressources/css/allPage.css" />
    <!--<link rel="stylesheet" href="Ressources/css/guest/main.css" />-->
    <link rel="stylesheet" href="Ressources/css/user/profil.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="Ressources/bitmap/boxicons/css/boxicons.min.css" rel="stylesheet">
</head>
<body>
<?php    
    // Bug  : on doit récuperer ces deux variables dans les variables globals 
    $txt = $GLOBALS['translat'];
    include 'Projet/view/'.$_SESSION['controle'].'/header.tpl';?>

<main style="height:830px;">
    <h1> Votre <color>profil</color></h1>
    <a href="index.php?controle=user&action=displayModifInfos">Modifier les informations</a>
    <div class="contenu">
        <?php echo "<img src='data:image/jpeg;base64," . $photo_base64 . "' . width=30% heigth=30%/>"; ?>
        <!--<img src="<?php echo("'data:image/jpeg;base64," . $photo_base64 . "'"); ?> " /> -->
        <div class="infos_perso grid_container">
            <h3>  Nom : <info><?php echo($lastName); ?></info></h3>
            <h3 class="hide"> </h3>
            <h3>  Prénom : <info><?php echo($firstName); ?></info></h3>
            <h3>  Numéro de téléphone : <info><?php echo($phoneNumber); ?></info></h3>
            <h3 class="hide"></h3>
            <h3>  Mail : <info><?php echo($mail); ?></info></h3>
            <h3>  Adresse : <info><?php echo($localisation); ?></info></h3>
        </div>
    </div>
</main>

<?php include 'Projet/view/other/footer.tpl'; ?>
</body>
</html>

<!-- 1er milestone : l'utilisateur peut afficher son profil avec ses infos --> 