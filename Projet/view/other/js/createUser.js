function verifChamp() {
    const inputs = document.getElementsByTagName('input');
    const selectRoles = document.getElementById('roles');
    const selectBoxes = document.getElementById('boxesId');
    let isValid = true;
    let firstInvalidField = null;
  
    const nameRegex = /^[A-Za-z\s]+$/; // Expression régulière pour les noms
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // Expression régulière pour l'e-mail
    const phoneRegex = /^\d+$/; // Expression régulière pour le numéro de téléphone
    const postalCodeRegex = /^\d+$/; // Expression régulière pour le code postal
  
    for (let i = 0; i < inputs.length; i++) {
      const inputValue = inputs[i].value.trim();
  
      if (inputValue === '') {
        isValid = false;
        inputs[i].classList.add('error');
  
        if (!firstInvalidField) {
          firstInvalidField = inputs[i];
        }
      } else {
        inputs[i].classList.remove('error');
  
        // Vérification spécifique pour chaque champ
        if (inputs[i].name === 'mail' && !emailRegex.test(inputValue)) {
          isValid = false;
          inputs[i].classList.add('error');
  
          if (!firstInvalidField) {
            firstInvalidField = inputs[i];
          }
        }
  
        if (inputs[i].name === 'phoneNumber' && !phoneRegex.test(inputValue)) {
          isValid = false;
          inputs[i].classList.add('error');
  
          if (!firstInvalidField) {
            firstInvalidField = inputs[i];
          }
        }
  
        if (inputs[i].name === 'codePostal' && !postalCodeRegex.test(inputValue)) {
          isValid = false;
          inputs[i].classList.add('error');
  
          if (!firstInvalidField) {
            firstInvalidField = inputs[i];
          }
        }
  
        if (
          (inputs[i].name === 'lastname' || inputs[i].name === 'firstname') &&
          !nameRegex.test(inputValue)
        ) {
          isValid = false;
          inputs[i].classList.add('error');
  
          if (!firstInvalidField) {
            firstInvalidField = inputs[i];
          }
        }
      }
    }
  
    if (selectRoles.value === '' || selectRoles.value === null) {
      isValid = false;
      selectRoles.classList.add('error');
  
      if (!firstInvalidField) {
        firstInvalidField = selectRoles;
      }
    } else {
      selectRoles.classList.remove('error');
    }
  
    if (selectBoxes.value === '' || selectBoxes.value === null) {
      isValid = false;
      selectBoxes.classList.add('error');
  
      if (!firstInvalidField) {
        firstInvalidField = selectBoxes;
      }
    } else {
      selectBoxes.classList.remove('error');
    }
  
    // Vérifier si les selects ont la valeur par défaut
    if (selectRoles.selectedIndex === 0) {
      isValid = false;
      selectRoles.classList.add('error');
  
      if (!firstInvalidField) {
        firstInvalidField = selectRoles;
      }
    }
  
    if (selectBoxes.selectedIndex === 0 && selectRoles.value === 'User') {
      isValid = false;
      selectBoxes.classList.add('error');
  
      if (!firstInvalidField) {
        firstInvalidField = selectBoxes;
      }
    }
  
    if (firstInvalidField) {
      firstInvalidField.focus();
    }
  
    return isValid;
  }



function afficherBoxID(){     
    if (document.getElementById('roles').value!='User') {
        document.getElementById('boxesId').hidden = true;
        document.getElementById('elemBox').hidden = true;
    }else {
        document.getElementById('boxesId').hidden =false;
        document.getElementById('elemBox').hidden =false;
    }
}

