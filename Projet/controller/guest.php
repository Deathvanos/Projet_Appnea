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

    /***** Header *****/

    function mainGuest(){require_once('./Projet/view/guest/mainGuest.tpl');}
    
    function productPage(){require_once('./Projet/view/guest/productPage.tpl');}
    
    function teamsPage(){require_once('./Projet/view/guest/teams.tpl');}

    function CGUPage(){require_once('./Projet/view/guest/CGUPage.tpl');}

    function PrivacyPolicyPage(){require_once('./Projet/view/guest/privacyPolicyPage.tpl');}

    function CookiesPage(){require_once('./Projet/view/guest/cookiesPage.tpl');}
    

    function FAQPage(){
        // Fonction login vers la base de données
        include_once("Projet/modele/guest.php");
        $data = FAQextraction();
        require_once('./Projet/view/guest/FAQPage.tpl');
    }


    /***** Footer *****/
    function contactPage(){
        // Texte dans la bonne langue
        $txt = $GLOBALS['translat'];
        include_once('Projet/view/'.$_SESSION['controle'].'/header.tpl');

        # Champs de saisie vide
        $email = null;
        $objetMail = null;
        $title = null;
        $text = null;
        
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            // Récupérer les données du formulaire
            $email = $_POST["email"];
            $title = $_POST["title"];
            $text = $_POST["text"];

            if (isset($_POST["objetMail"])) {
                $objetMail = $_POST["objetMail"];

                // Envoi le mail à APPNEA
                $to = "webmaster@appnea.websr.fr";
                $subject = $objetMail;
                $message = "Objet: ".$title . "\n\n" . "Question: " . $text;
                $headers = "Content-Type: text/plain; charset=utf-8\r\n";
                $headers .= "From: ".$email;
                if (mail($to, $subject, $message, $headers)) {
                    echo "<center class='msgforUser'>".$txt['contact_msgValidate1']."</center>";
                } 
                else {echo "<center class='msgforUser'>".$txt['contact_msgError2']."</center>";}

                // Envoi un mail de bien reception du message à l'utilisateur
                $to = $email;
                $subject = "Re: ".$objetMail;
                $message =$txt['contact_msgConfirm']."____________________\nObjet: ".$title.  "\n\n". $text;
                $headers = "Content-Type: text/plain; charset=utf-8\r\n";
                $headers .= "From: serviceappnea@outlook.com\r\n";
                $headers .= "Reply-To: serviceappnea@outlook.com\r\n";
                $headers .= "X-Mailer: PHP/" . phpversion();
                if (mail($to, $subject, $message, $headers)) {
                    echo "<center class='msgforUser'>".$txt['contact_msgValidate2']."</center>";
                    // Suppression des valeurs saisi par l'utilisateur après envoi du mail
                    $email = null;
                    $objetMail = null;
                    $title = null;
                    $text = null;
                } 
                else {echo "<center class='msgforUser'>".$txt['contact_msgError3']."</center>";}
            }
            else {echo "<center class='msgforUser'>".$txt['contact_msgError1']."</center>";}
        }
        require_once('./Projet/view/guest/contact.tpl');
    }









    function resetPassword(){
        $tokenMdp = $_GET['token'];
        $_SESSION['resetPassword'] = "Merci de bien renseigner les champs suivants.<br> Un mot de passe doit contenir au moins un caractère spécial, une minuscule, une majuscule, un chiffre et 8 caractères minimum";
        echo '<script src="Projet/view/other/js/resetPassword.js"></script>';
        if ($_SERVER['REQUEST_METHOD'] == 'POST'){
            include_once("Projet/modele/infoDB.php");
            include_once("Projet/view/reset-password.tpl");
            $conn = connectionToDB();
            $newPassword = $_POST['newPassword'];
            $passwordHashed = hash('ripemd160', $newPassword);
            // echo($newPassword);
            $newPasswordConfirm = $_POST['newPasswordConfirm'];
            $sql = "UPDATE utilisateur 
                    SET password = :newPassword 
                    WHERE token = :token";
            $commande = $conn->prepare($sql);
            $commande->bindParam(':token',$tokenMdp);
            $commande->bindParam(':newPassword',$passwordHashed);
            $commande->execute();
            $conn = null;    
            $tokenMdp ="...";
            $_SESSION['resetPassword'] = "Le mot de passe a été modifiée.<br>Veuillez cliquez sur le bouton connexion en haut à droite.";
            
        }
        
        // Récupérez le jeton à partir de l'URL
        require_once("Projet/view/guest/reset-password.tpl");
    }

    function forgetPassword(){
        $txt = $GLOBALS['translat'];
        echo '<script src="Projet/view/other/js/resetPasswordMail.js"></script>';
        $_SESSION['SaisirMail'] = "Saisir votre mail";
        
        if ($_SERVER['REQUEST_METHOD'] == 'POST'){
            $mail = $_POST['mail'];
            $token = uniqid();

        // expiration du jeton : 6 heures
        // $expiration = date('Y-m-d H:i:s', strtotime('+6 hour'));

        // Construction du lien de réinitialisation
        $resetLink = "https://appnea.websr.fr/index.php?controle=guest&action=resetPassword&token=" . $token;

        // Information du mail
        $title = "Creation profil APPNEA";
        $message = "Cher client.\n\nVoici le lien pour réinitialiser votre mot de passe : " . $resetLink;        
        $subject = "APPNEA";
        $headers = "Content-Type: text/plain; charset=utf-8\r\n";
        $headers .= "From: serviceappnea@outlook.com\r\n";
        $headers .= "Reply-To: serviceappnea@outlook.com\r\n";
        $headers .= "X-Mailer: PHP/" . phpversion();
        
        include_once("Projet/modele/infoDB.php");
        include_once("Projet/view/guest/reset-password-mail.tpl");


        // Connexion à la DB puis insertion d'un élément à la table
        $conn = connectionToDB();
        try{
            require_once("Projet/view/guest/reset-password-mail.tpl");
            $sql = "UPDATE utilisateur SET utilisateur.token = '$token' WHERE utilisateur.mail = '$mail';";
            $commande = $conn->prepare($sql);
            $commande->execute();

            // envoie du mail
            if (mail($mail, $subject, $message, $headers)) {
                $_SESSION['SaisirMail'] = "Un mail a bien été envoyée";
            }
            else
            {
                $_SESSION['SaisirMail'] = "Un mail n'a pas bien été envoyée";
            }
        }
        catch (PDOException $e) {
            $_SESSION['SaisirMail'] = "Un mail n'a pas bien été envoyée";
            }
        $conn = null;

        }
        require_once("Projet/view/guest/reset-password-mail.tpl");

        }





    /************************************/
    /** TEMP : check session variable ***/
    /************************************/

    function checkVarSession() {
        Print_r($_SESSION); // _SESSION - txt
        echo "<u><b> <br><br>Voici la liste des informations concernant votre session :<br> </b></u>";
        foreach ($_SESSION as $cle => $valeur) {
            if(Gettype ($valeur) != gettype(array())) {echo "- ".$cle . " : " . $valeur . "<br>";}
            else {
                echo "<br> <b>$cle</b> <br>";
                foreach ($valeur as $Subcle => $Subvaleur) {echo "- ".$Subcle . " : " . $Subvaleur . "<br>";}
            }
        }
    }

?>
