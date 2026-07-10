// Niveau COMPONENT : raffine les sous-systèmes. SpareAntenna est
// volontairement SANS refine → section « Non rattachés » de la vue.
package MsatComponents {
    part def OpticalCamera {
        refine MsatSubsystems::ImagingPayload;
    }
    part def ImageCompressor {
        refine MsatSubsystems::ImagingPayload;
    }
    part def StarTracker {
        refine MsatSubsystems::SatellitePlatform;
    }
    part def BatteryPack {
        refine MsatSubsystems::SatellitePlatform;
    }
    part def SpareAntenna {
        doc /* Tagué component par son chemin, mais ne raffine rien :
             attendu dans « Non rattachés (aucune relation refine) ». */
    }
}
