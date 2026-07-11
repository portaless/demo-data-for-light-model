# Mockup 04 — Badges de dérivation partout (la solution minimale)

**Le principe** : ne rien inventer comme vue — rendre le lien de
dérivation VISIBLE et CLIQUABLE partout où un `part def` apparaît déjà.
C'est le plus petit pas qui règle « on ne voit pas qu'on peut descendre ».

**1. Sur les nœuds du diagramme** :
```
   ┌─ PayloadModule ─────────────────┐        ┌─ CameraUnit (étage N+1) ──┐
   │ PART DEF            [🟣 payload-module ▸]│ │ PART DEF   [⬆ MSAT ▸ …]  │
   │ ■ data  ■ pwr  ■ optics         │        │                           │
   └─────────────────────────────────┘        └───────────────────────────┘
     clic badge = basculer le canvas             clic = remonter au part def
     sur l'étage dérivé                          d'origine (sélectionné)
```

**2. Dans l'explorateur (les deux modes)** :
```
  ▸ part def PayloadModule  🟣 payload-module ▸
  ▸ part def OnboardComputer          ← rien : pas (encore) dérivé
```

**3. Dans le panneau Détail** — une section « Dérivation » :
```
  ┌─ Dérivation ────────────────────────────────────────────┐
  │ Cet élément est dérivé en :  🟣 payload-module   [Ouvrir]│
  │ Chaîne : MSAT ▸ payload-module ▸ camera-unit             │
  │ (sinon : « Pas d'étage dérivé — [Dériver en sous-système…] »)│
  └──────────────────────────────────────────────────────────┘
```

**4. Le menu contextuel devient contextuel pour de vrai** :
- part def NON dérivé → « Dériver en sous-système… » (existant) ;
- part def DÉJÀ dérivé → « **Ouvrir l'étage payload-module** » à la place
  (re-dériver le même serait une erreur — le 409 backend le refuse déjà,
  autant que l'UI ne le propose plus).

**Ce que la data fournit déjà** : tout — il manque uniquement d'exposer
`derived_subsystem` par élément/nœud (un lookup des refine entrants dont
la source est une racine de scaffold ; même critère que l'arbre Systèmes).

**Avantages** : coût minimal, aucune vue nouvelle, cohérent avec le
langage visuel existant (badge indigo « système » de l'arbre), et c'est le
PRÉREQUIS des mockups 01/02/03 (tous ont besoin de `derived_subsystem`).
**Limites** : ne montre pas la N² ni la vue d'ensemble de la profondeur —
c'est un complément, pas une réponse complète.

**Ma recommandation d'ensemble** : livrer 04 (le socle), puis 02 (la N²
demandée), puis 01 (le zoom sémantique) ; garder 03 en réserve seulement
si l'arbre « Systèmes » ne suffit pas à la lecture de la profondeur.

```
✏️ Corrections testeur (ordre de livraison ? badges suffisants pour
   commencer ?) :
-
-
```
