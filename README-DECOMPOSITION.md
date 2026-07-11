# Branche demo-decomposition — décomposition & analyse récursive

## 0. UN SEUL `.sysml` par couche (v3, décision 2026-07-11)

TOUT le modèle vit dans `system/<couche>/<couche>.sysml` — six fichiers,
c'est tout. Un sous-système n'a NI dossier NI fichier : c'est une
**PROJECTION** (macro → micro) portée par ses packages d'identité
`<Système><Couche>` dans ces mêmes fichiers. La donnée vit une fois ;
l'explorateur, le diagramme et les docs re-scopent la vue par étage.

Les packages racine portent le nom du SYSTÈME (`MsatRequirements`,
`MsatOperational`, `MsatFunctional`, `MsatLogical`, `MsatPhysical`,
`MsatIvvq`) — même convention que les sous-systèmes dérivés
(`PayloadModule<Couche>`) : chaque étage du cycle récursif a la même forme.

Deux jeux d'essai complémentaires sur le modèle MSAT.

## 1. Marquage de niveaux (REQ-MULTI-004) — démo retirée

La démo dédiée (`levels/` + `decomposition-extras.sysml`) est **retirée**
(2026-07-11) : c'était un modèle PARALLÈLE (ObservationSatellite,
ImagingPayload, OpticalCamera…) qui racontait la même histoire que le vrai
modèle sous d'autres noms — source de confusion (constat testeur) et d'un
homonyme StarTracker. La décomposition RÉELLE passe par les ancres (§2).

Le marquage de niveaux reste disponible dans l'outil quand on veut étiqueter
l'abstraction SANS créer d'étage : metadata `#System` / `#Subsystem` /
`#Component` sur un élément, filtres « Niveau », vue Décomposition. C'est une
ÉTIQUETTE de lecture ; `subsystems/<nom>/` est une STRUCTURE d'analyse —
dès qu'un composant mérite ses propres exigences/fonctions/IVVQ →
**architecturez le sous-système**.

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
  couche Logical de l'étage ET au niveau système ;
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
   `payload-module` imbriqué (badge « ← PayloadModule »). Sa couche
   **Logical** porte l'élément étudié : le part def RÉEL du niveau parent
   (le même élément — l'étage re-scope la vue, il ne copie rien), à côté
   du package d'ancrage. `camera-unit` imbriqué dedans, même principe.
2. **Architecturer soi-même** : clic droit sur un `part def` L/P
   (explorateur ou diagramme) → « Architecturer le sous-système… ». AUCUN
   dossier créé : six packages ajoutés aux fichiers de couche (l'ancre dans
   Logical) — vérifiez dans Source.
3. **Tester la non-copie** : ajoutez un sous-élément à
   `MsatLogical::PayloadModule` (au niveau système) → il apparaît dans la
   couche Logical de l'étage. Renommez `CameraUnit` → l'ancre de
   camera-unit suit (onglet Source pour le constater). Le NOM DU DOSSIER
   d'étage (camera-unit) ne change pas : c'est un identifiant technique
   stable (chemins git, packages <Pascal><Couche>, .lm) — le badge de
   l'étage affiche toujours le nom VIVANT de l'élément étudié.
4. **Re-architecturer le même composant** : refusé (409) — le menu et le
   backend savent qu'un étage existe déjà.
5. **Matrice / Dashboard** : la couverture reste GLOBALE pour l'instant —
   la recette PAR sous-système est au backlog (REQ-MULTI-007).

### ❓ FAQ testeur : « où vivent les données d'un étage ? »

Dans les MÊMES six fichiers que tout le reste — il n'y a plus qu'un
`logical.sysml` (celui de `system/logical/`). Un étage y possède ses
packages d'identité :

- `PayloadModuleLogical` — l'ancre `ref part root : …;` + les liens
  propres à l'étage ;
- `PayloadModuleRequirements`, `…Functional`, `…Ivvq` — ses exigences
  dérivées, fonctions, campagne de vérification.

**Comment la cohérence est garantie** : une définition = un seul endroit
(plus AUCUNE duplication possible, même de fichier) ; le renommage réécrit
toutes les références ; le vérificateur détecte les références cassées ;
re-architecturer un composant déjà architecturé est refusé (409).

### Structure : des packages, pas des dossiers

Un étage = 6 packages `<Système><Couche>` dans les fichiers de couche
uniques, découvert par son ancre (`<Système>Logical` contenant
`ref part root`). La verticalité est portée par le typing des ancres et
rendue par l'explorateur « Systèmes », le diagramme scopé et la
Décomposition. Les dossiers `subsystems/<nom>/` des anciens projets
restent reconnus en lecture.

## Utilisation

    git checkout demo-decomposition
    # l'application réindexe toute seule (watcher) — F5 pour recharger l'UI
