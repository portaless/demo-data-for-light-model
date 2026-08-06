---
generated_by: light-model
generated_at: 2026-08-06T15:08:03+00:00
layer: F
---

# Couche Functional (F)

55 élément(s).

## RadioReveilFunctional

<!-- lm:id=RadioReveilFunctional -->

`package`

Architecture fonctionnelle : chaînes du temps, de l'alarme et du son.

### TopHoraire

<!-- lm:id=RadioReveilFunctional::TopHoraire -->

`item_def`

Impulsion de cadence issue de la base de temps (1 Hz).

### HeureCourante

<!-- lm:id=RadioReveilFunctional::HeureCourante -->

`item_def`

Heure/minute/seconde tenues à jour par le comptage.

### ConsigneAlarme

<!-- lm:id=RadioReveilFunctional::ConsigneAlarme -->

`item_def`

Heure de réveil programmée et état actif/inactif.

### Declenchement

<!-- lm:id=RadioReveilFunctional::Declenchement -->

`item_def`

Événement de réveil émis quand l'heure atteint la consigne.

### CommandeUtilisateur

<!-- lm:id=RadioReveilFunctional::CommandeUtilisateur -->

`item_def`

Action utilisateur : réglage, activation, snooze.

### SignalRf

<!-- lm:id=RadioReveilFunctional::SignalRf -->

`item_def`

Champ électromagnétique capté dans la bande FM 87.5-108 MHz.

### SignalAudio

<!-- lm:id=RadioReveilFunctional::SignalAudio -->

`item_def`

Signal audio en bande de base, prêt à amplifier.

### EnergieRegulee

<!-- lm:id=RadioReveilFunctional::EnergieRegulee -->

`item_def`

Alimentation continue régulée distribuée aux fonctions.

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

#### arret

<!-- lm:id=RadioReveilFunctional::ModesFonctionnement::arret -->

`state`

#### veille

<!-- lm:id=RadioReveilFunctional::ModesFonctionnement::veille -->

`state`

#### alarme

<!-- lm:id=RadioReveilFunctional::ModesFonctionnement::alarme -->

`state`

#### radioActive

<!-- lm:id=RadioReveilFunctional::ModesFonctionnement::radioActive -->

`state`

Écoute radio : syntonisation puis écoute stable.

##### syntonisation

<!-- lm:id=RadioReveilFunctional::ModesFonctionnement::radioActive::syntonisation -->

`state`

##### ecoute

<!-- lm:id=RadioReveilFunctional::ModesFonctionnement::radioActive::ecoute -->

`state`

#### coupureSecteur

<!-- lm:id=RadioReveilFunctional::ModesFonctionnement::coupureSecteur -->

`state`

### ScenarioReveil

<!-- lm:id=RadioReveilFunctional::ScenarioReveil -->

`action_def`

Scénario nominal : de la mise sous tension au réveil sonore.

#### energie

<!-- lm:id=RadioReveilFunctional::ScenarioReveil::energie -->

`action` · type : `DistribuerEnergie`

#### base

<!-- lm:id=RadioReveilFunctional::ScenarioReveil::base -->

`action` · type : `GenererBaseDeTemps`

#### heure

<!-- lm:id=RadioReveilFunctional::ScenarioReveil::heure -->

`action` · type : `MaintenirHeure`

#### affichage

<!-- lm:id=RadioReveilFunctional::ScenarioReveil::affichage -->

`action` · type : `AfficherHeure`

#### saisie

<!-- lm:id=RadioReveilFunctional::ScenarioReveil::saisie -->

`action` · type : `AcquerirCommandes`

#### surveillance

<!-- lm:id=RadioReveilFunctional::ScenarioReveil::surveillance -->

`action` · type : `SurveillerAlarme`

#### sonnerie

<!-- lm:id=RadioReveilFunctional::ScenarioReveil::sonnerie -->

`action` · type : `GenererSonAlarme`

#### reception

<!-- lm:id=RadioReveilFunctional::ScenarioReveil::reception -->

`action` · type : `RecevoirFm`

Réception FM : capter le signal puis le démoduler.

##### capter

<!-- lm:id=RadioReveilFunctional::ScenarioReveil::reception::capter -->

`action`

##### demoduler

<!-- lm:id=RadioReveilFunctional::ScenarioReveil::reception::demoduler -->

`action`

#### ampli

<!-- lm:id=RadioReveilFunctional::ScenarioReveil::ampli -->

`action` · type : `AmplifierAudio`

- **Alloué à** : `RadioReveilLogical::RadioReveil::RestitutionSonore`

#### choixReveil

<!-- lm:id=RadioReveilFunctional::ScenarioReveil::choixReveil -->

`decide`

#### versAmpli

<!-- lm:id=RadioReveilFunctional::ScenarioReveil::versAmpli -->

`merge`
