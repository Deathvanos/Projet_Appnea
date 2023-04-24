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
    <title>APNEA - Profil modification</title>
    <?php include 'Projet/view/other/header_Font_Page.html';?>
    <link rel="stylesheet" href="Ressources/css/user/modifProfil.css"/>
</head>
<body>
    <?php    
    // Bug  : on doit récuperer ces deux variables dans les variables globals 
    $txt = $GLOBALS['translat'];
    include 'Projet/view/'.$_SESSION['controle'].'/header.tpl';?>

    <main style="height:115%;"> <!-- 830px = 115% -->
        <h1> Votre <color>profil</color></h1>
        <div class="contenu">
            <?php echo "<img src='data:image/jpeg;base64," . $photo_base64 . "' . width=30% heigth=30%/>"; ?>
            <!--<img src="<?php echo("'data:image/jpeg;base64," . $photo_base64 . "'"); ?> " /> -->
            
            <form enctype="multipart/form-data" action="index.php?controle=user&action=modifInfos" method="POST">
                <div class="infos_perso grid_container">
                    <elem><h3>Nom : </h3><input type="text" placeholder= <?php echo("'$lastName'"); ?> name="lastname"/></elem>
                    <h3 class="hide"> </h3>
                    <elem><h3>Prénom :</h3><input type="text" placeholder= <?php echo("'$firstName'");?> name="firstname"/></elem>
                    <elem><h3>Numéro de téléphone : </h3> <input type="text" placeholder= <?php echo("'$phoneNumber'");?> name="phone"/></elem>
                    <h3 class="hide"> </h3>
                    <elem><h3>Mail : </h3><input type="text" placeholder= <?php echo("'$mail'");?> name="mail"/></elem>
                    <elem><h3>Adresse : </h3><input type="text" placeholder= <?php echo("'$address'");?> name="address"/></elem>
                    <h3 class="hide"> </h3>
                    <elem><h3>Ville : </h3><input type="text" placeholder= <?php echo("'$city'");?> name="city"/></elem>
                    <elem><h3>Pays : </h3><input type="text" placeholder= <?php echo("'$country'");?> name="country"/></elem>
                </div>
                <label for="avatar">Modifier la photo</label>
                <input type="file" id="avatar" name="avatar" accept="image/png, image/jpeg" style="display: none;">
                <button type="submit">Enregistrer</button>
                <a href="">Modifier votre mot de passe ? Cliquez ici</a>
            </form>
        </div>
    </main>

    <?php include 'Projet/view/' . $_SESSION['controle'] . '/footer.tpl'; ?>
</body>
</html>
