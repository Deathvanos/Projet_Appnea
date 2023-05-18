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
    <title>APNEA - User Sensor</title>
    <?php include 'Projet/view/other/head_Font_Page.html';?>
    <link rel="stylesheet" href="Ressources/css/user/sensorUser.css" >
    <script src="Projet/view/other/js/d3.v4.js"></script>
    
</head>

<body>

    <?php $txt = $GLOBALS['translat'];
    include 'Projet/view/' . $_SESSION['controle'] . '/header.tpl';?>


    <main>

        <br>
        <h1>Vos Capteurs</h1>
        <br>


        <div id="dd" style="display: none;">
            <?php
            ; // Again, do some operation, get the output.
            echo htmlspecialchars($d1); /* You have to escape because the result
              will not be valid HTML otherwise. */
            ?>
        </div>

        <div id="df" style="display: none;">
            <?php
            ; // Again, do some operation, get the output.
            echo htmlspecialchars($d2); /* You have to escape because the result
              will not be valid HTML otherwise. */
            ?>
        </div>

        <div id="tempD" style="display: none;">
            <?php
            ; // Again, do some operation, get the output.
            echo htmlspecialchars($tempValues); /* You have to escape because the result
              will not be valid HTML otherwise. */
            ?>
        </div>

        <div id="cardD" style="display: none;">
            <?php
            ; // Again, do some operation, get the output.
            echo htmlspecialchars($cardValues); /* You have to escape because the result
              will not be valid HTML otherwise. */
            ?>
        </div>

        <div id="humD" style="display: none;">
            <?php
            ; // Again, do some operation, get the output.
            echo htmlspecialchars($humValues); /* You have to escape because the result
              will not be valid HTML otherwise. */
            ?>
        </div>

        <div id="sonD" style="display: none;">
            <?php
            ; // Again, do some operation, get the output.
            echo htmlspecialchars($sonValues); /* You have to escape because the result
              will not be valid HTML otherwise. */
            ?>
        </div>


        <div class="allGraphs">

            <div class="Line">
                <div id="first" class="firstGraph">

                    <h3>Capteur Temperature</h3>
                </div>





                <div class="vertical-lign"></div>






                <div id="second" class="secondGraph">

                    <h3>Capteur Cardiaque</h3>


                </div>
            </div>

            <div class="horizontal-lign"></div>

            <div class="Line">
                <div id="third" class="thirdGraph">

                    <h3>Capteur Humidité</h3>
                </div>

                <div class="vertical-lign"></div>

                <div id="forth" class="forthGraph">

                    <h3>Capteur Sonore</h3>
                </div>
            </div>

        </div>
        <br>
        <br>
        <h1>Au vu de vos données, il est fort probable que vous ayez fait de l'apnée du sommeil cette nuit.</h1>


    </main>


    <?php include 'Projet/view/other/footer.tpl'; ?>


</body>
<script src="Projet/view/other/js/graphs.js" ></script>
</html>