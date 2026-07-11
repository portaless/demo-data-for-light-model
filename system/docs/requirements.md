---
generated_by: light-model
generated_at: 2026-07-11T12:48:38+00:00
layer: R
---

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
