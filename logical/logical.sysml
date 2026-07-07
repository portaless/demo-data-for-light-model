package Logical {
    doc /* Architecture logique : sous-systèmes et interfaces. */

    port def DataBusPort;
    port def PowerPort;
    port def RfPort;
    port def OpticalPort;

    part def Satellite {
        doc /* Système satellite complet. */
        part payload : PayloadModule;
        part obc : OnboardComputer;
        part comm : CommSubsystem;
        part eps : PowerSubsystem;
        part aocs : Aocs;
    }

    part def PayloadModule {
        doc /* Module charge utile : instrument optique et électronique. */
        port data : DataBusPort;
        port pwr : PowerPort;
        port optics : OpticalPort;
    }
    part def OnboardComputer {
        doc /* Calculateur de bord : gestion mission et données. */
        port bus : DataBusPort;
        port pwr : PowerPort;
    }
    part def CommSubsystem {
        doc /* Sous-système de communication bande X. */
        port rf : RfPort;
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
