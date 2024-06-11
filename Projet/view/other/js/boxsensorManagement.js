

/** 
 * Execture une requete AJAX pour la page createBoxAndSensor
 */
function addItem(nameField, action, typeField='box') {
    // recuperation du nom de l'objet
    let name = document.getElementById(nameField).value;
    // verification du champ non vide et sans caractere speciaux
    if (name=="" || !name.match(/[a-zA-Z0-9]+$/)) {
        document.getElementById(nameField).focus();
        return;
    }
    // Recuperation du type du capteur
    let type=typeField;
    if (typeField!="box") {
        let select = document.getElementById(typeField);
        let index = select.selectedIndex;
        type = select.options[ index ].value;
        // verification du type du capteur
        if (type == "--Veuillez choisir une option--") {
            select.focus();
            return;
        }
    }

    // Requete Ajax 
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        // Si le code PHP a bien été exécuté
        if (this.readyState == 4 && this.status == 200) {
            // Récupération du message PHP en ne gradant que la partir JSON dans la console
            var response = JSON.parse('{'+this.response.split('{')[1]);        
            // On save le msg pour l'afficher après avoir reload la page
            localStorage.setItem('messageAjax', response.message);
            // On reload la page
            location.reload();
        }
    };
    // Indique la méthode et la page PHP à charger de manière asynchrone
    xmlhttp.open("GET", "index.php?controle=admin&action="+action+"&temoin=" + name+"&typeSensor=" + type, true);
    // Active la requete Ajax
    xmlhttp.send();
};

/** 
 * En rechargeant la page après la fonction Ajax, affiche un message
 */
