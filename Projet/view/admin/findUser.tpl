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
    // Bug  : on doit récuperer ces deux variables dans les variables globals 
    $txt = $GLOBALS['translat'];
    include 'Projet/view/' . $_SESSION['controle'] . '/header.tpl'; ?>

    <main class='main' style="height:740px;">
        <h1>Gérer les utilisateurs</h1> 

        
        <div class='tableOverflow'><table class='tableBox' width=95%>


        
       
            <tr align=center>
                <td><i class='bx bxs-user'></i></td>
                <td>typeUser</td>
                <td>id</td><!-- A supprimer -->
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
                <td colspan="3">Gestion</td>
            </tr>
            <tr align=left>
                <td><i class='bx bxs-user'></i></td>
                <td><input size=5%></input></td>
                <td><input type=number style='width: 4em;'></input></td><!-- A supprimer -->
                <td><input size=5%></input></td>
                <td><input size=5%></input></td>
                <td><input type=email size=20%></input></td>
                <td><input type=date></input></td>
                <td><input type=tel size=10%></input></td>
                <td><input size=5%></input></td>
                <td><input size=5%></input></td>
                <td><input size=5%></input></td>
                <td align=center><input type=checkbox></input></td>
                <td align=center><input type=checkbox></input></td>
                <td align=center><input type=checkbox></input></td>
                <td align=center><input type=checkbox></input></td>
                <td class="tblBlanc">...</td>
                <td colspan="3"><a href="#">Find user</a></td>
            </tr>


            <?php 
            // Fonction login vers la base de données
            include("Projet/modele/admin.php");
            $result = printDataBase(0, 5);

        

                

            foreach  ($result as $row) {
                echo '<tr>';
                    echo '<td><i class="bx bxs-user"></i></td>';
                    echo '<td>'.$row['typeUser'].'</td>';
                    echo '<td>'.$row['id'].'</td>';//A supprimer
                    echo '<td>'.$row['firstName'].'</td>';
                    echo '<td>'.$row['lastName'].'</td>';
                    echo '<td>'.$row['mail'].'</td>';
                    echo '<td>'.$row['birthday'].'</td>';
                    echo '<td>'.$row['phoneNumber'].'</td>';
                    echo '<td>'.$row['country'].'</td>';
                    echo '<td>'.$row['city'].'</td>';
                    echo '<td>'.$row['localisation'].'</td>';
                    echo '<td><a href="#" class="colorTrue">true</a></td>';
                    echo '<td><a href="#" class="colorFalse">false</a></td>';
                    echo '<td><a href="#" class="colorTrue">true</a></td>';
                    echo '<td><a href="#" class="colorTrue">true</a></td>';
                    echo '<td class="tblBlanc">...</td>';
                    echo '<td><a href="#">Delete</a></td>';
                    echo '<td><a href="#">Gerer</a></td>';
                    echo '<td><a href="#">mode View</a></td>';
                    
                echo '</tr>';
            }
            ?>

        </table></div>
        <a href=''>Suivant</a> - <a href=''>Précédant</a><br>
        Afficher par éléments de : <a href=''>5</a> - <a href=''>10</a> - <a href=''>15</a><br>

    </main>

    <?php include 'Projet/view/other/footer.tpl'; ?>
</body>

</html>