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
  
  
  <?php 
  
  
      /********************************************/
      /***** Fonctions pour afficher une page *****/
      /********************************************/
      // Affiche la page d'accueil d'un guest
      function mainGuest(){require('./Projet/view/guest/main.tpl');}
      // Affiche la page de connection 
      function login(){require('./Projet/view/guest/login.tpl');}
      // Après verification de la demande de login, connection de l'utilisateur
      function User(){header('Location: index.php?controle=user&action=mainUser');}
      function Modo(){header('Location: index.php?controle=modo&action=mainModo');}
      function Admin(){header('Location: index.php?controle=admin&action=mainAdmin');}
  
  
  
      /************************************/
      /***** Fonctions about le login *****/
      /************************************/
      function testConnection() {
          // Récupération des infos du guest
          $mail = htmlspecialchars($_POST['mail']);
          $mdp= htmlspecialchars($_POST['mdp']);
  
          /*** Vérification des infos avant la requete SQL ***/
          // 
          if (//!preg_match("/@/", $mail) | // un mail doit contenir un @
            //  (strlen($mdp) < 8 || strlen($mdp) > 64) | // Vérifier la longueur du mot de passe
            //  !preg_match("/[A-Z]/", $mdp) | // Vérifier la présence d'une lettre majuscule
             // !preg_match("/[a-z]/", $mdp) | // Vérifier la présence d'une lettre minuscule
             // !preg_match("/[0-9]/", $mdp) | // Vérifier la présence d'un chiffre
            //  !preg_match('/[~!@#$%^&*()_+={[}\]|:;<>,.?]/', $mdp) | // Vérifier la présence d'un caractère spécial autorisé
              !preg_match('/^[a-zA-Z0-9~!@#$%^&*()_+-={[}]|\:;<>,.?\/]+$/', $mdp) ) { // La chaîne ne contient que des caractères alphanumériques et certains symboles
              // caractères spéciaux possible ~ ! @ # $ % ^ & * ( ) _ - + = { [ } ] | : ; < > , . ?
                  $_SESSION['errorLog'] = "Mail ou mot de passe non conforme.";
                  //header('Location: ' . $_SERVER['HTTP_REFERER']);
                  require('Projet/view/guest/main.tpl');
                  exit();
          }
  
          // Fonction login vers la base de données
          include("Projet/modele/guest.php");
          tryLogin();
  
          // Si la fonction tryLogin a fonctionné alors l'user exist -> connection
          $_SESSION['userInfo']["typeUser"]();
      } 
  ?>