---
generated_by: light-model
generated_at: 2026-07-11T13:18:39+00:00
layer: O
---

# Couche Operational (O)

14 élément(s).

## RadioReveilOperational

<!-- lm:id=RadioReveilOperational -->

`package`

Contexte opérationnel : qui utilise le radio-réveil et pour quoi.

### Dormeur

<!-- lm:id=RadioReveilOperational::Dormeur -->

`part_def`

L'utilisateur principal : programme, dort, est réveillé.

### ReseauElectrique

<!-- lm:id=RadioReveilOperational::ReseauElectrique -->

`part_def`

Le secteur domestique — disponible... sauf la nuit de l'examen.

### EtreReveille

<!-- lm:id=RadioReveilOperational::EtreReveille -->

`use_case_def`

Être tiré du sommeil à l'heure programmée, volume croissant.

#### dormeur

<!-- lm:id=RadioReveilOperational::EtreReveille::dormeur -->

`actor` · type : `Dormeur`

#### radioReveil

<!-- lm:id=RadioReveilOperational::EtreReveille::radioReveil -->

`subject` · type : `RadioReveil`

### ProgrammerAlarme

<!-- lm:id=RadioReveilOperational::ProgrammerAlarme -->

`use_case_def`

Régler l'heure de réveil et activer/désactiver les alarmes.

#### dormeur

<!-- lm:id=RadioReveilOperational::ProgrammerAlarme::dormeur -->

`actor` · type : `Dormeur`

### Snoozer

<!-- lm:id=RadioReveilOperational::Snoozer -->

`use_case_def`

Reporter l'alarme de 9 minutes d'un seul geste, sans ouvrir les yeux.

#### dormeur

<!-- lm:id=RadioReveilOperational::Snoozer::dormeur -->

`actor` · type : `Dormeur`

### EcouterRadio

<!-- lm:id=RadioReveilOperational::EcouterRadio -->

`use_case_def`

Écouter un programme FM, notamment pour s'endormir (minuterie).

#### dormeur

<!-- lm:id=RadioReveilOperational::EcouterRadio::dormeur -->

`actor` · type : `Dormeur`

### SurvivreCoupure

<!-- lm:id=RadioReveilOperational::SurvivreCoupure -->

`use_case_def`

Conserver heure et alarmes pendant une coupure secteur.

#### reseau

<!-- lm:id=RadioReveilOperational::SurvivreCoupure::reseau -->

`actor` · type : `ReseauElectrique`
