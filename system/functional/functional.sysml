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
        state veille;
        state alarme;
        state radio;
        state coupureSecteur;
    }
    flow from GenererBaseDeTemps.top to MaintenirHeure.top;
    flow from MaintenirHeure.heure to AfficherHeure.heure;
    flow from MaintenirHeure.heure to SurveillerAlarme.heure;
    flow from SurveillerAlarme.declenchement to GenererSonAlarme.declenchement;
    flow from GenererSonAlarme.audio to AmplifierAudio.audio;
    flow from RecevoirFm.audio to AmplifierAudio.audio;
    flow from AcquerirCommandes.commande to SurveillerAlarme.consigne;
    action surveiller : SurveillerAlarme;
    action sonner : GenererSonAlarme;
    action amplifier : AmplifierAudio;
    first surveiller then sonner;
    first sonner then amplifier;
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
