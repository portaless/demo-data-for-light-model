---
generated_by: light-model
generated_at: 2026-07-07T13:05:42+00:00
---

# Modèle — document global

# Couche Requirements (R)

17 élément(s).

## Requirements

<!-- lm:id=Requirements -->

`package`

Exigences du mini-satellite d'observation MSAT.

### MSAT-REQ-001 — MissionAvailability

<!-- lm:id=Requirements::MissionAvailability -->

`requirement_def` · spécialise : `ROFLP::StakeholderRequirement`

Le service d'imagerie doit être disponible 95 % du temps
sur une année d'exploitation.

#### testreq

<!-- lm:id=Requirements::MissionAvailability::testreq -->

`requirement` · spécialise : `ROFLP::FunctionalRequirement`

- **Alloué à** : `Physical::SolarArray`

#### testreq2

<!-- lm:id=Requirements::MissionAvailability::testreq2 -->

`requirement` · spécialise : `ROFLP::FunctionalRequirement`

- **Alloué à** : `Physical::CameraAssembly`

### Imaging

<!-- lm:id=Requirements::Imaging -->

`package`

#### MSAT-REQ-010 — ImageResolution

<!-- lm:id=Requirements::Imaging::ImageResolution -->

`requirement_def` · spécialise : `ROFLP::PerformanceRequirement`

La résolution au sol (GSD) doit être inférieure ou égale
à 3.5 m au nadir.

- **Satisfaite par** : `Physical::CameraAssembly`
- **Vérifiée par** : `IVVQ::VerifyImageResolution`
- **Alloué à** : `Physical::ReactionWheel`, `Physical::camera`, `Physical::StarTracker`

##### gsd

<!-- lm:id=Requirements::Imaging::ImageResolution::gsd -->

`attribute` · type : `Real`

#### MSAT-REQ-011 — DailyImagingCapacity

<!-- lm:id=Requirements::Imaging::DailyImagingCapacity -->

`requirement_def` · spécialise : `ROFLP::FunctionalRequirement`

Le système doit acquérir au moins 40 scènes par jour.

- **Satisfaite par** : `Logical::PayloadModule`
- **Alloué à** : `Physical::StarTracker`, `Physical::CameraAssembly`

#### MSAT-REQ-020 — DownlinkBand

<!-- lm:id=Requirements::Imaging::DownlinkBand -->

`requirement_def` · spécialise : `ROFLP::InterfaceRequirement`

La télémesure image doit être transmise en bande X
(8.0 - 8.4 GHz).

- **Satisfaite par** : `Logical::CommSubsystem`
- **Vérifiée par** : `IVVQ::VerifyDownlink`
- **Alloué à** : `Physical::camera`

### Platform

<!-- lm:id=Requirements::Platform -->

`package`

#### MSAT-REQ-030 — TotalMass

<!-- lm:id=Requirements::Platform::TotalMass -->

`requirement_def` · spécialise : `ROFLP::PhysicalRequirement`

La masse totale au lancement ne doit pas dépasser 120 kg.

- **Satisfaite par** : `Physical::Structure`
- **Vérifiée par** : `IVVQ::VerifyMassBudget`
- **Alloué à** : `Physical::StarTracker`, `Physical::StarTracker`, `Physical::StarTracker`, `Physical::ReactionWheel`, `Physical::SolarArray`, `Physical::Structure`, `Physical::XBandTransmitter`, `Physical::ObcBoard`

##### maxMass

<!-- lm:id=Requirements::Platform::TotalMass::maxMass -->

`attribute` · type : `Real`

#### MSAT-REQ-031 — PowerBudget

<!-- lm:id=Requirements::Platform::PowerBudget -->

`requirement_def` · spécialise : `ROFLP::PhysicalRequirement`

La puissance générée en fin de vie doit être supérieure
à 400 W.

- **Satisfaite par** : `Physical::SolarArray`
- **Vérifiée par** : `IVVQ::VerifyPowerBudget`
- **Alloué à** : `Physical::camera`, `Physical::wheels`

##### minPower

<!-- lm:id=Requirements::Platform::PowerBudget::minPower -->

`attribute` · type : `Real`

