---
generated_by: light-model
generated_at: 2026-07-11T08:17:08+00:00
layer: L
---

# Couche Logical (L)

42 élément(s).

## MsatComponents

<!-- lm:id=MsatComponents -->

`package`

### OpticalCamera

<!-- lm:id=MsatComponents::OpticalCamera -->

`part_def`

### ImageCompressor

<!-- lm:id=MsatComponents::ImageCompressor -->

`part_def`

### StarTracker

<!-- lm:id=MsatComponents::StarTracker -->

`part_def`

### BatteryPack

<!-- lm:id=MsatComponents::BatteryPack -->

`part_def`

### SpareAntenna

<!-- lm:id=MsatComponents::SpareAntenna -->

`part_def`

Tagué component par son chemin, mais ne raffine rien :
attendu dans « Non rattachés (aucune relation refine) ».

## MsatSubsystems

<!-- lm:id=MsatSubsystems -->

`package`

### ImagingPayload

<!-- lm:id=MsatSubsystems::ImagingPayload -->

`part_def`

Chaîne image : capteur, compression, stockage.

### SatellitePlatform

<!-- lm:id=MsatSubsystems::SatellitePlatform -->

`part_def`

Plateforme : énergie, attitude, calculateur.

### MissionControl

<!-- lm:id=MsatSubsystems::MissionControl -->

`part_def`

Centre de contrôle mission.

## MsatSystem

<!-- lm:id=MsatSystem -->

`package`

Vue système de la mission MSAT : le satellite d'observation et
son segment sol, à raffiner par les sous-systèmes.

### ObservationSatellite

<!-- lm:id=MsatSystem::ObservationSatellite -->

`part_def`

Le satellite d'observation vu comme une boîte noire mission.

### GroundSegment

<!-- lm:id=MsatSystem::GroundSegment -->

`part_def`

Le segment sol vu du niveau mission.

## DecompositionExtras

<!-- lm:id=DecompositionExtras -->

`package`

### ThermalSensor

<!-- lm:id=DecompositionExtras::ThermalSensor -->

`part_def`

Tagué component par METADATA (pas par le chemin) ;
raffine la plateforme comme les autres composants.

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
