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
                // Affichage de toutes les questions de la table FAQ
                foreach ($data as $value) {
                    echo "<tr><td>";
                    echo "<question>" . $value[$_SESSION['lang'].'_question'] . "</question><br>";
                    echo "<response>" . $value[$_SESSION['lang'].'_response'] . "</response>";
                    echo "</td></tr>";
                }
            ?>
        </table>
    </main>


    <?php include 'Projet/view/other/footer.tpl'; ?>

</body>
</html>

