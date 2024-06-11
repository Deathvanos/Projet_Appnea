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
    <title>APNEA - Main Admin</title>
    <?php include 'Projet/view/other/head_Font_Page.html';?>
    <link rel="stylesheet" href="Ressources/css/admin/showUserInfo.css" />
</head>

<body>
    <?php
    // Bug  : on doit récuperer ces deux variables dans les variables globals 
    $txt = $GLOBALS['translat'];
    //include 'Projet/view/' . $_SESSION['controle'] . '/header.tpl'; ?>

    <a class="header_title" href="index.php?controle=modo&action=mainGuest">
        <img class="header_logo" src="Ressources/img/Logo_Appea-grey.svg" alt="Logo APPNEA">
        <?php echo $txt['title_brand']; ?>
    </a>

    <main class='main'>
            <h1 class='title'>Vous consultez la page de : <?php echo $_GET['temoin']; ?> </h1> 
            <br><br>
            <br>
            <h2>ERROR - Info missing</h2> 
            <br>
            <a href="index.php?controle=admin&action=findUser">RETOUR</a> 
    </main>

    <?php include 'Projet/view/other/footer.tpl'; ?>
</body>

</html>