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
    <meta charset="UTF-8">
    <title>APNEA</title>    
    <link rel="icon" type="image/x-icon" href="Ressources/img/Logo_Appea-color.svg">
    <link rel="stylesheet" href="Ressources/css/allPage.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="Ressources/bitmap/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="Ressources/css/admin/mainAdmin.css" />
</head>
<body>
    <?php    
    // Bug  : on doit récuperer ces deux variables dans les variables globals 
    $txt = $GLOBALS['translat'];
    include 'Projet/view/'.$_SESSION['controle'].'/header.tpl';?>

    <main class='main' style="height:440px;">
        <table class='buttonMain'>
            <thead><h1 class='title'><?php echo $txt['adminMainTitle']; ?></h1></thead> 
            <tr><td><a href='index.php?controle=admin&action=errorPage'><?php echo $txt['modoMain2']; ?></a></td></tr>
            <tr><td><a href='index.php?controle=admin&action=errorPage'><?php echo $txt['adminMain2']; ?></a></td></tr>
        </table>
    </main>

    <?php include 'Projet/view/other/footer.tpl'; ?>
</body>
</html>