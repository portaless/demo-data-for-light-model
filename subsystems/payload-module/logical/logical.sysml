package PayloadModuleLogical {
    doc /* Analyse logique du sous-système PayloadModule,
         dérivée de MsatLogical::PayloadModule. */
    part def PayloadModule {
        refine MsatLogical::PayloadModule;
        part camera : CameraUnit;
        part compressor : CompressionBoard;
    }
    part def CameraUnit {
        doc /* Tête optique : clic droit dessus → « Dériver en
             sous-système… » pour ouvrir le cycle de l'étage 3. */
        satisfy PayloadModuleRequirements::PlImageResolution;
    }
    part def CompressionBoard {
        satisfy PayloadModuleRequirements::PlMassBudget;
    }
}
