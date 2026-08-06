---
generated_by: light-model
generated_at: 2026-08-06T15:08:03+00:00
layer: R
---

# Couche Requirements (R)

3 élément(s).

## ChaineRadioRequirements

<!-- lm:id=ChaineRadioRequirements -->

`package`

Exigences DÉRIVÉES de l'étage chaine-radio (refine vers les
exigences système).

### CR-001 — CrSensibilite

<!-- lm:id=ChaineRadioRequirements::CrSensibilite -->

`requirement_def` · spécialise : `ROFLP::PerformanceRequirement`

Sensibilité utilisable : 2 µV (S/N 26 dB) sur toute la bande.

- **Satisfaite par** : `RadioReveilLogical::RadioReveil::ChaineRadio::Syntoniseur`
- **Vérifiée par** : `ChaineRadioIvvq::TestSensibilite`

### CR-002 — CrRejetCanalAdjacent

<!-- lm:id=ChaineRadioRequirements::CrRejetCanalAdjacent -->

`requirement_def` · spécialise : `ROFLP::PerformanceRequirement`

Réjection du canal adjacent supérieure à 40 dB.

- **Satisfaite par** : `RadioReveilLogical::RadioReveil::ChaineRadio::Syntoniseur`
- **Vérifiée par** : `ChaineRadioIvvq::TestRejetCanalAdjacent`
