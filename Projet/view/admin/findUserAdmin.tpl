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
    <title>APNEA - findUser</title>
    <?php include 'Projet/view/other/head_Font_Page.html';?>
    <link rel="stylesheet" href="Ressources/css/admin/findUserAdmin.css" />
</head>

<body>
    <?php
    // Chargement du header et de la langue de la page
    $txt = $GLOBALS['translat'];
    include 'Projet/view/' . $_SESSION['controle'] . '/header.tpl'; ?>



    <main class='main'>
    <form name='findUser' action="index.php?controle=admin&action=findUser" method='post'>

        <h1><?php echo $txt['adminGestionUser_title']; ?></h1> 

        <div class='tableOverflow'>
        <table class='tableBox'>

            <tr> <!-- Les noms des champs-->
                <td></td>
                <td><?php echo $txt['adminGestionUser_typeUser']; ?></td>
                <td><?php echo $txt['adminGestionUser_firstName']; ?></td>
                <td><?php echo $txt['adminGestionUser_lastName']; ?></td>
                <td><?php echo $txt['adminGestionUser_mail']; ?></td>
                <td><?php echo $txt['adminGestionUser_birthday']; ?></td>
                <td><?php echo $txt['adminGestionUser_phone']; ?></td>
                <td><?php echo $txt['adminGestionUser_country']; ?></td>
                <td><?php echo $txt['adminGestionUser_city']; ?></td>
                <td><?php echo $txt['adminGestionUser_localisation']; ?></td>
                <td><?php echo $txt['adminGestionUser_cardiaque']; ?></td>
                <td><?php echo $txt['adminGestionUser_sonor']; ?></td>
                <td><?php echo $txt['adminGestionUser_temperature']; ?></td>
                <td><?php echo $txt['adminGestionUser_humidity']; ?></td>
                <td class="tblBlanc">...</td>
                <td colspan="2"><button class="btnTbl" name="validat" value="ok" ><?php echo $txt['adminGestionUser_Find']; ?></button></td>
            </tr>
            
            <tr> <!-- Les filtres-->
                <td></td>
                <td><select name="typeUser"?>>
                    <option value=""></option>
                    <?php // Mise en place de la boite à selection
                        foreach (['User', 'Modo', 'Admin'] as $type) {
                        $selected = ($_POST['typeUser'] == $type) ? "selected" : "";
                        echo "<option value='$type' $selected>$type</option>";
                    }?>
                </select></td>
                <td><input name="firstName" size=5% value=<?php echo $_POST['firstName'] ?>></td>
                <td><input name="lastName" size=5% value=<?php echo $_POST['lastName'] ?>></td>
                <td><input name="mail" size=15% value=<?php echo $_POST['mail'] ?>></td>
                <td><input type=date name="birthday" value=<?php echo $_POST['birthday'] ?>></td>
                <td><input type=tel name="phoneNumber" size=10% value=<?php echo $_POST['phoneNumber'] ?>></td>
                <td><input name="country" size=5% value=<?php echo $_POST['country'] ?>></td>
                <td><input name="city" size=5% value=<?php echo $_POST['city'] ?>></td>
                <td><input name="address" size=10% value=<?php echo $_POST['address'] ?>></td>

                <?php foreach (['cardiaque', 'sonor', 'temperature', "humidity"] as $sensor) { // Pour chaque capteur?>
                    <td><select name=<?php echo $sensor."Stat"?>>
                        <option value=""></option>
                        <?php // Mise en place de la boite à selection
                            foreach ([$txt['adminGestionUser_Active'], $txt['adminGestionUser_Lock']] as $etat) {
                            $selected = ($_POST[$sensor."Stat"] == $etat) ? "selected" : "";
                            echo "<option value='$etat' $selected>$etat</option>";
                        }?>
                    </select></td>
                <?php }?>

                <td class="tblBlanc">...</td>
                <td colspan="2"><button class="btnTbl" name="validat" value="reset"><?php echo $txt['adminGestionUser_Reset']; ?></button></td>
            </tr>
            
            <?php // Les valeurs
            foreach  ($result as $row) {
                echo '<tr>';
                    echo '<td><i class="bx bxs-user"></i></td>';
                    echo '<td>'.$row['typeUser'].'</td>';
                    echo '<td>'.$row['firstName'].'</td>';
                    echo '<td>'.$row['lastName'].'</td>';
                    echo '<td>'.$row['mail'].'</td>';
                    echo '<td>'.$row['birthday'].'</td>';
                    echo '<td>'.$row['phoneNumber'].'</td>';
                    echo '<td>'.$row['country'].'</td>';
                    echo '<td>'.$row['city'].'</td>';
                    echo '<td>'.$row['address'].'</td>';

                    if($row['typeUser']=="User") {
                        printInfoSensor($row['heart_id'], $row['heart_isUsed'], $row['heart_isNotBroken']);
                        printInfoSensor($row['sound_id'], $row['sound_isUsed'], $row['sound_isNotBroken']);
                        printInfoSensor($row['temp_id'], $row['temp_isUsed'], $row['temp_isNotBroken']);
                        printInfoSensor($row['hum_id'], $row['hum_isUsed'], $row['hum_isNotBroken']);
                    }
                    else {echo '<td></td>';echo '<td></td>';echo '<td></td>';echo '<td></td>';}
    
                    echo '<td class="tblBlanc">...</td>';

                    if($row['typeUser']!="Admin") {
                        echo "<td><button type='button' class='btnDel' onclick=showPopup('".$row['mail']."','".$_SESSION['lang']."')>".$txt['adminGestionUser_Delete'].'</button></td>';
                        echo "<td><a href='index.php?controle=admin&action=showUserInfo&temoin=".$row['mail']."'>".$txt['adminGestionUser_Manage'].'</a></td>';
                    }
                    else {
                        echo '<td> </td>';
                        echo '<td> </td>';
                    }
                echo '</tr>';
            }?>
        </table>
        </div>

        <!-- Pagination-->
        <?php echo $txt['adminGestionUser_PageIndex']; ?> (<button name="validat" class='btnParam' value="last"><?php echo $txt['adminGestionUser_LastPage']; ?></button> |
        <button name="validat" class='btnParam' value="next"><?php echo $txt['adminGestionUser_NextPage']; ?></button>)
        (<?php for ($i = 3; $i <= 5; $i++) {
            echo "<button name='validat' class='btnParam' value='$i' ";
                if ($i == $nbElements) {echo "disabled ";}
            echo ">$i</button>";
            if ($i != $nbElements) {echo " | ";}
        }?>)

        <input type="hidden" name="posList" value=<?php echo $posList?>>
        <input type="hidden" name="nbElements" value=<?php echo $nbElements?>>
        
    </form>
    </main>

    <?php include 'Projet/view/other/footer.tpl'; ?>

</body>

</html>