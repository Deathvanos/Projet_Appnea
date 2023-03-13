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

<!-- A mettre seulement sur la first page du site 
(Permet l'utilisation de variables inter page) -->
<!--
<?php //**session_start(); ?>
-->

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>APNEA</title>
    <link rel="icon" type="image/x-icon" href="../../../Ressources/img/Logo_Appea-color.svg">
    <link rel="stylesheet" href="../../../Ressources/css/allPage.css" />
    <link rel="stylesheet" href="../../../Ressources/css/guest/main.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="../../../Ressources/bitmap/boxicons/css/boxicons.min.css" rel="stylesheet">
</head>
<body>
    <?php include '../../view/for_all/header.php';?>

    <main style="height:830px;">
        <div class="top">
            <div class="top_title">
                <a href="#OurProduct"><?php echo $translat['index_topLeft_1']; ?></a>
                <h2><?php echo $translat['index_topLeft_2']; ?></h2>
                <p><?php echo $translat['index_topLeft_3']; ?></p>
            </div>
            <div class="top_Zoneavis">
                <div class="top_avis">
                    <p><?php echo $translat['index_topRight_1']; ?></p>
                    <div>
                        <img src="../../../Ressources/img/index_autor1.png" alt="Photo_id">
                        <autor><?php echo $translat['index_topRight_2']; ?></autor>
                    </div>
                </div>
                <div class="top_nextAvis">
                    <cran><i id="c1" class="bx bxs-circle"></i>
                        <i id="c2" class="bx bxs-circle"></i>
                        <i id="c3" class="bx bxs-circle"></i>
                    </cran>
                    <a href=<?php echo $errorPage?>><i class='bx bxs-chevron-right-circle'></i></a>
                </div>
            </div>
        </div>
        <div class="bottom">
            <div class="bottom_presProd">
                <h1 id="OurProduct"><?php echo $translat['index_bottom_title']; ?></h1>
                <p><?php echo $translat['index_bottom_1']; ?></p>
                <p><?php echo $translat['index_bottom_2']; ?></p>
                <p><?php echo $translat['index_bottom_3']; ?></p>
            </div>
            <img class="bottom_imgProd" src="../../../Ressources/img/index_phone.png" alt="Photo_screen">
        </div>
    </main>

    <?php include '../../view/for_all/footer.php'; ?>
</body>
</html>

