# Branche demo-decomposition — décomposition & analyse récursive

## 0. Le système de tête a son identité

Le premier niveau vit dans `system/<couches>` — même forme que chaque
`subsystems/<nom>/<couches>` : le cycle a la même structure à tous les étages.

Les packages racine portent le nom du SYSTÈME (`MsatRequirements`,
`MsatOperational`, `MsatFunctional`, `MsatLogical`, `MsatPhysical`,
`MsatIvvq`) — même convention que les sous-systèmes dérivés
(`PayloadModule<Couche>`) : chaque étage du cycle récursif a la même forme.

Deux jeux d'essai complémentaires sur le modèle MSAT.

## 1. Vue Décomposition (niveaux d'abstraction, REQ-MULTI-004)

Dossiers `levels/system|subsystem|component/` + `logical/decomposition-extras.sysml`
(tag par metadata `#Component`). Onglet **Décomposition** : arbres
ObservationSatellite → {ImagingPayload, SatellitePlatform} → composants,
`SpareAntenna` dans « Non rattachés », filtres « Niveau » apparus.


## ❓ `levels/` vs `subsystems/` : qui fait quoi ? (question testeur)

Les deux ne jouent PAS dans la même catégorie :

| | `subsystems/<nom>/` (dérivation) | Niveaux (`#System/#Subsystem/#Component`) |
|---|---|---|
| **Nature** | une **STRUCTURE** : un étage d'analyse complet | une **ÉTIQUETTE** : un marquage de lecture |
| **Contenu** | 6 couches ROFLP+IVVQ + docs/ + .lm propres | rien — juste un tag sur des éléments existants |
| **Profondeur** | N niveaux (chaîne refine : sub, sub-sub, …) | 3 crans fixes (system/subsystem/component) |
| **Créé par** | clic droit → « Dériver en sous-système… » | metadata `#Component` (ou dossier `levels/`) |
| **Sert à** | dérouler une VRAIE analyse récursive | classer l'abstraction d'éléments **au sein d'un même étage**, alimenter les filtres « Niveau » et colorer la vue Décomposition |

**La règle simple** : dès qu'un composant mérite sa propre analyse
(exigences dérivées, fonctions, conception, IVVQ) → **dérivez un
sous-système**. Le marquage de niveau ne sert que quand on veut étiqueter
l'abstraction SANS créer d'étage — par exemple distinguer, dans la couche
logique d'un même étage, ce qui relève de la vue système de ce qui est déjà
du composant.

**Le dossier `levels/` lui-même est un mécanisme HISTORIQUE** (conçu avant
la dérivation) : il tague par chemin ce que la metadata `#Component` tague
plus simplement. Il reste reconnu en lecture, et la démo le conserve
uniquement pour montrer la vue Décomposition indépendamment des
sous-systèmes. Pour du vrai travail : metadata, pas dossier.

```
✏️ Question ouverte au testeur : maintenant que la dérivation couvre la
   décomposition structurelle, gardez-vous une utilité au marquage de
   niveau ? Si non, on déprécie le dossier levels/ (et on retire cette
   partie de la démo) ; si oui, dans quel cas concret ?
-
```

## 2. Analyse récursive ROFLP+IVVQ (REQ-MULTI-005) — NOUVEAU

Le composant `MsatLogical::PayloadModule` a été **dérivé en sous-système** :
`subsystems/payload-module/` porte un cycle COMPLET, comme la racine :

- `requirements/` — `PlImageResolution`, `PlMassBudget` : exigences DÉRIVÉES
  (`refine` vers les exigences système Imaging/Platform)
- `functional/` — mini ActionFlow (acquire → compress, succession)
- `logical/` — `PayloadModule { refine MsatLogical::PayloadModule; }` (le pont
  vertical), `CameraUnit` et `CompressionBoard` qui `satisfy` SES exigences
- `ivvq/` — `VerifyPlResolution`, `VerifyPlMass` : la recette PROPRE à l'étage

Et l'étage 3 existe déjà : `subsystems/camera-unit/` (scaffold généré par la
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

Chaque cycle dérivé est un dossier FRÈRE sous `subsystems/` (git-friendly,
importable) ; la verticalité est portée par les relations `refine` et rendue
par l'explorateur « Systèmes » et la Décomposition.

## Utilisation

    git checkout demo-decomposition
    # l'application réindexe toute seule (watcher) — F5 pour recharger l'UI
