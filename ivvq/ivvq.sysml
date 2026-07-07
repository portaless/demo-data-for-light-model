package IVVQ {
    doc /* Campagne de vérification MSAT. */

    verification def <'MSAT-TC-001'> VerifyImageResolution {
        doc /* Mesure de la FTM et du GSD sur banc optique, puis en vol
             * sur mire géoréférencée. */
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
             * autonome en mode sûr. */
        verify SafeMode;
    }
    verification def <'MSAT-TC-006'> VerifyAttitude {
        doc /* Précision de pointage en boucle fermée sur simulateur. */
        verify AttitudeAccuracy;
    }
}
