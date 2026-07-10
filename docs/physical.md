---
generated_by: light-model
generated_at: 2026-07-10T15:45:03+00:00
layer: P
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
- **Alloué depuis** : `PayloadModule`, `MsatRequirements::MissionAvailability::testreq2`, `MsatRequirements::Imaging::DailyImagingCapacity`, `MsatRequirements::Platform::AttitudeAccuracy`

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

- **Alloué depuis** : `MsatLogical::PayloadModule::CommSubsystem`, `MsatRequirements::Platform::TotalMass`, `MsatRequirements::MissionAvailability`, `MsatRequirements::MissionAvailability::testreq`

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

- **Alloué depuis** : `MsatLogical::Aocs`, `MsatRequirements::Platform::TotalMass`, `MsatRequirements::Platform::TotalMass`, `MsatRequirements::Platform::TotalMass`, `MsatRequirements::Imaging::DailyImagingCapacity`, `MsatRequirements::Imaging::ImageResolution`, `MsatRequirements::Platform::SafeMode`

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

`part` · type : `StarTracker`

### structure

<!-- lm:id=MsatPhysical::structure -->

`part` · type : `Structure`
