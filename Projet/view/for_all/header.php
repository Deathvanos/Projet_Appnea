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
        <a class="header_title" href="../guest/main.php">
            <img class="header_logo" src="../../../Ressources/img/Logo_Appea-grey.svg" alt="Logo APPNEA">
            <?php echo $translat['title_brand']; ?>
        </a>
        <nav class="header_language"> 
            <?php echo '<img class="header_flag" src="../../../Ressources/bitmap/icon-flag/'.$_SESSION['lang'].'.svg">'; ?>
            <ul class="header_listFlag">
                <li><a href="?lang=fr"><img class="header_flag" src="../../../Ressources/bitmap/icon-flag/fr.svg" alt="Francais"></a></li> 
                <li><a href="?lang=us" ><img class="header_flag" src="../../../Ressources/bitmap/icon-flag/us.svg" alt="English"></a></li> 
            </ul> 
        </nav>
    </div>
    <ul class="header_right">
        <li><a href=<?php echo $errorPage?>><?php echo $translat['header_link1']; ?></a></li>
        <li><a href=<?php echo $errorPage?>><?php echo $translat['header_link2']; ?></a></li>
        <li><a href=<?php echo $errorPage?>><?php echo $translat['header_link3']; ?></a></li>
        <li><a href=<?php echo $errorPage?>><?php echo $translat['header_link4']; ?></a></li>
        <li class="header_log"><a href="../guest/login.php"><?php echo $translat['header_linkConn']; ?></a></li>
    </ul>
</header>
        
