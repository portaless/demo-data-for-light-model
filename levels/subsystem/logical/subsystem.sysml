// Niveau SUBSYSTEM : chaque élément RAFFINE un élément du niveau system
// (c'est l'élément le plus concret qui porte le `refine` vers l'abstrait).
package MsatSubsystems {
    part def ImagingPayload {
        doc /* Chaîne image : capteur, compression, stockage. */
        refine MsatSystem::ObservationSatellite;
    }
    part def SatellitePlatform {
        doc /* Plateforme : énergie, attitude, calculateur. */
        refine MsatSystem::ObservationSatellite;
    }
    part def MissionControl {
        doc /* Centre de contrôle mission. */
        refine MsatSystem::GroundSegment;
    }
}
