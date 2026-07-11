---
generated_by: light-model
generated_at: 2026-07-11T13:18:40+00:00
---

# Sous-système chaine-radio — document global

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

---

# Couche Operational (O)

1 élément(s).

## ChaineRadioOperational

<!-- lm:id=ChaineRadioOperational -->

`package`

Couche Operational de l'étage chaine-radio.

---

# Couche Functional (F)

4 élément(s).

## ChaineRadioFunctional

<!-- lm:id=ChaineRadioFunctional -->

`package`

Fonctions propres à l'étage chaine-radio.

### CapterRf

<!-- lm:id=ChaineRadioFunctional::CapterRf -->

`action_def`

Capter le champ électromagnétique de la bande FM.

- **Alloué à** : `RadioReveilLogical::RadioReveil::ChaineRadio::Syntoniseur`

### Syntoniser

<!-- lm:id=ChaineRadioFunctional::Syntoniser -->

`action_def`

Sélectionner la porteuse de la station choisie.

- **Alloué à** : `RadioReveilLogical::RadioReveil::ChaineRadio::Syntoniseur`

### Demoduler

<!-- lm:id=ChaineRadioFunctional::Demoduler -->

`action_def`

Extraire le signal audio de la porteuse FM.

- **Alloué à** : `RadioReveilLogical::RadioReveil::ChaineRadio::Demodulateur`

---

# Couche Logical (L)

2 élément(s).

## ChaineRadioLogical

<!-- lm:id=ChaineRadioLogical -->

`package`

Étage chaine-radio, ancré sur le sous-système logique ChaineRadio —
la structure vit au niveau parent, ce package porte l'ancre et les
liens propres à l'étage.

### root

<!-- lm:id=ChaineRadioLogical::root -->

`part` · type : `RadioReveilLogical::RadioReveil::ChaineRadio`

---

# Couche Physical (P)

1 élément(s).

## ChaineRadioPhysical

<!-- lm:id=ChaineRadioPhysical -->

`package`

Couche Physical de l'étage chaine-radio : la solution retenue
(module intégré RDA5807) est tracée par les allocations.

---

# Couche IVVQ (IVVQ)

2 élément(s).

## ChaineRadioIvvq

<!-- lm:id=ChaineRadioIvvq -->

`package`

Recette propre à l'étage chaine-radio.

### CR-TC-001 — TestSensibilite

<!-- lm:id=ChaineRadioIvvq::TestSensibilite -->

`verification_def`

Mesure de sensibilité à 2 µV, S/N 26 dB, trois fréquences.

- **Vérifie** : `ChaineRadioRequirements::CrSensibilite`
