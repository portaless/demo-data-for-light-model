---
generated_by: light-model
generated_at: 2026-08-06T15:08:03+00:00
layer: IVVQ
---

# Couche IVVQ (IVVQ)

13 élément(s).

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

### RR-TC-008 — EssaiReveilBoutEnBout

<!-- lm:id=RadioReveilIvvq::EssaiReveilBoutEnBout -->

`verification_def`

Scénario complet : programmation la veille, coupure secteur
nocturne de 2 h, réveil sonore à l'heure programmée au matin.

- **Vérifie** : `RadioReveilRequirements::ReveilFiable`

### RR-TC-009 — ControleAffichage

<!-- lm:id=RadioReveilIvvq::ControleAffichage -->

`verification_def`

Lecture de l'heure à 3 m dans l'obscurité, contrôle des
3 niveaux de luminosité et du mode nuit.

- **Vérifie** : `RadioReveilRequirements::Fonctions::AffichageHeure`, `RadioReveilRequirements::Interfaces::LuminositeReglable`

### RR-TC-010 — TestVolumeCroissant

<!-- lm:id=RadioReveilIvvq::TestVolumeCroissant -->

`verification_def`

Sonomètre : croissance monotone du niveau sonore sur 30 s
au déclenchement de l'alarme.

- **Vérifie** : `RadioReveilRequirements::Fonctions::VolumeCroissant`

### RR-TC-011 — EssaiAlimentationSecteur

<!-- lm:id=RadioReveilIvvq::EssaiAlimentationSecteur -->

`verification_def`

Fonctionnement nominal sous 230 V / 50 Hz, tenue aux
variations +/- 10 % sur alimentation stabilisée.

- **Vérifie** : `RadioReveilRequirements::Interfaces::AlimentationSecteur`

### RR-TC-012 — PeseeProduit

<!-- lm:id=RadioReveilIvvq::PeseeProduit -->

`verification_def`

Pesée du produit complet emballé hors notice : <= 0.5 kg.

- **Vérifie** : `RadioReveilRequirements::Contraintes::MasseMax`
