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
    <title>APPNEA - Profil modification</title>
    <?php include 'Projet/view/other/head_Font_Page.html';?>
    <link rel="stylesheet" href="Ressources/css/user/modifProfil.css"/>
</head>
<body>
    <?php
    // Bug  : on doit récuperer ces deux variables dans les variables globals
    $txt = $GLOBALS['translat'];
    include 'Projet/view/'.$_SESSION['controle'].'/header.tpl';?>

<main>
    <h1> Votre <color>profil</color></h1>
    <div class="contenu">
        <?php
        if($photo_base64 !=""){
            echo "<img src='data:image/jpeg;base64," . $photo_base64 . "' . width=30% heigth=30%/>";
        }else
        {
            echo "<img src='Ressources/img/profil/bedroom.png' alt='Photo de profil' width=15% heigth=15%/>";
        }
        ?>
        <form enctype="multipart/form-data" action=<?php echo "index.php?controle=".$_SESSION['controle']."&action=modifInfos";?> method="POST">
            <div class="infos_perso grid_container">
                <elem><h3 class="form_title"><?php echo $txt['Profil_Label_Name1']; ?> : </h3><input type="text" placeholder= <?php echo("'$lastName'"); ?> name="lastname" value=<?php echo("'$lastName'"); ?>/></elem>
                <h3 class="hide"> </h3>
                <elem><h3 class="form_title"><?php echo $txt['Profil_Label_Name2']; ?> :</h3><input type="text" placeholder= <?php echo("'$firstName'");?> name="firstname" value=<?php echo("'$firstName'"); ?> /></elem>
                <elem><h3 class="form_title"><?php echo $txt['Profil_Tel']; ?> : </h3> <input type="text" placeholder= <?php echo("'$phoneNumber'");?> name="phoneNumber" value=<?php echo("'$phoneNumber'"); ?>/></elem>
                <h3 class="hide"> </h3>
                <elem><h3 class="form_title"><?php echo $txt['Profil_Mail']; ?> : </h3><input type="text" placeholder= <?php echo("'$mail'");?> name="mail" value=<?php echo("'$mail'"); ?>/></elem>
                <elem><h3 class="form_title"><?php echo $txt['Profil_Localisation']; ?> : </h3><input type="text" placeholder= <?php echo("'$address'");?> name="address" value=<?php echo("'$address'"); ?>/></elem>
                <h3 class="hide"> </h3>
                <elem><h3 class="form_title"><?php echo $txt['Profil_City']; ?>  : </h3><input type="text" placeholder= <?php echo("'$city'");?> name="city" value=<?php echo("'$city'"); ?>/></elem>
                <elem><h3 class="form_title"><?php echo $txt['Profil_Country']; ?>  : </h3><input type="text" placeholder= <?php echo("'$country'");?> name="country" value=<?php echo("'$country'"); ?>/></elem>
            </div>
            <label for="avatar"><?php echo $txt['Profil_Avatar']; ?> </label>
            <input type="file" id="avatar" name="avatar" accept="image/png, image/jpeg" style="display: none;">
            <button class="submit" type="submit"><?php echo $txt['Submit']; ?></button>
            <a href=<?php echo "index.php?controle=".$_SESSION['controle']."&action=errorPage";?> class="modifMdp"><?php echo $txt['Profil_Change_mdp']; ?></a>
        </form>
        <form action=<?php echo "index.php?controle=".$_SESSION['controle']."&action=displayProfil";?> method="POST">
            <button type="submit" class="btnAbandon"><?php echo $txt['Abandon']; ?></button>
        </form>
    </div>
</main>
<?php include 'Projet/view/other/footer.tpl'; ?>
</body>
</html>
