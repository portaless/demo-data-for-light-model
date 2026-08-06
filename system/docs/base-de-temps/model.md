---
generated_by: light-model
generated_at: 2026-08-06T15:08:03+00:00
---

# Sous-système base-de-temps — document global

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

---

# Couche Operational (O)

1 élément(s).

## BaseDeTempsOperational

<!-- lm:id=BaseDeTempsOperational -->

`package`

Couche Operational de l'étage base-de-temps.

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

---

# Couche Logical (L)

2 élément(s).

## BaseDeTempsLogical

<!-- lm:id=BaseDeTempsLogical -->

`package`

Étage base-de-temps, ancré sur le sous-système logique BaseDeTemps.

### root

<!-- lm:id=BaseDeTempsLogical::root -->

`part` · type : `RadioReveilLogical::RadioReveil::BaseDeTemps`

---

# Couche Physical (P)

1 élément(s).

## BaseDeTempsPhysical

<!-- lm:id=BaseDeTempsPhysical -->

`package`

Couche Physical de l'étage base-de-temps (quartz + RTC du MCU).

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
