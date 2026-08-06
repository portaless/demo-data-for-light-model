---
generated_by: light-model
generated_at: 2026-08-06T15:08:03+00:00
layer: IVVQ
---

# Couche IVVQ (IVVQ)

3 élément(s).

## BaseDeTempsIvvq

<!-- lm:id=BaseDeTempsIvvq -->

`package`

Recette propre à l'étage base-de-temps.

### BT-TC-001 — TestDerive

<!-- lm:id=BaseDeTempsIvvq::TestDerive -->

`verification_def`

Étuve 0-40 °C, mesure de dérive sur 48 h.

- **Vérifie** : `BaseDeTempsRequirements::BtDerive`

### BT-TC-002 — TestTenueSauvegarde

<!-- lm:id=BaseDeTempsIvvq::TestTenueSauvegarde -->

`verification_def`

Coupure secteur 72 h sur source de secours chargée :
heure conservée à +/- 2 s au retour du secteur.

- **Vérifie** : `BaseDeTempsRequirements::BtTenueSauvegarde`
