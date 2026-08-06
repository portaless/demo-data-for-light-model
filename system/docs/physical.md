---
generated_by: light-model
generated_at: 2026-08-06T15:08:03+00:00
layer: P
---

# Couche Physical (P)

37 élément(s).

## RadioReveilPhysical

<!-- lm:id=RadioReveilPhysical -->

`package`

SOLUTION TECHNIQUE : électronique grand public sur carte unique,
descendue au niveau composant.

### BoitierAbs

<!-- lm:id=RadioReveilPhysical::BoitierAbs -->

`part_def`

Boîtier plastique ABS deux coques, sans vis apparente.

- **Satisfait** : `RadioReveilRequirements::Contraintes::MasseMax`

#### masse

<!-- lm:id=RadioReveilPhysical::BoitierAbs::masse -->

`attribute` · type : `Real`

### CartePrincipale

<!-- lm:id=RadioReveilPhysical::CartePrincipale -->

`part_def`

PCB simple face — toute l'électronique du produit.

- **Satisfait** : `RadioReveilRequirements::Contraintes::ConsommationVeille`

#### masse

<!-- lm:id=RadioReveilPhysical::CartePrincipale::masse -->

`attribute` · type : `Real`

#### MicrocontroleurStm32l0

<!-- lm:id=RadioReveilPhysical::CartePrincipale::MicrocontroleurStm32l0 -->

`part_def`

MCU basse consommation, RTC 32 bits intégrée : tient
l'heure, gère alarmes/snooze, pilote afficheur et module FM.

- **Alloué depuis** : `RadioReveilLogical::RadioReveil::BaseDeTemps`, `RadioReveilLogical::RadioReveil::BaseDeTemps::CompteurTemps`, `RadioReveilLogical::RadioReveil::GestionAlarmes`

##### consoVeille

<!-- lm:id=RadioReveilPhysical::CartePrincipale::MicrocontroleurStm32l0::consoVeille -->

`attribute` · type : `Real`

#### QuartzHorloge32kHz

<!-- lm:id=RadioReveilPhysical::CartePrincipale::QuartzHorloge32kHz -->

`part_def`

Quartz horloger 32 768 Hz ±20 ppm : la référence de temps.

- **Alloué depuis** : `RadioReveilLogical::RadioReveil::BaseDeTemps::OscillateurReference`

#### ModuleFmRda5807

<!-- lm:id=RadioReveilPhysical::CartePrincipale::ModuleFmRda5807 -->

`part_def`

Récepteur FM intégré (syntoniseur + démodulateur), bus I2C.

- **Alloué depuis** : `RadioReveilLogical::RadioReveil::ChaineRadio`, `RadioReveilLogical::RadioReveil::ChaineRadio::Syntoniseur`, `RadioReveilLogical::RadioReveil::ChaineRadio::Demodulateur`

##### consoActive

<!-- lm:id=RadioReveilPhysical::CartePrincipale::ModuleFmRda5807::consoActive -->

`attribute` · type : `Real`

#### AmplificateurPam8403

<!-- lm:id=RadioReveilPhysical::CartePrincipale::AmplificateurPam8403 -->

`part_def`

Ampli audio classe D 2×3 W, volume piloté (croissance).

- **Alloué depuis** : `RadioReveilLogical::RadioReveil::RestitutionSonore`

##### consoActive

<!-- lm:id=RadioReveilPhysical::CartePrincipale::AmplificateurPam8403::consoActive -->

`attribute` · type : `Real`

#### TransformateurSecteur

<!-- lm:id=RadioReveilPhysical::CartePrincipale::TransformateurSecteur -->

`part_def`

Transformateur d'isolement 230 V → 9 V, double isolation.

- **Satisfait** : `RadioReveilRequirements::Contraintes::SecuriteElectrique`, `RadioReveilRequirements::Interfaces::AlimentationSecteur`
- **Alloué depuis** : `RadioReveilLogical::RadioReveil::AlimentationSauvegarde`

##### masse

<!-- lm:id=RadioReveilPhysical::CartePrincipale::TransformateurSecteur::masse -->

`attribute` · type : `Real`

#### PontRedresseur

