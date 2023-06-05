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

        <!-- Titre et info -->
        <h1 class='title'>Visualisation de vos données</h1>
        <!-- ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT -->
        <!-- _______________ METTRE LE CSS DANS LE CSS _________________ -->
        <!-- ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT -->
        <p style="font-style: italic;margin-bottom:2rem;"><?php echo $txt["firefox"];?></p>

        <!-- Get the output. You have to escape because the result will not be valid HTML otherwise-->
        <!-- Envoi les datas php en json dans la console pour le script js ? -->
        <div id="dd" style="display: none;"><?php echo htmlspecialchars(json_encode($d1));?></div>
        <div id="df" style="display: none;"><?php echo htmlspecialchars(json_encode($d2));?></div>
        <div id="tempD" style="display: none;"><?php echo htmlspecialchars(json_encode($tempValues));?></div>
        <div id="cardD" style="display: none;"><?php echo htmlspecialchars(json_encode($cardValues));?></div>
        <div id="humD" style="display: none;"><?php echo htmlspecialchars(json_encode($humValues)); ?></div>
        <div id="sonD" style="display: none;"><?php echo htmlspecialchars(json_encode($sonValues));?></div>

        <!-- ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT -->
        <!-- ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT -->
        <!-- ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT -->
        <!-- ________________ LA SELECTBOX EST STATIC  _________________ -->
        <!-- ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT -->
        <!-- ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT -->
        <!-- ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT -->
        <!-- Selection de la période des données à afficher -->
        <div id="dateSelection">
            <label for="dateSelected">Quel jour souhaitez-vous voir?</label><br>
            <select id="dateSelected" onchange="saveSelectedValue()">
                <option value="0">Dernière nuit enregistrée</option>
                <option value="1">Avant Dernière nuit enregistrée</option>
                <option value="2">Avant Avant Dernière nuit enregistrée</option>
            </select>
        </div>

        <!-- ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT -->
        <!-- ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT -->
        <!-- ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT -->
        <!-- _______________ A METTRE DANS UN FICHIER JS _______________ -->
        <!-- ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT -->
        <!-- ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT -->
        <!-- ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT -->
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
                <div id="first" class="firstGraph"><h3><?php echo $txt['Temperature'];?></h3></div>
                <div class="vertical-lign"></div>
                <div id="second" class="secondGraph"><h3><?php echo $txt['Cardiac'];?></h3></div>
            </div>
            <div class="horizontal-lign"></div>
            <div class="Line">
                <div id="third" class="thirdGraph"><h3><?php echo $txt['Humidity'];?></h3></div>
                <div class="vertical-lign"></div>
                <div id="forth" class="forthGraph"><h3><?php echo $txt['Sound'];?></h3></div>
            </div>
        </div>

        <!-- ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT -->
        <!-- _______________A METTRE DANS LE CONTROLLER ________________ -->
        <!-- ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT -->
        <script src="Projet/view/other/js/graphs.js" ></script>

        <!-- ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT -->
        <!-- _______________ METTRE LE CSS DANS LE CSS _________________ -->
        <!-- ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT ALERT -->
        <h1 style="margin-top:3rem;"><?php echo $txt[$_COOKIE["result"]];?></h1>

    </main>

    <?php include 'Projet/view/other/footer.tpl'; ?>
</body>
</html>