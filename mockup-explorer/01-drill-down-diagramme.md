# Mockup 01 — Zoom sémantique : le double-clic DESCEND dans l'étage

**Le geste** : double-cliquer un `part def` qui a un étage dérivé fait
ENTRER le canvas dedans — le diagramme affiche la couche L de l'étage
N+1, et un fil d'Ariane permet de remonter. (Référence mentale : la
« plongée » d'Arcadia/Capella, ou le zoom de Figma.)

```
┌────────────────────────────────────────────────────────────────────────┐
│ MSAT ▸ payload-module ▸ [camera-unit]        L / Tout      [⬆ Remonter]│  ← fil d'Ariane cliquable
├────────────────────────────────────────────────────────────────────────┤
│                                                                        │
│   ┌───────────────────────────── CameraUnit ──────────────┐            │
│   │  ⬆ raffine PayloadModuleLogical::CameraUnit           │            │
│   │                                                       │            │
│   │   ┌────────────┐        ┌──────────────┐              │            │
│   │   │ Detector   │■──────■│ ReadoutBoard │              │            │
│   │   └────────────┘        └──────────────┘              │            │
│   └───────────────────────────────────────────────────────┘            │
│                                                                        │
└────────────────────────────────────────────────────────────────────────┘

Au niveau N, le nœud dérivable s'annonce :
   ┌─ PayloadModule ──────────────┐
   │ PART DEF          🟣 dérivé ▾│   ← badge : étage payload-module
   │ ■ data   ■ pwr   ■ optics    │      double-clic ou clic badge = descendre
   └──────────────────────────────┘
```

**Chorégraphie** :
- double-clic sur nœud AVEC étage dérivé → descente (le canvas bascule
  sur le filtre sous-système de l'étage, contenu = sa couche L) ;
- double-clic sur nœud SANS étage dérivé → proposer « Dériver en
  sous-système… » (le geste de création et le geste de navigation ne font
  qu'un : c'est la boucle méthodologique complète) ;
- `⬆ Remonter` / clic sur un segment du fil d'Ariane → remontée, en
  re-sélectionnant le part def d'origine (on retombe où on était) ;
- le fil d'Ariane EST la chaîne refine, calculée comme dans l'arbre
  « Systèmes ».

**Ce que la data fournit déjà** : la chaîne refine ; le filtre
sous-système du graphe ; les diagrammes par étage (.lm shardés).
**Ce qui manque** : `derived_subsystem` par nœud (cf. README) ; l'état
« pile de navigation » côté canvas ; le badge sur SysmlNode.

**Avantages** : c'est le modèle mental exact de la décomposition — on ne
change jamais d'outil, on « entre » dans les boîtes. Le double-clic sur
canvas vide (créer, existant) et sur nœud (descendre) restent cohérents.
**Limites / risques** : conflit avec le double-clic actuel du canvas vide ?
non (cible ≠). Risque de désorientation si le fil d'Ariane n'est pas très
visible ; la remontée doit restaurer l'état visuel de l'étage N (nos
brouillons par clé `layer:`/`diagram:` le permettent).

```
✏️ Corrections testeur :
-
-
```
