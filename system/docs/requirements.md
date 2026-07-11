---
generated_by: light-model
generated_at: 2026-07-11T13:18:39+00:00
layer: R
---

# Couche Requirements (R)

21 élément(s).

## RadioReveilRequirements

<!-- lm:id=RadioReveilRequirements -->

`package`

Exigences du radio-réveil grand public RR-100.

### RR-001 — ReveilFiable

<!-- lm:id=RadioReveilRequirements::ReveilFiable -->

`requirement_def` · spécialise : `ROFLP::StakeholderRequirement`

L'utilisateur doit être réveillé à l'heure programmée,
chaque jour, y compris après une coupure secteur nocturne.

- **Satisfaite par** : `RadioReveilLogical::RadioReveil`

### Fonctions

<!-- lm:id=RadioReveilRequirements::Fonctions -->

`package`

#### RR-010 — AffichageHeure

<!-- lm:id=RadioReveilRequirements::Fonctions::AffichageHeure -->

`requirement_def` · spécialise : `ROFLP::FunctionalRequirement`

L'heure courante doit être visible en permanence et
lisible à 3 m dans l'obscurité.

- **Satisfaite par** : `RadioReveilLogical::RadioReveil::AffichageTemps`

#### RR-011 — PrecisionHorloge

<!-- lm:id=RadioReveilRequirements::Fonctions::PrecisionHorloge -->

`requirement_def` · spécialise : `ROFLP::PerformanceRequirement`

La dérive de l'heure doit rester inférieure ou égale à
2 secondes par jour.

- **Satisfaite par** : `RadioReveilLogical::RadioReveil::BaseDeTemps`
- **Vérifiée par** : `RadioReveilIvvq::TestPrecisionHorloge`

##### deriveMaxSecondesParJour

<!-- lm:id=RadioReveilRequirements::Fonctions::PrecisionHorloge::deriveMaxSecondesParJour -->

`attribute` · type : `Real`

#### RR-012 — AlarmeProgrammable

<!-- lm:id=RadioReveilRequirements::Fonctions::AlarmeProgrammable -->

`requirement_def` · spécialise : `ROFLP::FunctionalRequirement`

Deux alarmes indépendantes doivent être programmables
à la minute près.

- **Satisfaite par** : `RadioReveilLogical::RadioReveil::GestionAlarmes`
- **Vérifiée par** : `RadioReveilIvvq::TestAlarmes`

#### RR-013 — Snooze

<!-- lm:id=RadioReveilRequirements::Fonctions::Snooze -->

`requirement_def` · spécialise : `ROFLP::FunctionalRequirement`

Un appui unique doit reporter l'alarme de 9 minutes,
répétable sans limite.

- **Satisfaite par** : `RadioReveilLogical::RadioReveil::InterfaceCommande`
- **Vérifiée par** : `RadioReveilIvvq::TestSnooze`

#### RR-014 — ReceptionFm

<!-- lm:id=RadioReveilRequirements::Fonctions::ReceptionFm -->

`requirement_def` · spécialise : `ROFLP::FunctionalRequirement`

Le récepteur doit couvrir la bande FM 87.5 - 108 MHz.

- **Satisfaite par** : `RadioReveilLogical::RadioReveil::ChaineRadio`
- **Vérifiée par** : `RadioReveilIvvq::TestBandeFm`

#### RR-015 — VolumeCroissant

<!-- lm:id=RadioReveilRequirements::Fonctions::VolumeCroissant -->

`requirement_def` · spécialise : `ROFLP::FunctionalRequirement`

Le volume de l'alarme doit croître progressivement
pendant 30 s (réveil non agressif).

#### RR-016 — SauvegardeHeure

<!-- lm:id=RadioReveilRequirements::Fonctions::SauvegardeHeure -->

`requirement_def` · spécialise : `ROFLP::FunctionalRequirement`

L'heure et les alarmes doivent survivre à une coupure
secteur d'au moins 72 h.

- **Satisfaite par** : `RadioReveilLogical::RadioReveil::AlimentationSauvegarde`
- **Vérifiée par** : `RadioReveilIvvq::TestSauvegarde72h`

##### autonomieHeures

<!-- lm:id=RadioReveilRequirements::Fonctions::SauvegardeHeure::autonomieHeures -->

`attribute` · type : `Real`

### Interfaces

<!-- lm:id=RadioReveilRequirements::Interfaces -->

`package`

#### RR-020 — AlimentationSecteur

<!-- lm:id=RadioReveilRequirements::Interfaces::AlimentationSecteur -->

`requirement_def` · spécialise : `ROFLP::InterfaceRequirement`

L'appareil doit fonctionner sur secteur 230 V / 50 Hz
(prise domestique standard).

- **Satisfaite par** : `RadioReveilPhysical::CartePrincipale::TransformateurSecteur`

#### RR-021 — LuminositeReglable

<!-- lm:id=RadioReveilRequirements::Interfaces::LuminositeReglable -->

`requirement_def` · spécialise : `ROFLP::InterfaceRequirement`

La luminosité de l'affichage doit offrir 3 niveaux dont
un mode nuit.

- **Satisfaite par** : `RadioReveilLogical::RadioReveil::AffichageTemps`

### Contraintes

<!-- lm:id=RadioReveilRequirements::Contraintes -->

`package`

#### RR-030 — ConsommationVeille

<!-- lm:id=RadioReveilRequirements::Contraintes::ConsommationVeille -->

`requirement_def` · spécialise : `ROFLP::PhysicalRequirement`

La consommation en veille (affichage seul) doit être
inférieure ou égale à 1 W.

- **Satisfaite par** : `RadioReveilPhysical::CartePrincipale`
- **Vérifiée par** : `RadioReveilIvvq::MesureConsoVeille`

##### consoMaxWatts

<!-- lm:id=RadioReveilRequirements::Contraintes::ConsommationVeille::consoMaxWatts -->

`attribute` · type : `Real`

#### RR-031 — SecuriteElectrique

<!-- lm:id=RadioReveilRequirements::Contraintes::SecuriteElectrique -->

`requirement_def` · spécialise : `ROFLP::PhysicalRequirement`

L'isolation secteur doit satisfaire l'EN 60065
(double isolation, pas de partie métallique accessible).

- **Satisfaite par** : `RadioReveilPhysical::CartePrincipale::TransformateurSecteur`
- **Vérifiée par** : `RadioReveilIvvq::EssaiSecuriteElectrique`

#### RR-032 — MasseMax

<!-- lm:id=RadioReveilRequirements::Contraintes::MasseMax -->

`requirement_def` · spécialise : `ROFLP::PhysicalRequirement`

La masse totale ne doit pas dépasser 0.5 kg.

- **Satisfaite par** : `RadioReveilPhysical::BoitierAbs`

##### masseMaxKg

<!-- lm:id=RadioReveilRequirements::Contraintes::MasseMax::masseMaxKg -->

`attribute` · type : `Real`
