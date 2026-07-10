---
generated_by: light-model
generated_at: 2026-07-10T16:05:29+00:00
layer: O
---

# Couche Operational (O)

12 élément(s).

## MsatOperational

<!-- lm:id=MsatOperational -->

`package`

Contexte opérationnel : acteurs et cas d'usage de la mission.

### GroundOperator

<!-- lm:id=MsatOperational::GroundOperator -->

`part_def`

Opérateur du segment sol.

### ImageAnalyst

<!-- lm:id=MsatOperational::ImageAnalyst -->

`part_def`

Analyste exploitant les images livrées.

### AcquireImagery

<!-- lm:id=MsatOperational::AcquireImagery -->

`use_case_def`

Programmer et acquérir des images d'une zone d'intérêt.

#### operator

<!-- lm:id=MsatOperational::AcquireImagery::operator -->

`actor` · type : `GroundOperator`

#### satellite

<!-- lm:id=MsatOperational::AcquireImagery::satellite -->

`subject` · type : `Satellite`

### DownlinkImagery

<!-- lm:id=MsatOperational::DownlinkImagery -->

`use_case_def`

Transmettre les images acquises vers la station sol.

#### operator

<!-- lm:id=MsatOperational::DownlinkImagery::operator -->

`actor` · type : `GroundOperator`

### ExploitImagery

<!-- lm:id=MsatOperational::ExploitImagery -->

`use_case_def`

Analyser et distribuer les produits image.

#### analyst

<!-- lm:id=MsatOperational::ExploitImagery::analyst -->

`actor` · type : `ImageAnalyst`

### RecoverFromAnomaly

<!-- lm:id=MsatOperational::RecoverFromAnomaly -->

`use_case_def`

Ramener le satellite en service après une anomalie.

#### operator

<!-- lm:id=MsatOperational::RecoverFromAnomaly::operator -->

`actor` · type : `GroundOperator`
