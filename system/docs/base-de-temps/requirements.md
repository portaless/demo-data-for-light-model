---
generated_by: light-model
generated_at: 2026-08-06T15:08:03+00:00
layer: R
---

# Couche Requirements (R)

3 élément(s).

## BaseDeTempsRequirements

<!-- lm:id=BaseDeTempsRequirements -->

`package`

Exigences DÉRIVÉES de l'étage base-de-temps.

### BT-001 — BtDerive

<!-- lm:id=BaseDeTempsRequirements::BtDerive -->

`requirement_def` · spécialise : `ROFLP::PerformanceRequirement`

Dérive de l'oscillateur inférieure à 20 ppm entre 0 et 40 °C.

- **Satisfaite par** : `RadioReveilLogical::RadioReveil::BaseDeTemps::OscillateurReference`
- **Vérifiée par** : `BaseDeTempsIvvq::TestDerive`

### BT-002 — BtTenueSauvegarde

<!-- lm:id=BaseDeTempsRequirements::BtTenueSauvegarde -->

`requirement_def` · spécialise : `ROFLP::PerformanceRequirement`

Le maintien de l'heure sur source de secours doit couvrir 72 h.

- **Satisfaite par** : `RadioReveilLogical::RadioReveil::AlimentationSauvegarde`
- **Vérifiée par** : `BaseDeTempsIvvq::TestTenueSauvegarde`