#### MSAT-REQ-040 — ThermalRange

<!-- lm:id=Requirements::Platform::ThermalRange -->

`requirement_def` · spécialise : `ROFLP::DesignConstraint`

Les équipements doivent fonctionner entre -20 et +50 °C.

- **Satisfaite par** : `Physical::Structure`
- **Alloué à** : `Physical::transmitter`

#### MSAT-REQ-050 — AttitudeAccuracy

<!-- lm:id=Requirements::Platform::AttitudeAccuracy -->

`requirement_def` · spécialise : `ROFLP::PerformanceRequirement`

La précision de pointage doit être meilleure que 0.05 deg.

- **Satisfaite par** : `Logical::Aocs`
- **Vérifiée par** : `IVVQ::VerifyAttitude`
- **Alloué à** : `Physical::ObcBoard`, `Physical::CameraAssembly`

#### MSAT-REQ-060 — SafeMode

<!-- lm:id=Requirements::Platform::SafeMode -->

`requirement_def` · spécialise : `ROFLP::FunctionalRequirement`

Le satellite doit rejoindre un mode sûr de façon autonome
sur détection d'anomalie critique.

- **Satisfaite par** : `Logical::OnboardComputer`
- **Vérifiée par** : `IVVQ::VerifySafeMode`
- **Alloué à** : `Physical::Battery`, `Physical::StarTracker`, `Physical::Structure`

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

---

# Couche Physical (P)

29 élément(s).

## Physical

<!-- lm:id=Physical -->

`package`

Architecture physique : équipements et budgets.

### CameraAssembly

<!-- lm:id=Physical::CameraAssembly -->

`part_def`

Ensemble caméra : télescope + plan focal.

- **Satisfait** : `Requirements::Imaging::ImageResolution`
- **Alloué depuis** : `Logical::PayloadModule`, `Requirements::MissionAvailability::testreq2`, `Requirements::Imaging::DailyImagingCapacity`, `Requirements::Platform::AttitudeAccuracy`

#### mass

<!-- lm:id=Physical::CameraAssembly::mass -->

`attribute` · type : `Real`

#### power

<!-- lm:id=Physical::CameraAssembly::power -->

`attribute` · type : `Real`

### ObcBoard

<!-- lm:id=Physical::ObcBoard -->

`part_def`

Carte calculateur durcie.

- **Alloué depuis** : `Logical::OnboardComputer`, `Requirements::Platform::TotalMass`, `Requirements::Platform::AttitudeAccuracy`

#### mass

<!-- lm:id=Physical::ObcBoard::mass -->

`attribute` · type : `Real`

#### power

<!-- lm:id=Physical::ObcBoard::power -->

`attribute` · type : `Real`

### XBandTransmitter

<!-- lm:id=Physical::XBandTransmitter -->

`part_def`

Émetteur bande X 150 Mbit/s.

- **Alloué depuis** : `Logical::CommSubsystem`, `Requirements::Platform::TotalMass`

#### mass

<!-- lm:id=Physical::XBandTransmitter::mass -->

`attribute` · type : `Real`

#### power

<!-- lm:id=Physical::XBandTransmitter::power -->

`attribute` · type : `Real`

### SolarArray

<!-- lm:id=Physical::SolarArray -->

`part_def`

Générateur solaire déployable.

- **Satisfait** : `Requirements::Platform::PowerBudget`
- **Alloué depuis** : `Logical::PowerSubsystem`, `Requirements::MissionAvailability::testreq`, `Requirements::Platform::TotalMass`

#### mass

<!-- lm:id=Physical::SolarArray::mass -->

`attribute` · type : `Real`

#### power

<!-- lm:id=Physical::SolarArray::power -->

`attribute` · type : `Real`

### Battery

<!-- lm:id=Physical::Battery -->

`part_def`

Batterie Li-ion 40 Ah.

- **Alloué depuis** : `Logical::PowerSubsystem`, `Requirements::Platform::SafeMode`

#### mass

<!-- lm:id=Physical::Battery::mass -->

`attribute` · type : `Real`

### ReactionWheel

<!-- lm:id=Physical::ReactionWheel -->

`part_def`

Roue à réaction 0.1 Nm.

