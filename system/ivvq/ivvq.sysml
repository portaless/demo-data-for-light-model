package RadioReveilIvvq {
    doc /* Campagne de vérification du produit RR-100. */
    verification def <'RR-TC-001'> TestPrecisionHorloge {
        doc /* Banc 7 jours, comparaison à une référence GPS : dérive/jour. */
        verify RadioReveilRequirements::Fonctions::PrecisionHorloge;
    }
    verification def <'RR-TC-002'> TestAlarmes {
        doc /* Programmation des 2 alarmes, vérification du déclenchement à la minute. */
        verify RadioReveilRequirements::Fonctions::AlarmeProgrammable;
    }
    verification def <'RR-TC-003'> TestSnooze {
        doc /* Trois reports successifs de 9 min chronométrés. */
        verify RadioReveilRequirements::Fonctions::Snooze;
    }
    verification def <'RR-TC-004'> TestSauvegarde72h {
        doc /* Débranchement 72 h, vérification heure et alarmes au retour. */
        verify RadioReveilRequirements::Fonctions::SauvegardeHeure;
    }
    verification def <'RR-TC-005'> MesureConsoVeille {
        doc /* Wattmètre de précision, affichage en mode nuit. */
        verify RadioReveilRequirements::Contraintes::ConsommationVeille;
    }
    verification def <'RR-TC-006'> TestBandeFm {
        doc /* Balayage 87.5 - 108 MHz sur générateur HF. */
        verify RadioReveilRequirements::Fonctions::ReceptionFm;
    }
    verification def <'RR-TC-007'> EssaiSecuriteElectrique {
        doc /* Essai diélectrique et courant de fuite selon EN 60065. */
        verify RadioReveilRequirements::Contraintes::SecuriteElectrique;
    }
    verification def <'RR-TC-008'> EssaiReveilBoutEnBout {
        doc /* Scénario complet : programmation la veille, coupure secteur
         * nocturne de 2 h, réveil sonore à l'heure programmée au matin.
         */
        verify RadioReveilRequirements::ReveilFiable;
    }
    verification def <'RR-TC-009'> ControleAffichage {
        doc /* Lecture de l'heure à 3 m dans l'obscurité, contrôle des
         * 3 niveaux de luminosité et du mode nuit.
         */
        verify RadioReveilRequirements::Fonctions::AffichageHeure;
        verify RadioReveilRequirements::Interfaces::LuminositeReglable;
    }
    verification def <'RR-TC-010'> TestVolumeCroissant {
        doc /* Sonomètre : croissance monotone du niveau sonore sur 30 s
         * au déclenchement de l'alarme.
         */
        verify RadioReveilRequirements::Fonctions::VolumeCroissant;
    }
    verification def <'RR-TC-011'> EssaiAlimentationSecteur {
        doc /* Fonctionnement nominal sous 230 V / 50 Hz, tenue aux
         * variations +/- 10 % sur alimentation stabilisée.
         */
        verify RadioReveilRequirements::Interfaces::AlimentationSecteur;
    }
    verification def <'RR-TC-012'> PeseeProduit {
        doc /* Pesée du produit complet emballé hors notice : <= 0.5 kg. */
        verify RadioReveilRequirements::Contraintes::MasseMax;
    }
}

package ChaineRadioIvvq {
    doc /* Recette propre à l'étage chaine-radio. */
    verification def <'CR-TC-001'> TestSensibilite {
        doc /* Mesure de sensibilité à 2 µV, S/N 26 dB, trois fréquences. */
        verify ChaineRadioRequirements::CrSensibilite;
    }
    verification def <'CR-TC-002'> TestRejetCanalAdjacent {
        doc /* Deux porteuses à +/- 200 kHz, mesure du rejet : > 40 dB. */
        verify ChaineRadioRequirements::CrRejetCanalAdjacent;
    }
}

package BaseDeTempsIvvq {
    doc /* Recette propre à l'étage base-de-temps. */
    verification def <'BT-TC-001'> TestDerive {
        doc /* Étuve 0-40 °C, mesure de dérive sur 48 h. */
        verify BaseDeTempsRequirements::BtDerive;
    }
    verification def <'BT-TC-002'> TestTenueSauvegarde {
        doc /* Coupure secteur 72 h sur source de secours chargée :
         * heure conservée à +/- 2 s au retour du secteur.
         */
        verify BaseDeTempsRequirements::BtTenueSauvegarde;
    }
}

package SyntoniseurIvvq {
    doc /* Couche IVVQ de l'étage syntoniseur. */
}
