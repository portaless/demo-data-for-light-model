---
generated_by: light-model
generated_at: 2026-07-07T13:05:42+00:00
layer: P
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
