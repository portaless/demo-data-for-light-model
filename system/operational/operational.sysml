package RadioReveilOperational {
    doc /* Contexte opérationnel : qui utilise le radio-réveil et pour quoi. */
    use case def EtreReveille {
        doc /* Être tiré du sommeil à l'heure programmée, volume croissant. */
        actor dormeur : Dormeur;
        subject radioReveil : RadioReveilLogical::RadioReveil;
        include use case Snoozer;
    }
    use case def ProgrammerAlarme {
        doc /* Régler l'heure de réveil et activer/désactiver les alarmes. */
        actor dormeur : Dormeur;
        subject radioReveil : RadioReveilLogical::RadioReveil;
    }
    use case def Snoozer {
        doc /* Reporter l'alarme de 9 minutes d'un seul geste, sans ouvrir les yeux. */
        actor dormeur : Dormeur;
        subject radioReveil : RadioReveilLogical::RadioReveil;
    }
    use case def EcouterRadio {
        doc /* Écouter un programme FM, notamment pour s'endormir (minuterie). */
        actor dormeur : Dormeur;
        subject radioReveil : RadioReveilLogical::RadioReveil;
    }
    use case def SurvivreCoupure {
        doc /* Conserver heure et alarmes pendant une coupure secteur. */
        actor reseau : ReseauElectrique;
        subject radioReveil : RadioReveilLogical::RadioReveil;
    }
    part def Dormeur {
        doc /* L'utilisateur du radio-réveil : il programme, dort, se
         * réveille — et snooze. L'acteur principal de tous les cas.
         */
    }
    part def ReseauElectrique {
        doc /* Le secteur domestique — disponible... sauf la nuit de l'examen. */
    }
}
package ChaineRadioOperational {
    doc /* Couche Operational de l'étage chaine-radio. */
}
package BaseDeTempsOperational {
    doc /* Couche Operational de l'étage base-de-temps. */
}
package SyntoniseurOperational {
    doc /* Couche Operational de l'étage syntoniseur. */
}
