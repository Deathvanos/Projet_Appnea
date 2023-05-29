<?php
echo "Erreur lors de l'envoi de l'e-mail.";
/*
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Récupérer les données du formulaire
    $objet = $_POST["objet"];
    $question = $_POST["question"];

    // Validation des données (vous pouvez ajouter vos propres validations ici)

    // Envoyer l'e-mail
    $to = "serviceappnea@outlook.com";
    $subject = "Nouveau message de contact";
    $message = "Objet: " . $objet . "\n\n" . "Question: " . $question;
    $headers = "From: webmaster@example.com";

    if (mail($to, $subject, $message, $headers)) {
        echo "E-mail envoyé avec succès.";
    } else {
        echo "Erreur lors de l'envoi de l'e-mail.";
    }
}*/
?>
