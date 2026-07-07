package Functional {
    doc /* Architecture fonctionnelle : chaîne image et fonctions plateforme. */

    item def ImagingCommand;
    item def RawImage;
    item def CompressedImage;
    item def Telemetry;

    action def PlanAcquisition {
        doc /* Transformer une demande utilisateur en plan d'acquisition. */
        out item plan : ImagingCommand;
    }
    action def CaptureImage {
        doc /* Acquérir une scène avec l'instrument optique. */
        in item cmd : ImagingCommand;
        out item raw : RawImage;
    }
    action def CompressImage {
        doc /* Compresser l'image brute (CCSDS 122). */
        in item raw : RawImage;
        out item compressed : CompressedImage;
    }
    action def StoreImage {
        doc /* Stocker l'image compressée en mémoire de masse. */
    }
    action def TransmitData {
        doc /* Transmettre images et télémesure vers le sol. */
    }
    action def MonitorHealth {
        doc /* Surveiller la santé du satellite et détecter les anomalies. */
        out item tm : Telemetry;
    }
    action def MaintainAttitude {
        doc /* Maintenir le pointage requis pendant l'acquisition. */
    }

    flow from PlanAcquisition.plan to CaptureImage.cmd;
    flow from CaptureImage.raw to CompressImage.raw;
    flow from CompressImage.compressed to StoreImage;
    flow from StoreImage to TransmitData;
    flow from MonitorHealth.tm to TransmitData;

    state def OperationalModes {
        doc /* Modes opérationnels du satellite. */
        state standby;
        state imaging;
        state downlink;
        state safe;
    }
}
