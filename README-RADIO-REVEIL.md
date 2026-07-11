# RR-100 — le radio-réveil : jeu de données complet

Cas réaliste pensé pour exercer **toutes les vues** de light-model.
Six fichiers `system/<couche>/<couche>.sysml`, trois étages d'analyse en
packages ancrés, 200 éléments.

## Le système

Un radio-réveil grand public : affiche l'heure, réveille (2 alarmes,
volume croissant, snooze), reçoit la FM, survit aux coupures secteur.

**La règle des couches est respectée à la lettre** :
- **Logique** (`RadioReveilLogical`) = le système SANS solution technique.
  `BaseDeTemps` « entretient l'heure » — quartz, résonateur ou
  radio-pilotage ne sont PAS décidés ici. Sept sous-systèmes logiques avec
  ports typés et connexions (énergie, temps, audio, commandes).
- **Physique** (`RadioReveilPhysical`) = LA solution : une carte
  électronique descendue au composant — MCU STM32L0 (RTC intégrée), quartz
  32 kHz, module FM RDA5807, ampli classe D PAM8403, transfo d'isolement,
  redresseur, buck 5 V, supercondensateur de sauvegarde, afficheur LED
  TM1637 — plus boîtier ABS, haut-parleur, clavier, antenne.

## Les sous-systèmes logiques (descriptions dans les `doc`)

| Sous-système | Responsabilité | Solution retenue (allocations L→P) |
|---|---|---|
| BaseDeTemps ⚓ | entretenir l'heure, référence de temps | RTC du MCU + quartz 32 kHz |
| GestionAlarmes | comparer, déclencher, snoozer | logiciel MCU |
| ChaineRadio ⚓ | capter et restituer la FM | module intégré RDA5807 |
| — Syntoniseur ⚓ | sélectionner la station | (dans le RDA5807) |
| RestitutionSonore | signal → son, volume piloté | PAM8403 + haut-parleur |
| AffichageTemps | heure lisible, mode nuit | afficheur LED 4 digits |
| InterfaceCommande | boutons, snooze | clavier 5 touches |
| AlimentationSauvegarde | secteur → énergie + secours | transfo + buck + supercap |

⚓ = étage architecturé (packages `<Nom><Couche>` + ancre `ref part root`) :
`base-de-temps` et `chaine-radio` sous le système, `syntoniseur` sous
chaine-radio — **chaîne à 3 niveaux**, chaque étage avec ses exigences
dérivées (`refine`), ses fonctions et sa recette IVVQ.

## Parcours des vues (tout doit avoir du contenu)

1. **Explorateur / Systèmes** : la tête + 3 étages imbriqués ; l'élément
   étudié réel en tête de la Logical de chaque étage.
2. **Diagramme** : 4 diagrammes enregistrés — *Architecture logique*
   (boîte blanche, ports et connexions = matière N²), *Solution physique
   (carte)*, *Chaîne fonctionnelle réveil* (flux + succession ActionFlow),
   *Étage chaîne radio* (scopé). Déplier `RadioReveil` en imbrication,
   afficher les ports.
3. **Matrice** : allocate **F→L** (10 fonctions sur 7 sous-systèmes),
   allocate **L→P** (14 allocations jusqu'au composant élec), satisfy
   (15), verify (9).
4. **Tableur** : les 13 exigences avec méta — statuts, responsables
   (léa/marc/nina/yusuf), jalons SRR/PDR/CDR, verdicts dont **un FAIL
   volontaire** (ConsommationVeille : mesurée 1.4 W !) et un
   *inconclusive* (bande FM).
5. **Dashboard / couverture** : 2 exigences volontairement NON satisfaites
   (VolumeCroissant, BtTenueSauvegarde) et 4 non vérifiées — le
   vérificateur et les indicateurs doivent les remonter.
6. **Décomposition** : les `refine` des exigences dérivées (CR-001/002,
   BT-001/002 → exigences système).
7. **Docs** : onglet Docs, sélecteur d'étage (tête + 3 étages).
8. **Santé / check-model** : uniquement les trous volontaires ci-dessus.

## Scénarios de manipulation suggérés

- Renommer `ChaineRadio` → vérifier ancre, satisfy et allocations dans
  Source (propagation des références).
- Ajouter un `part def` dans `BaseDeTemps` au niveau système → il apparaît
  dans la projection de l'étage base-de-temps.
- Architecturer `RestitutionSonore` → six packages ajoutés aux fichiers,
  nouvel étage dans la vue Systèmes.
- Corriger le FAIL : la conso de l'ampli en veille est le suspect
  (le couper en veille = passer sous 1 W).
