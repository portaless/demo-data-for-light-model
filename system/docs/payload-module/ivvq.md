---
generated_by: light-model
generated_at: 2026-07-11T12:48:39+00:00
layer: IVVQ
---

# Couche IVVQ (IVVQ)

3 élément(s).

## PayloadModuleIvvq

<!-- lm:id=PayloadModuleIvvq -->

`package`

Campagne de vérification du sous-système : chaque étage
d'analyse porte sa propre recette IVVQ.

### VerifyPlResolution

<!-- lm:id=PayloadModuleIvvq::VerifyPlResolution -->

`verification_def`

Banc optique : mesure de la résolution bout en bout.

- **Vérifie** : `PayloadModuleRequirements::PlImageResolution`

### VerifyPlMass

<!-- lm:id=PayloadModuleIvvq::VerifyPlMass -->

`verification_def`

Pesée du module intégré.

- **Vérifie** : `PayloadModuleRequirements::PlMassBudget`
