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

<footer class="footer">
    <div class="footer_top">
        <div>
        <h3><?php echo $txt['footer_p1_title']; ?></h3>
        <ul>
            <li>
            <div class="numberPhone_all">
                <div class="numberPhone_left"><?php echo $txt['footer_p1_txt1_1']; ?></div>
                <div class="numberPhone_right"><?php echo $txt['footer_p1_txt1_2']; ?></div>
            </div>
            </li>
            <li><i class="bx bx-chevron-right"></i> <a href=<?php echo 'mailto:'.$txt['footer_p1_txt2']; ?>><?php echo $txt['footer_p1_txt2']; ?></a></li>
            <li><i class="bx bx-chevron-right"></i> <a href=<?php echo "index.php?controle=".$_SESSION['controle']."&action=contactPage"?>><?php echo $txt['footer_p1_txt3']; ?></a></li>
        </ul>
        </div>
        <div>
        <h3><?php echo $txt['footer_p2_title']; ?></h3>
        <ul>
            <li><i class="bx bx-chevron-right"></i> <a href=<?php echo "index.php?controle=".$_SESSION['controle']."&action=CGUPage"?>><?php echo $txt['footer_p2_txt1']; ?></a></li>
            <li><i class="bx bx-chevron-right"></i> <a href=<?php echo "index.php?controle=".$_SESSION['controle']."&action=FAQPage"?>><?php echo $txt['footer_p2_txt3']; ?></a></li>
        </ul>
        </div>
        <div>
        <h3><?php echo $txt['footer_p3_title']; ?></h3>
        <ul>
            <a class="footer_icon" href=<?php echo "https://www.facebook.com/profile.php?id=100093521102356"?>><i class="bx bxl-facebook"></i></a>
            <a class="footer_icon" href=<?php echo "https://www.instagram.com/appnea2023"?>><i class="bx bxl-instagram"></i></a>
            <a class="footer_icon" href=<?php echo "https://twitter.com/appnea2023"?>><i class="bx bxl-twitter"></i></a>  
        </ul>
        </div>
    </div>
    <div class="footer_bottom"><i class='bx bx-copyright'></i><?php echo $txt['footer_p4']; ?></div>
</footer>

