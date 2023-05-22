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
    <title>APNEA - Main Guest</title>
    <?php include 'Projet/view/other/head_Font_Page.html';?>
    <link rel="stylesheet" href="Ressources/css/guest/mainGuest.css" />
</head>
<body>
    <?php    
    $txt = $GLOBALS['translat'];
    include 'Projet/view/'.$_SESSION['controle'].'/header.tpl';?>

    <main>
        <div class="top">
            <div class="top_title">
                <a href="#OurProduct"><?php echo $txt['index_topLeft_1']; ?></a>
                <h2><?php echo $txt['index_topLeft_2']; ?></h2>
                <p><?php echo $txt['index_topLeft_3']; ?></p>
            </div>
            <div class="top_Zoneavis">
                <div class="top_avis">
                    <p><?php echo $txt['index_topRight_1']; ?></p>
                    <div>
                        <img src="Ressources/img/mainGuest/index_autor1.png" alt="Photo_id">
                        <autor><?php echo $txt['index_topRight_2']; ?></autor>
                    </div>
                </div>
                <div class="top_nextAvis">
                    <cran><i id="c1" class="bx bxs-circle"></i>
                        <i id="c2" class="bx bxs-circle"></i>
                        <i id="c3" class="bx bxs-circle"></i>
                    </cran>
                    <a href="index.php?controle=guest&action=errorPage"><i class='bx bxs-chevron-right-circle'></i></a>
                </div>
            </div>
        </div>
        <div class="bottom">
            <div class="bottom_presProd">
                <h1 id="OurProduct"><?php echo $txt['index_bottom_title']; ?></h1>
                <p><?php echo $txt['index_bottom_1']; ?></p>
                <p><?php echo $txt['index_bottom_2']; ?></p>
                <p><?php echo $txt['index_bottom_3']; ?></p>
            </div>
            <img class="bottom_imgProd" src="Ressources/img/mainGuest/index_phone.png" alt="Photo_screen">
        </div>
    </main>

    <?php include 'Projet/view/other/footer.tpl'; ?>
</body>
</html>

