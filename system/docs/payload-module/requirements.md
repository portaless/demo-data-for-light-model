---
generated_by: light-model
generated_at: 2026-07-11T12:48:39+00:00
layer: R
---

# Couche Requirements (R)

3 élément(s).

## PayloadModuleRequirements

<!-- lm:id=PayloadModuleRequirements -->

`package`

Exigences du sous-système PayloadModule, DÉRIVÉES des exigences
système par refine (traçabilité verticale du cycle récursif).

### PlImageResolution

<!-- lm:id=PayloadModuleRequirements::PlImageResolution -->

`requirement_def`

Résolution image au niveau charge utile — dérive de
l'exigence système ImageResolution.

- **Satisfaite par** : `MsatLogical::CameraUnit2`
- **Vérifiée par** : `PayloadModuleIvvq::VerifyPlResolution`

### PlMassBudget

<!-- lm:id=PayloadModuleRequirements::PlMassBudget -->

`requirement_def`

Budget de masse alloué à la charge utile — dérive du budget
de masse total plateforme.

- **Satisfaite par** : `MsatLogical::PayloadModule::CompressionBoard`
- **Vérifiée par** : `PayloadModuleIvvq::VerifyPlMass`
