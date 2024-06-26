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

    <p style="font-style: italic;"><?php echo $txt["firefox"];?></p>

    <main>
        

        <br>
        <br>

        <div id="dd_t" style="display: none;">
            <?php
            ; // Again, do some operation, get the output.
            echo htmlspecialchars(json_encode($d1_t));
            ?>
        </div>

        <div id="df_t" style="display: none;">
            <?php
            ;
            echo htmlspecialchars(json_encode($d2_t));
            ?>
        </div>
        
        <div id="dd_c" style="display: none;">
            <?php
            ; // Again, do some operation, get the output.
            echo htmlspecialchars(json_encode($d1_c));
            ?>
        </div>

        <div id="df_c" style="display: none;">
            <?php
            ;
            echo htmlspecialchars(json_encode($d2_c));
            ?>
        </div>
        

        <div id="dd_h" style="display: none;">
            <?php
            ; // Again, do some operation, get the output.
            echo htmlspecialchars(json_encode($d1_h));
            ?>
        </div>

        <div id="df_h" style="display: none;">
            <?php
            ;
            echo htmlspecialchars(json_encode($d2_h));
            ?>
        </div>

        <div id="dd_s" style="display: none;">
            <?php
            ; // Again, do some operation, get the output.
            echo htmlspecialchars(json_encode($d1_s));
            ?>
        </div>

        <div id="df_s" style="display: none;">
            <?php
            ;
            echo htmlspecialchars(json_encode($d2_s));
            ?>
        </div>
        

        <div id="tempD" style="display: none;">
            <?php
            ; 
            echo htmlspecialchars(json_encode($tempValues));
            ?>
        </div>

        <div id="cardD" style="display: none;">
            <?php
            ;
            echo htmlspecialchars(json_encode($cardValues)); 
            ?>
        </div>

        <div id="humD" style="display: none;">
            <?php
            ; // Again, do some operation, get the output.
            echo htmlspecialchars(json_encode($humValues)); /* You have to escape because the result
              will not be valid HTML otherwise. */
            ?>
        </div>

        <div id="sonD" style="display: none;">
            <?php
            ; // Again, do some operation, get the output.
            echo htmlspecialchars(json_encode($sonValues)); /* You have to escape because the result
              will not be valid HTML otherwise. */
            ?>
        </div>

        <div id="dateSelection">
        <label for="dateSelected">Quel jour souhaitez-vous voir?</label><br>
            <select id="dateSelected" onchange="saveSelectedValue()">
                
            </select>
        </div>
        <script>
            // Fonction pour sauvegarder la valeur sélectionnée dans le stockage local
            function saveSelectedValue() {
                var selectedValue = document.getElementById("dateSelected").value;
                localStorage.setItem("selectedValue", selectedValue);
                location.reload();
            }

            // Vérifie si une valeur est déjà enregistrée dans le stockage local
            var storedValue = localStorage.getItem("selectedValue");
            if (storedValue) {
                document.getElementById("dateSelected").value = storedValue;
            }
        </script>

        <div class="allGraphs">

            <div class="Line">
                <div id="first" class="firstGraph">
                    <h3><?php echo $txt['Temperature'];?></h3>
                </div>

                <div class="vertical-lign"></div>

                <div id="second" class="secondGraph">
                    <h3><?php echo $txt['Cardiac'];?></h3>
                </div>
            </div>
            
            <div class="horizontal-lign"></div>


            <div class="Line">
                <div id="third" class="thirdGraph">

                    <h3><?php echo $txt['Humidity'];?></h3>
                </div>

                <div class="vertical-lign"></div>

                <div id="forth" class="forthGraph">

                    <h3><?php echo $txt['Sound'];?></h3>
                </div>
            </div>

        </div>
        <script src="Projet/view/other/js/graphs.js" ></script>
        <br>
        <br>
        <h1><?php echo $txt[$_COOKIE["result"]];?></h1>


    </main>


    <?php include 'Projet/view/other/footer.tpl'; ?>


</body>

</html>