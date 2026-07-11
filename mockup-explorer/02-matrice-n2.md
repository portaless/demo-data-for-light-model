# Mockup 02 — Matrice N² par étage, drill-down par la diagonale

**Le geste** : l'onglet Matrice gagne un type « N² (interfaces) ». La
diagonale porte les composants d'UN étage (usages de sa couche L) ; les
cellules hors diagonale comptent les `connect`/`flow` entre eux. Un
composant dérivé porte le marqueur 🟣 : **double-clic dessus = la N² de
son étage remplace la vue** (fil d'Ariane pour remonter).

```
Matrice : [ N² (interfaces) ▾ ]   Étage : MSAT ▸ (tête)          [⬆]
┌──────────────┬──────────┬──────────┬──────────┬──────────┬─────────┐
│      ↓ de/à →│ Payload  │ OBC      │ Comm     │ EPS      │ Aocs    │
├──────────────┼──────────┼──────────┼──────────┼──────────┼─────────┤
│ 🟣 PayloadMod │ ▓▓▓▓▓▓▓▓ │ data→bus │          │          │         │
│ OnboardCmp   │          │ ▓▓▓▓▓▓▓▓ │ bus→bus  │          │ bus→bus │
│ 🟣 CommSubsys │          │          │ ▓▓▓▓▓▓▓▓ │          │         │
│ PowerSubsys  │ pwr→pwr  │ pwr→pwr  │ pwr→pwr  │ ▓▓▓▓▓▓▓▓ │ pwr→pwr │
│ Aocs         │          │          │          │          │ ▓▓▓▓▓▓▓ │
└──────────────┴──────────┴──────────┴──────────┴──────────┴─────────┘
     🟣 = un étage dérivé existe — double-clic : descendre dans SA matrice N²

  … double-clic sur 🟣 PayloadModule :

Matrice : [ N² (interfaces) ▾ ]   Étage : MSAT ▸ payload-module   [⬆]
┌──────────────┬───────────┬───────────────┐
│      ↓ de/à →│ camera    │ compressor    │
├──────────────┼───────────┼───────────────┤
│ 🟣 camera     │ ▓▓▓▓▓▓▓▓▓ │ raw→in        │
│ compressor   │           │ ▓▓▓▓▓▓▓▓▓▓▓▓▓ │
└──────────────┴───────────┴───────────────┘
```

**Détails** :
- cellule pleine : liste des connexions au clic (ports source→cible),
  navigation vers les éléments ;
- une cellule vide reste CLIQUABLE en mode édition → créer un `connect`
  (même mécanique que la matrice allocate existante) ;
- la diagonale d'un composant NON dérivé propose « Dériver… » au menu
  contextuel — la N² devient aussi un poste de travail de décomposition ;
- option « inclure les interfaces héritées de l'étage N » (les connect du
  part def d'origine remontés en en-têtes grisés) pour vérifier que la
  décomposition COUVRE les interfaces promises au niveau supérieur — c'est
  la vraie valeur ingénierie de la N² multi-étages.

**Ce que la data fournit déjà** : connect/flow avec ports par étage
(filtre subsystem du graphe) ; la matrice existante (allocate/satisfy/
verify) comme socle UI. **Ce qui manque** : le type de matrice N² côté
backend (projection élémentaire), le marqueur dérivé, le fil d'Ariane.

**Avantages** : c'est l'artefact N² canonique de l'ingénierie système,
directement demandé ; la vérification de couverture d'interfaces
inter-étages n'existe dans AUCUNE autre vue. **Limites** : au-delà de
~15 composants par étage il faut du tri/regroupement ; vue experte.

```
✏️ Corrections testeur (contenu des cellules ? héritage de l'étage N ?) :
-
-
```
