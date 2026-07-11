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
}

package ChaineRadioIvvq {
    doc /* Recette propre à l'étage chaine-radio. */
    verification def <'CR-TC-001'> TestSensibilite {
        doc /* Mesure de sensibilité à 2 µV, S/N 26 dB, trois fréquences. */
        verify ChaineRadioRequirements::CrSensibilite;
    }
}

package BaseDeTempsIvvq {
    doc /* Recette propre à l'étage base-de-temps. */
    verification def <'BT-TC-001'> TestDerive {
        doc /* Étuve 0-40 °C, mesure de dérive sur 48 h. */
        verify BaseDeTempsRequirements::BtDerive;
    }
}

package SyntoniseurIvvq {
    doc /* Couche IVVQ de l'étage syntoniseur. */
}
