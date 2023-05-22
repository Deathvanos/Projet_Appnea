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
    <link rel="stylesheet" href="Ressources/css/admin/mainAdmin.css" />
</head>

<body>
    <?php
    // Bug  : on doit récuperer ces deux variables dans les variables globals 
    $txt = $GLOBALS['translat'];
    include 'Projet/view/' . $_SESSION['controle'] . '/header.tpl'; ?>

    <main class='main'>
        <table class='buttonMain'>
            <thead><h1 class='title'><?php echo $txt['adminMainTitle']; ?></h1></thead> 
            <tr><td><a href='index.php?controle=admin&action=createUserPage'><?php echo $txt['adminMain1']; ?></a></td></tr>
            <tr><td><a href='index.php?controle=admin&action=findUser'><?php echo $txt['adminMain2']; ?></a></td></tr>
        </table>
    </main>

    <?php include 'Projet/view/other/footer.tpl'; ?>
</body>

</html>