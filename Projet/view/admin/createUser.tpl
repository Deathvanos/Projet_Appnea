<!DOCTYPE html>
<html lang="fr">

<head>
    <title>APNEA - Main Admin</title>
    <?php include 'Projet/view/other/header_Font_Page.html';?>
    <link rel="stylesheet" href="Ressources/css/admin/mainAdmin.css" />
</head>

<body>
    <?php
    // Bug  : on doit récuperer ces deux variables dans les variables globals 
    $txt = $GLOBALS['translat'];
    include 'Projet/view/' . $_SESSION['controle'] . '/header.tpl'; ?>
</body>

<?php include 'Projet/view/' . $_SESSION['controle'] . '/footer.tpl'; ?>

</body>

</html>