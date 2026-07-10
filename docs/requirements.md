---
generated_by: light-model
generated_at: 2026-07-07T13:05:42+00:00
layer: R
---

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
