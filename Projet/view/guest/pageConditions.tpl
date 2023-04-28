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
    <title>APNEA - CGU</title>
    <?php include 'Projet/view/other/header_Font_Page.html';?>
    <link rel="stylesheet" href="Ressources/css/guest/pageConditions.css" />
</head>
<body>

    <?php $txt = $GLOBALS['translat'];
    include 'Projet/view/'.$_SESSION['controle'].'/header.tpl';?>
    
    <main>
        
        <h2 id="Conditions"><?php echo $txt['cgu_title']; ?></h2>
        
        <table>
            <tr><td>
                <question><?php echo $txt['cgu_CGV_Q']; ?></question><br>
                <response><?php echo $txt['cgu_CGV_A']; ?></response>
            </td></tr>
            <tr><td>
                <question><?php echo $txt['cgu_ML_Q']; ?></question><br>
                <response><?php echo $txt['cgu_ML_A']; ?> </response>
            </td></tr>
        </table>

    </main>

    <?php include 'Projet/view/' . $_SESSION['controle'] . '/footer.tpl'; ?>

</body>
</html>

