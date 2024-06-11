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
    <title>APNEA - manageFAQPage</title>    
    <?php include 'Projet/view/other/head_Font_Page.html';?>
    <link rel="stylesheet" href="Ressources/css/modo/manageFAQPage.css" />
</head>
<body>
    <?php    
    $txt = $GLOBALS['translat'];
    include 'Projet/view/'.$_SESSION['controle'].'/header.tpl';?>

    <main>
        <h2 id="Conditions"><?php echo $txt['modifFAQ_title']; ?></h2>

        <center><a class='newFAQ' href="index.php?controle=modo&action=modifFAQPage&numfaq=new"><?php echo $txt['newFAQ_title'];?></a></center>
        <table>
            <?php 
                // Affichage de toutes les questions de la table FAQ
                foreach ($data as $value) {
                    echo "<tr>";
                        echo '<td>';
                            echo "<question>" . $value[$_SESSION['lang'].'_question'] . "</question><br>";
                            echo "<response>" . $value[$_SESSION['lang'].'_response'] . "</response>";
                        echo "</td>";
                        echo '<td class="tblBlanc">...</td>';

                        echo '<td class="btn">';
                            echo '<a href="index.php?controle=modo&action=modifFAQPage&numfaq='.$value['id_question'].'">'.$txt['manageFAQ_modif'].'</a>';
                        echo "</td>";
                        echo '<td class="btn">';
                            echo "<button onclick=showPopupFAQ('".$value['id_question']."','".$_SESSION['lang']."')>".$txt['manageFAQ_del'].'</button>';
                        echo "</td>";
                    echo "</tr>";
                }
            ?>
        </table>
        <center><a class='newFAQ' href="index.php?controle=modo&action=modifFAQPage&numfaq=new"><?php echo $txt['newFAQ_title'];?></a></center>
    </main>

    <?php include 'Projet/view/other/footer.tpl'; ?>
</body>
</html>