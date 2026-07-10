package PayloadModuleRequirements {
    doc /* Exigences du sous-système PayloadModule, DÉRIVÉES des exigences
         système par refine (traçabilité verticale du cycle récursif). */
    requirement def PlImageResolution {
        doc /* Résolution image au niveau charge utile — dérive de
             l'exigence système ImageResolution. */
        refine Requirements::Imaging::ImageResolution;
    }
    requirement def PlMassBudget {
        doc /* Budget de masse alloué à la charge utile — dérive du budget
             de masse total plateforme. */
        refine Requirements::Platform::TotalMass;
    }
}
