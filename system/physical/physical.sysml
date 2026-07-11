package MsatPhysical {
    doc /* Architecture physique : équipements et budgets. */
    part def CameraAssembly {
        doc /* Ensemble caméra : télescope + plan focal. */
        attribute mass : Real = 12.5;
        attribute power : Real = 45.0;
    }
    part def ObcBoard {
        doc /* Carte calculateur durcie. */
        attribute mass : Real = 1.2;
        attribute power : Real = 8.0;
    }
    part def XBandTransmitter {
        doc /* Émetteur bande X 150 Mbit/s. */
        attribute mass : Real = 2.4;
        attribute power : Real = 35.0;
    }
    part def SolarArray {
        doc /* Générateur solaire déployable. */
        attribute mass : Real = 8.0;
        attribute power : Real = 450.0;
    }
    part def Battery {
        doc /* Batterie Li-ion 40 Ah. */
        attribute mass : Real = 6.5;
    }
    part def ReactionWheel {
        doc /* Roue à réaction 0.1 Nm. */
        attribute mass : Real = 1.1;
    }
    part def StarTracker {
        doc /* Senseur stellaire. */
        attribute mass : Real = 0.9;
    }
    part def Structure {
        doc /* Structure primaire et thermique. */
        attribute mass : Real = 35.0;
    }
    part camera : CameraAssembly;
    part obcBoard : ObcBoard;
    part transmitter : XBandTransmitter;
    part solarArray : SolarArray [2];
    part battery : Battery;
    part wheels : ReactionWheel [4];
    part starTracker : MsatPhysical::StarTracker [2];
    part structure : Structure;
    allocate MsatLogical::PayloadModule to CameraAssembly;
    allocate OnboardComputer to ObcBoard;
    allocate CommSubsystem to XBandTransmitter;
    allocate PowerSubsystem to SolarArray;
    allocate PowerSubsystem to Battery;
    allocate Aocs to ReactionWheel;
    allocate Aocs to MsatPhysical::StarTracker;
    satisfy ImageResolution by CameraAssembly;
    satisfy TotalMass by Structure;
    satisfy PowerBudget by SolarArray;
    satisfy ThermalRange by Structure;
}
