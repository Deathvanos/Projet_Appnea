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
    <meta charset="UTF-8">
    <!-------------------------------------------->
    <!-- Nom de votre page -->
    <title>APNEA</title>
    <!-------------------------------------------->
    <link rel="icon" type="image/x-icon" href="Ressources/img/Logo_Appea-color.svg">
    <link rel="stylesheet" href="Ressources/css/allPage.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="Ressources/bitmap/boxicons/css/boxicons.min.css" rel="stylesheet">
    <!-------------------------------------------->
    <!-- Lien vers la feuille CSS de votre page -->
    <link rel="stylesheet" href="Ressources/css/guest/teams.css" />
    <!-------------------------------------------->
</head>
<body>

    <?php    
    // Bug  : on doit récuperer ces deux variables dans les variables globals 
    $txt = $GLOBALS['translat'];
    include 'Projet/view/'.$_SESSION['controle'].'/header.tpl';?>


    




    <!-- Pour régler la longeur de la page : changer la valeur du height-->
    <main style="height:1600px;">
        <!-- Le contenu de ta page-->

    <div class="equipe_texte">
        <h2 id="titre_equipe"> Notre <span id="dégradé"> équipe </span>  </h2>
        <div class="image">
         <img class= "equipe" src="Ressources/img/Equipe.png"> 
        </div>
 
        <div class="texte"> 
            <p class="paragraphe-equipe"> 
        Notre équipe est composée de 6 professionnels hautement qualifiés provenant de domaines variés. Nous avons combiné nos connaissances stratégiques, commerciales, techniques et marketing pour concevoir et déployer des services de détection de l'apnée du sommeil fiables et sécurisés. 
    </p>
       </div>
    </div>


    <div class="equipe1a1">
        <div class=" imageFares"> <img src="Ressources/img/Fares.png" style="width: 260px; height: auto; ">
           <div class="Role"> Maiza Fares <br> 
            <span id="violet">Responsable </span>  <span id="dégradé"> data</span>
           </div>
           <a href="https://www.linkedin.com/in/far%C3%A8s-maiza-6862b122a/overlay/contact-info/?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base%3Bnav02AJYTxGbZXxs8ebCXQ%3D%3D" target="_blank">
            <div class="linkFares"> <img src="Ressources/img/Linkedin Fares.png" style="width: 30px; height: auto;"> 
        </div>
          </a>

         </div>


        <div class=" imageFlore"> <img src="Ressources/img/Flore.png" style="width: 200px; height: auto;">
            <div class="Role"> PAVIOT-ADET Flore  <br> 
                <span id="violet">Responsable </span>  <span id="dégradé"> gestion de projet</span>
               </div>
               <a href="https://www.linkedin.com/in/flore-paviot-adet?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BTJZXrlZ%2BQuGx31Bo775ysA%3D%3D" target="_blank">
                <div class="linkFlore"> <img src="Ressources/img/Linkedin Flore.png" style="width: 30px; height: auto;"> 
            </div>
              </a>

        </div>

        <div class=" imagePrasanaa"> <img src="Ressources/img/Prasanaa.png" style="width: 200px; height: auto;">
            <div class="Role"> VINGADASSAMY Prasanaa   <br> 
                <span id="violet">Responsable  </span>  <span id="dégradé"> developpement </span>
            </div>
            <a href="https://www.linkedin.com/in/prasanaa-vingadassamy-a55506171?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BVe5S0z0qQRi%2B6lXgQqDmMw%3D%3D" target="_blank">
                <div class="linkPrasanaa"> <img src="Ressources/img/Linkedin Prasanaa.png" style="width: 30px; height: auto;"> 
            </div>
              </a>

        </div>

        <div class=" imageCharles"> <img src="Ressources/img/Charles.png" style="width: 260px; height: auto;">
            <div class="Role"> Mailley Charles   <br> 
                <span id="violet">Responsable  </span>  <span id="dégradé"> organisation </span>
            </div>
            <a href="https://www.linkedin.com/in/charlesmailley?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BRoXepLvuTnmeYQ7YW3PXDA%3D%3D" target="_blank">
                <div class="linkCharles"> 
                    <i class='bx bxl-linkedin-square'></i>
            </div>
              </a>

        </div>

        <div class=" imageEliot"> <img src="Ressources/img/Eliot.png" style="width: 210px; height: auto;">
            <div class="Role"> Martinez Eliot   <br> 
                <span id="violet">Responsable  </span>  <span id="dégradé"> qualité </span>
            </div>

            <a href="https://www.linkedin.com/in/eliot-martinez-42ab9422a?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3Ba%2FWd%2BKBnSbmJ0HDdc4AzJQ%3D%3D/" target="_blank">
                <div class="linkEliot"> <img src="Ressources/img/Linkedin Eliot.png" style="width: 30px; height: auto;"> 
            </div>
              </a>

        </div>


        <div class=" imageFanny"> <img src="Ressources/img/Fanny.png" style="width: 210px; height: auto;">
            <div class="Role"> Spasojevic Fanny   <br> 
                <span id="violet">Responsable  </span>  <span id="dégradé"> design </span>
            </div>

            <a href="https://www.linkedin.com/in/fannyspasojevic?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BkXXGfDm7Q9K61Ler8W1fAw%3D%3D/" target="_blank">
                <div class="linkFanny"> <img src="Ressources/img/Linkedin Fanny.png" style="width: 30px; height: auto;"> 
            </div>
              </a>

        </div>


        <div class=" imageClient"> <img src="Ressources/img/Client.png" style="width: 200px; height: auto;">
            <div class="Role">      Notre Client   <br> 
                <span id="violet">INFINITE </span>  <span id="dégradé"> MESURES </span>
            </div>


        </div>




    </div>



    </main>





    <?php include 'Projet/view/other/footer.tpl'; ?>

    
</body>
</html>