


/**
 * Après confirmation de la demande de suppression,
 * on effectue une requete Ajax pour supprimer l'utilisateur
 * @param {*} mailUser mail de l'utilisateur à supprimer
 */
function confirmPopup(mailUser, lang) {
    // On a plus besoin du popup
    popup.remove();
    // Requete Ajax pour del l'user
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        // Si le code PHP a bien été exécuté
        if (this.readyState == 4 && this.status == 200) {
            // Récupération du message PHP en ne gradant que la partir JSON dans la console
            var response = JSON.parse('{'+this.response.split('{')[1]);

            // On save le msg pour l'afficher après avoir reload la page
            localStorage.setItem('messageDelete', response.message);
            // On reload la page
            location.reload();
        }
    };
    // Indique la méthode et la page PHP à charger de manière asynchrone
    xmlhttp.open("GET", "index.php?controle=admin&action=deleteUserAjax&temoin=" + mailUser, true);
    // Active la requete Ajax
    xmlhttp.send();
};


/**
 * En supprimant un utilisateur, on actualise la page.
 * Il faut pourtant afficher un message de confirmation à l'admin
 */
window.addEventListener('load', function() {
    // Récupération de la réponse Ajax
    var message = localStorage.getItem('messageDelete');
    // Si le message existe on l'affiche
    if (message) {
        var styles = `padding-block:0.5rem;
                    background-color: rgba(0, 0, 0, 0.5);
                    color: #F6593E;
                    `;
        // Div pour afficher le message
        var boxMsgDeleteUser = document.createElement('center');
        boxMsgDeleteUser.id = 'boxMsgDeleteUser';
        boxMsgDeleteUser.innerHTML = message;
        // Application des styles
        boxMsgDeleteUser.style.cssText = styles;
        // Ajout de la div sur la page sous le header
        document.querySelector('.header_all').insertAdjacentHTML('afterend', boxMsgDeleteUser.outerHTML);
        // Suppression la variable Ajax stoqué
        localStorage.removeItem('messageDelete');
    } // Sinon aucune demande de suppression a été effectué
 });



/**
 * Le popup a été cancel.
 * On supprime donc pas d'utilisateur
 */
function cancelPopup() {
    popup.remove();
};


/**
 * Un admin souhaite supprimer un utilisateur.
 * On affiche un popup lui demandant de confirmer son choix
 */
function showPopup(mailUser="mailUser", lang='fr') {
    // Style du Pop-Up
    var styles = `position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
                text-align: center;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 9999;
    `;
    // Lecture du fichier texte en fonction de la langue
    fetch('Ressources/lang/text_'+lang+'.json')
    .then(response => response.json())
    .then(data => {
        // recuperation des valeurs qui nous intéresse
        var title = data.adminGestionUser_MsgDelTitle;
        var msg = data['adminGestionUser_MsgDelUser'];
        var txtBtnBack = data['Abandon'];
        var txtBtnConf = data['adminGestionUser_PopupSubmit'];
        // Affiche le popup
        var popup = document.createElement('div');
        popup.id = 'popup';
        popup.classList.add('popup-style'); // Ajout de la classe CSS
        popup.innerHTML = '<div class="popup-content">\
                                <h2>'+title+'</h2>\
                                <p>'+msg+'</p>\
                                <p>mail : '+mailUser+'</p>\
                                <div class="popup-buttons">\
                                    <button onclick=cancelPopup()>'+txtBtnBack+'</button>\
                                    <button onclick=confirmPopup("'+mailUser+'","'+lang+'")>'+txtBtnConf+'</button>\
                                </div>\
                            </div>'
        ;
        popup.style.cssText = styles;
        document.body.appendChild(popup);
    })
    .catch(error => {
        console.error('Une erreur s\'est produite:', error);
    });
}
