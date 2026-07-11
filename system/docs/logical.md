---
generated_by: light-model
generated_at: 2026-07-11T09:57:33+00:00
layer: L
---

# Couche Logical (L)

31 élément(s).

## MsatLogical

<!-- lm:id=MsatLogical -->

`package`

Architecture logique : sous-systèmes et interfaces.

### DataBusPort

<!-- lm:id=MsatLogical::DataBusPort -->

`port_def`

### PowerPort

<!-- lm:id=MsatLogical::PowerPort -->

`port_def`

### RfPort

<!-- lm:id=MsatLogical::RfPort -->

`port_def`

### OpticalPort

<!-- lm:id=MsatLogical::OpticalPort -->

`port_def`

### Satellite

<!-- lm:id=MsatLogical::Satellite -->

`part_def`

Système satellite complet.

#### payload

<!-- lm:id=MsatLogical::Satellite::payload -->

`part` · type : `MsatLogical::PayloadModule`

#### obc

<!-- lm:id=MsatLogical::Satellite::obc -->

`part` · type : `OnboardComputer`

#### comm

<!-- lm:id=MsatLogical::Satellite::comm -->

`part` · type : `CommSubsystem`

#### eps

<!-- lm:id=MsatLogical::Satellite::eps -->

`part` · type : `PowerSubsystem`

#### aocs

<!-- lm:id=MsatLogical::Satellite::aocs -->

`part` · type : `Aocs`

### PayloadModule

<!-- lm:id=MsatLogical::PayloadModule -->

`part_def`

Module charge utile : instrument optique et électronique.
Architecturé en étage subsystems/payload-module — la structure
interne ci-dessous est LA source de vérité (aucune copie).

- **Satisfait** : `MsatRequirements::Imaging::DailyImagingCapacity`
- **Alloué à** : `MsatPhysical::CameraAssembly`
- **Alloué depuis** : `MsatFunctional::CaptureImage`

#### data

<!-- lm:id=MsatLogical::PayloadModule::data -->

`port` · type : `DataBusPort`

#### pwr

<!-- lm:id=MsatLogical::PayloadModule::pwr -->

`port` · type : `PowerPort`

#### optics

<!-- lm:id=MsatLogical::PayloadModule::optics -->

`port` · type : `OpticalPort`

#### CameraUnit

<!-- lm:id=MsatLogical::PayloadModule::CameraUnit -->

`part_def`

Tête optique — architecturée à son tour (étage 3) :
clic droit → « Architecturer le sous-système… ».

- **Satisfait** : `PayloadModuleRequirements::PlImageResolution`

#### CompressionBoard

<!-- lm:id=MsatLogical::PayloadModule::CompressionBoard -->

`part_def`

Carte de compression embarquée.

- **Satisfait** : `PayloadModuleRequirements::PlMassBudget`

#### camera

<!-- lm:id=MsatLogical::PayloadModule::camera -->

`part` · type : `CameraUnit`

#### compressor

<!-- lm:id=MsatLogical::PayloadModule::compressor -->

`part` · type : `CompressionBoard`

### CommSubsystem

<!-- lm:id=MsatLogical::CommSubsystem -->

`part_def`

Sous-système de communication bande X.

- **Satisfait** : `MsatRequirements::Imaging::DownlinkBand`
- **Alloué à** : `MsatPhysical::XBandTransmitter`
- **Alloué depuis** : `MsatFunctional::TransmitData`

#### rf

<!-- lm:id=MsatLogical::CommSubsystem::rf -->

`port` · type : `RfPort`

#### bus

<!-- lm:id=MsatLogical::CommSubsystem::bus -->

`port` · type : `DataBusPort`

#### pwr

<!-- lm:id=MsatLogical::CommSubsystem::pwr -->

`port` · type : `PowerPort`

### OnboardComputer

<!-- lm:id=MsatLogical::OnboardComputer -->

`part_def`

Calculateur de bord : gestion mission et données.

- **Satisfait** : `MsatRequirements::Platform::SafeMode`
- **Alloué à** : `MsatPhysical::ObcBoard`
- **Alloué depuis** : `MsatFunctional::PlanAcquisition`, `MsatFunctional::CompressImage`, `MsatFunctional::StoreImage`, `MsatFunctional::MonitorHealth`

#### bus

<!-- lm:id=MsatLogical::OnboardComputer::bus -->

`port` · type : `DataBusPort`

#### pwr

<!-- lm:id=MsatLogical::OnboardComputer::pwr -->

`port` · type : `PowerPort`

### PowerSubsystem

<!-- lm:id=MsatLogical::PowerSubsystem -->

`part_def`

Génération, stockage et distribution d'énergie.

- **Alloué à** : `MsatPhysical::SolarArray`, `MsatPhysical::Battery`

#### pwr

<!-- lm:id=MsatLogical::PowerSubsystem::pwr -->

`port` · type : `PowerPort`

### Aocs

<!-- lm:id=MsatLogical::Aocs -->

`part_def`

Contrôle d'attitude et d'orbite.

- **Satisfait** : `MsatRequirements::Platform::AttitudeAccuracy`
- **Alloué à** : `MsatPhysical::ReactionWheel`, `MsatPhysical::StarTracker`
- **Alloué depuis** : `MsatFunctional::MaintainAttitude`

#### bus

<!-- lm:id=MsatLogical::Aocs::bus -->

`port` · type : `DataBusPort`

#### pwr

<!-- lm:id=MsatLogical::Aocs::pwr -->

`port` · type : `PowerPort`