window.addEventListener('load', function() {
    // Récupération de la réponse Ajax
    var message = localStorage.getItem('messageAjax');
    // Si le message existe on l'affiche
    if (message) {
        var styles = `padding-block:0.5rem;
                    background-color: rgba(0, 0, 0, 0.5);
                    color: #F6593E;
                    `;
        // Div pour afficher le message
        var msgBox = document.createElement('center');
        msgBox.id = 'msgBox';
        msgBox.innerHTML = message;
        // Application des styles 
        msgBox.style.cssText = styles;
        // Ajout de la div sur la page sous le header
        document.querySelector('.header_all').insertAdjacentHTML('afterend', msgBox.outerHTML);
        // Suppression la variable Ajax stoqué
        localStorage.removeItem('messageAjax');
    }
 });







 function printMessage() {
    // Recuperation de la Box selected
    let refBox = document.getElementById('refBox').value;

    // Changement du titre
    document.getElementById('titleBox').innerHTML = "Gestion du boitier " + refBox;

   

    // -1- Requete Ajax pour récuperer l'utilisateur de la box
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        // Si le code PHP a bien été exécuté
        if (this.readyState == 4 && this.status == 200) {
            // Récupération du message PHP en ne gradant que la partir JSON dans la console
            var response = JSON.parse('{'+this.response.split('{')[1]);  
            document.getElementById('userBox').value = response["User"];   
            // Affiche/cache le bouton deleteBox
            if (document.getElementById('userBox').value!='notUsed') {
                document.getElementById('deleteBoxBtn').hidden = true;
            }else {document.getElementById('deleteBoxBtn').hidden = false;}
        }           
    };// Active la requete Ajax et Indique la méthode et la page PHP à charger de manière asynchrone
    xmlhttp.open("GET", "index.php?controle=admin&action=getUserBoxAjax&temoin=" + refBox, true);
    xmlhttp.send();



    // Sélectionnez toutes les balises <option> avec id="optionSensor"
    const options = document.querySelectorAll('option[id="optionSensor"]');
    // Parcourez les options sélectionnées et supprimez-les un par un
    options.forEach(option => {option.remove();});


    // -2- Requete Ajax pour recuperer les infos des sensors
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        // Si le code PHP a bien été exécuté
        if (this.readyState == 4 && this.status == 200) {
            // Récupération du message PHP en ne gradant que la partir JSON dans la console
            var response = JSON.parse('{'+this.response.split('{').slice(1).join('{'))['message'];
            // Pour les quatre type de capteurs
            var array = ["temperatureSensor", "humiditySensor", "heartSensor", "soundSensor"];
            array.forEach(function(sensor) {
                // Recherche de son existance pour ce capteur
                var resultSensor = response.find(function(arraySensor) {
                    return arraySensor.typeSensor === sensor;
                });
                // Si existant recuperation des infos
                if (resultSensor != null) {
                    sensorId_value = resultSensor['id_sensor'];
                    sensorAct_value = (resultSensor['isUsed'] == 1) ? 'oui' : 'non';
                }
                else {
                    sensorId_value = "**Inexistant**";
                    sensorAct_value = "non";
                }
                // Affichage du sensorIsUsed 
                [sensorId_value, '**Inexistant**'].forEach(function(sensorIdName) {
                    if (sensorId_value!='exit') {
                        var sensorId = document.createElement('option');
                        sensorId.value = sensorIdName;
                        sensorId.innerHTML = sensorIdName;
                        sensorId.id = "optionSensor";
                        if (sensorIdName == sensorId_value) {sensorId.selected = true;}
                        document.getElementById(sensor).appendChild(sensorId);
                        if (sensorId_value=="**Inexistant**") {sensorId_value ='exit';};
                    }
                });
                // Affichage du sensorIsUsed 
                ['oui', 'non'].forEach(function(typeUsed) {
                    var sensorAct = document.createElement('option');
                    sensorAct.value = typeUsed;
                    sensorAct.innerHTML = typeUsed;
                    sensorAct.id = "optionSensor";
                    if (typeUsed == sensorAct_value) {sensorAct.selected = true;}
                    document.getElementById(sensor+"Act").appendChild(sensorAct);
                });
            });
        }
    };
    // Indique la méthode et la page PHP à charger de manière asynchrone
    xmlhttp.open("GET", "index.php?controle=admin&action=getinfoBoxAjax&temoin=" + refBox, true);
    // Active la requete Ajax
    xmlhttp.send();




     // -3- Requete Ajax pour afficher la liste des capteurs sans box
     var xmlhttp = new XMLHttpRequest();
     xmlhttp.onreadystatechange = function() {
         // Si le code PHP a bien été exécuté
         if (this.readyState == 4 && this.status == 200) {
             // Récupération du message PHP en ne gradant que la partir JSON dans la console
             var response = JSON.parse('{'+this.response.split('{').slice(1).join('{'))['message'];
             // Pour les quatre type de capteurs
             var array = ["temperatureSensor", "humiditySensor", "heartSensor", "soundSensor"];
             array.forEach(function(sensor) {
                 // Dans la liste des capteurs ne prend que ceux de type sensor
                 var resultSensor = response.filter(function(arraySensor) {
                     return arraySensor.typeSensor === sensor;
                 });
                 // Pour chaque sensor trouvé, l'ajoute en option à la selectBox
                 resultSensor.forEach(function(sensorFind) {
                    var sensorId = document.createElement('option');
                    sensorId.value = sensorFind['id_sensor'];
                    sensorId.innerHTML = sensorFind['id_sensor'];
                    sensorId.id = "optionSensor";
                    document.getElementById(sensor).appendChild(sensorId);
                 });
             });
         }
     };
     // Indique la méthode et la page PHP à charger de manière asynchrone
     xmlhttp.open("GET", "index.php?controle=admin&action=getSensorNotUsedAjax", true);
     // Active la requete Ajax
     xmlhttp.send();
 }


 function changeIsActive(typeSensor) {
    let idSensor = document.getElementById(typeSensor).value;
    if (idSensor != "**Inexistant**") {
        // Requete Ajax mettre à l'etat la valeur de isUsed du new sensor select
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            // Si le code PHP a bien été exécuté
            if (this.readyState == 4 && this.status == 200) {
                // Récupération du message PHP en ne gradant que la partir JSON dans la console
                var response = JSON.parse('{'+this.response.split('{').slice(1).join('{'))['message'];
                document.getElementById(typeSensor+"Act").value = (response['isUsed'] == 1) ? 'oui' : 'non';
            }
        };
        // Indique la méthode et la page PHP à charger de manière asynchrone
        xmlhttp.open("GET", "index.php?controle=admin&action=getSensorSelectAjax&temoin=" + idSensor, true);
        // Active la requete Ajax
        xmlhttp.send();
    }
    else {document.getElementById(typeSensor+"Act").value = 'non';}
 }




 function delBoxAction() {
    let refBox = document.getElementById("refBox").value;
    if (confirm('Veuillez confirmer la suppression du boitier : '+refBox)) {
        // Requete Ajax pour del la box
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            // Si le code PHP a bien été exécuté
            if (this.readyState == 4 && this.status == 200) {
                var response = JSON.parse('{'+this.response.split('{')[1]);        
                // On save le msg pour l'afficher après avoir reload la page
                localStorage.setItem('messageAjax', response.message);
                // On reload la page
                location.reload();
            }           
        };// Active la requete Ajax et Indique la méthode et la page PHP à charger de manière asynchrone
        xmlhttp.open("GET", "index.php?controle=admin&action=deleteBoxAjax&temoin=" + refBox, true);
        xmlhttp.send();
    }
}

 function delSensorAction(sensorType) {
    let refSensor = document.getElementById(sensorType).value;
    if (refSensor!="" && refSensor!="**Inexistant**" && confirm('Veuillez confirmer la suppression du capteur : '+refSensor)) {
        // Requete Ajax pour del la box
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            // Si le code PHP a bien été exécuté
            if (this.readyState == 4 && this.status == 200) {
                var response = JSON.parse('{'+this.response.split('{')[1]);        
                // On save le msg pour l'afficher après avoir reload la page
                localStorage.setItem('messageAjax', response.message);
                // On reload la page
                location.reload();
            }           
        };// Active la requete Ajax et Indique la méthode et la page PHP à charger de manière asynchrone
        xmlhttp.open("GET", "index.php?controle=admin&action=deleteSensorAjax&temoin=" + refSensor, true);
        xmlhttp.send();
    }
}


