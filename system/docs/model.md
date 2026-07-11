---
generated_by: light-model
generated_at: 2026-07-11T08:17:08+00:00
---

# Modèle — document global

# Couche Requirements (R)

15 élément(s).

## MsatRequirements

<!-- lm:id=MsatRequirements -->

`package`

Exigences du mini-satellite d'observation MSAT.

### MSAT-REQ-001 — MissionAvailability

<!-- lm:id=MsatRequirements::MissionAvailability -->

`requirement_def` · spécialise : `ROFLP::StakeholderRequirement`

Le service d'imagerie doit être disponible 95 % du temps
sur une année d'exploitation.

- **Alloué à** : `MsatPhysical::ObcBoard`, `MsatPhysical::XBandTransmitter`

### Imaging

<!-- lm:id=MsatRequirements::Imaging -->

`package`

#### MSAT-REQ-010 — ImageResolution

<!-- lm:id=MsatRequirements::Imaging::ImageResolution -->

`requirement_def` · spécialise : `ROFLP::PerformanceRequirement`

La résolution au sol (GSD) doit être inférieure ou égale
à 3.5 m au nadir.

- **Satisfaite par** : `MsatPhysical::CameraAssembly`
- **Vérifiée par** : `MsatIvvq::VerifyImageResolution`
- **Alloué à** : `MsatPhysical::ReactionWheel`, `MsatPhysical::camera`, `MsatPhysical::StarTracker`

##### gsd

<!-- lm:id=MsatRequirements::Imaging::ImageResolution::gsd -->

`attribute` · type : `Real`

#### MSAT-REQ-011 — DailyImagingCapacity

<!-- lm:id=MsatRequirements::Imaging::DailyImagingCapacity -->

`requirement_def` · spécialise : `ROFLP::FunctionalRequirement`

Le système doit acquérir au moins 40 scènes par jour.

- **Satisfaite par** : `MsatLogical::PayloadModule`
- **Alloué à** : `MsatPhysical::StarTracker`, `MsatPhysical::CameraAssembly`

#### MSAT-REQ-020 — DownlinkBand

<!-- lm:id=MsatRequirements::Imaging::DownlinkBand -->

`requirement_def` · spécialise : `ROFLP::InterfaceRequirement`

La télémesure image doit être transmise en bande X
(8.0 - 8.4 GHz).

- **Satisfaite par** : `MsatLogical::CommSubsystem`
- **Vérifiée par** : `MsatIvvq::VerifyDownlink`
- **Alloué à** : `MsatPhysical::camera`

### Platform

<!-- lm:id=MsatRequirements::Platform -->

`package`

#### MSAT-REQ-030 — TotalMass

<!-- lm:id=MsatRequirements::Platform::TotalMass -->

`requirement_def` · spécialise : `ROFLP::PhysicalRequirement`

La masse totale au lancement ne doit pas dépasser 120 kg.

- **Satisfaite par** : `MsatPhysical::Structure`
- **Vérifiée par** : `MsatIvvq::VerifyMassBudget`
- **Alloué à** : `MsatPhysical::StarTracker`, `MsatPhysical::ReactionWheel`, `MsatPhysical::SolarArray`, `MsatPhysical::Structure`, `MsatPhysical::XBandTransmitter`, `MsatPhysical::ObcBoard`

##### maxMass

<!-- lm:id=MsatRequirements::Platform::TotalMass::maxMass -->

`attribute` · type : `Real`

#### MSAT-REQ-031 — PowerBudget

<!-- lm:id=MsatRequirements::Platform::PowerBudget -->

`requirement_def` · spécialise : `ROFLP::PhysicalRequirement`

La puissance générée en fin de vie doit être supérieure
à 400 W.

- **Satisfaite par** : `MsatPhysical::SolarArray`
- **Vérifiée par** : `MsatIvvq::VerifyPowerBudget`
- **Alloué à** : `MsatPhysical::camera`, `MsatPhysical::wheels`, `MsatPhysical::Battery`, `MsatPhysical::ReactionWheel`

##### minPower

<!-- lm:id=MsatRequirements::Platform::PowerBudget::minPower -->

`attribute` · type : `Real`

#### MSAT-REQ-050 — AttitudeAccuracy

<!-- lm:id=MsatRequirements::Platform::AttitudeAccuracy -->

`requirement_def` · spécialise : `ROFLP::PerformanceRequirement`

La précision de pointage doit être meilleure que 0.05 deg.

