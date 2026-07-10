---
generated_by: light-model
generated_at: 2026-07-10T16:05:29+00:00
layer: L
---

# Couche Logical (L)

33 élément(s).

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

- **Vérifiée par** : `MsatRequirements::MissionAvailability::testreq2`
- **Vérifie** : `MsatRequirements::MissionAvailability`

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

### cacahuetes

<!-- lm:id=MsatLogical::cacahuetes -->

`part_def`

test doc

#### lol

<!-- lm:id=MsatLogical::cacahuetes::lol -->

`part` · type : `kisscool`

### Satellite

<!-- lm:id=MsatLogical::Satellite -->

`part_def`

Système satellite complet.

#### payload

<!-- lm:id=MsatLogical::Satellite::payload -->

`part` · type : `PayloadModule`

#### obc

<!-- lm:id=MsatLogical::Satellite::obc -->

`part` · type : `OnboardComputer`

#### comm

<!-- lm:id=MsatLogical::Satellite::comm -->

`part` · type : `CommSubsystem`

#### eps

<!-- lm:id=MsatLogical::Satellite::eps -->

`part` · type : `PowerSubsystem`

#### aocs2

<!-- lm:id=MsatLogical::Satellite::aocs2 -->

`part` · type : `Aocs`

#### test

<!-- lm:id=MsatLogical::Satellite::test -->

`part` · type : `testlog`

### PayloadModule

<!-- lm:id=MsatLogical::PayloadModule -->

`part_def`

Module charge utile : instrument optique et électronique.

#### data

<!-- lm:id=MsatLogical::PayloadModule::data -->

`port` · type : `DataBusPort`

#### pwr

<!-- lm:id=MsatLogical::PayloadModule::pwr -->

`port` · type : `PowerPort`

#### CommSubsystem

<!-- lm:id=MsatLogical::PayloadModule::CommSubsystem -->

`part_def`

Sous-système de communication bande X.

- **Satisfait** : `MsatRequirements::Imaging::DownlinkBand`
- **Alloué à** : `MsatPhysical::XBandTransmitter`
- **Alloué depuis** : `MsatFunctional::TransmitData`

##### rf

<!-- lm:id=MsatLogical::PayloadModule::CommSubsystem::rf -->

`port` · type : `RfPort`

##### bus

<!-- lm:id=MsatLogical::PayloadModule::CommSubsystem::bus -->

`port` · type : `DataBusPort`

##### pwr

<!-- lm:id=MsatLogical::PayloadModule::CommSubsystem::pwr -->

`port` · type : `PowerPort`

##### optics

<!-- lm:id=MsatLogical::PayloadModule::CommSubsystem::optics -->

`port` · type : `OpticalPort`

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

### NewPart1

<!-- lm:id=MsatLogical::NewPart1 -->

`part_def`
