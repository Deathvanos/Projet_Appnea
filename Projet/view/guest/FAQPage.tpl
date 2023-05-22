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
    <title>APNEA - FAQ</title>
    <?php include 'Projet/view/other/head_Font_Page.html';?>
    <link rel="stylesheet" href="Ressources/css/guest/pageQuestions.css" />
</head>
<body>
    
    <?php $txt = $GLOBALS['translat'];
    include 'Projet/view/'.$_SESSION['controle'].'/header.tpl';?>

    <main>
    
        <h2 id="Conditions"><?php echo $txt['faq_title']; ?></h2>

        <table>

        <?php 
        // Faire la boucle pour afficher les i questions (enlever les questions d'en dessous)
        
            //<tr><td>
            // Affichage des questions dans la table HTML
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<tr><td>";
                echo "<question>" . $row['question'] . "</question><br>";
                echo "<response>" . $row['response'] . "</response>";
                echo "</td></tr>";
    }
           // </td></tr>
            ?>

    </main>
    
</table>

    <?php include 'Projet/view/other/footer.tpl'; ?>

</body>
</html>

// 
