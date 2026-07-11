# Vision de l'explorateur — document de travail pour la recette

> **Mode d'emploi de ce document** : c'est MA vision (l'outil tel qu'il est
> construit et pourquoi). Chaque section se termine par un bloc
> `✏️ Corrections testeur` — annotez directement, raturez, proposez.
> Rien ici n'est figé : la section 5 liste déjà ce que je considère
> moi-même comme trop compliqué.

---

## 1. À quoi sert l'explorateur (l'intention)

L'explorateur est **la carte du modèle** : il répond à « où est cet
élément ? » et « que contient ce niveau ? », en une colonne toujours
visible. Il n'est PAS un éditeur (ça, c'est Détail/Source/Diagramme) —
ses mutations se limitent à ce qui relève du rangement : créer dans une
couche, encapsuler/désencapsuler par glisser-déposer, renommer, supprimer,
dériver un sous-système.

Trois principes que j'ai suivis :
1. **La sélection est partagée** : cliquer un élément synchronise toutes
   les vues (et toutes les fenêtres), jamais l'inverse d'un clic ne change
   votre onglet courant.
2. **La structure est toujours visible** : les filtres masquent des
   éléments, jamais les couches/étages qui les contiennent.
3. **Les contrôles n'apparaissent que s'ils servent** : pas de sous-système
   dans le projet → pas de sélecteur Sous-système, pas de toggle
   Couches/Systèmes, etc.

```
✏️ Corrections testeur :
-
-
```

## 2. Les deux regroupements (le toggle Couches / Systèmes)

L'arbre a deux façons de raconter le même modèle :

**Mode « Couches »** (défaut, historique) — l'axe est la NATURE des
artefacts. Bon pour : « montre-moi toutes les exigences », travail mono-étage.

```
▾ msat  ⎇ demo-decomposition
  ▾ Requirements          ← couche (pastille rouge, + création)
    ▾ requirements.sysml  ← fichier
      ▾ package MsatRequirements
        ▸ requirement def ImageResolution
  ▸ Operational … ▸ IVVQ
```

**Mode « Systèmes »** — l'axe est la CHAÎNE DE DÉRIVATION. Bon pour :
« montre-moi l'analyse du payload », navigation multi-étages.

```
▾ msat
  ▸ Requirements … IVVQ            ← les couches du système de tête
  ▾ 🟣 système payload-module  ← PayloadModule
    ▸ Requirements … IVVQ          ← SES couches
    ▾ 🟣 système camera-unit  ← CameraUnit   ← imbriqué (chaîne refine)
      ▸ Requirements … IVVQ
```

Pourquoi deux modes et pas un seul : les deux questions sont orthogonales
(nature vs profondeur), et les aplatir dans un seul arbre à 5 niveaux
(étage → couche → fichier → package → élément) rendrait TOUT chemin long.
Le stockage ne bouge jamais : seul l'affichage change.

```
✏️ Corrections testeur (le toggle est-il au bon endroit ? les deux modes
   se justifient-ils ? faut-il un défaut différent selon le projet ?) :
-
-
```

## 3. Les filtres (là où ça se complique)

État actuel, de haut en bas du panneau :

| Contrôle | Apparaît quand | Sémantique |
|---|---|---|
| Recherche | toujours | nom/nom court/qualifié, ancêtres conservés, auto-expansion |
| ⧉ / ⇥ | toujours | fenêtre séparée / réglage d'indentation (persisté) |
| Tout / Arch / Instance | toujours | définitions vs usages |
| Couches / Systèmes | ≥1 sous-système | regroupement (§2) |
| Sous-système | ≥1 sous-système | `-` = tête seule, nom = cet étage seul |
| Variante | ≥1 variante | `-` = tronc commun, nom = tronc + variante |
| Niveau | ≥1 niveau marqué | `-` = hors niveaux, nom = ce niveau seul |

Tous se COMBINENT (ET logique), et « Retrouver dans l'explorateur » lève
automatiquement ceux qui masqueraient la cible.

**Mon diagnostic honnête** : sur un projet multi-système complet, ça fait
jusqu'à **7 contrôles empilés au-dessus de l'arbre** avant le premier
élément. Chaque contrôle est justifiable isolément ; l'empilement ne l'est
plus. C'est, je pense, ce que le testeur ressent.

```
✏️ Corrections testeur (lesquels utilisez-vous vraiment ? lesquels
   devraient disparaître/fusionner ?) :
-
-
```

## 4. Ce que l'arbre affiche sur chaque ligne

- **Élément** : badge de kind (violet=package, bleu=définition,
  vert=usage), nom (tooltip = nom qualifié + nom court), nom court grisé,
  badge violet de variante le cas échéant, liseré gauche à la couleur de la
  couche.
- **Système** (mode Systèmes) : badge indigo « système », nom, origine de
  dérivation grisée (`← PayloadModule`).
- **Couche** : pastille + nom colorés, bouton `+` de création.
- **Projet** : nom + badge de branche Git `⎇`.

Interactions : clic = sélection partagée ; clic droit = menu (retirer du
parent, renommer, dériver en sous-système, supprimer) ; drag d'un élément
sur un élément = encapsulation, sur un fichier/couche = désencapsulation ;
drag vers le canvas du diagramme = ajout au diagramme.

```
✏️ Corrections testeur (trop de badges ? le drag est-il découvrable ?) :
-
-
```

## 5. Ce que je propose de simplifier (mes hypothèses, à valider)

**P1 — Fusionner les 3 filtres multi-système en un seul bouton
« Filtres »** (popover ou ligne repliable, avec un badge compteur quand des
filtres sont actifs : `Filtres (2)`). L'empilement disparaît, la puissance
reste. C'est ma préférée.

**P2 — En mode « Systèmes », masquer le sélecteur Sous-système** : l'arbre
scope déjà par étage, le sélecteur y est redondant (on déplie l'étage au
lieu de filtrer).

**P3 — Reléguer Tout/Arch/Instance dans le popover Filtres** : au quotidien
c'est un réglage de session, pas un geste fréquent — la place au-dessus de
l'arbre est trop chère pour lui.

**P4 — Un seul indicateur « filtré »** : quand n'importe quel filtre est
actif, une barre fine « N éléments masqués — tout afficher » au-dessus de
l'arbre, cliquable pour tout réinitialiser (aujourd'hui il faut se souvenir
de quel contrôle masque quoi).

**P5 — Masquer les fichiers .sysml par défaut** (option « Afficher les
fichiers ») : le niveau fichier est utile aux power users mais allonge tous
les chemins ; package → élément suffit à la lecture. *(Impact : la cible de
drop « désencapsuler vers ce fichier » passerait au menu contextuel.)*

Résultat visé : **recherche + toggle Couches/Systèmes + bouton Filtres**,
et c'est tout au-dessus de l'arbre.

```
✏️ Corrections testeur (cocher/raturer, ou autre chose ?) :
[ ] P1   [ ] P2   [ ] P3   [ ] P4   [ ] P5
-
-
```

## 6. Ce qui ne changera pas sans discussion

- Le stockage à plat (`system/`, `subsystems/<nom>/`) et la hiérarchie
  portée par `refine` — actés ensemble, l'explorateur n'est qu'une vue.
- La sélection partagée entre vues et fenêtres.
- « Les filtres ne cassent jamais la structure » (principe 2).

```
✏️ Corrections testeur :
-
-
```

---
*Document rédigé le 2026-07-11 (recette en cours). Les corrections seront
traduites en exigences SRD (CAT-UX) puis implémentées.*
