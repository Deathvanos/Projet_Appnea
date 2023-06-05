function resetPasswordMail(){
    const emailField = document.querySelector('input[name="mail"]');
    const email = emailField.value.trim();
  
    if (email === '') {
      // Le champ d'e-mail est vide
      emailField.classList.add('error');
      emailField.focus();
      return false;
    }
  
    // Vérification de la validité de l'adresse e-mail
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      // L'adresse e-mail n'est pas valide
      emailField.classList.add('error');
      emailField.focus();
      return false;
    }
    
    return true;
  }
  