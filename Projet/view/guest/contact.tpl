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
    <title>APNEA - Contact</title>
    <?php include 'Projet/view/other/header_Font_Page.html';?>
    <link rel="stylesheet" href="Ressources/css/guest/contact.css" />
</head>
<body>

    <?php
    $txt = $GLOBALS['translat'];
    include 'Projet/view/'.$_SESSION['controle'].'/header.tpl';?>

    <!-- Centrer cette box pour quand on dezoom -->
    <main style="height:900px;">

        <!-- On stoque aussi les balises color dans $GLOBALS['translat'] (voir #com after) (y a des balises inutiles)-->
        <div><h2 id="Contacter">Contacter<color id="dégradé">le support</color></h2>

        <div>
            <div class="objet"> <p>Objet</p></div>
            <!-- Le background n'est pas reponsive (y a des balises inutiles) -->
            <div class="rectangle"><textarea></textarea></div>
        </div>

        <!-- A revoir la mise en forme car c'est devenu un link (y a des balises inutiles) -->
        <div class="rectangleretour"><div class="rectanglebleu"><span><a href="javascript:history.back()">Retour</a></span></div>

        <div>
            <div class="question"><p>Question</p></div>
            <!-- Le background n'est pas reponsive -->
            <div class="rectanglequestion"><textarea placeholder="Ecrivez votre question"></textarea></div>
        </div>

        <!-- Passer par un formulaire PHP -->
       <!-- Quand on submit : fonction qui va recuperer l'objet et la question et va envoyer le tout sur le mail de l'admin -->
        <div class="rectangleenvoyer"><div class="rectangleorange"><span>Envoyer</span></div></div>
        <!-- Passer tous les textes en variable $GLOBALS['translat'] qui sont stoqué dans Ressources/lang/toutesleslangues.json-->

    </main>

    <?php include 'Projet/view/' . $_SESSION['controle'] . '/footer.tpl'; ?>

</body>
</html>