- **Satisfaite par** : `MsatLogical::Aocs`
- **Vérifiée par** : `MsatIvvq::VerifyAttitude`
- **Alloué à** : `MsatPhysical::ObcBoard`, `MsatPhysical::CameraAssembly`

#### MSAT-REQ-060 — SafeMode

<!-- lm:id=MsatRequirements::Platform::SafeMode -->

`requirement_def` · spécialise : `ROFLP::FunctionalRequirement`

Le satellite doit rejoindre un mode sûr de façon autonome
sur détection d'anomalie critique.

- **Satisfaite par** : `MsatLogical::OnboardComputer`
- **Vérifiée par** : `MsatIvvq::VerifySafeMode`
- **Alloué à** : `MsatPhysical::Battery`, `MsatPhysical::StarTracker`, `MsatPhysical::Structure`

#### MSAT-REQ-040 — ThermalRange

<!-- lm:id=MsatRequirements::Platform::ThermalRange -->

`requirement_def` · spécialise : `ROFLP::DesignConstraint`

Les équipements doivent fonctionner entre -20 et +50 °C.

- **Satisfaite par** : `MsatPhysical::Structure`
- **Alloué à** : `MsatPhysical::transmitter`, `MsatPhysical::Battery`

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

---

# Couche Physical (P)

29 élément(s).

## MsatPhysical

<!-- lm:id=MsatPhysical -->

`package`

Architecture physique : équipements et budgets.

### CameraAssembly

<!-- lm:id=MsatPhysical::CameraAssembly -->

`part_def`

Ensemble caméra : télescope + plan focal.

- **Satisfait** : `MsatRequirements::Imaging::ImageResolution`
- **Alloué depuis** : `MsatLogical::PayloadModule`, `MsatRequirements::Imaging::DailyImagingCapacity`, `MsatRequirements::Platform::AttitudeAccuracy`

#### mass

<!-- lm:id=MsatPhysical::CameraAssembly::mass -->

`attribute` · type : `Real`

#### power

<!-- lm:id=MsatPhysical::CameraAssembly::power -->

`attribute` · type : `Real`

### ObcBoard

<!-- lm:id=MsatPhysical::ObcBoard -->

`part_def`

Carte calculateur durcie.

- **Alloué depuis** : `MsatLogical::OnboardComputer`, `MsatRequirements::Platform::TotalMass`, `MsatRequirements::Platform::AttitudeAccuracy`, `MsatRequirements::MissionAvailability`

#### mass

<!-- lm:id=MsatPhysical::ObcBoard::mass -->

`attribute` · type : `Real`

#### power

<!-- lm:id=MsatPhysical::ObcBoard::power -->

`attribute` · type : `Real`

### XBandTransmitter

<!-- lm:id=MsatPhysical::XBandTransmitter -->

`part_def`

Émetteur bande X 150 Mbit/s.

- **Alloué depuis** : `MsatLogical::CommSubsystem`, `MsatRequirements::Platform::TotalMass`, `MsatRequirements::MissionAvailability`

#### mass

<!-- lm:id=MsatPhysical::XBandTransmitter::mass -->

`attribute` · type : `Real`

#### power

<!-- lm:id=MsatPhysical::XBandTransmitter::power -->

`attribute` · type : `Real`

### SolarArray

<!-- lm:id=MsatPhysical::SolarArray -->

`part_def`

Générateur solaire déployable.

- **Satisfait** : `MsatRequirements::Platform::PowerBudget`
- **Alloué depuis** : `MsatLogical::PowerSubsystem`, `MsatRequirements::Platform::TotalMass`

#### mass

<!-- lm:id=MsatPhysical::SolarArray::mass -->

`attribute` · type : `Real`

#### power

<!-- lm:id=MsatPhysical::SolarArray::power -->

`attribute` · type : `Real`

### Battery

<!-- lm:id=MsatPhysical::Battery -->

`part_def`

Batterie Li-ion 40 Ah.

- **Alloué depuis** : `MsatLogical::PowerSubsystem`, `MsatRequirements::Platform::SafeMode`, `MsatRequirements::Platform::ThermalRange`, `MsatRequirements::Platform::PowerBudget`

#### mass

<!-- lm:id=MsatPhysical::Battery::mass -->

`attribute` · type : `Real`

### ReactionWheel

<!-- lm:id=MsatPhysical::ReactionWheel -->

`part_def`

Roue à réaction 0.1 Nm.

