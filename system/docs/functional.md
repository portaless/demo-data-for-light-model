---
generated_by: light-model
generated_at: 2026-07-11T13:18:40+00:00
layer: F
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
