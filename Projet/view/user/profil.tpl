<!--******************************************************
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

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>APNEA - Profil</title>
    <?php include 'Projet/view/other/header_Font_Page.html';?>
    <link rel="stylesheet" href="Ressources/css/user/profil.css"/>
</head>
<body>
    <?php    
    // Bug  : on doit récuperer ces deux variables dans les variables globals 
    $txt = $GLOBALS['translat'];
    include 'Projet/view/'.$_SESSION['controle'].'/header.tpl';?>

    <main style="height:115%;"> <!-- 830px = 115% -->
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

    <?php include 'Projet/view/' . $_SESSION['controle'] . '/footer.tpl'; ?>
</body>
</html>

<!-- 1er milestone : l'utilisateur peut afficher son profil avec ses infos --> 
