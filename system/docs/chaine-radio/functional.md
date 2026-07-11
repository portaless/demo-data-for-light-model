---
generated_by: light-model
generated_at: 2026-07-11T13:18:40+00:00
layer: F
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
