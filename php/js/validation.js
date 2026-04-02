// validation.js
// 1. Validation formulaire client

function validerFormulaireClient() {
  const nom = document.getElementById('nom').value.trim();
  const email = document.getElementById('email').value.trim();

  if (nom === '' || email === '') {
    alert('nom ou mail vide, veuillez remplir tous les champs obligatoires !');
    return false;
    }

  // Validation nom
  const nomPattern = /^[A-Za-zÀ-ÖØ-öø-ÿ' -]{2,50}$/;
  if (!nomPattern.test(nom)) {
    alert('Votre nom n\'est pas valide, veuillez recommencer la saisie.');
    return false;
  }

  // Validation email
  const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
  if (!emailPattern.test(email)) {
    alert('Email invalide !');
    return false;
  }

  return true;
}


// 2. Confirmation suppression client
function confirmerSuppressionClient(nomClient) {
  return confirm(`Êtes-vous sûr de vouloir supprimer le client ${nomClient} ?`);
}

// 3. Vérifier solde suffisant pour retrait
function verifierSolde(retraitInputId, soldeCompte) {
  const retrait = parseFloat(document.getElementById(retraitInputId).value);
  const boutonRetirer = document.getElementById('btnRetirer');

  if (retrait > soldeCompte) {
    boutonRetirer.disabled = true;
    alert('Solde insuffisant pour ce retrait !');
  } else {
    boutonRetirer.disabled = false;
  }
}