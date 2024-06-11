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
    <title>APNEA - Main Admin</title>
    <?php include 'Projet/view/other/head_Font_Page.html';?>
    <link rel="stylesheet" href="Ressources/css/admin/createBoxAndSensor.css" />
</head>

<body>
    <?php
    $txt = $GLOBALS['translat'];
    include 'Projet/view/' . $_SESSION['controle'] . '/header.tpl';?>

  

    <main>

        <h1>Création de boitiers et capteurs</h1> 

        <div class='rowBlock' id='part1'>
            <div class='colBlock'>
                <h3>Nouveau boitier</h3>
                <p id='labelColor'>référence boitier</p>
                <input type="text" id="idNewBox" name="idNewBox" maxlength=30><br>
                <button type='button' onclick="addItem('idNewBox', 'createBoxAjax')">Ajouter</button>
            </div>
            
            <div class='colBlock'>
                <h3>Nouveau capteur</h3>
                <p id='labelColor'>référence capteurs</p>
                <input type="text" id="idNewSensor" name="idNewSensor" maxlength=30>
                <p id='labelColor'>type de capteur</p>
                <select name="idNewSensorType" id="idNewSensorType" autocomplete required>
                    <option disabled selected><?php echo $txt['contact_obj_base'];?></option>
                    <option value="heartSensor">Capteur cardiaque</option>
                    <option value="humiditySensor">Capteur d'humidité</option>
                    <option value="soundSensor">Capteur sonore</option>
                    <option value="temperatureSensor">Capteur de température</option>
                </select><br>
                <button type='button' onclick="addItem('idNewSensor', 'createSensorAjax', 'idNewSensorType')">Ajouter</button>
            </div>
        </div>

        <a href="index.php?controle=admin&action=mainAdmin">RETOUR</a> 
        <hr><hr>

        <h1>Gestion boitiers et capteurs</h1> 

        <form action="index.php?controle=admin&action=createBoxAndSensor" method="post">
        <div class='rowBlock' id='part2'>
            <div class='colBlock'>
                <h3>Filtre liste boitiers</h3>
                <p id='labelColor'>nombre de capteurs reliés</p>
                <select name="nbSensor" id="nbSensor" autocomplete>
                    <option selected value='*'>*</option>
                    <?php for ($num=0; $num <= 4; $num++) { 
                        if (isset($_POST['nbSensor']) && $num==$_POST['nbSensor']){echo "<option value=".$num." selected>".$num."</option>";}
                        else {echo "<option value=".$num.">".$num."</option>";}}?>
                </select>
                <p id='labelColor'>isUsed</p>
                <select name="isUsed" id="isUsed" autocomplete>
                    <option value='*' selected>*</option>
                    <?php if (isset($_POST['isUsed']) && $_POST['isUsed']==0) {echo "<option value=0 selected>non attribué</option>";}
                    else {echo "<option value=0>non attribué</option>";}?>
                    <?php if (isset($_POST['isUsed']) && $_POST['isUsed']==1) {echo "<option value=1 selected>attribué</option>";}
                    else {echo "<option value=1>attribué</option>";}?>
                </select><br>
            </div>

            <div class='colBlock'>
                <p id='labelColor'>référence capteurs</p>
                <select name="refBox" id="refBox" autocomplete onchange="printMessage()">
                    <option disabled selected><?php echo $txt['contact_obj_base'];?></option>
                    <?php foreach  ($data as $boxName) {
                        echo "<option value=".$boxName['id_Box'].">".$boxName['id_Box']."</option>";
                    }?>
                </select><br>
            </div>

            <div class='colBlock'>
                <button class='btnHeight'>Valider filtres</button>
            </div>
        </div>
        </form>

        <hr>

        <h2 id="titleBox">Gestion du boitier Ni</h2> 

        <div>
            Utilisateur du boitier
            <input type="text" disabled value="" id='userBox'>
            <button type='button' class='redbutton' id='deleteBoxBtn' hidden onclick="delBoxAction()">Delete box</button>
        </div>
        <br>

        <table align="center">
            <tr>
                <td id='labelColor'>Capteur temperature</td>
                <td><select name="temperatureSensor" id="temperatureSensor" autocomplete onchange="changeIsActive('temperatureSensor')"></select>
                </td>
                <td id='labelColor'>is active</td>
                <td><select name="temperatureSensorAct" id="temperatureSensorAct" autocomplete></select>
                </td><td><button type='button' class='redbutton' onclick="delSensorAction('temperatureSensor')">Delete sensor</button></td>
            </tr>

            <tr>
                <td id='labelColor'>Capteur humidité</td>
                <td><select name="humiditySensor" id="humiditySensor" autocomplete onchange="changeIsActive('humiditySensor')"></select>
                </td>
                <td id='labelColor'>is active</td>
                <td><select name="humiditySensorAct" id="humiditySensorAct" autocomplete></select>
                </td><td><button type='button' class='redbutton' onclick="delSensorAction('humiditySensor')">Delete sensor</button></td>
            </tr>

            <tr>
                <td id='labelColor'>Capteur cardiaque</td>
                <td><select name="heartSensor" id="heartSensor" autocomplete onchange="changeIsActive('heartSensor')"></select>
                </td>
                <td id='labelColor'>is active</td>
                <td><select name="heartSensorAct" id="heartSensorAct" autocomplete></select>
                </td><td><button type='button' class='redbutton' onclick="delSensorAction('heartSensor')">Delete sensor</button></td>
            </tr>

            <tr>
                <td id='labelColor'>Capteur son</td>
                <td><select name="soundSensor" id="soundSensor" autocomplete onchange="changeIsActive('soundSensor')"></select>
                </td>
                <td id='labelColor'>is active</td>
                <td><select name="soundSensorAct" id="soundSensorAct" autocomplete></select>
                </td><td><button type='button' class='redbutton' onclick="delSensorAction('soundSensor')">Delete sensor</button></td>
            </tr>

        </table>

        <div>
            <button type='button' onclick="modifSensorInBox()">Enregistrer les changements</button> 
            <a href="index.php?controle=admin&action=mainAdmin">RETOUR</a>
        </div>


    </main>

    <?php include 'Projet/view/other/footer.tpl'; ?>
</body>

</html>