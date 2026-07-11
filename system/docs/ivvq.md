---
generated_by: light-model
generated_at: 2026-07-11T13:18:40+00:00
layer: IVVQ
---

# Couche IVVQ (IVVQ)

8 élément(s).

## RadioReveilIvvq

<!-- lm:id=RadioReveilIvvq -->

`package`

Campagne de vérification du produit RR-100.

### RR-TC-001 — TestPrecisionHorloge

<!-- lm:id=RadioReveilIvvq::TestPrecisionHorloge -->

`verification_def`

Banc 7 jours, comparaison à une référence GPS : dérive/jour.

- **Vérifie** : `RadioReveilRequirements::Fonctions::PrecisionHorloge`

### RR-TC-002 — TestAlarmes

<!-- lm:id=RadioReveilIvvq::TestAlarmes -->

`verification_def`

Programmation des 2 alarmes, vérification du déclenchement à la minute.

- **Vérifie** : `RadioReveilRequirements::Fonctions::AlarmeProgrammable`

### RR-TC-003 — TestSnooze

<!-- lm:id=RadioReveilIvvq::TestSnooze -->

`verification_def`

Trois reports successifs de 9 min chronométrés.

- **Vérifie** : `RadioReveilRequirements::Fonctions::Snooze`

### RR-TC-004 — TestSauvegarde72h

<!-- lm:id=RadioReveilIvvq::TestSauvegarde72h -->

`verification_def`

Débranchement 72 h, vérification heure et alarmes au retour.

- **Vérifie** : `RadioReveilRequirements::Fonctions::SauvegardeHeure`

### RR-TC-005 — MesureConsoVeille

<!-- lm:id=RadioReveilIvvq::MesureConsoVeille -->

`verification_def`

Wattmètre de précision, affichage en mode nuit.

- **Vérifie** : `RadioReveilRequirements::Contraintes::ConsommationVeille`

### RR-TC-006 — TestBandeFm

<!-- lm:id=RadioReveilIvvq::TestBandeFm -->

`verification_def`

Balayage 87.5 - 108 MHz sur générateur HF.

- **Vérifie** : `RadioReveilRequirements::Fonctions::ReceptionFm`

### RR-TC-007 — EssaiSecuriteElectrique

<!-- lm:id=RadioReveilIvvq::EssaiSecuriteElectrique -->

`verification_def`

Essai diélectrique et courant de fuite selon EN 60065.

- **Vérifie** : `RadioReveilRequirements::Contraintes::SecuriteElectrique`
