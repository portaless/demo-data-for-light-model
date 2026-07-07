package Requirements {
    doc /* Exigences du mini-satellite d'observation MSAT. */

    requirement def <'MSAT-REQ-001'> MissionAvailability :> ROFLP::StakeholderRequirement {
        doc /* Le service d'imagerie doit être disponible 95 % du temps
             * sur une année d'exploitation. */
    }

    package Imaging {
        requirement def <'MSAT-REQ-010'> ImageResolution :> ROFLP::PerformanceRequirement {
            doc /* La résolution au sol (GSD) doit être inférieure ou égale
                 * à 3.5 m au nadir. */
            attribute gsd : Real = 3.5;
        }
        requirement def <'MSAT-REQ-011'> DailyImagingCapacity :> ROFLP::FunctionalRequirement {
            doc /* Le système doit acquérir au moins 40 scènes par jour. */
        }
        requirement def <'MSAT-REQ-020'> DownlinkBand :> ROFLP::InterfaceRequirement {
            doc /* La télémesure image doit être transmise en bande X
                 * (8.0 - 8.4 GHz). */
        }
    }

    package Platform {
        requirement def <'MSAT-REQ-030'> TotalMass :> ROFLP::PhysicalRequirement {
            doc /* La masse totale au lancement ne doit pas dépasser 120 kg. */
            attribute maxMass : Real = 120.0;
        }
        requirement def <'MSAT-REQ-031'> PowerBudget :> ROFLP::PhysicalRequirement {
            doc /* La puissance générée en fin de vie doit être supérieure
                 * à 400 W. */
            attribute minPower : Real = 400.0;
        }
        requirement def <'MSAT-REQ-040'> ThermalRange :> ROFLP::DesignConstraint {
            doc /* Les équipements doivent fonctionner entre -20 et +50 °C. */
        }
        requirement def <'MSAT-REQ-050'> AttitudeAccuracy :> ROFLP::PerformanceRequirement {
            doc /* La précision de pointage doit être meilleure que 0.05 deg. */
        }
        requirement def <'MSAT-REQ-060'> SafeMode :> ROFLP::FunctionalRequirement {
            doc /* Le satellite doit rejoindre un mode sûr de façon autonome
                 * sur détection d'anomalie critique. */
        }
    }
}
