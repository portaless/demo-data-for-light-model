package MsatLogical {
    doc /* Architecture logique : sous-systèmes et interfaces. */
    port def DataBusPort;
    port def PowerPort;
    port def RfPort;
    port def OpticalPort;
    part def Satellite {
        doc /* Système satellite complet. */
        part payload : MsatLogical::PayloadModule;
        part obc : OnboardComputer;
        part comm : CommSubsystem;
        part eps : PowerSubsystem;
        part aocs : Aocs;
    }
    part def PayloadModule {
        doc /* Module charge utile : instrument optique et électronique.
         * Architecturé en étage subsystems/payload-module — la structure
         * interne ci-dessous est LA source de vérité (aucune copie).
         */
        port data : DataBusPort;
        port pwr : PowerPort;
        part def CompressionBoard {
            doc /* Carte de compression embarquée. */
        }
        part camera : CameraUnit2;
        part compressor : CompressionBoard;
    }
    part def CommSubsystem {
        doc /* Sous-système de communication bande X. */
        port rf : RfPort;
        port bus : DataBusPort;
        port pwr : PowerPort;
    }
    part def OnboardComputer {
        doc /* Calculateur de bord : gestion mission et données. */
        port bus : DataBusPort;
        port pwr : PowerPort;
    }
    part def PowerSubsystem {
        doc /* Génération, stockage et distribution d'énergie. */
        port pwr : PowerPort;
    }
    part def Aocs {
        doc /* Contrôle d'attitude et d'orbite. */
        port bus : DataBusPort;
        port pwr : PowerPort;
    }
    part def CameraUnit2 {
        doc /* Tête optique — architecturée à son tour (étage 3) :
         * clic droit → « Architecturer le sous-système… ».
         */
        part def <subcomponentcamera> subcomponentcamer;
        part def NewPart3;
    }
    connect PayloadModule.data to OnboardComputer.bus;
    connect OnboardComputer.bus to CommSubsystem.bus;
    connect OnboardComputer.bus to Aocs.bus;
    connect PowerSubsystem.pwr to PayloadModule.pwr;
    connect PowerSubsystem.pwr to OnboardComputer.pwr;
    connect PowerSubsystem.pwr to CommSubsystem.pwr;
    connect PowerSubsystem.pwr to Aocs.pwr;
    allocate PlanAcquisition to OnboardComputer;
    allocate CaptureImage to PayloadModule;
    allocate CompressImage to OnboardComputer;
    allocate StoreImage to OnboardComputer;
    allocate TransmitData to CommSubsystem;
    allocate MonitorHealth to OnboardComputer;
    allocate MaintainAttitude to Aocs;
    satisfy DownlinkBand by CommSubsystem;
    satisfy AttitudeAccuracy by Aocs;
    satisfy SafeMode by OnboardComputer;
    satisfy DailyImagingCapacity by PayloadModule;
}

package CameraUnitLogical {
    doc /* Architecture du sous-système camera-unit, ancrée sur
     * MsatLogical::PayloadModule::CameraUnit — étage 3 du cycle
     * récursif, même structure ROFLP+IVVQ que les étages 1 et 2.
     */
    ref part root : MsatLogical::CameraUnit2;
    part def NewPart2;
}

package NewPart2Logical {
    doc /* Architecture du sous-système NewPart2,
         ancrée sur CameraUnitLogical::NewPart2 — la structure logique
         vit au niveau parent, cette couche ne porte que
         la référence et les compléments propres à l'étage. */
    ref part root : CameraUnitLogical::NewPart2;
}

package PayloadModuleLogical {
    doc /* Architecture du sous-système payload-module, ancrée sur
     * MsatLogical::PayloadModule — la structure logique vit au niveau
     * parent (aucune copie, REQ-MULTI-005 v2). Cette couche ne porte
     * que l'ancre et les liens propres à l'étage.
     */
    ref part root : MsatLogical::PayloadModule;
    satisfy PayloadModuleRequirements::PlImageResolution by MsatLogical::CameraUnit2;
    satisfy PayloadModuleRequirements::PlMassBudget by MsatLogical::PayloadModule::CompressionBoard;
}
