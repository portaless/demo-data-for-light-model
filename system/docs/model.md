---
generated_by: light-model
generated_at: 2026-07-11T13:18:40+00:00
---

# Modèle — document global

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

---

# Couche Operational (O)

14 élément(s).

## RadioReveilOperational

<!-- lm:id=RadioReveilOperational -->

`package`

Contexte opérationnel : qui utilise le radio-réveil et pour quoi.

### Dormeur

<!-- lm:id=RadioReveilOperational::Dormeur -->

`part_def`

L'utilisateur principal : programme, dort, est réveillé.

### ReseauElectrique

<!-- lm:id=RadioReveilOperational::ReseauElectrique -->

`part_def`

Le secteur domestique — disponible... sauf la nuit de l'examen.

### EtreReveille

<!-- lm:id=RadioReveilOperational::EtreReveille -->

`use_case_def`

Être tiré du sommeil à l'heure programmée, volume croissant.

#### dormeur

<!-- lm:id=RadioReveilOperational::EtreReveille::dormeur -->

`actor` · type : `Dormeur`

#### radioReveil

<!-- lm:id=RadioReveilOperational::EtreReveille::radioReveil -->

`subject` · type : `RadioReveil`

### ProgrammerAlarme

<!-- lm:id=RadioReveilOperational::ProgrammerAlarme -->

`use_case_def`

Régler l'heure de réveil et activer/désactiver les alarmes.

#### dormeur

<!-- lm:id=RadioReveilOperational::ProgrammerAlarme::dormeur -->

`actor` · type : `Dormeur`

### Snoozer

<!-- lm:id=RadioReveilOperational::Snoozer -->

`use_case_def`

Reporter l'alarme de 9 minutes d'un seul geste, sans ouvrir les yeux.

#### dormeur

<!-- lm:id=RadioReveilOperational::Snoozer::dormeur -->

`actor` · type : `Dormeur`

### EcouterRadio

<!-- lm:id=RadioReveilOperational::EcouterRadio -->

`use_case_def`

Écouter un programme FM, notamment pour s'endormir (minuterie).

#### dormeur

<!-- lm:id=RadioReveilOperational::EcouterRadio::dormeur -->

`actor` · type : `Dormeur`

### SurvivreCoupure

<!-- lm:id=RadioReveilOperational::SurvivreCoupure -->

`use_case_def`

Conserver heure et alarmes pendant une coupure secteur.

#### reseau

<!-- lm:id=RadioReveilOperational::SurvivreCoupure::reseau -->

`actor` · type : `ReseauElectrique`

---

# Couche Functional (F)

41 élément(s).

## RadioReveilFunctional

<!-- lm:id=RadioReveilFunctional -->

`package`

Architecture fonctionnelle : chaînes du temps, de l'alarme et du son.

### TopHoraire

<!-- lm:id=RadioReveilFunctional::TopHoraire -->

`item_def`

### HeureCourante

<!-- lm:id=RadioReveilFunctional::HeureCourante -->

`item_def`

### ConsigneAlarme

<!-- lm:id=RadioReveilFunctional::ConsigneAlarme -->

`item_def`

### Declenchement

<!-- lm:id=RadioReveilFunctional::Declenchement -->

`item_def`

### CommandeUtilisateur

<!-- lm:id=RadioReveilFunctional::CommandeUtilisateur -->

`item_def`

### SignalRf

<!-- lm:id=RadioReveilFunctional::SignalRf -->

`item_def`

### SignalAudio

<!-- lm:id=RadioReveilFunctional::SignalAudio -->

`item_def`

### EnergieRegulee

<!-- lm:id=RadioReveilFunctional::EnergieRegulee -->

`item_def`

### GenererBaseDeTemps

<!-- lm:id=RadioReveilFunctional::GenererBaseDeTemps -->

`action_def`

Produire la référence de temps stable du système.

- **Alloué à** : `RadioReveilLogical::RadioReveil::BaseDeTemps::OscillateurReference`

#### top

<!-- lm:id=RadioReveilFunctional::GenererBaseDeTemps::top -->

`item` · type : `TopHoraire`

### MaintenirHeure

<!-- lm:id=RadioReveilFunctional::MaintenirHeure -->

`action_def`

Compter le temps et tenir l'heure courante à jour.

- **Alloué à** : `RadioReveilLogical::RadioReveil::BaseDeTemps::CompteurTemps`

#### top

<!-- lm:id=RadioReveilFunctional::MaintenirHeure::top -->

`item` · type : `TopHoraire`

#### heure

<!-- lm:id=RadioReveilFunctional::MaintenirHeure::heure -->

`item` · type : `HeureCourante`

