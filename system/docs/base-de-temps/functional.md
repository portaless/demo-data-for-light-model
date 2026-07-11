---
generated_by: light-model
generated_at: 2026-07-11T13:18:40+00:00
layer: F
---

# Couche Functional (F)

3 élément(s).

## BaseDeTempsFunctional

<!-- lm:id=BaseDeTempsFunctional -->

`package`

Fonctions propres à l'étage base-de-temps.

### CompenserDerive

<!-- lm:id=BaseDeTempsFunctional::CompenserDerive -->

`action_def`

Corriger la dérive thermique de l'oscillateur.

- **Alloué à** : `RadioReveilLogical::RadioReveil::BaseDeTemps::OscillateurReference`

### BasculerSurSecours

<!-- lm:id=BaseDeTempsFunctional::BasculerSurSecours -->

`action_def`

Détecter la coupure secteur et basculer la source d'énergie.

- **Alloué à** : `RadioReveilLogical::RadioReveil::AlimentationSauvegarde`
