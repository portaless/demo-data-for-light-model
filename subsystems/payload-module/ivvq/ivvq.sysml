package PayloadModuleIvvq {
    doc /* Campagne de vérification du sous-système : chaque étage
         d'analyse porte sa propre recette IVVQ. */
    verification def VerifyPlResolution {
        doc /* Banc optique : mesure de la résolution bout en bout. */
        verify PayloadModuleRequirements::PlImageResolution;
    }
    verification def VerifyPlMass {
        doc /* Pesée du module intégré. */
        verify PayloadModuleRequirements::PlMassBudget;
    }
}