### AfficherHeure

<!-- lm:id=RadioReveilFunctional::AfficherHeure -->

`action_def`

Rendre l'heure lisible en permanence.

- **Alloué à** : `RadioReveilLogical::RadioReveil::AffichageTemps`

#### heure

<!-- lm:id=RadioReveilFunctional::AfficherHeure::heure -->

`item` · type : `HeureCourante`

### SurveillerAlarme

<!-- lm:id=RadioReveilFunctional::SurveillerAlarme -->

`action_def`

Comparer l'heure courante aux consignes d'alarme.

- **Alloué à** : `RadioReveilLogical::RadioReveil::GestionAlarmes`

#### heure

<!-- lm:id=RadioReveilFunctional::SurveillerAlarme::heure -->

`item` · type : `HeureCourante`

#### consigne

<!-- lm:id=RadioReveilFunctional::SurveillerAlarme::consigne -->

`item` · type : `ConsigneAlarme`

#### declenchement

<!-- lm:id=RadioReveilFunctional::SurveillerAlarme::declenchement -->

`item` · type : `Declenchement`

### GenererSonAlarme

<!-- lm:id=RadioReveilFunctional::GenererSonAlarme -->

`action_def`

Produire le signal d'alarme, volume croissant.

- **Alloué à** : `RadioReveilLogical::RadioReveil::GestionAlarmes`

#### declenchement

<!-- lm:id=RadioReveilFunctional::GenererSonAlarme::declenchement -->

`item` · type : `Declenchement`

#### audio

<!-- lm:id=RadioReveilFunctional::GenererSonAlarme::audio -->

`item` · type : `SignalAudio`

### RecevoirFm

<!-- lm:id=RadioReveilFunctional::RecevoirFm -->

`action_def`

Capter et démoduler la bande FM.

- **Alloué à** : `RadioReveilLogical::RadioReveil::ChaineRadio`

#### rf

<!-- lm:id=RadioReveilFunctional::RecevoirFm::rf -->

`item` · type : `SignalRf`

#### audio

<!-- lm:id=RadioReveilFunctional::RecevoirFm::audio -->

`item` · type : `SignalAudio`

### AmplifierAudio

<!-- lm:id=RadioReveilFunctional::AmplifierAudio -->

`action_def`

Amplifier le signal audio vers le transducteur.

- **Alloué à** : `RadioReveilLogical::RadioReveil::RestitutionSonore`

#### audio

<!-- lm:id=RadioReveilFunctional::AmplifierAudio::audio -->

`item` · type : `SignalAudio`

### AcquerirCommandes

<!-- lm:id=RadioReveilFunctional::AcquerirCommandes -->

`action_def`

Lire les actions utilisateur (boutons, snooze).

- **Alloué à** : `RadioReveilLogical::RadioReveil::InterfaceCommande`

#### commande

<!-- lm:id=RadioReveilFunctional::AcquerirCommandes::commande -->

`item` · type : `CommandeUtilisateur`

### DistribuerEnergie

<!-- lm:id=RadioReveilFunctional::DistribuerEnergie -->

`action_def`

Convertir le secteur et alimenter toutes les fonctions.

- **Alloué à** : `RadioReveilLogical::RadioReveil::AlimentationSauvegarde`

#### energie

<!-- lm:id=RadioReveilFunctional::DistribuerEnergie::energie -->

`item` · type : `EnergieRegulee`

### SauvegarderHeure

<!-- lm:id=RadioReveilFunctional::SauvegarderHeure -->

`action_def`

Maintenir l'heure sur source de secours pendant une coupure.

- **Alloué à** : `RadioReveilLogical::RadioReveil::AlimentationSauvegarde`

### ModesFonctionnement

<!-- lm:id=RadioReveilFunctional::ModesFonctionnement -->

`state_def`

Modes du radio-réveil.

#### veille

<!-- lm:id=RadioReveilFunctional::ModesFonctionnement::veille -->

`state`

#### alarme

<!-- lm:id=RadioReveilFunctional::ModesFonctionnement::alarme -->

`state`

#### radio

<!-- lm:id=RadioReveilFunctional::ModesFonctionnement::radio -->

`state`

#### coupureSecteur

<!-- lm:id=RadioReveilFunctional::ModesFonctionnement::coupureSecteur -->

`state`

### surveiller

<!-- lm:id=RadioReveilFunctional::surveiller -->

`action` · type : `SurveillerAlarme`

### sonner

<!-- lm:id=RadioReveilFunctional::sonner -->

`action` · type : `GenererSonAlarme`

### amplifier

<!-- lm:id=RadioReveilFunctional::amplifier -->

`action` · type : `AmplifierAudio`

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
