package RadioReveilPhysical {
    doc /* SOLUTION TECHNIQUE : électronique grand public sur carte unique,
         descendue au niveau composant. */
    part def BoitierAbs {
        doc /* Boîtier plastique ABS deux coques, sans vis apparente. */
        attribute masse : Real = 0.18;
    }
    part def CartePrincipale {
        doc /* PCB simple face — toute l'électronique du produit. */
        attribute masse : Real = 0.09;
        part def MicrocontroleurStm32l0 {
            doc /* MCU basse consommation, RTC 32 bits intégrée : tient
             * l'heure, gère alarmes/snooze, pilote afficheur et module FM.
             */
            attribute consoVeille : Real = 0.008;
        }
        part def QuartzHorloge32kHz {
            doc /* Quartz horloger 32 768 Hz ±20 ppm : la référence de temps. */
        }
        part def ModuleFmRda5807 {
            doc /* Récepteur FM intégré (syntoniseur + démodulateur), bus I2C. */
            attribute consoActive : Real = 0.02;
        }
        part def AmplificateurPam8403 {
            doc /* Ampli audio classe D 2×3 W, volume piloté (croissance). */
            attribute consoActive : Real = 2.5;
        }
        part def TransformateurSecteur {
            doc /* Transformateur d'isolement 230 V → 9 V, double isolation. */
            attribute masse : Real = 0.12;
        }
        part def PontRedresseur {
            doc /* Redressement + filtrage de la tension secondaire. */
        }
        part def RegulateurBuck5V {
            doc /* Conversion 9 V → 5 V à découpage, haut rendement en veille. */
        }
        part def SupercondensateurSauvegarde {
            doc /* 1 F sur le domaine RTC : maintient l'heure plus de 72 h. */
        }
        part def AfficheurLed7Segments {
            doc /* 4 digits LED, driver TM1637, 3 niveaux de luminosité. */
            attribute consoVeille : Real = 0.35;
        }
        part mcu : MicrocontroleurStm32l0;
        part quartz : QuartzHorloge32kHz;
        part moduleFm : ModuleFmRda5807;
        part ampli : AmplificateurPam8403;
        part transfo : TransformateurSecteur;
        part redresseur : PontRedresseur;
        part regulateur : RegulateurBuck5V;
        part supercap : SupercondensateurSauvegarde;
        part afficheur : AfficheurLed7Segments;
    }
    part def HautParleur {
        doc /* Haut-parleur large bande 8 Ω / 2 W. */
        attribute masse : Real = 0.06;
    }
    part def ClavierBoutons {
        doc /* 5 boutons poussoirs dont un grand SNOOZE sur le dessus. */
    }
    part def AntenneFilaire {
        doc /* Antenne FM filaire 75 cm. */
    }
    part boitier : BoitierAbs;
    part carte : CartePrincipale;
    part hautParleur : HautParleur;
    part clavier : ClavierBoutons;
    part antenne : AntenneFilaire;
    allocate RadioReveilLogical::RadioReveil::BaseDeTemps to CartePrincipale::MicrocontroleurStm32l0;
    allocate RadioReveilLogical::RadioReveil::BaseDeTemps::OscillateurReference to CartePrincipale::QuartzHorloge32kHz;
    allocate RadioReveilLogical::RadioReveil::BaseDeTemps::CompteurTemps to CartePrincipale::MicrocontroleurStm32l0;
    allocate RadioReveilLogical::RadioReveil::GestionAlarmes to CartePrincipale::MicrocontroleurStm32l0;
    allocate RadioReveilLogical::RadioReveil::ChaineRadio to CartePrincipale::ModuleFmRda5807;
    allocate RadioReveilLogical::RadioReveil::ChaineRadio::Syntoniseur to CartePrincipale::ModuleFmRda5807;
    allocate RadioReveilLogical::RadioReveil::ChaineRadio::Demodulateur to CartePrincipale::ModuleFmRda5807;
    allocate RadioReveilLogical::RadioReveil::RestitutionSonore to CartePrincipale::AmplificateurPam8403;
    allocate RadioReveilLogical::RadioReveil::RestitutionSonore to HautParleur;
    allocate RadioReveilLogical::RadioReveil::AffichageTemps to CartePrincipale::AfficheurLed7Segments;
    allocate RadioReveilLogical::RadioReveil::InterfaceCommande to ClavierBoutons;
    allocate RadioReveilLogical::RadioReveil::AlimentationSauvegarde to CartePrincipale::TransformateurSecteur;
    allocate RadioReveilLogical::RadioReveil::AlimentationSauvegarde to CartePrincipale::RegulateurBuck5V;
    allocate RadioReveilLogical::RadioReveil::AlimentationSauvegarde to CartePrincipale::SupercondensateurSauvegarde;
    satisfy RadioReveilRequirements::Contraintes::ConsommationVeille by CartePrincipale;
    satisfy RadioReveilRequirements::Contraintes::SecuriteElectrique by CartePrincipale::TransformateurSecteur;
    satisfy RadioReveilRequirements::Contraintes::MasseMax by BoitierAbs;
    satisfy RadioReveilRequirements::Interfaces::AlimentationSecteur by CartePrincipale::TransformateurSecteur;
}

package ChaineRadioPhysical {
    doc /* Couche Physical de l'étage chaine-radio : la solution retenue
         (module intégré RDA5807) est tracée par les allocations. */
}

package BaseDeTempsPhysical {
    doc /* Couche Physical de l'étage base-de-temps (quartz + RTC du MCU). */
}

package SyntoniseurPhysical {
    doc /* Couche Physical de l'étage syntoniseur. */
}