<!-- lm:id=RadioReveilPhysical::CartePrincipale::PontRedresseur -->

`part_def`

Redressement + filtrage de la tension secondaire.

#### RegulateurBuck5V

<!-- lm:id=RadioReveilPhysical::CartePrincipale::RegulateurBuck5V -->

`part_def`

Conversion 9 V → 5 V à découpage, haut rendement en veille.

- **Alloué depuis** : `RadioReveilLogical::RadioReveil::AlimentationSauvegarde`

#### SupercondensateurSauvegarde

<!-- lm:id=RadioReveilPhysical::CartePrincipale::SupercondensateurSauvegarde -->

`part_def`

1 F sur le domaine RTC : maintient l'heure plus de 72 h.

- **Alloué depuis** : `RadioReveilLogical::RadioReveil::AlimentationSauvegarde`

#### AfficheurLed7Segments

<!-- lm:id=RadioReveilPhysical::CartePrincipale::AfficheurLed7Segments -->

`part_def`

4 digits LED, driver TM1637, 3 niveaux de luminosité.

- **Alloué depuis** : `RadioReveilLogical::RadioReveil::AffichageTemps`

##### consoVeille

<!-- lm:id=RadioReveilPhysical::CartePrincipale::AfficheurLed7Segments::consoVeille -->

`attribute` · type : `Real`

#### mcu

<!-- lm:id=RadioReveilPhysical::CartePrincipale::mcu -->

`part` · type : `MicrocontroleurStm32l0`

#### quartz

<!-- lm:id=RadioReveilPhysical::CartePrincipale::quartz -->

`part` · type : `QuartzHorloge32kHz`

#### moduleFm

<!-- lm:id=RadioReveilPhysical::CartePrincipale::moduleFm -->

`part` · type : `ModuleFmRda5807`

#### ampli

<!-- lm:id=RadioReveilPhysical::CartePrincipale::ampli -->

`part` · type : `AmplificateurPam8403`

#### transfo

<!-- lm:id=RadioReveilPhysical::CartePrincipale::transfo -->

`part` · type : `TransformateurSecteur`

#### redresseur

<!-- lm:id=RadioReveilPhysical::CartePrincipale::redresseur -->

`part` · type : `PontRedresseur`

#### regulateur

<!-- lm:id=RadioReveilPhysical::CartePrincipale::regulateur -->

`part` · type : `RegulateurBuck5V`

#### supercap

<!-- lm:id=RadioReveilPhysical::CartePrincipale::supercap -->

`part` · type : `SupercondensateurSauvegarde`

#### afficheur

<!-- lm:id=RadioReveilPhysical::CartePrincipale::afficheur -->

`part` · type : `AfficheurLed7Segments`

### HautParleur

<!-- lm:id=RadioReveilPhysical::HautParleur -->

`part_def`

Haut-parleur large bande 8 Ω / 2 W.

- **Alloué depuis** : `RadioReveilLogical::RadioReveil::RestitutionSonore`

#### masse

<!-- lm:id=RadioReveilPhysical::HautParleur::masse -->

`attribute` · type : `Real`

### ClavierBoutons

<!-- lm:id=RadioReveilPhysical::ClavierBoutons -->

`part_def`

5 boutons poussoirs dont un grand SNOOZE sur le dessus.

- **Alloué depuis** : `RadioReveilLogical::RadioReveil::InterfaceCommande`

### AntenneFilaire

<!-- lm:id=RadioReveilPhysical::AntenneFilaire -->

`part_def`

Antenne FM filaire 75 cm.

### boitier

<!-- lm:id=RadioReveilPhysical::boitier -->

`part` · type : `BoitierAbs`

### carte

<!-- lm:id=RadioReveilPhysical::carte -->

`part` · type : `CartePrincipale`

### hautParleur

<!-- lm:id=RadioReveilPhysical::hautParleur -->

`part` · type : `HautParleur`

### clavier

<!-- lm:id=RadioReveilPhysical::clavier -->

`part` · type : `ClavierBoutons`

### antenne

<!-- lm:id=RadioReveilPhysical::antenne -->

`part` · type : `AntenneFilaire`
