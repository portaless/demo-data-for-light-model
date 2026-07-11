---
generated_by: light-model
generated_at: 2026-07-11T08:17:08+00:00
layer: L
---

# Couche Logical (L)

6 élément(s).

## PayloadModuleLogical

<!-- lm:id=PayloadModuleLogical -->

`package`

Analyse logique du sous-système PayloadModule,
dérivée de MsatLogical::PayloadModule.

### PayloadModule

<!-- lm:id=PayloadModuleLogical::PayloadModule -->

`part_def`

#### camera

<!-- lm:id=PayloadModuleLogical::PayloadModule::camera -->

`part` · type : `PayloadModuleLogical::CameraUnit`

#### compressor

<!-- lm:id=PayloadModuleLogical::PayloadModule::compressor -->

`part` · type : `CompressionBoard`

### CameraUnit

<!-- lm:id=PayloadModuleLogical::CameraUnit -->

`part_def`

Tête optique : clic droit dessus → « Dériver en
sous-système… » pour ouvrir le cycle de l'étage 3.

- **Satisfait** : `PayloadModuleRequirements::PlImageResolution`

### CompressionBoard

<!-- lm:id=PayloadModuleLogical::CompressionBoard -->

`part_def`

- **Satisfait** : `PayloadModuleRequirements::PlMassBudget`
