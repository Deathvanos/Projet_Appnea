


/**
 * Avant la suppression d'un User :
 * Génération de 2 boites de dialogues à confirmer
 * Anulation de la procédure si annulation
 */
function msgDelUser(idUser) {   
    // Boite de dialogue 1
    var firstConfirm = confirm("Votre demande de suppression de l'utilisateur (id="+idUser+") a été pris en compte."
                        +"\nPour valider la suppression, veuillez reefectuer la demarche de suppression"
                        +"\n Attetnion, l'action sera irréversible."
                        );
    if (firstConfirm==true) {
            document.cookie = "valueRep="+idUser;
            return true;
    }
    document.cookie = "valueRep=false";
    return false;
}



