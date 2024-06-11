<?php

    // Affiche la page de connection
    function login(){require_once('./Projet/view/isLogout/login.tpl');}


    /************************************/
    /****** Fonctions check login *******/
    /************************************/
    function testConnection() {
        // Récupération des infos du guest
        $mail = htmlspecialchars($_POST['mail']);
        $mdp= htmlspecialchars($_POST['mdp']);

        /*** Vérification des infos avant la requete SQL ***/
        if (!preg_match('/^[a-zA-Z0-9~!@#$%^&*()_+-={[}]|\:;<>,.?\/]+$/', $mdp) ) { 
            // La chaîne ne contient que des caractères alphanumériques et certains symboles
            // caractères spéciaux possible ~ ! @ # $ % ^ & * ( ) _ - + = { [ } ] | : ; < > , . ?
                $_SESSION['errorLog'] = "Mail ou mot de passe non conforme.";
                header('Location: ' . $_SERVER['HTTP_REFERER']);
                exit();
        }

        // Fonction login vers la base de données
        include_once("Projet/modele/isLogout.php");
        tryLogin();

        // Si la fonction tryLogin a fonctionné alors l'user exist -> connection
        $funcTypeUser = 'is'.$_SESSION['userInfo']["typeUser"];
        $funcTypeUser();
    }


    /********************************************/
    /********* Fonctions de login Page **********/
    /********************************************/
    
    // Après verification de la demande de login, connection de l'utilisateur
    function isUser(){
        $_SESSION['controle'] = "user";
        header('Location: index.php?controle=user&action=mainUser');
    }
    function isModo(){
        $_SESSION['controle'] = "modo";
        header('Location: index.php?controle=modo&action=mainModo');
    }
    function isAdmin(){
        $_SESSION['controle'] = "admin";
        header('Location: index.php?controle=admin&action=mainAdmin');
    }
?>