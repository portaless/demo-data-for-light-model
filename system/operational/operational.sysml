package MsatOperational {
    doc /* Contexte opérationnel : acteurs et cas d'usage de la mission. */
    part def GroundOperator {
        doc /* Opérateur du segment sol. */
    }
    part def ImageAnalyst {
        doc /* Analyste exploitant les images livrées. */
    }
    use case def AcquireImagery {
        doc /* Programmer et acquérir des images d'une zone d'intérêt. */
        actor operator : GroundOperator;
        subject satellite : Satellite;
    }
    use case def DownlinkImagery {
        doc /* Transmettre les images acquises vers la station sol. */
        actor operator : GroundOperator;
    }
    use case def ExploitImagery {
        doc /* Analyser et distribuer les produits image. */
        actor analyst : ImageAnalyst;
    }
    use case def RecoverFromAnomaly {
        doc /* Ramener le satellite en service après une anomalie. */
        actor operator : GroundOperator;
    }
}

package CameraUnitOperational {
    doc /* Couche Operational du sous-système CameraUnit
         (architecture de MsatLogical::PayloadModule::CameraUnit). */
}

package NewPart2Operational {
    doc /* Couche Operational du sous-système NewPart2
         (architecture de CameraUnitLogical::NewPart2). */
}

package PayloadModuleOperational {
    doc /* Couche Operational du sous-système PayloadModule
         (analyse dérivée de MsatLogical::PayloadModule). */
}
