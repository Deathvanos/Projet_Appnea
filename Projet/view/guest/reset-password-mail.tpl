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
    <title>APNEA - createUserPage</title>
    <?php include 'Projet/view/other/head_Font_Page.html';?>
    <link rel="stylesheet" href="Ressources/css/guest/resetpassword.css" />
    <style>
        elem{
            width:100%;
            margin-left:100%;
        }
        main {
            text-align: center;
        }
    </style>
</head>

<body>
    <?php
    // Bug  : on doit récuperer ces deux variables dans les variables globals 
    $txt = $GLOBALS['translat'];
    include 'Projet/view/guest/header.tpl';?>    
    <main>
        <?php if (isset($_SESSION['SaisirMail'])) {
            echo '<div class="erroMsg">' . $_SESSION['SaisirMail'] . '</div>';}?> 
        <h1>Reinitialiser son mot de passe</h1>
        <form enctype="multipart/form-data" name="ajouter" action=<?php echo "index.php?controle=guest&action=forgetPassword" ;?> onSubmit="return resetPasswordMail()" method="POST">
            <div class="infos_perso grid_container">
                <elem><h3 class="form_title"><?php echo $txt['Profil_Mail']; ?> : </h3><input type="text" name="mail" id="mail" placeholder= "Votre mail" /></elem>
            </div>
            <button class="submit" type="submit" ><?php echo $txt['Submit']; ?></button>
            <button type="submit" class="btnAbandon"><?php echo $txt['Abandon']; ?></button>
              
        </form>
    </main>

    <?php include 'Projet/view/other/footer.tpl'; ?>
</body>

</html>