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
    <title>APNEA - Main User</title>    
    <?php include 'Projet/view/other/head_Font_Page.html';?>
    <link rel="stylesheet" href="Ressources/css/user/mainUser.css" />
</head>
<body>
    <?php    
    $txt = $GLOBALS['translat'];
    include 'Projet/view/'.$_SESSION['controle'].'/header.tpl';?>



    <main>

        <?php $info =  $_SESSION['userInfo'];
        echo '<h3>'.$txt['userMain_date']. date("d/m/Y") ."</h3>";
        echo '<br>'.$txt['userMain_id'].$info['mail'];
        echo '<br>'.$txt['userMain_box']. ($info['id_Box']==null? "None" : $info['id_Box']);
        ?>

        <table class='buttonMain'>
            <thead><center><h1 class='title'><?php echo $txt['userMain'].'<color>'.$info['firstName']." ".$info['lastName'].'</color>'; ?></h1></center></thead> 
            <tr><td><a href='index.php?controle=user&action=sensorUserPage'><?php echo $txt['userMain_btnData']; ?></a></td></tr>
            <tr><td><a href='index.php?controle=user&action=contactPage'><?php echo $txt['userMain_btnTicket']; ?></a></td></tr>
        </table>

    </main>

    <?php include 'Projet/view/other/footer.tpl'; ?>
</body>
</html>