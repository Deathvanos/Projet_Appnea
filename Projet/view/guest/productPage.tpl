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
    <title>APNEA - productPage</title>
    <?php include 'Projet/view/other/head_Font_Page.html';?>
    <link rel="stylesheet" href="Ressources/css/guest/productPage.css" />
</head>
<body>
    <?php    
    $txt = $GLOBALS['translat'];
    include 'Projet/view/'.$_SESSION['controle'].'/header.tpl';?>

    <main>

        <h1>Presentation de notre produit</h1>
        <p>Nous avons differents capteurs pour la detection de l'appneé du sommeil</p>
        <ul>
            <li>cardiaque : il sert à ...</li>
            <li>son : il sert à ...</li>
            <li>temp : il sert à ...</li>
            <li>hum : il sert à ...</li>
        </ul>

        <p>Tout ces capteurs sont placé dans une boite</p>
        <img src="" alt="Image du boitier">

        <h2>Comment utiliser notre produit</h2>
        <p>...</p>

        
       
    </main>

    <?php include 'Projet/view/other/footer.tpl'; ?>
</body>
</html>

