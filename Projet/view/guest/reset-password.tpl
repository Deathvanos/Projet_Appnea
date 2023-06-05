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
    <title>APNEA - CGU</title>
    <?php include 'Projet/view/other/head_Font_Page.html';?>
    <link rel="stylesheet" href="Ressources/css/guest/pageConditions.css" />
    <link rel="stylesheet" href="Ressources/css/guest/modifMdp.css" />
</head>
<body>

<?php $txt = $GLOBALS['translat']; include 'Projet/view/'.$_SESSION['controle'].'/header.tpl';?>


    <main>
    <h1 id="Creation">Modification du 
        <color id=dégradé>mot de passe</color></h1>
        <div class="contenu">
        <?php if (isset($_SESSION['resetPassword'])) {
                echo '<div class="erroMsg">' . $_SESSION['resetPassword'] . '</div>';}?> 
        <form enctype="multipart/form-data" name="reset" action=<?php echo "index.php?controle=".$_SESSION['controle']."&action=resetPassword&token=".$tokenMdp;?> onSubmit="return verifMdp()" method="POST">
            <div class="infos_perso grid_container">
                <elem><h3 class="form_title"><?php echo $txt['Profil_newPassword']; ?> : </h3><input type="text" name="newPassword" placeholder= "Votre nouveau mot de passe" /></elem>
                <h3 class="hide"></h3>
                <elem><h3 class="form_title"><?php echo $txt['Profil_confirmNewPassword']; ?> : </h3><input type="password" name="newPasswordConfirm" placeholder= "Confirmer nouveau mot de passe" /></elem>
            </div>  
            <button class="submit" type="submit"><?php echo $txt['Submit']; ?></button>
        </form>
        </div>
    </main>

<?php include 'Projet/view/other/footer.tpl'; ?>

</body>
</html>
