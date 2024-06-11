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
    <title>APNEA - manageFAQPage</title>    
    <?php include 'Projet/view/other/head_Font_Page.html';?>
    <link rel="stylesheet" href="Ressources/css/modo/modifFAQPage.css" />
</head>
<body>
    <?php    
    $txt = $GLOBALS['translat'];
    //include 'Projet/view/'.$_SESSION['controle'].'/header.tpl';?>

    <a class="header_title" href="index.php?controle=modo&action=mainGuest">
        <img class="header_logo" src="Ressources/img/Logo_Appea-grey.svg" alt="Logo APPNEA">
        <?php echo $txt['title_brand']; ?>
    </a>

    <main>

        <?php if ($_GET['numfaq']!="new") {?>
            <h1><?php echo $txt['modifFAQ_title'] . ' n'. $faqSelect['id_question'];?></h1>
        <?php }
        else {echo "<h1>".$faqSelect['id_question']."</h1>";}?>

    
    <form action="index.php?controle=modo&action=addFAQ" method="post">
        <div>
            <h3>FAQ - Français</h3>
            <p>Français - Question</p>
            <textarea name="fr_question" minlength=1 required placeholder="<?php echo $faqSelect['fr_question'];?>"><?php echo $faqSelect['fr_question'];?></textarea>
            <p>Français - Reponse</p>
            <textarea name="fr_response" minlength=1 required placeholder="<?php echo $faqSelect['fr_response'];?>"><?php echo $faqSelect['fr_response'];?></textarea>
            <p><button>Toute enregistrer</button></p>
            <a href="index.php?controle=modo&action=manageFAQPage">Page précédante</a>
        </div>

        <div>
            <h3>FAQ - English</h3>
            <p>English - Question</p>
            <textarea name="us_question" minlength=1 required placeholder="<?php echo $faqSelect['us_question'];?>"><?php echo $faqSelect['us_question'];?></textarea>
            <p>English - Reponse</p>
            <textarea name="us_response" minlength=1 required placeholder="<?php echo $faqSelect['us_response'];?>"><?php echo $faqSelect['us_response'];?></textarea>
            <p><button>Save all</button></p>
            <a href="index.php?controle=modo&action=manageFAQPage">Last Page</a>
        </div>
        <input type="hidden" name="numfaq" value=<?php echo $_GET['numfaq']?>>
    </form>
     
    </main>

    <?php include 'Projet/view/other/footer.tpl'; ?>
</body>
</html>