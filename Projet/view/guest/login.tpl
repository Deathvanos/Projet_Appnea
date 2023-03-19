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
        <link rel="stylesheet" href="Ressources/css/guest/login.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
        <!-- background : <link rel="stylesheet" href="Ressources/css/allPage.css" /> -->
    </head>

    
  
    <body>
        <?php    
        // Si l'utilisateur va sur cette page alors il est logout et va sur la main page
        if (isset($_SESSION['userInfo'])) { header('Location: index.php');}

        // Bug  : on doit récuperer ces deux variables dans les variables globals 
        $translat = $GLOBALS['translat'];
        $errorPage = $GLOBALS['errorPage'];?>

        <div class="barre-verticale"></div>
        <div class="login-page">
            <div class="form">


              <!-- https://apcpedagogie.com/controler-les-mots-de-passe/ -->
              <form name='' class="login-form" action="index.php?controle=guest&action=testConnection" method='post'>
                <input type="text" placeholder="Nom d'utilisateur" name="mail" required minlength="1"/>
                <input type="password" placeholder="Mot de passe" name="mdp" required minlength="1"/>
                <input type="submit" value="Se connecter" />


                <button>Se connecter de la mauvaise manière</button>
                <p class="message">Pas encore de compte ? <a href= <?php echo $errorPage?> >Créer un compte</a></p>

                <!-- Afficher le message d'erreur s'il existe -->
                <?php if(isset($_SESSION['errorLog'])){echo '<br>'.$_SESSION['errorLog'];}else{echo 'first try';}?>
                


              </form>


            </div>
          </div>
      
    </body>
</html>