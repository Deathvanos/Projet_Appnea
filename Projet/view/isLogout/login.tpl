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
<html>

<head>
    <?php include 'Projet/view/other/head_Font_Page.html'; ?>
    <link rel="stylesheet" href="Ressources/css/guest/login.css">
    <link rel="icon" type="image/x-icon" href="Ressources/img/Logo_Appea-color.svg">
</head>

<body>
    <?php $txt = $GLOBALS['translat']; ?>


    <div class="main_login">
        <a href='index.php?controle=guest&action=mainGuest' class="logo_text">
            <img src="Ressources\img\Logo_Appea-color.svg">
            <?php echo $txt['title_brand']; ?>
        </a>

        <h3 id="se_connecter_title"><?php echo $txt['login_title']; ?></h3>

        <div class="form">
            <!-- https://apcpedagogie.com/controler-les-mots-de-passe/ -->
            <form name='login' class="login-form" action="index.php?controle=guest&action=testConnection" method='post'>
                <p class="desc_login"><?php echo $txt['login_nameLabel']; ?></p>
                <input id="nom" type="text" placeholder="<?php echo $txt['login_nameField']; ?>" name="mail" required minlength="1" />
                <p class='desc_login'><?php echo $txt['login_mdpLabel']; ?></p>
                <input id="mdp" type="password" placeholder="<?php echo $txt['login_mdpField']; ?>" name="mdp" required minlength="1" />
                <input id="btn_connection" type="submit" value="<?php echo $txt['login_title']; ?>" />
                <p class="message">
                    <?php echo $txt['login_newUser1']; ?>
                    <a href='index.php?controle=guest&action=contactPage'><?php echo $txt['login_newUser2']; ?></a>
                </p>
                <p id="mdp_oublie"><a href='index.php?controle=guest&action=errorPage'><?php echo $txt['login_forgotMdp']; ?></a></p>
                <!-- Afficher le message d'erreur s'il existe -->
                <?php if (isset($_SESSION['errorLog'])) {echo '<div class="erroMsg">' . $_SESSION['errorLog'] . '</div>';}
                else {echo '';} ?>
            </form>
        </div>
    </div>


    <div id="droite_login"><h3><?php echo $txt['login_Add']; ?></h3></div>

</body>

</html>
