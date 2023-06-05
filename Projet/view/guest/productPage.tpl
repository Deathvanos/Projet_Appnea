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
    <title>APNEA - productPage</title>
    <?php include 'Projet/view/other/head_Font_Page.html';?>
    <link rel="stylesheet" href="Ressources/css/guest/productPage.css" />
</head>
<body>
    <?php    
    $txt = $GLOBALS['translat'];
    include 'Projet/view/'.$_SESSION['controle'].'/header.tpl';?>

    <main>

        <h1><?php echo $txt['productPage_title'];?></h1>
        <p><?php echo $txt['productPage_intro'];?></p>

        <table>
            <tr class="aa" id="aa">
                <td><img src="Ressources/img/ourProduct/capteur_graph-cardiaque.jpeg" alt="Capteur cardiaque"></td>
                <td><?php echo $txt['productPage_heart'];?></td>
            </tr>
            <tr>
                <td><img src="Ressources/img/ourProduct/capteur_graph-sonor.png" alt="Capteur sonore"></td>
                <td><?php echo $txt['productPage_sound'];?></td>
            </tr>
            <tr>
                <td><img src="Ressources/img/ourProduct/capteur_graph-humidity.png" alt="Capteur d'humidité"></td>
                <td><?php echo $txt['productPage_humy'];?></td>
            </tr>
            <tr>
                <td><img src="Ressources/img/ourProduct/capteur_graph-temperature.png" alt="Capteur temperature"></td>
                <td><?php echo $txt['productPage_temp'];?></td>
            </tr>

            <tr>
                <td>
                    <p><?php echo $txt['productPage_ccl1'];?></p><br>
                    <p><?php echo $txt['productPage_ccl2'];?></p><br>
                    <p><?php echo $txt['productPage_ccl3'];?></p>
                </td>
                <td><img src="Ressources/img/ourProduct/sensor_shema.PNG" alt="sensor shema"></td>

            </tr>
        </table>
        
    </main>

    <?php include 'Projet/view/other/footer.tpl';?>
</body>
</html>

