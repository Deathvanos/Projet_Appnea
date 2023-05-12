function scrollCarrousel(event, targetId) {
    event.preventDefault();
    const targetElement = document.getElementById(targetId);
    
    // Bloquer le défilement de la page
    document.body.style.overflow = 'hidden';
    
    // Effectuer l'animation de défilement du carrousel
    targetElement.scrollIntoView({ behavior: 'smooth', block: 'nearest', inline: 'nearest' });
    
    // Réactiver le défilement de la page après l'animation
    setTimeout(() => {
      document.body.style.overflow = '';
    }, 600); // Temps d'animation en millisecondes
  }