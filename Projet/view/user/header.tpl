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
        <a class="header_title" href="index.php?controle=user&action=mainGuest">
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
        <li><a href='index.php?controle=user&action=errorPage'><?php echo $txt['header_link1']; ?></a></li>
        <li><a href='index.php?controle=user&action=errorPage'><?php echo $txt['header_link2']; ?></a></li>
        <li><a href='index.php?controle=user&action=errorPage'><?php echo $txt['header_link3']; ?></a></li>
        <li><a href='index.php?controle=user&action=errorPage'><?php echo $txt['header_link4']; ?></a></li>
        <li class="header_log"><a href="index.php">Hold <?php echo $txt['header_linkLogout']; ?></a></li>


        <li><a href='index.php?controle=user&action=errorPage'>Data Sensor</a></li>
        <li><a href='index.php?controle=user&action=errorPage'>Ticket incident</a></li>
        <nav class="header_language"> 
            <a href=<?php echo "index.php?controle=user&action=errorPage"?>>mainUser</a>
            
            <ul class="header_listFlag">
                <li><a href=<?php echo "index.php?controle=user&action=errorPage"?>>Editer profil</a></li> 
                <li><a href=<?php echo "index.php"?>><?php echo $txt['header_linkLogout']; ?></a></li> 
            </ul> 
        </nav>

        
    </ul>
</header>
        
