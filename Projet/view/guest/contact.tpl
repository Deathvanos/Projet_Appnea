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
    <title>APNEA - Contact</title>
    <?php include 'Projet/view/other/head_Font_Page.html';?>
    <link rel="stylesheet" href="Ressources/css/guest/contact.css" />
</head>
<body>

    <?php
    $txt = $GLOBALS['translat'];
    include 'Projet/view/'.$_SESSION['controle'].'/header.tpl';?>

    <main>

        <h2 class="title"><?php echo $txt['contact_title'];?></h2>

        <<form name='contact' class="contact-form" action="envoyer_email.php" method='post'>
    <div class='mailSpace'>
        <p><?php echo $txt['contact_obj_title'];?></p>
        <textarea placeholder="<?php echo $txt['contact_obj_sub'];?>" name="objet"></textarea>
        <p><?php echo $txt['contact_question_title'];?></p>
        <textarea placeholder="<?php echo $txt['contact_question_sub'];?>" name="message"></textarea>
    </div>
</form>

        
       <div class='buttons'>
            <input href="#"><?php echo $txt['contact_send'];?></input>
            <a href=<?php echo "index.php?controle=".$_SESSION['controle']."&action=main".ucfirst($_SESSION['controle'])?>><?php echo $txt['contact_back'];?></a>
       </div>
        
    </main>

    <?php include 'Projet/view/other/footer.tpl'; 
    

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $to = "serviceappnea@outlook.com"; 
        $objet = $_POST["objet"];
        $message = $_POST["message"];
    
        $headers = "serviceappnea@outlook.com"; 
        $headers .= "Reply-To: " . $_POST["email"];
    
        if (mail($to, $objet, $message, $headers)) {
            echo "L'e-mail a bien été envoyé.";
        } else {
            echo "Une erreur s'est produite lors de l'envoi.";
        }
    }
?>


</body>
</html>
