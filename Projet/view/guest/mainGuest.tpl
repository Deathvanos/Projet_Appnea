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
    <script src="Projet/view/other/js/carrousel.js"></script>
</head>
<body>
    <?php    
    $txt = $GLOBALS['translat'];
    include 'Projet/view/'.$_SESSION['controle'].'/header.tpl';?>

    <main>
        <div class="top">
            <div class="top_title">
                <a href="#OurProduct"><?php echo $txt['index_topLeft_1'];?></a>
                <h2><?php echo $txt['index_topLeft_2'];?></h2>
                <p><?php echo $txt['index_topLeft_3'];?></p>
            </div>

            <div class="box-carrousel">
                <div class="carrousel">
                    <div id="1" class="carrousel-view">
                        <p><?php echo $txt['index_carsel_1t'];?></p>
                        <div class="carrousel-bottom">
                            <div><img src="Ressources/img/mainGuest/profil1.png" alt="Photo_id"><autor><?php echo $txt['index_carsel_1n'];?></autor>
                            </div>
                            <a href="#2" onclick="scrollCarrousel(event, '2')"><i class='bx bxs-chevron-right-circle'></i></a>
                        </div>
                    </div>
                    <div id="2" class="carrousel-view">
                        <p><?php echo $txt['index_carsel_2t'];?></p>
                        <div  class="carrousel-bottom">
                            <div><img src="Ressources/img/mainGuest/profil2.jpg" alt="Photo_id"><autor><?php echo $txt['index_carsel_2n'];?></autor></div>
                            <a href="#3" onclick="scrollCarrousel(event, '3')"><i class='bx bxs-chevron-right-circle'></i></a>
                        </div>
                    </div>
                    <div id="3" class="carrousel-view">
                        <p><?php echo $txt['index_carsel_3t'];?></p>
                        <div  class="carrousel-bottom">
                            <div><img src="Ressources/img/mainGuest/profil3.jpeg" alt="Photo_id"><autor><?php echo $txt['index_carsel_3n'];?></autor></div>
                            <a href="#1" onclick="scrollCarrousel(event, '1')"><i class='bx bxs-chevron-right-circle'></i></a>
                        </div>
                    </div>
                </div>
                <div class="link-carrousel">
                    <a href="#1" onclick="scrollCarrousel(event, '1')"><i class="bx bxs-circle"></i></a>
                    <a href="#2" onclick="scrollCarrousel(event, '2')"><i class="bx bxs-circle"></i></a>
                    <a href="#3" onclick="scrollCarrousel(event, '3')"><i class="bx bxs-circle"></i></a>
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

