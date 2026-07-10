---
generated_by: light-model
generated_at: 2026-07-07T13:05:42+00:00
layer: IVVQ
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
