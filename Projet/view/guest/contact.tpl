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
    include_once('Projet/view/'.$_SESSION['controle'].'/header.tpl');?>


    <main>

        <h2 class="title"><?php echo $txt['contact_title'];?></h2>

        <form method="post" action=<?php echo "index.php?controle=".$_SESSION['controle']."&action=contactPage"?>>

            <div class='mailSpace'>
                <p><?php echo $txt['contact_mail'];?></p>
                <input name="email"  id="email" type="email" value="<?php echo $email;?>" minlength=1 maxlength=100 required placeholder="<?php echo $txt['contact_mail_sub'];?>"></input>
                <p><?php echo $txt['contact_obj'];?></p>
                <select name="objetMail" id="objetMail" autocomplete required>
                    <option disabled selected><?php echo $txt['contact_obj_base'];?></option>
                    <option value="<?php echo $txt['contact_obj1'];?>"><?php echo $txt['contact_obj1'];?></option>
                    <option value="<?php echo $txt['contact_obj2'];?>"><?php echo $txt['contact_obj2'];?></option>
                    <option value="<?php echo $txt['contact_obj3'];?>"><?php echo $txt['contact_obj3'];?></option>
                    <option value="<?php echo $txt['contact_obj4'];?>"><?php echo $txt['contact_obj4'];?></option>
                    <option value="<?php echo $txt['contact_obj5'];?>"><?php echo $txt['contact_obj5'];?></option>
                    <option value="<?php echo $txt['contact_obj6'];?>"><?php echo $txt['contact_obj6'];?></option>
                    <option value="<?php echo $txt['contact_obj7'];?>"><?php echo $txt['contact_obj7'];?></option>
                    <option value="<?php echo $txt['contact_obj8'];?>"><?php echo $txt['contact_obj8'];?></option>
                    <option value="<?php echo $txt['contact_obj9'];?>"><?php echo $txt['contact_obj9'];?></option>
                </select>
                <p><?php echo $txt['contact_obj_title'];?></p>
                <textarea name="title" minlength=1 maxlength=100 required placeholder="<?php echo $txt['contact_obj_sub'];?>"><?php echo $title;?></textarea>
                <p><?php echo $txt['contact_question_title'];?></p>
                <textarea name="text" minlength=1 maxlength=1000 required placeholder="<?php echo $txt['contact_question_sub'];?>"><?php echo $text;?></textarea>
            </div>

            <div class='buttons'>
                <input type="submit" value=<?php echo $txt['contact_send'];?>></input>
                <a href=<?php echo "index.php?controle=".$_SESSION['controle']."&action=main".ucfirst($_SESSION['controle'])?>><?php echo $txt['contact_back'];?></a>
            </div>

       </form>
        
    </main>

    <?php include 'Projet/view/other/footer.tpl'; ?>

</body>
</html>
