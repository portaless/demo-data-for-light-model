package RadioReveilRequirements {
    doc /* Exigences du radio-réveil grand public RR-100. */
    requirement def <'RR-001'> ReveilFiable :> ROFLP::StakeholderRequirement {
        doc /* L'utilisateur doit être réveillé à l'heure programmée,
         * chaque jour, y compris après une coupure secteur nocturne.
         */
    }
    package Fonctions {
        requirement def <'RR-010'> AffichageHeure :> ROFLP::FunctionalRequirement {
            doc /* L'heure courante doit être visible en permanence et
             * lisible à 3 m dans l'obscurité.
             */
        }
        requirement def <'RR-011'> PrecisionHorloge :> ROFLP::PerformanceRequirement {
            doc /* La dérive de l'heure doit rester inférieure ou égale à
             * 2 secondes par jour.
             */
            attribute deriveMaxSecondesParJour : Real = 2.0;
        }
        requirement def <'RR-012'> AlarmeProgrammable :> ROFLP::FunctionalRequirement {
            doc /* Deux alarmes indépendantes doivent être programmables
             * à la minute près.
             */
        }
        requirement def <'RR-013'> Snooze :> ROFLP::FunctionalRequirement {
            doc /* Un appui unique doit reporter l'alarme de 9 minutes,
             * répétable sans limite.
             */
        }
        requirement def <'RR-014'> ReceptionFm :> ROFLP::FunctionalRequirement {
            doc /* Le récepteur doit couvrir la bande FM 87.5 - 108 MHz. */
        }
        requirement def <'RR-015'> VolumeCroissant :> ROFLP::FunctionalRequirement {
            doc /* Le volume de l'alarme doit croître progressivement
             * pendant 30 s (réveil non agressif).
             */
        }
        requirement def <'RR-016'> SauvegardeHeure :> ROFLP::FunctionalRequirement {
            doc /* L'heure et les alarmes doivent survivre à une coupure
             * secteur d'au moins 72 h.
             */
            attribute autonomieHeures : Real = 72.0;
        }
    }
    package Interfaces {
        requirement def <'RR-020'> AlimentationSecteur :> ROFLP::InterfaceRequirement {
            doc /* L'appareil doit fonctionner sur secteur 230 V / 50 Hz
             * (prise domestique standard).
             */
        }
        requirement def <'RR-021'> LuminositeReglable :> ROFLP::InterfaceRequirement {
            doc /* La luminosité de l'affichage doit offrir 3 niveaux dont
             * un mode nuit.
             */
        }
    }
    package Contraintes {
        requirement def <'RR-030'> ConsommationVeille :> ROFLP::PhysicalRequirement {
            doc /* La consommation en veille (affichage seul) doit être
             * inférieure ou égale à 1 W.
             */
            attribute consoMaxWatts : Real = 1.0;
        }
        requirement def <'RR-031'> SecuriteElectrique :> ROFLP::PhysicalRequirement {
            doc /* L'isolation secteur doit satisfaire l'EN 60065
             * (double isolation, pas de partie métallique accessible).
             */
        }
        requirement def <'RR-032'> MasseMax :> ROFLP::PhysicalRequirement {
            doc /* La masse totale ne doit pas dépasser 0.5 kg. */
            attribute masseMaxKg : Real = 0.5;
        }
    }
}

package ChaineRadioRequirements {
    doc /* Exigences DÉRIVÉES de l'étage chaine-radio (refine vers les
         exigences système). */
    requirement def <'CR-001'> CrSensibilite :> ROFLP::PerformanceRequirement {
        doc /* Sensibilité utilisable : 2 µV (S/N 26 dB) sur toute la bande. */
        refine RadioReveilRequirements::Fonctions::ReceptionFm;
    }
    requirement def <'CR-002'> CrRejetCanalAdjacent :> ROFLP::PerformanceRequirement {
        doc /* Réjection du canal adjacent supérieure à 40 dB. */
        refine RadioReveilRequirements::Fonctions::ReceptionFm;
    }
}

package BaseDeTempsRequirements {
    doc /* Exigences DÉRIVÉES de l'étage base-de-temps. */
    requirement def <'BT-001'> BtDerive :> ROFLP::PerformanceRequirement {
        doc /* Dérive de l'oscillateur inférieure à 20 ppm entre 0 et 40 °C. */
        refine RadioReveilRequirements::Fonctions::PrecisionHorloge;
    }
    requirement def <'BT-002'> BtTenueSauvegarde :> ROFLP::PerformanceRequirement {
        doc /* Le maintien de l'heure sur source de secours doit couvrir 72 h. */
        refine RadioReveilRequirements::Fonctions::SauvegardeHeure;
    }
}

package SyntoniseurRequirements {
    doc /* Étage syntoniseur (niveau 3) : à dériver au fil de l'analyse. */
}
