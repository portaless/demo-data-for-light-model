package MsatRequirements {
    doc /* Exigences du mini-satellite d'observation MSAT. */
    requirement def <'MSAT-REQ-001'> MissionAvailability :> ROFLP::StakeholderRequirement {
        doc /* Le service d'imagerie doit être disponible 95 % du temps
         * sur une année d'exploitation.
         */
    }
    package Imaging {
        requirement def <'MSAT-REQ-010'> ImageResolution :> ROFLP::PerformanceRequirement {
            doc /* La résolution au sol (GSD) doit être inférieure ou égale
             * à 3.5 m au nadir.
             */
            attribute gsd : Real = 3.5;
        }
        requirement def <'MSAT-REQ-011'> DailyImagingCapacity :> ROFLP::FunctionalRequirement {
            doc /* Le système doit acquérir au moins 40 scènes par jour. */
        }
        requirement def <'MSAT-REQ-020'> DownlinkBand :> ROFLP::InterfaceRequirement {
            doc /* La télémesure image doit être transmise en bande X
             * (8.0 - 8.4 GHz).
             */
        }
    }
    package Platform {
        requirement def <'MSAT-REQ-030'> TotalMass :> ROFLP::PhysicalRequirement {
            doc /* La masse totale au lancement ne doit pas dépasser 120 kg. */
            attribute maxMass : Real = 120.0;
        }
        requirement def <'MSAT-REQ-031'> PowerBudget :> ROFLP::PhysicalRequirement {
            doc /* La puissance générée en fin de vie doit être supérieure
             * à 400 W.
             */
            attribute minPower : Real = 400.0;
        }
        requirement def <'MSAT-REQ-050'> AttitudeAccuracy :> ROFLP::PerformanceRequirement {
            doc /* La précision de pointage doit être meilleure que 0.05 deg. */
        }
        requirement def <'MSAT-REQ-060'> SafeMode :> ROFLP::FunctionalRequirement {
            doc /* Le satellite doit rejoindre un mode sûr de façon autonome
             * sur détection d'anomalie critique.
             */
        }
        requirement def <'MSAT-REQ-040'> ThermalRange :> ROFLP::DesignConstraint {
            doc /* Les équipements doivent fonctionner entre -20 et +50 °C. */
        }
    }
    allocate Imaging::ImageResolution to MsatPhysical::ReactionWheel;
    allocate Imaging::ImageResolution to MsatPhysical::camera;
    allocate Imaging::DownlinkBand to MsatPhysical::camera;
    allocate Platform::PowerBudget to MsatPhysical::camera;
    allocate Platform::ThermalRange to MsatPhysical::transmitter;
    allocate Platform::PowerBudget to MsatPhysical::wheels;
    allocate Platform::TotalMass to MsatPhysical::StarTracker;
    allocate Platform::TotalMass to MsatPhysical::ReactionWheel;
    allocate Platform::TotalMass to MsatPhysical::SolarArray;
    allocate Imaging::DailyImagingCapacity to MsatPhysical::StarTracker;
    allocate Imaging::ImageResolution to MsatPhysical::StarTracker;
    allocate Platform::TotalMass to MsatPhysical::Structure;
    allocate Platform::TotalMass to MsatPhysical::XBandTransmitter;
    allocate Platform::TotalMass to MsatPhysical::ObcBoard;
    allocate Imaging::DailyImagingCapacity to MsatPhysical::CameraAssembly;
    allocate Platform::SafeMode to MsatPhysical::Battery;
    allocate Platform::SafeMode to MsatPhysical::StarTracker;
    allocate Platform::SafeMode to MsatPhysical::Structure;
    allocate Platform::AttitudeAccuracy to MsatPhysical::ObcBoard;
    allocate Platform::AttitudeAccuracy to MsatPhysical::CameraAssembly;
    allocate Platform::ThermalRange to MsatPhysical::Battery;
    allocate Platform::PowerBudget to MsatPhysical::Battery;
    allocate Platform::PowerBudget to MsatPhysical::ReactionWheel;
    allocate MissionAvailability to MsatPhysical::ObcBoard;
    allocate MissionAvailability to MsatPhysical::XBandTransmitter;
    connect Imaging::DailyImagingCapacity to Imaging::ImageResolution;
}

package CameraUnitRequirements {
    doc /* Couche Requirements du sous-système CameraUnit
         (architecture de MsatLogical::PayloadModule::CameraUnit). */
}

package NewPart2Requirements {
    doc /* Couche Requirements du sous-système NewPart2
         (architecture de CameraUnitLogical::NewPart2). */
}

package PayloadModuleRequirements {
    doc /* Exigences du sous-système PayloadModule, DÉRIVÉES des exigences
         système par refine (traçabilité verticale du cycle récursif). */
    requirement def PlImageResolution {
        doc /* Résolution image au niveau charge utile — dérive de
             l'exigence système ImageResolution. */
        refine MsatRequirements::Imaging::ImageResolution;
    }
    requirement def PlMassBudget {
        doc /* Budget de masse alloué à la charge utile — dérive du budget
             de masse total plateforme. */
        refine MsatRequirements::Platform::TotalMass;
    }
}
