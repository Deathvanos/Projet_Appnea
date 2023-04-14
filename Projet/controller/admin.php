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

    // Affiche la page d'accueil d'un guest
    function mainGuest(){require('./Projet/view/guest/main.tpl');}
    /* Affiche la page d'accueil */
    function mainAdmin(){require('./Projet/view/admin/main.tpl');}
    /* Affiche la page de findUser */
    function findUser(){require('./Projet/view/admin/findUser.tpl');}

    // Header
    function teamsPage(){require('./Projet/view/guest/teams.tpl');}

    // Footer
    function contactPage(){require('./Projet/view/guest/contact.tpl');}
    // Après verification de la demande de login, connection de l'utilisateur



    /**
     * L'utilisateur doit confirmer avant de supprimer un user
     */
    function sendConfirmationDelUser(){
        // Chargement du fichier JavaScript
        echo '<script id="confirm-script" src="Projet/view/other/js/confirmDeleteUser.js" type="text/javascript"></script>';
        // Activation de la fonction (mettre '' pour str et rine pour int)
        echo "<script>msgDelUser('".$_POST['delUser']."')</script>";
    }


    /* Affiche la page de findUser */
    function findUser(){
        // Fonction login vers la base de données
        include("Projet/modele/admin.php");
        
        // if delete button on
        if(isset($_POST['delUser'])) {
            // Pour la suite du programme
            $_POST['validat'] = 'ok';
            // cas 2 : 2e clic -> suppression définitif 
            if (isset($_COOKIE['valueRep'])) {
                // mais seulement si on a choisi le même user
                if ($_COOKIE['valueRep']==$_POST['delUser']){
                    
                    removeUser();
                }
                // Sinon on retombe sur le 1er cas
                else {sendConfirmationDelUser();}
            }
            // cas 1 : 1er clic -> demande de comfirmation avant suppression 
            else {sendConfirmationDelUser();}
        }

        // La page est reload - isset($_POST['validat']) = true
        if (isset($_POST['nbElements'])){            
            $nbElements = $_POST['nbElements'];
            $posList = $_POST['posList'];

            // En fonction du bouton clic -> action différentes
            switch ($_POST['validat']) {
                // On supprime cette var pour réinitialiser les vars du $_POST à null
                case 'reset': unset($_POST['mail']); break;
                // Affiche les n éléments suivant
                case 'next':
                    $nbUser = nbUserFind();
                    $posList += $nbElements;
                    if ($posList>= $nbUser) {$posList-=$nbElements;}
                    if ($posList<0) {$posList=0;}
                    break;
                // Affiche les n éléments précédant
                case 'last':
                    $posList -= $nbElements;
                    if ($posList<0) {$posList=0;}
                    break;
                // Nombre d'éléments à afficher
                case 3: $nbElements = 3; break;    
                case 4: $nbElements = 4; break;
                case 5: $nbElements = 5; break;
                // Validation le compteur retourne à 0
                default: if(!isset($_POST['delUser'])) {$posList = 0;} break; 
            }
        }

        // On arrive sur la page pour la first time or reset page - Il n'y a pas de filtre
        if(!isset($_POST['mail'])) {
            $nbElements = 5;
            $posList = 0;
            $_POST['typeUser'] = null;
            $_POST['firstName'] = null;
            $_POST['lastName'] = null;
            $_POST['mail'] = null;
            $_POST['birthday'] = null;
            $_POST['phoneNumber'] = null;
            $_POST['country'] = null;
            $_POST['city'] = null;
            $_POST['address'] = null;
            $_POST['cardiaqueStat'] = null;
            $_POST['sonorStat'] = null;
            $_POST['temperatureStat'] = null;
            $_POST['humidityStat'] = null;
        }
                
        // Va chercher la table User
        $result = printDataBase($posList, $nbElements);

        // Pour un affichage dinamique de la hauteur de la pge
        $nbUser = nbUserFind();
        $size =  300 + 80 * ($nbUser-$nbElements>0 ? $nbElements : $nbUser) ;
                
        require('./Projet/view/admin/findUser.tpl');
    }



    function printInfoSensor($sensor, $isUsed, $isNotBroken) {
        if ($sensor!=null) {
            if ($isUsed==1 & $isNotBroken==1) {echo '<td><p class="colorTrue">active</p></td>';}
            else {echo '<td><p class="colorFalse">lock</p></td>';}
        }
        else {echo '<td><p">.</p></td>';}
    }







    
    
?>