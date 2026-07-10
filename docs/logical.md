---
generated_by: light-model
generated_at: 2026-07-07T13:05:42+00:00
layer: L
---

# Couche Logical (L)

27 élément(s).

## Logical

<!-- lm:id=Logical -->

`package`

Architecture logique : sous-systèmes et interfaces.

### DataBusPort

<!-- lm:id=Logical::DataBusPort -->

`port_def`

### PowerPort

<!-- lm:id=Logical::PowerPort -->

`port_def`

### RfPort

<!-- lm:id=Logical::RfPort -->

`port_def`

### OpticalPort

<!-- lm:id=Logical::OpticalPort -->

`port_def`

### Satellite

<!-- lm:id=Logical::Satellite -->

`part_def`

Système satellite complet.

#### payload

<!-- lm:id=Logical::Satellite::payload -->

`part` · type : `PayloadModule`

#### obc

<!-- lm:id=Logical::Satellite::obc -->

`part` · type : `OnboardComputer`

#### comm

<!-- lm:id=Logical::Satellite::comm -->

`part` · type : `CommSubsystem`

#### eps

<!-- lm:id=Logical::Satellite::eps -->

`part` · type : `PowerSubsystem`

#### aocs

<!-- lm:id=Logical::Satellite::aocs -->

`part` · type : `Aocs`

### PayloadModule

<!-- lm:id=Logical::PayloadModule -->

`part_def`

Module charge utile : instrument optique et électronique.

- **Satisfait** : `Requirements::Imaging::DailyImagingCapacity`
- **Alloué à** : `Physical::CameraAssembly`
- **Alloué depuis** : `Functional::CaptureImage`

#### data

<!-- lm:id=Logical::PayloadModule::data -->

`port` · type : `DataBusPort`

#### pwr

<!-- lm:id=Logical::PayloadModule::pwr -->

`port` · type : `PowerPort`

#### optics

<!-- lm:id=Logical::PayloadModule::optics -->

`port` · type : `OpticalPort`

### OnboardComputer

<!-- lm:id=Logical::OnboardComputer -->

`part_def`

Calculateur de bord : gestion mission et données.

- **Satisfait** : `Requirements::Platform::SafeMode`
- **Alloué à** : `Physical::ObcBoard`
- **Alloué depuis** : `Functional::PlanAcquisition`, `Functional::CompressImage`, `Functional::StoreImage`, `Functional::MonitorHealth`

#### bus

<!-- lm:id=Logical::OnboardComputer::bus -->

`port` · type : `DataBusPort`

#### pwr

<!-- lm:id=Logical::OnboardComputer::pwr -->

`port` · type : `PowerPort`

### CommSubsystem

<!-- lm:id=Logical::CommSubsystem -->

`part_def`

Sous-système de communication bande X.

- **Satisfait** : `Requirements::Imaging::DownlinkBand`
- **Alloué à** : `Physical::XBandTransmitter`
- **Alloué depuis** : `Functional::TransmitData`

#### rf

<!-- lm:id=Logical::CommSubsystem::rf -->

`port` · type : `RfPort`

#### bus

<!-- lm:id=Logical::CommSubsystem::bus -->

`port` · type : `DataBusPort`

#### pwr

<!-- lm:id=Logical::CommSubsystem::pwr -->

`port` · type : `PowerPort`

### PowerSubsystem

<!-- lm:id=Logical::PowerSubsystem -->

`part_def`

Génération, stockage et distribution d'énergie.

- **Alloué à** : `Physical::SolarArray`, `Physical::Battery`

#### pwr

<!-- lm:id=Logical::PowerSubsystem::pwr -->

`port` · type : `PowerPort`

### Aocs

<!-- lm:id=Logical::Aocs -->

`part_def`

Contrôle d'attitude et d'orbite.

- **Satisfait** : `Requirements::Platform::AttitudeAccuracy`
- **Alloué à** : `Physical::ReactionWheel`, `Physical::StarTracker`
- **Alloué depuis** : `Functional::MaintainAttitude`

#### bus

<!-- lm:id=Logical::Aocs::bus -->

`port` · type : `DataBusPort`

#### pwr

<!-- lm:id=Logical::Aocs::pwr -->

`port` · type : `PowerPort`
