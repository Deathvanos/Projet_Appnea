function verifMdp() {
    const newPassword = document.querySelector('input[name="newPassword"]');
    const newPasswordConfirm = document.querySelector('input[name="newPasswordConfirm"]');
    let isValid = true;
  
    // Vérification de l'identité des mots de passe
    if (newPassword.value !== newPasswordConfirm.value) {
      isValid = false;
      newPassword.classList.add('error');
      newPasswordConfirm.classList.add('error');
      newPassword.focus();
    } else {
      newPassword.classList.remove('error');
      newPasswordConfirm.classList.remove('error');
    }
  
    // Vérification de la complexité des mots de passe
    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&-~]+$/;

    if (!passwordRegex.test(newPassword.value) ||newPassword.value.length<8) {
      isValid = false;
      newPassword.classList.add('error');
      newPassword.focus();
    } else {
      newPassword.classList.remove('error');
    }

    // Retournez la validité du formulaire
    return isValid;
  }