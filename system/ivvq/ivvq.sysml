package MsatIvvq {
    doc /* Campagne de vérification MSAT. */
    verification def <'MSAT-TC-001'> VerifyImageResolution {
        doc /* Mesure de la FTM et du GSD sur banc optique, puis en vol
         * sur mire géoréférencée.
         */
        verify ImageResolution;
    }
    verification def <'MSAT-TC-002'> VerifyMassBudget {
        doc /* Pesée de l'ensemble intégré, comparaison au budget. */
        verify TotalMass;
    }
    verification def <'MSAT-TC-003'> VerifyPowerBudget {
        doc /* Test de génération en simulation solaire fin de vie. */
        verify PowerBudget;
    }
    verification def <'MSAT-TC-004'> VerifyDownlink {
        doc /* Liaison RF de bout en bout avec la station sol. */
        verify DownlinkBand;
    }
    verification def <'MSAT-TC-005'> VerifySafeMode {
        doc /* Injection d'anomalies et vérification de la transition
         * autonome en mode sûr.
         */
        verify SafeMode;
    }
    verification def <'MSAT-TC-006'> VerifyAttitude {
        doc /* Précision de pointage en boucle fermée sur simulateur. */
        verify AttitudeAccuracy;
    }
}

package CameraUnitIvvq {
    doc /* Couche IVVQ du sous-système CameraUnit
         (architecture de MsatLogical::PayloadModule::CameraUnit). */
}

package NewPart2Ivvq {
    doc /* Couche IVVQ du sous-système NewPart2
         (architecture de CameraUnitLogical::NewPart2). */
}

package PayloadModuleIvvq {
    doc /* Campagne de vérification du sous-système : chaque étage
         d'analyse porte sa propre recette IVVQ. */
    verification def VerifyPlResolution {
        doc /* Banc optique : mesure de la résolution bout en bout. */
        verify PayloadModuleRequirements::PlImageResolution;
    }
    verification def VerifyPlMass {
        doc /* Pesée du module intégré. */
        verify PayloadModuleRequirements::PlMassBudget;
    }
}
