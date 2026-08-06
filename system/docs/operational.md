---
generated_by: light-model
generated_at: 2026-08-06T15:08:03+00:00
layer: O
---

# Couche Operational (O)

18 élément(s).

## RadioReveilOperational

<!-- lm:id=RadioReveilOperational -->

`package`

Contexte opérationnel : qui utilise le radio-réveil et pour quoi.

### EtreReveille

<!-- lm:id=RadioReveilOperational::EtreReveille -->

`use_case_def`

Être tiré du sommeil à l'heure programmée, volume croissant.

#### dormeur

<!-- lm:id=RadioReveilOperational::EtreReveille::dormeur -->

`actor` · type : `Dormeur`

#### radioReveil

<!-- lm:id=RadioReveilOperational::EtreReveille::radioReveil -->

`subject` · type : `RadioReveilLogical::RadioReveil`

### ProgrammerAlarme

<!-- lm:id=RadioReveilOperational::ProgrammerAlarme -->

`use_case_def`

Régler l'heure de réveil et activer/désactiver les alarmes.

#### dormeur

<!-- lm:id=RadioReveilOperational::ProgrammerAlarme::dormeur -->

`actor` · type : `Dormeur`

#### radioReveil

<!-- lm:id=RadioReveilOperational::ProgrammerAlarme::radioReveil -->

`subject` · type : `RadioReveilLogical::RadioReveil`

### Snoozer

<!-- lm:id=RadioReveilOperational::Snoozer -->

`use_case_def`

Reporter l'alarme de 9 minutes d'un seul geste, sans ouvrir les yeux.

#### dormeur

<!-- lm:id=RadioReveilOperational::Snoozer::dormeur -->

`actor` · type : `Dormeur`

#### radioReveil

<!-- lm:id=RadioReveilOperational::Snoozer::radioReveil -->

`subject` · type : `RadioReveilLogical::RadioReveil`

### EcouterRadio

<!-- lm:id=RadioReveilOperational::EcouterRadio -->

`use_case_def`

Écouter un programme FM, notamment pour s'endormir (minuterie).

#### dormeur

<!-- lm:id=RadioReveilOperational::EcouterRadio::dormeur -->

`actor` · type : `Dormeur`

#### radioReveil

<!-- lm:id=RadioReveilOperational::EcouterRadio::radioReveil -->

`subject` · type : `RadioReveilLogical::RadioReveil`

### SurvivreCoupure

<!-- lm:id=RadioReveilOperational::SurvivreCoupure -->

`use_case_def`

Conserver heure et alarmes pendant une coupure secteur.

#### reseau

<!-- lm:id=RadioReveilOperational::SurvivreCoupure::reseau -->

`actor` · type : `ReseauElectrique`

#### radioReveil

<!-- lm:id=RadioReveilOperational::SurvivreCoupure::radioReveil -->

`subject` · type : `RadioReveilLogical::RadioReveil`

### Dormeur

<!-- lm:id=RadioReveilOperational::Dormeur -->

`part_def`

L'utilisateur du radio-réveil : il programme, dort, se
réveille — et snooze. L'acteur principal de tous les cas.

### ReseauElectrique

<!-- lm:id=RadioReveilOperational::ReseauElectrique -->

`part_def`

Le secteur domestique — disponible... sauf la nuit de l'examen.
