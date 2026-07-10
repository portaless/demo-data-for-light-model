---
generated_by: light-model
generated_at: 2026-07-07T13:05:42+00:00
layer: F
---

# Couche Functional (F)

23 élément(s).

## Functional

<!-- lm:id=Functional -->

`package`

Architecture fonctionnelle : chaîne image et fonctions plateforme.

### ImagingCommand

<!-- lm:id=Functional::ImagingCommand -->

`item_def`

### RawImage

<!-- lm:id=Functional::RawImage -->

`item_def`

### CompressedImage

<!-- lm:id=Functional::CompressedImage -->

`item_def`

### Telemetry

<!-- lm:id=Functional::Telemetry -->

`item_def`

### PlanAcquisition

<!-- lm:id=Functional::PlanAcquisition -->

`action_def`

Transformer une demande utilisateur en plan d'acquisition.

- **Alloué à** : `Logical::OnboardComputer`

#### plan

<!-- lm:id=Functional::PlanAcquisition::plan -->

`item` · type : `ImagingCommand`

### CaptureImage

<!-- lm:id=Functional::CaptureImage -->

`action_def`

Acquérir une scène avec l'instrument optique.

- **Alloué à** : `Logical::PayloadModule`

#### cmd

<!-- lm:id=Functional::CaptureImage::cmd -->

`item` · type : `ImagingCommand`

#### raw

<!-- lm:id=Functional::CaptureImage::raw -->

`item` · type : `RawImage`

### CompressImage

<!-- lm:id=Functional::CompressImage -->

`action_def`

Compresser l'image brute (CCSDS 122).

- **Alloué à** : `Logical::OnboardComputer`

#### raw

<!-- lm:id=Functional::CompressImage::raw -->

`item` · type : `RawImage`

#### compressed

<!-- lm:id=Functional::CompressImage::compressed -->

`item` · type : `CompressedImage`

### StoreImage

<!-- lm:id=Functional::StoreImage -->

`action_def`

Stocker l'image compressée en mémoire de masse.

- **Alloué à** : `Logical::OnboardComputer`

### TransmitData

<!-- lm:id=Functional::TransmitData -->

`action_def`

Transmettre images et télémesure vers le sol.

- **Alloué à** : `Logical::CommSubsystem`

### MonitorHealth

<!-- lm:id=Functional::MonitorHealth -->

`action_def`

Surveiller la santé du satellite et détecter les anomalies.

- **Alloué à** : `Logical::OnboardComputer`

#### tm

<!-- lm:id=Functional::MonitorHealth::tm -->

`item` · type : `Telemetry`

### MaintainAttitude

<!-- lm:id=Functional::MaintainAttitude -->

`action_def`

Maintenir le pointage requis pendant l'acquisition.

- **Alloué à** : `Logical::Aocs`

### OperationalModes

<!-- lm:id=Functional::OperationalModes -->

`state_def`

Modes opérationnels du satellite.

#### standby

<!-- lm:id=Functional::OperationalModes::standby -->

`state`

#### imaging

<!-- lm:id=Functional::OperationalModes::imaging -->

`state`

#### downlink

<!-- lm:id=Functional::OperationalModes::downlink -->

`state`

#### safe

<!-- lm:id=Functional::OperationalModes::safe -->

`state`
