package PayloadModuleLogical {
    doc /* Architecture du sous-système payload-module, ancrée sur
         MsatLogical::PayloadModule — la structure logique vit au niveau
         parent (aucune copie, REQ-MULTI-005 v2). Cette couche ne porte
         que l'ancre et les liens propres à l'étage. */
    ref part root : MsatLogical::PayloadModule;
    satisfy PayloadModuleRequirements::PlImageResolution by MsatLogical::PayloadModule::CameraUnit;
    satisfy PayloadModuleRequirements::PlMassBudget by MsatLogical::PayloadModule::CompressionBoard;
}
