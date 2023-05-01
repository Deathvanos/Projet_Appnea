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
    <?php include 'Projet/view/other/head_Font_Page.html';?>
    <link rel="stylesheet" href="Ressources/css/guest/teams.css"/>
</head>

<body>

    <?php $txt = $GLOBALS['translat'];
    include 'Projet/view/' . $_SESSION['controle'] . '/header.tpl';?>


    <main>

        <div class="equipe_texte">
            <h1 class="titre_equipe"><?php echo $txt['ourTeams_title'];?></h1>
            <img class="equipe" src="Ressources/img/teams/Equipe.png">
            <p class="paragraphe-equipe"><?php echo $txt['ourTeams_info'];?></p>
        </div>

        <table class="tableBox">
            <tr> 
                <td>
                    <img class="imagemembre" src="Ressources/img/teams/Fares.png"> 
                    <div><?php echo $txt['ourTeams_P1'];?></div>
                    <a class="link" target="_blank" href="https://www.linkedin.com/in/far%C3%A8s-maiza-6862b122a/overlay/contact-info/?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base%3Bnav02AJYTxGbZXxs8ebCXQ%3D%3D">
                        <i class='bx bxl-linkedin-square'></i>
                    </a>
                </td>
                <td>
                    <img class="imagemembre"src="Ressources/img/teams/Flore.png">
                    <div><?php echo $txt['ourTeams_P2'];?></div>
                    <a class="link" target="_blank" href="https://www.linkedin.com/in/flore-paviot-adet?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BTJZXrlZ%2BQuGx31Bo775ysA%3D%3D">
                        <i class='bx bxl-linkedin-square'></i>
                    </a>
                </td>
                <td>
                    <img class="imagemembre" src="Ressources/img/teams/Prasanaa.png">
                    <div><?php echo $txt['ourTeams_P3'];?></div>
                    <a class="link" target="_blank" href="https://www.linkedin.com/in/prasanaa-vingadassamy-a55506171?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BVe5S0z0qQRi%2B6lXgQqDmMw%3D%3D">
                        <i class='bx bxl-linkedin-square'></i>
                    </a>
                </td>
            </tr>
            <tr> 
                <td>
                    <img class="imagemembre" src="Ressources/img/teams/Charles.png">
                    <div><?php echo $txt['ourTeams_P4'];?></div>
                    <a class="link" target="_blank" href="https://www.linkedin.com/in/far%C3%A8s-maiza-6862b122a/overlay/contact-info/?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base%3Bnav02AJYTxGbZXxs8ebCXQ%3D%3D">
                        <i class='bx bxl-linkedin-square'></i>
                    </a>
                </td>
                <td>
                    <img class="imagemembre" src="Ressources/img/teams/Fanny.png">
                    <div><?php echo $txt['ourTeams_P5'];?></div>
                    <a class="link" target="_blank" href="https://www.linkedin.com/in/flore-paviot-adet?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BTJZXrlZ%2BQuGx31Bo775ysA%3D%3D">
                        <i class='bx bxl-linkedin-square'></i>
                    </a>
                </td>
                <td>
                    <img class="imagemembre" src="Ressources/img/teams/Eliot.png">
                    <div class="Role"><?php echo $txt['ourTeams_P6'];?></div>
                    <a class="link" target="_blank" href="https://www.linkedin.com/in/prasanaa-vingadassamy-a55506171?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BVe5S0z0qQRi%2B6lXgQqDmMw%3D%3D">
                        <i class='bx bxl-linkedin-square'></i>
                    </a>
                </td>
            </tr>
        </table>

        <div class="imageclient">
            <img class=" imagemembre" src="Ressources/img/Infinite_measures.gif">
            <div class="Role"><?php echo $txt['ourTeams_client'];?></div>
        </div>

    </main>


    <?php include 'Projet/view/other/footer.tpl'; ?>

</body>

</html>