function modifSensorInBox() {
    let refBox = document.getElementById("refBox").value;
    if (confirm('Veuillez confirmer la nouvelle composition du boitier du capteur : '+refBox)) {

        let isActiveTemp = document.getElementById('temperatureSensor'+'Act').value
        let isActiveHum = document.getElementById('humiditySensor'+'Act').value
        let isActiveHeart = document.getElementById('heartSensor'+'Act').value
        let isActiveSound = document.getElementById('soundSensor'+'Act').value

        var listNewSensor = {
            'id_Box': refBox,
            "temperatureSensor": {
                'id_sensor':document.getElementById("temperatureSensor").value, 
                'isUsed': (isActiveTemp=="oui") ? 1:0 },
            "humiditySensor": {
                'id_sensor':document.getElementById('humiditySensor').value, 
                'isUsed': (isActiveHum=="oui") ? 1:0},
            "heartSensor": {
                'id_sensor':document.getElementById('heartSensor').value, 
                'isUsed': (isActiveHeart=="oui") ? 1:0},
            "soundSensor": {
                'id_sensor':document.getElementById('soundSensor').value, 
                'isUsed': (isActiveSound=="oui") ? 1:0}
        };
        // Convertir l'objet en chaîne JSON
        var jsonData = JSON.stringify(listNewSensor);
        
        // Requete Ajax pour del la box
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            // Si le code PHP a bien été exécuté
            if (this.readyState == 4 && this.status == 200) {
                var response = JSON.parse('{'+this.response.split('{')[1]);   
                //var response = JSON.parse('{'+this.response.split('{').slice(1).join('{'))['message'];
                // On save le msg pour l'afficher après avoir reload la page
                localStorage.setItem('messageAjax', response.message);
                // On reload la page
                location.reload();
            }           
        };// Active la requete Ajax et Indique la méthode et la page PHP à charger de manière asynchrone
        xmlhttp.open("POST", "index.php?controle=admin&action=changeSensorInBoxAjax", true);
        xmlhttp.setRequestHeader("Content-Type", "application/json");
        xmlhttp.send(jsonData);
    }
}


