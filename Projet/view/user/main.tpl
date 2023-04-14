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
    <link rel="stylesheet" href="Ressources/css/viewer_index.css" />
</head>
<body>
    <?php    
    // Bug  : on doit récuperer ces deux variables dans les variables globals 
    $txt = $GLOBALS['translat'];
    include 'Projet/view/'.$_SESSION['controle'].'/header.tpl';?>

    <main style="height:530px;">
        <h1>Bienvenu sur votre page d'acceuil personnel</h1>
        <h2>Laissez moi deviner... vous êtes... un... pigeon (User)</h2>
        <?php echo $txt['userMain'];
        echo "<br>Voici la liste des informations concernant votre session :<br>";
        //Print_r($_SESSION['userInfo']); // _SESSION - txt
        foreach ($_SESSION['userInfo'] as $cle => $valeur) {
            if (!is_numeric($cle)){echo "- ".$cle . " : " . $valeur . "<br>";}  
        }
        ?>
    </main>

    <?php include 'Projet/view/' . $_SESSION['controle'] . '/footer.tpl'; ?>
</body>
</html>