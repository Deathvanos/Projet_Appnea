# APPNEA - Une solution pour détecter l'apnée du sommeil (*Website*)

Le projet "Appnea" a eu lieu dans le cadre d'un module APP (Apprentissage par Projet) lors de mon apprentissage à l'ISEP (école d'ingénieur). Nous travaillions en mode "start-up". Cette APP contient 4 modules : Électronique, Signal, Informatique et Télécommunication. Le projet fait partie de la composante informatique et a pour objectif de développer un site internet pour la détection d'apnée du sommeil. Il est codé en PHP, JavaScript et CSS.

## Contexte
>  
> Le sommeil joue un rôle primordial pour notre santé, il nous permet de consolider nos souvenirs, d’améliorer nos apprentissages, mais aussi de développer nos capacités de déduction et de créativité. Dormir favorise ainsi une récupération physique et psychologique. Cependant, de nombreuses personnes souffrent d’apnée du sommeil et cela peut nuire à leur santé pouvant même provoquer de grave maladie.
> 
> C’est pour cela que notre entreprise, Appnea, entreprend de mettre sur pied un détecteur d’apnée du sommeil. En effet, il est important de pouvoir identifier le plus tôt possible si un patient est sujet d’apnée du sommeil. Notre produit viendrait remplacer, ou compléter le calendrier du sommeil. Il est donné lors de la phase de recherche de trouble du sommeil à l’hôpital. Ceci ayant pour but de permettre au patient de gagner du temps en évitant de prendre rendez-vous avant d'être sûr d'être atteint de troubles du sommeil. En arrivant pour la première fois chez un médecin du sommeil, le patient pourra arriver avec ses analyses effectuées (plus précis qu’un calendrier du sommeil fait à la main qui est peu précis) avec notre appareil et pourra dans le meilleur des cas être directement pris en charge à l'hôpital pour des analyses plus approfondies.
>
> N.B. Pour clarifier les choses, ce diagnostic n’est pas réservé aux personnes sachant être atteintes de ce trouble, car ce dernier ne donne qu’un premier diagnostic incertain. Il n’a pas pour vocation de remplacer les réels diagnostics médicaux, mais de vous proposer un premier diagnostic. Plusieurs critères sont à prendre en compte pour effectuer ce diagnostic tel que la qualité de l’air de la pièce dans laquelle se trouve le patient, le niveau sonore et la température de la peau du patient.
>
> Auparavant, nous avons développé un prototype composé des capteurs de son, de rythme cardiaque, de température et d’humidité pour détecter l’apnée du sommeil. Nous allons dans la seconde partie de ce projet, implémenter un site web pour permettre au client de consulter les données collectées par les capteurs et les montrer à leur médecin traitant. 

## Objectif 
  
Le site internet d'Appnea intervient après la conception d'un appareil de détection d'apnée du sommeil et la mise en place d'une passerelle pour envoyer des données de chaque capteur sur un serveur. Il permet à un utilisateur ayant un de nos capteurs de pourvoir, après sert connecter à son compte, visualiser les données émis par son appareil sous forme de graphique. Une partie administration a aussi été implémentée pour gérer les utilisateurs de la plateforme.

## Pris en main du projet

Le projet a été développé sur VSCode et utilise [Xampp](https://www.apachefriends.org/fr/index.html) pour la partie serveur et base de données mySQL.

Pour initialiser la BdD :  
    - Dans Xampp -> Start Apache + Start MySQL  
    - Dans un navigateur -> url=http://localhost/ -> phpMyAdmin  
    - Dans phpMyAdmin -> "Nouvelle base de données" (à gauche de l'écran)  
                      -> "Nom de base de données"="APPNEA" (ou un autre nom)   
                      -> Créer  
    - Aller maintenant dans la partie SQL (sur le bandeau en haut et vers la gauche)  
    - Ouvrez le fichier BdD/appnea.SQL (présent dans ce dossier) avec un éditeur de texte -> ctrl+a -> ctrl+c pour copier tout le script  
    - Dans l'éditeur de code -> coller le script contenu dans le fichier appnea.SQL  
    - Exécuter (en bas à droite)  
    - Votre BdD est maintenant créée   
    - Pour le vérifier, allez dans l'onglet Structure pour constater la création des tables.  
  
Liste des logins (main, typeUser, mdp):
- admin: adminthebest@gmail.com | admin123ABC!!!
- modo: modothwoth@yahoo.fr | modo123ABC!!!
- user: faresdata.yessir@yahoo.fr user Azerty123!
