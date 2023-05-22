
/**
 * Avant la suppression d'un User :
 * Génération de 2 boites de dialogues à confirmer
 * Anulation de la procédure si annulation
 */
function msgDelUser(idUser, txt) {   
    // Boite de dialogue
    var firstConfirm = confirm(txt+" \nUser: "+idUser);
    if (firstConfirm==true) {
            document.cookie = "valueRep="+idUser;
            return true;
    }
    document.cookie = "valueRep=false";
    return false;
}