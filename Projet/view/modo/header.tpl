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

<header class="header_all">
    <div class="header_left">
        <a class="header_title" href="index.php?controle=modo&action=mainGuest">
            <img class="header_logo" src="Ressources/img/Logo_Appea-grey.svg" alt="Logo APPNEA">
            <?php echo $txt['title_brand']; ?>
        </a>
        <nav class="header_language">
            <?php echo '<img class="header_flag" src="Ressources/bitmap/icon-flag/'.$_SESSION['lang'].'.svg">'; ?>
            <ul class="header_listFlag">
                <li><a href=<?php echo "index.php?controle=".$_SESSION['controle']."&action=".$_SESSION['action']."&lang=fr"?>><img class="header_flag" src="Ressources/bitmap/icon-flag/fr.svg" alt="Francais"></a></li>
                <li><a href=<?php echo "index.php?controle=".$_SESSION['controle']."&action=".$_SESSION['action']."&lang=us"?>><img class="header_flag" src="Ressources/bitmap/icon-flag/us.svg" alt="English"></a></li>
            </ul>
        </nav>
    </div>
    <ul class="header_right">
        <li><a href='index.php?controle=modo&action=errorPage'><?php echo $txt['header_link1']; ?></a></li>
        <li><a href='index.php?controle=modo&action=errorPage'><?php echo $txt['header_link2']; ?></a></li>
        <li><a href='index.php?controle=modo&action=teamsPage'><?php echo $txt['header_link3']; ?></a></li>
        <li><a href='index.php?controle=modo&action=questionsPage'><?php echo $txt['header_link4']; ?></a></li>
        <li><a href='index.php?controle=modo&action=errorPage'><?php echo $txt['header_linkM1'];?></a></li>
        <li><a href='index.php?controle=modo&action=findUser'><?php echo $txt['header_linkAM2'];?></a></li>
        <li class="header_conn"><nav class="header_login">
            <a href=<?php echo "index.php?controle=modo&action=mainModo"?>><i class='bx bxs-user'></i></a>
            <ul>
                <li><a href="index.php?controle=user&action=displayProfil"><?php echo $txt['header_link5'];?></a></li>
                <li><a href=<?php echo "index.php"?>><?php echo $txt['header_linkLogout']; ?></a></li>
            </ul>
        </nav></li>
    </ul>
</header>
