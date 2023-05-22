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
            <tr><td>
                <question>Comment acheter notre produit</question><br>
                <response>Notre produit est disponible sur notre site. Il peut vous être prescrit par votre médecin traitant.</response>
            </td></tr>
            <tr><td>
                <question>Qui contacter en cas de panne ?</question><br>
                <response>Retrouvez-nous dans la rubrique Contact de notre site, nous sommes accessibles par téléphone ou bien sur nos réseaux sociaux.</response>
            </td></tr>
            <tr><td>
                <question>Vos produits sont-ils fiables ?</question><br>
                <response>Tous nos produits sont garantis fiables et testés par nos équipes. Vous pouvez retrouver nos procédures de tests dans notre rubrique Capteurs.</response>
            </td></tr>
        </table>

    </main>

    <?php include 'Projet/view/other/footer.tpl'; ?>

</body>
</html>

