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
    <link rel="icon" type="image/x-icon" href="../../../Ressources/img/Logo_Appea-color.svg">
    <link rel="stylesheet" href="../../../Ressources/css/allPage.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="../../../Ressources/bitmap/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../../Ressources/css/viewer_index.css" />
</head>
<body>
    <?php include '../../view/for_all/header.php';?>

    <main style="height:430px;">
        <h1>Bienvenu sur votre page d'acceuil personnel</h1>
        <?php echo $translat['userMain'];
        echo "<br>Voici la liste des informations concernant votre session :<br>";
        Print_r ($_SESSION);
            
        ?>
    </main>

    <?php include '../../view/for_all/footer.php'; ?>
</body>
</html>