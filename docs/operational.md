---
generated_by: light-model
generated_at: 2026-07-07T13:05:42+00:00
layer: O
---

# Couche Operational (O)

12 élément(s).

## Operational

<!-- lm:id=Operational -->

`package`

Contexte opérationnel : acteurs et cas d'usage de la mission.

### GroundOperator

<!-- lm:id=Operational::GroundOperator -->

`part_def`

Opérateur du segment sol.

### ImageAnalyst

<!-- lm:id=Operational::ImageAnalyst -->

`part_def`

Analyste exploitant les images livrées.

### AcquireImagery

<!-- lm:id=Operational::AcquireImagery -->

`use_case_def`

Programmer et acquérir des images d'une zone d'intérêt.

#### operator

<!-- lm:id=Operational::AcquireImagery::operator -->

`actor` · type : `GroundOperator`

#### satellite

<!-- lm:id=Operational::AcquireImagery::satellite -->

`subject` · type : `Satellite`

### DownlinkImagery

<!-- lm:id=Operational::DownlinkImagery -->

`use_case_def`

Transmettre les images acquises vers la station sol.

#### operator

<!-- lm:id=Operational::DownlinkImagery::operator -->

`actor` · type : `GroundOperator`

### ExploitImagery

<!-- lm:id=Operational::ExploitImagery -->

`use_case_def`

Analyser et distribuer les produits image.

#### analyst

<!-- lm:id=Operational::ExploitImagery::analyst -->

`actor` · type : `ImageAnalyst`

### RecoverFromAnomaly

<!-- lm:id=Operational::RecoverFromAnomaly -->

`use_case_def`

Ramener le satellite en service après une anomalie.

#### operator

<!-- lm:id=Operational::RecoverFromAnomaly::operator -->

`actor` · type : `GroundOperator`
