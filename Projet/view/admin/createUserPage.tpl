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
    <link rel="stylesheet" href="Ressources/css/admin/createUserPage.css" />
</head>

<body>
    <?php
    // Bug  : on doit récuperer ces deux variables dans les variables globals 
    $txt = $GLOBALS['translat'];
    include 'Projet/view/' . $_SESSION['controle'] . '/header.tpl';?>    

    <main class='main'>
        <h1 id="Creation">Création de
        <color id=dégradé>profil</color></h1>
        <div class="contenu">
        <!-- Afficher le message d'erreur s'il existe -->
        <?php if (isset($_SESSION['createUser'])) {
                echo '<div class="erroMsg" id="msg">' . $_SESSION['createUser'] . '</div>';}?> 
        <form enctype="multipart/form-data" name="ajouter" action=<?php echo "index.php?controle=admin&action=createUserPage" ;?> onSubmit="return verifChamp()" method="POST">
            <div class="infos_perso grid_container">
                <elem><h3 class="form_title"><?php echo $txt['Profil_Label_Name1']; ?> : </h3><input type="text" name="lastname" id="lastname" placeholder= "Votre nom" /></elem>
                <h3 class="hide"></h3>
                <elem><h3 class="form_title"><?php echo $txt['Profil_Label_Name2']; ?> :</h3><input type="text" name="firstname" id="firstname" placeholder= "Votre prénom" ></elem>
                <elem><h3 class="form_title"><?php echo $txt['Profil_Tel']; ?> : </h3> <input type="text" name="phoneNumber" placeholder= "Votre n° de téléphone"></elem>
                <h3 class="hide"> </h3>
                <elem><h3 class="form_title"><?php echo $txt['Profil_Mail']; ?> : </h3><input type="text" name="mail" placeholder= "Votre mail"></elem>
                <elem><h3 class="form_title"><?php echo $txt['Profil_Localisation']; ?> : </h3><input type="text" name="address" placeholder= "Votre adresse"></elem>
                <h3 class="hide"> </h3>
                <elem><h3 class="form_title"><?php echo $txt['Profil_City']; ?>  : </h3><input type="text" placeholder= "Votre ville" name="city"></elem>
                <elem><h3 class="form_title"><?php echo $txt['Profil_CodePostal']; ?> : </h3><input type="text" name="codePostal" placeholder= "Votre code postal" /></elem>
                <h3 class="hide"></h3>
                <elem><h3 class="form_title"><?php echo $txt['Profil_Country']; ?>  : </h3><input type="text" placeholder= "Votre pays" name="country"></elem>
                <elem><h3 class="form_title"><?php echo $txt['Profil_Birthday']; ?>  : </h3><input type="date" name="birthday"></elem>
                <h3 class="hide"></h3>
                <elem><h3 class="form_title"><?php echo $txt['Profil_Role']; ?>  : </h3>
                <select id="roles" name="role" onchange="afficherBoxID()">
                    <option disabled selected>Choisir une valeur</option>
                    <option value="User" >User</option>
                    <option value="Modo" >Modo</option>
                    <option value="Admin">Admin</option>
                </select>
                </elem>
                <elem><h3 id="elemBox" class="form_title"><?php echo $txt['Profil_BoxId']; ?>  : </h3>
                <select id="boxesId" name="boxId">
                    <option disabled selected value='null'>Choisir une valeur</option>
                    <?php foreach ($liste_resultat as $resultat) : ?>
                    <option value="<?php echo $resultat['id_Box']; ?>" name="boxId"><?php echo $resultat['id_Box']; ?></option>
                    <?php endforeach; ?>
                </select>
                </elem>
            </div>  
            <button class="submit" type="submit" ><?php echo $txt['Submit']; ?></button>
            <button type="submit" class="btnAbandon"><?php echo $txt['Abandon']; ?></button>
        </form>
    </main>

    <?php include 'Projet/view/other/footer.tpl'; ?>
</body>

</html>