- **Alloué depuis** : `Logical::Aocs`, `Requirements::Imaging::ImageResolution`, `Requirements::Platform::TotalMass`

#### mass

<!-- lm:id=Physical::ReactionWheel::mass -->

`attribute` · type : `Real`

### StarTracker

<!-- lm:id=Physical::StarTracker -->

`part_def`

Senseur stellaire.

- **Alloué depuis** : `Logical::Aocs`, `Requirements::Platform::TotalMass`, `Requirements::Platform::TotalMass`, `Requirements::Platform::TotalMass`, `Requirements::Imaging::DailyImagingCapacity`, `Requirements::Imaging::ImageResolution`, `Requirements::Platform::SafeMode`

#### mass

<!-- lm:id=Physical::StarTracker::mass -->

`attribute` · type : `Real`

### Structure

<!-- lm:id=Physical::Structure -->

`part_def`

Structure primaire et thermique.

- **Satisfait** : `Requirements::Platform::TotalMass`, `Requirements::Platform::ThermalRange`
- **Alloué depuis** : `Requirements::Platform::TotalMass`, `Requirements::Platform::SafeMode`

#### mass

<!-- lm:id=Physical::Structure::mass -->

`attribute` · type : `Real`

### camera

<!-- lm:id=Physical::camera -->

`part` · type : `CameraAssembly`

- **Alloué depuis** : `Requirements::Imaging::ImageResolution`, `Requirements::Imaging::DownlinkBand`, `Requirements::Platform::PowerBudget`

### obcBoard

<!-- lm:id=Physical::obcBoard -->

`part` · type : `ObcBoard`

### transmitter

<!-- lm:id=Physical::transmitter -->

`part` · type : `XBandTransmitter`

- **Alloué depuis** : `Requirements::Platform::ThermalRange`

### solarArray

<!-- lm:id=Physical::solarArray -->

`part` · type : `SolarArray`

### battery

<!-- lm:id=Physical::battery -->

`part` · type : `Battery`

### wheels

<!-- lm:id=Physical::wheels -->

`part` · type : `ReactionWheel`

- **Alloué depuis** : `Requirements::Platform::PowerBudget`

### starTracker

<!-- lm:id=Physical::starTracker -->

`part` · type : `StarTracker`

### structure

<!-- lm:id=Physical::structure -->

`part` · type : `Structure`

---

# Couche IVVQ (IVVQ)

7 élément(s).

## IVVQ

<!-- lm:id=IVVQ -->

`package`

Campagne de vérification MSAT.

### MSAT-TC-001 — VerifyImageResolution

<!-- lm:id=IVVQ::VerifyImageResolution -->

`verification_def`

Mesure de la FTM et du GSD sur banc optique, puis en vol
sur mire géoréférencée.

- **Vérifie** : `Requirements::Imaging::ImageResolution`

### MSAT-TC-002 — VerifyMassBudget

<!-- lm:id=IVVQ::VerifyMassBudget -->

`verification_def`

Pesée de l'ensemble intégré, comparaison au budget.

- **Vérifie** : `Requirements::Platform::TotalMass`

### MSAT-TC-003 — VerifyPowerBudget

<!-- lm:id=IVVQ::VerifyPowerBudget -->

`verification_def`

Test de génération en simulation solaire fin de vie.

- **Vérifie** : `Requirements::Platform::PowerBudget`

### MSAT-TC-004 — VerifyDownlink

<!-- lm:id=IVVQ::VerifyDownlink -->

`verification_def`

Liaison RF de bout en bout avec la station sol.

- **Vérifie** : `Requirements::Imaging::DownlinkBand`

### MSAT-TC-005 — VerifySafeMode

<!-- lm:id=IVVQ::VerifySafeMode -->

`verification_def`

Injection d'anomalies et vérification de la transition
autonome en mode sûr.

- **Vérifie** : `Requirements::Platform::SafeMode`

### MSAT-TC-006 — VerifyAttitude

<!-- lm:id=IVVQ::VerifyAttitude -->

`verification_def`

Précision de pointage en boucle fermée sur simulateur.

- **Vérifie** : `Requirements::Platform::AttitudeAccuracy`