- **Alloué depuis** : `MsatLogical::Aocs`, `MsatRequirements::Imaging::ImageResolution`, `MsatRequirements::Platform::TotalMass`, `MsatRequirements::Platform::PowerBudget`

#### mass

<!-- lm:id=MsatPhysical::ReactionWheel::mass -->

`attribute` · type : `Real`

### StarTracker

<!-- lm:id=MsatPhysical::StarTracker -->

`part_def`

Senseur stellaire.

- **Alloué depuis** : `MsatLogical::Aocs`, `MsatRequirements::Platform::TotalMass`, `MsatRequirements::Imaging::DailyImagingCapacity`, `MsatRequirements::Imaging::ImageResolution`, `MsatRequirements::Platform::SafeMode`

#### mass

<!-- lm:id=MsatPhysical::StarTracker::mass -->

`attribute` · type : `Real`

### Structure

<!-- lm:id=MsatPhysical::Structure -->

`part_def`

Structure primaire et thermique.

- **Satisfait** : `MsatRequirements::Platform::TotalMass`, `MsatRequirements::Platform::ThermalRange`
- **Alloué depuis** : `MsatRequirements::Platform::TotalMass`, `MsatRequirements::Platform::SafeMode`

#### mass

<!-- lm:id=MsatPhysical::Structure::mass -->

`attribute` · type : `Real`

### camera

<!-- lm:id=MsatPhysical::camera -->

`part` · type : `CameraAssembly`

- **Alloué depuis** : `MsatRequirements::Imaging::ImageResolution`, `MsatRequirements::Imaging::DownlinkBand`, `MsatRequirements::Platform::PowerBudget`

### obcBoard

<!-- lm:id=MsatPhysical::obcBoard -->

`part` · type : `ObcBoard`

### transmitter

<!-- lm:id=MsatPhysical::transmitter -->

`part` · type : `XBandTransmitter`

- **Alloué depuis** : `MsatRequirements::Platform::ThermalRange`

### solarArray

<!-- lm:id=MsatPhysical::solarArray -->

`part` · type : `SolarArray`

### battery

<!-- lm:id=MsatPhysical::battery -->

`part` · type : `Battery`

### wheels

<!-- lm:id=MsatPhysical::wheels -->

`part` · type : `ReactionWheel`

- **Alloué depuis** : `MsatRequirements::Platform::PowerBudget`

### starTracker

<!-- lm:id=MsatPhysical::starTracker -->

`part` · type : `MsatPhysical::StarTracker`

### structure

<!-- lm:id=MsatPhysical::structure -->

`part` · type : `Structure`

---

# Couche IVVQ (IVVQ)

7 élément(s).

## MsatIvvq

<!-- lm:id=MsatIvvq -->

`package`

Campagne de vérification MSAT.

### MSAT-TC-001 — VerifyImageResolution

<!-- lm:id=MsatIvvq::VerifyImageResolution -->

`verification_def`

Mesure de la FTM et du GSD sur banc optique, puis en vol
sur mire géoréférencée.

- **Vérifie** : `MsatRequirements::Imaging::ImageResolution`

### MSAT-TC-002 — VerifyMassBudget

<!-- lm:id=MsatIvvq::VerifyMassBudget -->

`verification_def`

Pesée de l'ensemble intégré, comparaison au budget.

- **Vérifie** : `MsatRequirements::Platform::TotalMass`

### MSAT-TC-003 — VerifyPowerBudget

<!-- lm:id=MsatIvvq::VerifyPowerBudget -->

`verification_def`

Test de génération en simulation solaire fin de vie.

- **Vérifie** : `MsatRequirements::Platform::PowerBudget`

### MSAT-TC-004 — VerifyDownlink

<!-- lm:id=MsatIvvq::VerifyDownlink -->

`verification_def`

Liaison RF de bout en bout avec la station sol.

- **Vérifie** : `MsatRequirements::Imaging::DownlinkBand`

### MSAT-TC-005 — VerifySafeMode

<!-- lm:id=MsatIvvq::VerifySafeMode -->

`verification_def`

Injection d'anomalies et vérification de la transition
autonome en mode sûr.

- **Vérifie** : `MsatRequirements::Platform::SafeMode`

### MSAT-TC-006 — VerifyAttitude

<!-- lm:id=MsatIvvq::VerifyAttitude -->

`verification_def`

Précision de pointage en boucle fermée sur simulateur.

- **Vérifie** : `MsatRequirements::Platform::AttitudeAccuracy`
