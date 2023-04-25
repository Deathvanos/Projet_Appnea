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
    <title>APNEA - Teams</title>
    <?php include 'Projet/view/other/header_Font_Page.html';?>
    <link rel="stylesheet" href="Ressources/css/guest/teams.css" />
</head>
<body>

    <?php
    $txt = $GLOBALS['translat'];
    include 'Projet/view/' . $_SESSION['controle'] . '/header.tpl'; ?>


    <!-- Centrer cette box pour quand on dezoom -->
    <!-- Passer le text en variables dans $GLOBALS['translat'] -->
    <main style="height:1600px;">

        <div class="equipe_texte">
            <h2 id="titre_equipe">Notre <color id="dégradé">équipe</color></h2>
            <!-- y a des balises inutiles -->
            <div class="image"><img class="equipe" src="Ressources/img/teams/Equipe.png"></div>
            <div class="texte">
                <p class="paragraphe-equipe">
                    Notre équipe est composée de 6 professionnels hautement qualifiés provenant de domaines variés.
                    Nous avons combiné nos connaissances stratégiques, commerciales, techniques et marketing pour
                    concevoir et déployer des services de détection de l'apnée du sommeil fiables et sécurisés.
                </p>
            </div>
        </div>

        <!-- Transformer toute cette partie en table avec tr et td -->
        <!-- Ca va aussi simplifier le code CSS -->
        <div class="equipe1a1">

            <div class=" imageFares"><img src="Ressources/img/teams/Fares.png" style="width: 270px; height: auto;"><!-- A mettre dans le css -->
                <div class="Role">MAIZA Fares<br><color id="violet">Responsable </color><color id="dégradé">data</color></div>
                <a href="https://www.linkedin.com/in/far%C3%A8s-maiza-6862b122a/overlay/contact-info/?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base%3Bnav02AJYTxGbZXxs8ebCXQ%3D%3D" target="_blank">
                    <div class="linkFares"><i class='bx bxl-linkedin-square' style='font-size: 40px'></i></div><!-- A mettre dans le css -->
                </a>
            </div>

            <div class=" imageFlore"><img src="Ressources/img/teams/Flore.png" style="width: 200px; height: auto;"><!-- A mettre dans le css -->
                <div class="Role"> PAVIOT-ADET Flore <br><color id="violet">Responsable </color> <span id="dégradé"> gestion de projet</color></div>
                <a href="https://www.linkedin.com/in/flore-paviot-adet?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BTJZXrlZ%2BQuGx31Bo775ysA%3D%3D" target="_blank">
                    <div class="linkFlore"> <i class='bx bxl-linkedin-square' style='font-size: 40px;'></i></div><!-- A mettre dans le css -->
                </a>
            </div>

            <div class=" imagePrasanaa"> <img src="Ressources/img/teams/Prasanaa.png" style="width: 200px; height: auto;"><!-- A mettre dans le css -->
                <div class="Role"> VINGADASSAMY Prasanaa <br><color id="violet">Responsable </color><color id="dégradé"> developpement </color></div>
                <a href="https://www.linkedin.com/in/prasanaa-vingadassamy-a55506171?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BVe5S0z0qQRi%2B6lXgQqDmMw%3D%3D" target="_blank">
                    <div class="linkPrasanaa"> <i class='bx bxl-linkedin-square' style='font-size: 40px;'></i></div>
                </a>
            </div>

            <div class=" imageCharles"> <img src="Ressources/img/teams/Charles.png" style="width: 260px; height: auto;"><!-- A mettre dans le css -->
                <div class="Role"> Mailley Charles <br><color id="violet">Responsable </color><color id="dégradé"> organisation </color></div>
                <a href="https://www.linkedin.com/in/charlesmailley?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BRoXepLvuTnmeYQ7YW3PXDA%3D%3D" target="_blank">
                    <div class="linkCharles"><i class='bx bxl-linkedin-square' style='font-size: 40px;'></i></div> <!-- A mettre dans le css -->
                </a>
            </div>

            <div class=" imageEliot"> <img src="Ressources/img/teams/Eliot.png" style="width: 210px; height: auto;"><!-- A mettre dans le css -->
                <div class="Role"> Martinez Eliot <br><color id="violet">Responsable </color><color id="dégradé"> qualité </color></div>
                <a href="https://www.linkedin.com/in/eliot-martinez-42ab9422a?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3Ba%2FWd%2BKBnSbmJ0HDdc4AzJQ%3D%3D/" target="_blank">
                    <div class="linkEliot"> <i class='bx bxl-linkedin-square' style='font-size: 40px;'></i></div><!-- A mettre dans le css -->
                </a>
            </div>

            <div class=" imageFanny"> <img src="Ressources/img/teams/Fanny.png" style="width: 210px; height: auto;"> <!-- A mettre dans le css -->
                <div class="Role"> Spasojevic Fanny <br><color id="violet">Responsable </color><color id="dégradé"> design </color></div>
                <a href="https://www.linkedin.com/in/fannyspasojevic?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BkXXGfDm7Q9K61Ler8W1fAw%3D%3D/" target="_blank">
                    <div class="linkFanny"> <i class='bx bxl-linkedin-square' style='font-size: 40px;'></i></div><!-- A mettre dans le css -->
                </a>
            </div>

            <div class=" imageClient"> <img src="Ressources/img/Infinite_measures.gif" style="width: 200px; height: auto;"><!-- A mettre dans le css -->
                <div class="Role"> Notre Client <br><color id="violet">INFINITE </color><color id="dégradé"> MESURES </color> </div>
            </div>

        </div>

    </main>



    <?php include 'Projet/view/' . $_SESSION['controle'] . '/footer.tpl'; ?>

</body>

</html>
