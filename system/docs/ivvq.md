---
generated_by: light-model
generated_at: 2026-07-11T12:48:38+00:00
layer: IVVQ
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
