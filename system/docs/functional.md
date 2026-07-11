---
generated_by: light-model
generated_at: 2026-07-11T08:17:08+00:00
layer: F
---

# Couche Functional (F)

23 élément(s).

## MsatFunctional

<!-- lm:id=MsatFunctional -->

`package`

Architecture fonctionnelle : chaîne image et fonctions plateforme.

### ImagingCommand

<!-- lm:id=MsatFunctional::ImagingCommand -->

`item_def`

### RawImage

<!-- lm:id=MsatFunctional::RawImage -->

`item_def`

### CompressedImage

<!-- lm:id=MsatFunctional::CompressedImage -->

`item_def`

### Telemetry

<!-- lm:id=MsatFunctional::Telemetry -->

`item_def`

### PlanAcquisition

<!-- lm:id=MsatFunctional::PlanAcquisition -->

`action_def`

Transformer une demande utilisateur en plan d'acquisition.

- **Alloué à** : `MsatLogical::OnboardComputer`

#### plan

<!-- lm:id=MsatFunctional::PlanAcquisition::plan -->

`item` · type : `ImagingCommand`

### CaptureImage

<!-- lm:id=MsatFunctional::CaptureImage -->

`action_def`

Acquérir une scène avec l'instrument optique.

- **Alloué à** : `MsatLogical::PayloadModule`

#### cmd

<!-- lm:id=MsatFunctional::CaptureImage::cmd -->

`item` · type : `ImagingCommand`

#### raw

<!-- lm:id=MsatFunctional::CaptureImage::raw -->

`item` · type : `RawImage`

### CompressImage

<!-- lm:id=MsatFunctional::CompressImage -->

`action_def`

Compresser l'image brute (CCSDS 122).

- **Alloué à** : `MsatLogical::OnboardComputer`

#### raw

<!-- lm:id=MsatFunctional::CompressImage::raw -->

`item` · type : `RawImage`

#### compressed

<!-- lm:id=MsatFunctional::CompressImage::compressed -->

`item` · type : `CompressedImage`

### StoreImage

<!-- lm:id=MsatFunctional::StoreImage -->

`action_def`

Stocker l'image compressée en mémoire de masse.

- **Alloué à** : `MsatLogical::OnboardComputer`

### TransmitData

<!-- lm:id=MsatFunctional::TransmitData -->

`action_def`

Transmettre images et télémesure vers le sol.

- **Alloué à** : `MsatLogical::CommSubsystem`

### MonitorHealth

<!-- lm:id=MsatFunctional::MonitorHealth -->

`action_def`

Surveiller la santé du satellite et détecter les anomalies.

- **Alloué à** : `MsatLogical::OnboardComputer`

#### tm

<!-- lm:id=MsatFunctional::MonitorHealth::tm -->

`item` · type : `Telemetry`

### MaintainAttitude

<!-- lm:id=MsatFunctional::MaintainAttitude -->

`action_def`

Maintenir le pointage requis pendant l'acquisition.

- **Alloué à** : `MsatLogical::Aocs`

### OperationalModes

<!-- lm:id=MsatFunctional::OperationalModes -->

`state_def`

Modes opérationnels du satellite.

#### standby

<!-- lm:id=MsatFunctional::OperationalModes::standby -->

`state`

#### imaging

<!-- lm:id=MsatFunctional::OperationalModes::imaging -->

`state`

#### downlink

<!-- lm:id=MsatFunctional::OperationalModes::downlink -->

`state`

#### safe

<!-- lm:id=MsatFunctional::OperationalModes::safe -->

`state`
