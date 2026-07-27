package RadioReveilFunctional {
    doc /* Architecture fonctionnelle : chaînes du temps, de l'alarme et du son. */
    item def TopHoraire;
    item def HeureCourante;
    item def ConsigneAlarme;
    item def Declenchement;
    item def CommandeUtilisateur;
    item def SignalRf;
    item def SignalAudio;
    item def EnergieRegulee;
    action def GenererBaseDeTemps {
        doc /* Produire la référence de temps stable du système. */
        out item top : TopHoraire;
    }
    action def MaintenirHeure {
        doc /* Compter le temps et tenir l'heure courante à jour. */
        in item top : TopHoraire;
        out item heure : HeureCourante;
    }
    action def AfficherHeure {
        doc /* Rendre l'heure lisible en permanence. */
        in item heure : HeureCourante;
    }
    action def SurveillerAlarme {
        doc /* Comparer l'heure courante aux consignes d'alarme. */
        in item heure : HeureCourante;
        in item consigne : ConsigneAlarme;
        out item declenchement : Declenchement;
    }
    action def GenererSonAlarme {
        doc /* Produire le signal d'alarme, volume croissant. */
        in item declenchement : Declenchement;
        out item audio : SignalAudio;
    }
    action def RecevoirFm {
        doc /* Capter et démoduler la bande FM. */
        in item rf : SignalRf;
        out item audio : SignalAudio;
    }
    action def AmplifierAudio {
        doc /* Amplifier le signal audio vers le transducteur. */
        in item audio : SignalAudio;
    }
    action def AcquerirCommandes {
        doc /* Lire les actions utilisateur (boutons, snooze). */
        out item commande : CommandeUtilisateur;
    }
    action def DistribuerEnergie {
        doc /* Convertir le secteur et alimenter toutes les fonctions. */
        out item energie : EnergieRegulee;
    }
    action def SauvegarderHeure {
        doc /* Maintenir l'heure sur source de secours pendant une coupure. */
    }
    state def ModesFonctionnement {
        doc /* Modes du radio-réveil. */
        state arret;
        state veille;
        state alarme;
        state radioActive {
            doc /* Écoute radio : syntonisation puis écoute stable. */
            state syntonisation;
            state ecoute;
            first syntonisation then ecoute;
        }
        state coupureSecteur;
        // Transitions entre modes (successions entre états). `arret` n'est
        // jamais cible → état initial ; `coupureSecteur` bascule sur secours
        // et revient en `veille` au retour du secteur.
        first arret then veille;
        first veille then alarme;
        first alarme then veille;
        first veille then radioActive;
        first radioActive then veille;
        first radioActive then alarme;
        first veille then coupureSecteur;
        first alarme then coupureSecteur;
        first radioActive then coupureSecteur;
        first coupureSecteur then veille;
    }
    // Scénario nominal du réveil comme action COMPOSITE : les étapes sont des
    // usages `action` typés par les fonctions ci-dessus, reliés par un flot de
    // contrôle (successions). C'est ce def composite qui porte le diagramme
    // d'ACTIVITÉ et le RÉSEAU DE PETRI (un flot vit dans une def, pas dans le
    // package). L'énergie conditionne le démarrage ; l'heure alimente affichage
    // ET surveillance (fork) ; la surveillance attend heure ET consigne (join) ;
    // alarme et réception radio convergent sur l'amplification (join).
    // Converti en Petri : net borné et sauf, plusieurs jetons concurrents,
    // marquage terminal (blocage détecté). Successions qualifiées ScenarioReveil::
    // pour lever les homonymes avec les ports (`energie`, …).
    action def ScenarioReveil {
        doc /* Scénario nominal : de la mise sous tension au réveil sonore. */
        action energie : DistribuerEnergie;
        action base : GenererBaseDeTemps;
        action heure : MaintenirHeure;
        action affichage : AfficherHeure;
        action saisie : AcquerirCommandes;
        action surveillance : SurveillerAlarme;
        action sonnerie : GenererSonAlarme;
        action reception : RecevoirFm {
            doc /* Réception FM : capter le signal puis le démoduler. */
            action capter;
            action demoduler;
            first capter then demoduler;
        }
        action ampli : AmplifierAudio;
        action NewAction1;
        // Choix EXCLUSIF du mode de réveil (decide → gardes) : sonnerie si
        // déclenchement d'alarme, radio si réveil en musique programmé ; les
        // deux branches CONVERGENT (merge) vers l'amplification — sans le
        // merge, ampli attendrait les DEUX branches (join) et l'analyse RdP
        // la déclarerait morte.
        decide choixReveil;
        merge versAmpli;
        first ScenarioReveil::energie then ScenarioReveil::base;
        first ScenarioReveil::base then ScenarioReveil::heure;
        first ScenarioReveil::heure then ScenarioReveil::affichage;
        first ScenarioReveil::heure then ScenarioReveil::surveillance;
        first ScenarioReveil::saisie then ScenarioReveil::surveillance;
        first ScenarioReveil::surveillance then ScenarioReveil::choixReveil;
        first ScenarioReveil::choixReveil if declenchement then ScenarioReveil::sonnerie;
        first ScenarioReveil::choixReveil if reveilEnMusique then ScenarioReveil::reception;
        first ScenarioReveil::sonnerie then ScenarioReveil::versAmpli;
        first ScenarioReveil::reception then ScenarioReveil::versAmpli;
        first ScenarioReveil::versAmpli then ScenarioReveil::ampli;
    }
    // Flux de données (matière/information) — items échangés entre actions.
    flow from GenererBaseDeTemps.top to MaintenirHeure.top;
    flow from MaintenirHeure.heure to AfficherHeure.heure;
    flow from MaintenirHeure.heure to SurveillerAlarme.heure;
    flow from SurveillerAlarme.declenchement to GenererSonAlarme.declenchement;
    flow from GenererSonAlarme.audio to AmplifierAudio.audio;
    flow from RecevoirFm.audio to AmplifierAudio.audio;
    flow from AcquerirCommandes.commande to SurveillerAlarme.consigne;
}
package ChaineRadioFunctional {
    doc /* Fonctions propres à l'étage chaine-radio. */
    action def CapterRf {
        doc /* Capter le champ électromagnétique de la bande FM. */
    }
    action def Syntoniser {
        doc /* Sélectionner la porteuse de la station choisie. */
    }
    action def Demoduler {
        doc /* Extraire le signal audio de la porteuse FM. */
    }
    flow from CapterRf to Syntoniser;
    flow from Syntoniser to Demoduler;
}
package BaseDeTempsFunctional {
    doc /* Fonctions propres à l'étage base-de-temps. */
    action def CompenserDerive {
        doc /* Corriger la dérive thermique de l'oscillateur. */
    }
    action def BasculerSurSecours {
        doc /* Détecter la coupure secteur et basculer la source d'énergie. */
    }
}
package SyntoniseurFunctional {
    doc /* Couche Functional de l'étage syntoniseur. */
}
