// Variante METADATA du tag de niveau (REQ-MULTI-004) : hors dossier levels/,
// le niveau est porté par #System / #Subsystem / #Component.
package DecompositionExtras {
    #Component part def ThermalSensor {
        doc /* Tagué component par METADATA (pas par le chemin) ;
             raffine la plateforme comme les autres composants. */
        refine MsatSubsystems::SatellitePlatform;
    }
}
