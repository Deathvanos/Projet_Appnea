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
    <title>APNEA - Contact</title>
    <?php include 'Projet/view/other/head_Font_Page.html';?>
    <link rel="stylesheet" href="Ressources/css/guest/contact.css" />
</head>
<body>

    <?php
    $txt = $GLOBALS['translat'];
    include 'Projet/view/'.$_SESSION['controle'].'/header.tpl';?>

    <main>

        <h2 class="title"><?php echo $txt['contact_title'];?></h2>

        <div class='mailSpace'>
            <p><?php echo $txt['contact_obj_title'];?></p>
            <textarea placeholder="<?php echo $txt['contact_obj_sub'];?>"></textarea>
            <p><?php echo $txt['contact_question_title'];?></p>
            <textarea placeholder="<?php echo $txt['contact_question_sub'];?>"></textarea>
        </div>
        
       <div class='buttons'>
            <a href="#"><?php echo $txt['contact_send'];?></a>
            <a href=<?php echo "index.php?controle=".$_SESSION['controle']."&action=main".ucfirst($_SESSION['controle'])?>><?php echo $txt['contact_back'];?></a>
       </div>
        
    </main>

    <?php include 'Projet/view/other/footer.tpl'; ?>

</body>
</html>
