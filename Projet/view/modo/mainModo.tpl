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
    <title>APNEA - Main Modo</title>    
    <?php include 'Projet/view/other/header_Font_Page.html';?>
    <link rel="stylesheet" href="Ressources/css/modo/mainModo.css" />
</head>
<body>
    <?php    
    $txt = $GLOBALS['translat'];
    include 'Projet/view/'.$_SESSION['controle'].'/header.tpl';?>

    <main class='main'>
        <table class='buttonMain'>
            <thead><h1 class='title'><?php echo $txt['modoMainTitle']; ?></h1></thead> 
            <tr><td><a href='index.php?controle=modo&action=errorPage'><?php echo $txt['modoMain2']; ?></a></td></tr>
            <tr><td><a href='index.php?controle=modo&action=findUser'><?php echo $txt['adminMain2']; ?></a></td></tr>
        </table>
    </main>

    <?php include 'Projet/view/' . $_SESSION['controle'] . '/footer.tpl'; ?>
</body>
</html>