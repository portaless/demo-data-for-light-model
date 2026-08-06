package RadioReveilLogical {
    doc /* Architecture LOGIQUE : le système SANS solution technique —
     * des responsabilités et des interfaces, aucun choix de composant.
     */
    port def TempsPort {
        doc /* Interface de temps : tops de cadence et heure courante. */
    }
    port def AudioPort {
        doc /* Interface audio en bande de base (source → restitution). */
    }
    port def EnergiePort {
        doc /* Interface d'alimentation régulée distribuée aux sous-systèmes. */
    }
    port def CommandePort {
        doc /* Interface de commande : consignes, déclenchements, réglages. */
    }
    port def RfPort {
        doc /* Interface radiofréquence : bande FM captée par l'antenne. */
    }
    part def RadioReveil {
        doc /* Le radio-réveil vu comme un assemblage de sous-systèmes
         * logiques. Chaque part def interne est candidate à
         * « Architecturer le sous-système ».
         */
        part def BaseDeTemps {
            doc /* Entretient l'heure courante et fournit la référence de
             * temps. Aucun choix technologique ici : quartz, résonateur
             * ou radio-pilotage appartiennent à la couche physique.
             */
            port energie : EnergiePort;
            port temps : TempsPort;
            part def OscillateurReference {
                doc /* Source de cadence stable, précision à charge de l'étage. */
            }
            part def CompteurTemps {
                doc /* Accumule les tops en heure/minute/seconde. */
            }
            part oscillateur : OscillateurReference;
            part compteur : CompteurTemps;
            // Réalisateur des actions du scénario (couloirs, REQ-DIAG-016)
            perform RadioReveilFunctional::ScenarioReveil::base;
            perform RadioReveilFunctional::ScenarioReveil::heure;
        }
        part def GestionAlarmes {
            doc /* Compare l'heure aux consignes, déclenche et gère le
             * report (snooze). Deux consignes indépendantes.
             */
            port temps : TempsPort;
            port declenche : CommandePort;
            port energie : EnergiePort;
            perform RadioReveilFunctional::ScenarioReveil::surveillance;
            perform RadioReveilFunctional::ScenarioReveil::sonnerie;
        }
        part def ChaineRadio {
            doc /* Capte la bande FM et restitue un signal audio — sans
             * préjuger de la solution (module intégré, discret, SDR…).
             */
            port rf : RfPort;
            port audio : AudioPort;
            port energie : EnergiePort;
            part def Syntoniseur {
                doc /* Sélectionne la station : filtrage et accord. */
            }
            part def Demodulateur {
                doc /* Extrait l'audio de la porteuse. */
            }
            part syntoniseur : Syntoniseur;
            part demodulateur : Demodulateur;
            perform RadioReveilFunctional::ScenarioReveil::reception;
        }
        part def RestitutionSonore {
            doc /* Transforme un signal audio en son audible, volume piloté.
             * Réalise l'amplification du scénario par ALLOCATION (repli des
             * couloirs) — voir functional.sysml.
             */
            port audio : AudioPort;
            port commande : CommandePort;
            port energie : EnergiePort;
        }
        part def AffichageTemps {
            doc /* Rend l'heure lisible, luminosité réglable, mode nuit. */
            port temps : TempsPort;
            port energie : EnergiePort;
            perform RadioReveilFunctional::ScenarioReveil::affichage;
        }
        part def InterfaceCommande {
            doc /* Capte les actions utilisateur : réglages, alarmes, snooze. */
            port cmd : CommandePort;
            port energie : EnergiePort;
            perform RadioReveilFunctional::ScenarioReveil::saisie;
        }
        part def AlimentationSauvegarde {
            doc /* Convertit le secteur, distribue l'énergie et maintient
             * l'heure pendant une coupure (source de secours).
             */
            port secteur : EnergiePort;
            port energie : EnergiePort;
            perform RadioReveilFunctional::ScenarioReveil::energie;
        }
        part baseTemps : BaseDeTemps;
        part alarmes : GestionAlarmes;
        part radio : ChaineRadio;
        part son : RestitutionSonore;
        part affichage : AffichageTemps;
        part commandes : InterfaceCommande;
        part alimentation : AlimentationSauvegarde;
        connect alimentation.energie to baseTemps.energie;
        connect alimentation.energie to alarmes.energie;
        connect alimentation.energie to radio.energie;
        connect alimentation.energie to son.energie;
        connect alimentation.energie to affichage.energie;
        connect alimentation.energie to commandes.energie;
        connect baseTemps.temps to affichage.temps;
        connect baseTemps.temps to alarmes.temps;
        connect alarmes.declenche to son.commande;
        connect radio.audio to son.audio;
        connect commandes.cmd to alarmes.declenche;
    }
    part radioReveil : RadioReveil;
    allocate RadioReveilFunctional::GenererBaseDeTemps to RadioReveil::BaseDeTemps::OscillateurReference;
    allocate RadioReveilFunctional::MaintenirHeure to RadioReveil::BaseDeTemps::CompteurTemps;
    allocate RadioReveilFunctional::AfficherHeure to RadioReveil::AffichageTemps;
    allocate RadioReveilFunctional::SurveillerAlarme to RadioReveil::GestionAlarmes;
    allocate RadioReveilFunctional::GenererSonAlarme to RadioReveil::GestionAlarmes;
    allocate RadioReveilFunctional::RecevoirFm to RadioReveil::ChaineRadio;
    allocate RadioReveilFunctional::AmplifierAudio to RadioReveil::RestitutionSonore;
    allocate RadioReveilFunctional::AcquerirCommandes to RadioReveil::InterfaceCommande;
    allocate RadioReveilFunctional::DistribuerEnergie to RadioReveil::AlimentationSauvegarde;
    allocate RadioReveilFunctional::SauvegarderHeure to RadioReveil::AlimentationSauvegarde;
    satisfy RadioReveilRequirements::ReveilFiable by RadioReveil;
    satisfy RadioReveilRequirements::Fonctions::AffichageHeure by RadioReveil::AffichageTemps;
    satisfy RadioReveilRequirements::Fonctions::PrecisionHorloge by RadioReveil::BaseDeTemps;
    satisfy RadioReveilRequirements::Fonctions::AlarmeProgrammable by RadioReveil::GestionAlarmes;
    satisfy RadioReveilRequirements::Fonctions::Snooze by RadioReveil::InterfaceCommande;
    satisfy RadioReveilRequirements::Fonctions::ReceptionFm by RadioReveil::ChaineRadio;
    satisfy RadioReveilRequirements::Fonctions::SauvegardeHeure by RadioReveil::AlimentationSauvegarde;
    satisfy RadioReveilRequirements::Fonctions::VolumeCroissant by RadioReveil::RestitutionSonore;
    satisfy RadioReveilRequirements::Interfaces::LuminositeReglable by RadioReveil::AffichageTemps;
}
package ChaineRadioLogical {
    doc /* Étage chaine-radio, ancré sur le sous-système logique ChaineRadio —
     * la structure vit au niveau parent, ce package porte l'ancre et les
     * liens propres à l'étage.
     */
    ref part root : RadioReveilLogical::RadioReveil::ChaineRadio;
    satisfy ChaineRadioRequirements::CrSensibilite by RadioReveilLogical::RadioReveil::ChaineRadio::Syntoniseur;
    satisfy ChaineRadioRequirements::CrRejetCanalAdjacent by RadioReveilLogical::RadioReveil::ChaineRadio::Syntoniseur;
    allocate ChaineRadioFunctional::CapterRf to RadioReveilLogical::RadioReveil::ChaineRadio::Syntoniseur;
    allocate ChaineRadioFunctional::Syntoniser to RadioReveilLogical::RadioReveil::ChaineRadio::Syntoniseur;
    allocate ChaineRadioFunctional::Demoduler to RadioReveilLogical::RadioReveil::ChaineRadio::Demodulateur;
}
package BaseDeTempsLogical {
    doc /* Étage base-de-temps, ancré sur le sous-système logique BaseDeTemps. */
    ref part root : RadioReveilLogical::RadioReveil::BaseDeTemps;
    satisfy BaseDeTempsRequirements::BtDerive by RadioReveilLogical::RadioReveil::BaseDeTemps::OscillateurReference;
    satisfy BaseDeTempsRequirements::BtTenueSauvegarde by RadioReveilLogical::RadioReveil::AlimentationSauvegarde;
    allocate BaseDeTempsFunctional::CompenserDerive to RadioReveilLogical::RadioReveil::BaseDeTemps::OscillateurReference;
    allocate BaseDeTempsFunctional::BasculerSurSecours to RadioReveilLogical::RadioReveil::AlimentationSauvegarde;
}
package SyntoniseurLogical {
    doc /* Étage syntoniseur (niveau 3), ancré sur le part def imbriqué
     * Syntoniseur — la profondeur se lit dans l'encapsulation.
     */
    ref part root : RadioReveilLogical::RadioReveil::ChaineRadio::Syntoniseur;
}
