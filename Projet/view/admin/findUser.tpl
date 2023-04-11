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
    <title>APNEA</title>
    <link rel="icon" type="image/x-icon" href="Ressources/img/Logo_Appea-color.svg">
    <link rel="stylesheet" href="Ressources/css/allPage.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="Ressources/bitmap/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="Ressources/css/admin/findUser.css" />
</head>

<body>
    <?php
    // Chargement du header et de la langue de la page
    $txt = $GLOBALS['translat'];
    include 'Projet/view/' . $_SESSION['controle'] . '/header.tpl'; ?>



    <main class='main' style=<?php echo "height:".$size."px;" ?>>
    <form name='findUser' action="index.php?controle=admin&action=findUser" method='post'>

        <h1>Gérer les utilisateurs</h1> 

        <div class='tableOverflow'>
        <table class='tableBox'>

            <tr> <!-- Les noms des champs-->
                <td><i class='bx bxs-user'></i></td>
                <td>typeUser</td>
                <td>firstName</td>
                <td>lastName</td>
                <td>mail</td>
                <td>birthday</td>
                <td>phoneNumber</td>
                <td>country</td>
                <td>city</td>
                <td>localisation</td>
                <td>cardiaque</td>
                <td>sonor</td>
                <td>temperature</td>
                <td>humidité</td>
                <td class="tblBlanc">...</td>
                <td colspan="3"><button class="btnTbl" name="validat" value="ok" >Find user</button></td>
            </tr>
            
            <tr> <!-- Les filtres-->
                <td><i class='bx bxs-user'></i></td>
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
                            foreach (['Active', 'Lock', '.'] as $etat) {
                            $selected = ($_POST[$sensor."Stat"] == $etat) ? "selected" : "";
                            echo "<option value='$etat' $selected>$etat</option>";
                        }?>
                    </select></td>
                <?php }?>

                <td class="tblBlanc">...</td>
                <td colspan="3"><button class="btnTbl" name="validat" value="reset">reset field</button></td>
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

                    printInfoSensor($row['heart_id'], $row['heart_isUsed'], $row['heart_isNotBroken']);
                    printInfoSensor($row['sound_id'], $row['sound_isUsed'], $row['sound_isNotBroken']);
                    printInfoSensor($row['temp_id'], $row['temp_isUsed'], $row['temp_isNotBroken']);
                    printInfoSensor($row['hum_id'], $row['hum_isUsed'], $row['hum_isNotBroken']);
        
                    echo '<td class="tblBlanc">...</td>';
                    echo '<td><button class="btnDel" name="delUser" value="'.$row['mail'].'">Delete</button></td>';
                    echo '<td><a href="index.php?controle=user&action=errorPage">Gerer</a></td>';
                    echo '<td><a href="index.php?controle=user&action=errorPage">mode View</a></td>';
                echo '</tr>';
            }?>

        </table>
        </div>

        <!-- Pagination-->
        View (<button name="validat" class='btnParam' value="last">Last</button> |
        <button name="validat" class='btnParam' value="next">Next</button>)
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

    <?php include 'Projet/view/' . $_SESSION['controle'] . '/footer.tpl'; ?>
</body>

</html>