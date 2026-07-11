# Mockup 03 — Explorateur en colonnes d'étages (à la Miller)

**Le geste** : un mode d'affichage où CHAQUE COLONNE est un étage.
Sélectionner un `part def` dérivé ouvre la colonne suivante (son étage) ;
la profondeur se LIT horizontalement. (Référence mentale : les colonnes du
Finder macOS.)

```
┌── MSAT (tête) ────┬── payload-module ──┬── camera-unit ────┬───────────
│ ▸ Requirements    │ ▸ Requirements     │ ▸ Requirements    │
│ ▾ Logical         │ ▾ Logical          │ ▾ Logical         │
│   Satellite       │   PayloadModule ⬆  │   CameraUnit ⬆    │   (étage
│   🟣 PayloadModule ▶│   🟣 CameraUnit   ▶│   Detector        │   suivant
│   OnboardComputer │   CompressionBoard │   ReadoutBoard    │   si on
│   🟣 CommSubsystem │ ▸ IVVQ             │ ▸ IVVQ            │   dérive…)
│   PowerSubsystem  │                    │                   │
│ ▸ IVVQ            │                    │                   │
└───────────────────┴────────────────────┴───────────────────┴───────────
  🟣 + ▶ = dérivé, ouvre la colonne suivante        ⬆ = raffine (remonte)
```

**Détails** :
- la colonne N+1 s'ouvre au clic sur un 🟣 (ou à la sélection de
  n'importe quel élément de cet étage ailleurs dans l'appli — les colonnes
  suivent la sélection partagée) ;
- chaque colonne garde la MÊME structure interne que l'explorateur actuel
  (couches → éléments), filtres par colonne inutiles : la colonne EST le
  scope ;
- scroll horizontal pour les chaînes profondes ; un clic sur l'en-tête
  d'une colonne la « racine » (les colonnes à gauche se replient en fil
  d'Ariane compact).

**Ce que la data fournit déjà** : tout (chaîne refine + tag subsystem).
**Ce qui manque** : c'est un composant d'UI entièrement nouveau — le plus
gros chantier des quatre. Question d'architecture : remplace-t-il le mode
« Systèmes » de l'arbre, ou est-ce un TROISIÈME mode (aggravant le
problème de complexité soulevé par ailleurs — cf. VISION-EXPLORATEUR §5) ?

**Avantages** : la profondeur N est LISIBLE d'un coup d'œil, comparaison
côte à côte de deux étages, geste de descente naturel. **Limites** :
largeur d'écran consommée vite ; redondance probable avec l'arbre
« Systèmes » — il faudrait sans doute CHOISIR l'un des deux.

```
✏️ Corrections testeur (remplaçant du mode Systèmes, ou 3e mode, ou
   poubelle ?) :
-
-
```
