---
generated_by: light-model
generated_at: 2026-07-11T13:18:40+00:00
layer: L
---

# Couche Logical (L)

47 élément(s).

## RadioReveilLogical

<!-- lm:id=RadioReveilLogical -->

`package`

Architecture LOGIQUE : le système SANS solution technique —
des responsabilités et des interfaces, aucun choix de composant.

### TempsPort

<!-- lm:id=RadioReveilLogical::TempsPort -->

`port_def`

### AudioPort

<!-- lm:id=RadioReveilLogical::AudioPort -->

`port_def`

### EnergiePort

<!-- lm:id=RadioReveilLogical::EnergiePort -->

`port_def`

### CommandePort

<!-- lm:id=RadioReveilLogical::CommandePort -->

`port_def`

### RfPort

<!-- lm:id=RadioReveilLogical::RfPort -->

`port_def`

### RadioReveil

<!-- lm:id=RadioReveilLogical::RadioReveil -->

`part_def`

Le radio-réveil vu comme un assemblage de sous-systèmes
logiques. Chaque part def interne est candidate à
« Architecturer le sous-système ».

- **Satisfait** : `RadioReveilRequirements::ReveilFiable`

#### BaseDeTemps

<!-- lm:id=RadioReveilLogical::RadioReveil::BaseDeTemps -->

`part_def`

Entretient l'heure courante et fournit la référence de
temps. Aucun choix technologique ici : quartz, résonateur
ou radio-pilotage appartiennent à la couche physique.

- **Satisfait** : `RadioReveilRequirements::Fonctions::PrecisionHorloge`
- **Alloué à** : `RadioReveilPhysical::CartePrincipale::MicrocontroleurStm32l0`

##### energie

<!-- lm:id=RadioReveilLogical::RadioReveil::BaseDeTemps::energie -->

`port` · type : `EnergiePort`

##### temps

<!-- lm:id=RadioReveilLogical::RadioReveil::BaseDeTemps::temps -->

`port` · type : `TempsPort`

##### OscillateurReference

<!-- lm:id=RadioReveilLogical::RadioReveil::BaseDeTemps::OscillateurReference -->

`part_def`

Source de cadence stable, précision à charge de l'étage.

- **Satisfait** : `BaseDeTempsRequirements::BtDerive`
- **Alloué à** : `RadioReveilPhysical::CartePrincipale::QuartzHorloge32kHz`
- **Alloué depuis** : `RadioReveilFunctional::GenererBaseDeTemps`, `BaseDeTempsFunctional::CompenserDerive`

##### CompteurTemps

<!-- lm:id=RadioReveilLogical::RadioReveil::BaseDeTemps::CompteurTemps -->

`part_def`

Accumule les tops en heure/minute/seconde.

- **Alloué à** : `RadioReveilPhysical::CartePrincipale::MicrocontroleurStm32l0`
- **Alloué depuis** : `RadioReveilFunctional::MaintenirHeure`

##### oscillateur

<!-- lm:id=RadioReveilLogical::RadioReveil::BaseDeTemps::oscillateur -->

`part` · type : `OscillateurReference`

##### compteur

<!-- lm:id=RadioReveilLogical::RadioReveil::BaseDeTemps::compteur -->

`part` · type : `CompteurTemps`

#### GestionAlarmes

<!-- lm:id=RadioReveilLogical::RadioReveil::GestionAlarmes -->

`part_def`

Compare l'heure aux consignes, déclenche et gère le
report (snooze). Deux consignes indépendantes.

- **Satisfait** : `RadioReveilRequirements::Fonctions::AlarmeProgrammable`
- **Alloué à** : `RadioReveilPhysical::CartePrincipale::MicrocontroleurStm32l0`
- **Alloué depuis** : `RadioReveilFunctional::SurveillerAlarme`, `RadioReveilFunctional::GenererSonAlarme`

##### temps

<!-- lm:id=RadioReveilLogical::RadioReveil::GestionAlarmes::temps -->

`port` · type : `TempsPort`

##### declenche

<!-- lm:id=RadioReveilLogical::RadioReveil::GestionAlarmes::declenche -->

`port` · type : `CommandePort`

##### energie

<!-- lm:id=RadioReveilLogical::RadioReveil::GestionAlarmes::energie -->

`port` · type : `EnergiePort`

#### ChaineRadio

<!-- lm:id=RadioReveilLogical::RadioReveil::ChaineRadio -->

`part_def`

Capte la bande FM et restitue un signal audio — sans
préjuger de la solution (module intégré, discret, SDR…).

- **Satisfait** : `RadioReveilRequirements::Fonctions::ReceptionFm`
- **Alloué à** : `RadioReveilPhysical::CartePrincipale::ModuleFmRda5807`
- **Alloué depuis** : `RadioReveilFunctional::RecevoirFm`

##### rf

<!-- lm:id=RadioReveilLogical::RadioReveil::ChaineRadio::rf -->

`port` · type : `RfPort`

##### audio

<!-- lm:id=RadioReveilLogical::RadioReveil::ChaineRadio::audio -->

`port` · type : `AudioPort`

##### energie

<!-- lm:id=RadioReveilLogical::RadioReveil::ChaineRadio::energie -->

`port` · type : `EnergiePort`

##### Syntoniseur

<!-- lm:id=RadioReveilLogical::RadioReveil::ChaineRadio::Syntoniseur -->

`part_def`

Sélectionne la station : filtrage et accord.

