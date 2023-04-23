Ce dossier BdD est sensé contenir le programme SQL permettant la création de la base de données (BdD).
Sans cela le site ne peut fonctionner.

Pour initialiser la BdD :
    - Dans Xampp -> Start Apache + Start MySQL
    - Dans un navigateur -> url=http://localhost/ -> phpMyAdmin
    - Dans phpMyAdmin -> "Nouvelle base de données" (à gauche de l'écran)
                      -> "Nom de base de données"="APPNEA" (ou un autre nom) 
                      -> Créer
    - Aller maintenant dans la partie SQL (sur le bandeau en haut et vers la gauche)
    - Ouvrez le fichier appnea.SQL (présent dans ce dossier) avec un éditeur de texte -> ctrl+a -> ctrl+c pour copier tout le script
    - Dans l'éditeur de code -> coller le script contenu dans le fichier appnea.SQL
    - Exécuter (en bas à droite)
    - Votre BdD est maintenant créée
    - Pour le vérifier aller dans l'onglet Structure pour constater la création des tables