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
        <meta charset="utf-8">
        <link rel="icon" type="image/x-icon" href="Ressources/img/Logo_Appea-color.svg">
        <link rel="stylesheet" href="Ressources/css/guest/login.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="Ressources/css/allPage.css" />
    </head>

    <body>
        <?php    
        // Bug  : on doit récuperer ces deux variables dans les variables globals 
        $txt = $GLOBALS['translat'];?>
        <div class="main_login">
          <div class="login-page">
            <img class="logo_text" src="Ressources\img\Logo_Appnea_with_name.png">
            <h3 id="se_connecter_title">Se connecter</h3>
              <div class="form">

                <!-- https://apcpedagogie.com/controler-les-mots-de-passe/ -->
                <form name='login' class="login-form" action="index.php?controle=guest&action=testConnection" method='post'>
                  <p class="desc_login">Nom d'utilisateur</p>
                  <input id="nom" type="text" placeholder="Entrez votre nom d'utilisateur" name="mail" required minlength="1"/>
                  <p class='desc_login'>Mot de passe</p>
                  <input id="mdp" type="password" placeholder="Entrez votre mot de passe" name="mdp" required minlength="1"/>
                  <input id="btn_connection" type="submit" value="Se connecter"/>
                  <p class="message">Nouveau chez APPNEA ? <a href="index.php?controle=guest&action=contactPage" >Achète ton produit</a></p>
                  <p id="mdp_oublie">Mot de passe oublié ? Cliquez ici</p>
                  <!-- Afficher le message d'erreur s'il existe -->
                  <?php if(isset($_SESSION['errorLog'])){echo '<br>'.$_SESSION['errorLog'];}else{echo '';}?>
                </form>
              </div>
            </div> 
          </div> 
          <div id="droite_login" class="main">
            <h3 id="message_droite"> - Enfin du vrai repos</h3>
          </div> 
    </body>
</html>