- **Satisfait** : `ChaineRadioRequirements::CrSensibilite`, `ChaineRadioRequirements::CrRejetCanalAdjacent`
- **Alloué à** : `RadioReveilPhysical::CartePrincipale::ModuleFmRda5807`
- **Alloué depuis** : `ChaineRadioFunctional::CapterRf`, `ChaineRadioFunctional::Syntoniser`

##### Demodulateur

<!-- lm:id=RadioReveilLogical::RadioReveil::ChaineRadio::Demodulateur -->

`part_def`

Extrait l'audio de la porteuse.

- **Alloué à** : `RadioReveilPhysical::CartePrincipale::ModuleFmRda5807`
- **Alloué depuis** : `ChaineRadioFunctional::Demoduler`

##### syntoniseur

<!-- lm:id=RadioReveilLogical::RadioReveil::ChaineRadio::syntoniseur -->

`part` · type : `Syntoniseur`

##### demodulateur

<!-- lm:id=RadioReveilLogical::RadioReveil::ChaineRadio::demodulateur -->

`part` · type : `Demodulateur`

#### RestitutionSonore

<!-- lm:id=RadioReveilLogical::RadioReveil::RestitutionSonore -->

`part_def`

Transforme un signal audio en son audible, volume piloté.

- **Alloué à** : `RadioReveilPhysical::CartePrincipale::AmplificateurPam8403`, `RadioReveilPhysical::HautParleur`
- **Alloué depuis** : `RadioReveilFunctional::AmplifierAudio`

##### audio

<!-- lm:id=RadioReveilLogical::RadioReveil::RestitutionSonore::audio -->

`port` · type : `AudioPort`

##### commande

<!-- lm:id=RadioReveilLogical::RadioReveil::RestitutionSonore::commande -->

`port` · type : `CommandePort`

##### energie

<!-- lm:id=RadioReveilLogical::RadioReveil::RestitutionSonore::energie -->

`port` · type : `EnergiePort`

#### AffichageTemps

<!-- lm:id=RadioReveilLogical::RadioReveil::AffichageTemps -->

`part_def`

Rend l'heure lisible, luminosité réglable, mode nuit.

- **Satisfait** : `RadioReveilRequirements::Fonctions::AffichageHeure`, `RadioReveilRequirements::Interfaces::LuminositeReglable`
- **Alloué à** : `RadioReveilPhysical::CartePrincipale::AfficheurLed7Segments`
- **Alloué depuis** : `RadioReveilFunctional::AfficherHeure`

##### temps

<!-- lm:id=RadioReveilLogical::RadioReveil::AffichageTemps::temps -->

`port` · type : `TempsPort`

##### energie

<!-- lm:id=RadioReveilLogical::RadioReveil::AffichageTemps::energie -->

`port` · type : `EnergiePort`

#### InterfaceCommande

<!-- lm:id=RadioReveilLogical::RadioReveil::InterfaceCommande -->

`part_def`

Capte les actions utilisateur : réglages, alarmes, snooze.

- **Satisfait** : `RadioReveilRequirements::Fonctions::Snooze`
- **Alloué à** : `RadioReveilPhysical::ClavierBoutons`
- **Alloué depuis** : `RadioReveilFunctional::AcquerirCommandes`

##### commandes

<!-- lm:id=RadioReveilLogical::RadioReveil::InterfaceCommande::commandes -->

`port` · type : `CommandePort`

##### energie

<!-- lm:id=RadioReveilLogical::RadioReveil::InterfaceCommande::energie -->

`port` · type : `EnergiePort`

#### AlimentationSauvegarde

<!-- lm:id=RadioReveilLogical::RadioReveil::AlimentationSauvegarde -->

`part_def`

Convertit le secteur, distribue l'énergie et maintient
l'heure pendant une coupure (source de secours).

- **Satisfait** : `RadioReveilRequirements::Fonctions::SauvegardeHeure`
- **Alloué à** : `RadioReveilPhysical::CartePrincipale::TransformateurSecteur`, `RadioReveilPhysical::CartePrincipale::RegulateurBuck5V`, `RadioReveilPhysical::CartePrincipale::SupercondensateurSauvegarde`
- **Alloué depuis** : `RadioReveilFunctional::DistribuerEnergie`, `RadioReveilFunctional::SauvegarderHeure`, `BaseDeTempsFunctional::BasculerSurSecours`

##### secteur

<!-- lm:id=RadioReveilLogical::RadioReveil::AlimentationSauvegarde::secteur -->

`port` · type : `EnergiePort`

##### energie

<!-- lm:id=RadioReveilLogical::RadioReveil::AlimentationSauvegarde::energie -->

`port` · type : `EnergiePort`

#### baseTemps

<!-- lm:id=RadioReveilLogical::RadioReveil::baseTemps -->

`part` · type : `BaseDeTemps`

#### alarmes

<!-- lm:id=RadioReveilLogical::RadioReveil::alarmes -->

`part` · type : `GestionAlarmes`

#### radio

<!-- lm:id=RadioReveilLogical::RadioReveil::radio -->

`part` · type : `ChaineRadio`

#### son

<!-- lm:id=RadioReveilLogical::RadioReveil::son -->

`part` · type : `RestitutionSonore`

#### affichage

<!-- lm:id=RadioReveilLogical::RadioReveil::affichage -->

`part` · type : `AffichageTemps`

#### commandes

<!-- lm:id=RadioReveilLogical::RadioReveil::commandes -->

`part` · type : `InterfaceCommande`

#### alimentation

<!-- lm:id=RadioReveilLogical::RadioReveil::alimentation -->

`part` · type : `AlimentationSauvegarde`

### radioReveil

<!-- lm:id=RadioReveilLogical::radioReveil -->

`part` · type : `RadioReveil`
