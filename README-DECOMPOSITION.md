# Branche demo-decomposition — décomposition & analyse récursive

Deux jeux d'essai complémentaires sur le modèle MSAT.

## 1. Vue Décomposition (niveaux d'abstraction, REQ-MULTI-004)

Dossiers `levels/system|subsystem|component/` + `logical/decomposition-extras.sysml`
(tag par metadata `#Component`). Onglet **Décomposition** : arbres
ObservationSatellite → {ImagingPayload, SatellitePlatform} → composants,
`SpareAntenna` dans « Non rattachés », filtres « Niveau » apparus.

## 2. Analyse récursive ROFLP+IVVQ (REQ-MULTI-005) — NOUVEAU

Le composant `Logical::PayloadModule` a été **dérivé en sous-système** :
`subprojects/payload-module/` porte un cycle COMPLET, comme la racine :

- `requirements/` — `PlImageResolution`, `PlMassBudget` : exigences DÉRIVÉES
  (`refine` vers les exigences système Imaging/Platform)
- `functional/` — mini ActionFlow (acquire → compress, succession)
- `logical/` — `PayloadModule { refine Logical::PayloadModule; }` (le pont
  vertical), `CameraUnit` et `CompressionBoard` qui `satisfy` SES exigences
- `ivvq/` — `VerifyPlResolution`, `VerifyPlMass` : la recette PROPRE à l'étage

Et l'étage 3 existe déjà : `subprojects/camera-unit/` (scaffold généré par la
feature elle-même, dérivé de `PayloadModuleLogical::CameraUnit`).

### Parcours de test conseillé

1. **Explorateur → toggle « Systèmes »** : la racine avec ses couches, puis
   `payload-module` imbriqué (badge système, « ← PayloadModule »), puis
   `camera-unit` imbriqué dedans — chacun avec ses 6 couches.
2. **Dériver soi-même** : clic droit sur un `part def` L/P (explorateur ou
   diagramme) → « Dériver en sous-système… » (nom prérempli). La racine créée
   est sélectionnée, le sélecteur « Sous-système » scope toutes les vues.
3. **Onglet Décomposition** : les chaînes `refine` de la démo niveaux ET de
   l'analyse récursive y apparaissent.
4. **Diagramme** : sélecteur Sous-système = payload-module, couche R/L/IVVQ —
   les arêtes refine (triangle creux pointillé), satisfy et verify du cycle.
5. **Matrice / Dashboard** : la couverture reste GLOBALE pour l'instant —
   la recette PAR sous-système est au backlog (REQ-MULTI-007).

### Structure : à plat, hiérarchie par refine

Chaque cycle dérivé est un dossier FRÈRE sous `subprojects/` (git-friendly,
importable) ; la verticalité est portée par les relations `refine` et rendue
par l'explorateur « Systèmes » et la Décomposition.

## Utilisation

    git checkout demo-decomposition
    # l'application réindexe toute seule (watcher) — F5 pour recharger l'UI
