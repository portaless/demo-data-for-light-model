---
generated_by: light-model
generated_at: 2026-08-06T15:08:03+00:00
layer: IVVQ
---

# Couche IVVQ (IVVQ)

3 élément(s).

## ChaineRadioIvvq

<!-- lm:id=ChaineRadioIvvq -->

`package`

Recette propre à l'étage chaine-radio.

### CR-TC-001 — TestSensibilite

<!-- lm:id=ChaineRadioIvvq::TestSensibilite -->

`verification_def`

Mesure de sensibilité à 2 µV, S/N 26 dB, trois fréquences.

- **Vérifie** : `ChaineRadioRequirements::CrSensibilite`

### CR-TC-002 — TestRejetCanalAdjacent

<!-- lm:id=ChaineRadioIvvq::TestRejetCanalAdjacent -->

`verification_def`

Deux porteuses à +/- 200 kHz, mesure du rejet : > 40 dB.

- **Vérifie** : `ChaineRadioRequirements::CrRejetCanalAdjacent`
