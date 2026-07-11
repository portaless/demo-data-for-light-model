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
| **Créé par** | clic droit → « Architecturer le sous-système… » | metadata `#Component` (ou dossier `levels/`) |
| **Sert à** | dérouler une VRAIE analyse récursive | classer l'abstraction d'éléments **au sein d'un même étage**, alimenter les filtres « Niveau » et colorer la vue Décomposition |

**La règle simple** : dès qu'un composant mérite sa propre analyse
(exigences dérivées, fonctions, conception, IVVQ) → **architecturez le
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

## 2. Analyse récursive ROFLP+IVVQ (REQ-MULTI-005 v2) — SANS COPIE

**Changement structurel (2026-07-11, validé)** : l'étage ne copie PLUS la
structure logique. La structure vit UNE seule fois, par encapsulation au
niveau parent ; l'étage la référence par une **ancre SysML v2 pure** :

```sysml
// system/logical/logical.sysml — LA source de vérité (une fois)
part def PayloadModule {
    port data : DataBusPort;  …
    part def CameraUnit { … }         // ← architecturé à son tour (étage 3)
    part def CompressionBoard { … }
    part camera : CameraUnit;
    part compressor : CompressionBoard;
}

// subsystems/payload-module/logical/logical.sysml — l'ANCRE, pas une copie
package PayloadModuleLogical {
    ref part root : MsatLogical::PayloadModule;
    satisfy PayloadModuleRequirements::PlImageResolution by MsatLogical::PayloadModule::CameraUnit;
    satisfy PayloadModuleRequirements::PlMassBudget by MsatLogical::PayloadModule::CompressionBoard;
}
```

Conséquences (les 3 problèmes de la copie disparaissent PAR CONSTRUCTION) :
- **renommer** `PayloadModule` ou `CameraUnit` : l'ancre et les références
  sont réécrites (propagation des références), rien d'autre à synchroniser ;
- **ajouter** un sous-élément au part def : visible immédiatement dans la
  vue de l'étage (« Structure (niveau parent) ») ET au niveau système ;
- **plus d'homonymes** : un seul `CameraUnit` dans tout le modèle.

L'étage garde son DOSSIER avec ce qui lui appartient en propre :
- `requirements/` — `PlImageResolution`, `PlMassBudget` : exigences DÉRIVÉES
  (`refine` vers les exigences système Imaging/Platform)
- `functional/` — mini ActionFlow (acquire → compress, succession)
- `logical/` — l'ancre `ref part root` + les liens satisfy de l'étage
- `ivvq/` — `VerifyPlResolution`, `VerifyPlMass` : la recette PROPRE à l'étage
- docs/ et .lm par étage (inchangé, REQ-MULTI-008)

Étage 3 : `subsystems/camera-unit/`, ancré sur
`MsatLogical::PayloadModule::CameraUnit` (le part def IMBRIQUÉ — la
profondeur N se lit dans l'encapsulation, plus dans des copies).

### Parcours de test conseillé

1. **Explorateur → toggle « Systèmes »** : la racine avec ses couches, puis
   `payload-module` imbriqué (badge « ← PayloadModule ») avec son nœud
   **« Structure (niveau parent) »** = le sous-arbre RÉEL et VIVANT du
   part def, puis `camera-unit` imbriqué dedans.
2. **Architecturer soi-même** : clic droit sur un `part def` L/P
   (explorateur ou diagramme) → « Architecturer le sous-système… ». La
   couche logique créée ne contient QUE l'ancre — vérifiez dans Source.
3. **Tester la non-copie** : ajoutez un sous-élément à
   `MsatLogical::PayloadModule` (au niveau système) → il apparaît sous
   « Structure (niveau parent) » de l'étage. Renommez `CameraUnit` → l'ancre
   de camera-unit suit (onglet Source pour le constater).
4. **Re-architecturer le même composant** : refusé (409) — le menu et le
   backend savent qu'un étage existe déjà.
5. **Matrice / Dashboard** : la couverture reste GLOBALE pour l'instant —
   la recette PAR sous-système est au backlog (REQ-MULTI-007).

### Structure : à plat, hiérarchie par les ancres

Chaque étage est un dossier FRÈRE sous `subsystems/` (git-friendly,
importable) ; la verticalité est portée par le typing des ancres `ref part`
(fallback refine pour les anciens scaffolds) et rendue par l'explorateur
« Systèmes » et la Décomposition.

## Utilisation

    git checkout demo-decomposition
    # l'application réindexe toute seule (watcher) — F5 pour recharger l'UI
