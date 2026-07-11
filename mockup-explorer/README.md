# Mockups — observer l'architecture à N sous-niveaux (et sa matrice N²)

> **Le problème** (recette 2026-07-11) : un sous-système est dérivé d'un
> `part def`. Le lien existe dans la data (`refine`) et se re-chaîne à
> chaque re-dérivation — mais **comment l'IHM montre-t-elle qu'on peut
> descendre, où l'on est, et comment on remonte ?** Et comment observer la
> matrice N² (interfaces entre composants) à chaque étage ?
>
> **Le but constant** : réaliser une architecture de systèmes à N
> sous-niveaux, en SysML v2 pur, fichiers texte versionnés.

Quatre approches maquettées, **cumulables** (ce n'est pas un concours à un
seul gagnant — probablement 04 + 02 d'abord, 01 ensuite) :

| # | Mockup | Geste central | Coût estimé |
|---|--------|----------------|-------------|
| [01](01-drill-down-diagramme.md) | **Zoom sémantique** dans le diagramme | double-clic sur un part def dérivé = on ENTRE dedans | moyen |
| [02](02-matrice-n2.md) | **Matrice N²** par étage | drill-down par la diagonale | moyen |
| [03](03-colonnes-etages.md) | Explorateur en **colonnes d'étages** | 1 colonne = 1 étage, à la Miller | élevé |
| [04](04-badges-navigation.md) | **Badges de dérivation** partout | clic sur le badge = navigation | faible |

Chaque fiche : mockup ASCII, le geste, ce que la data fournit déjà, ce qui
manque, avantages/limites, bloc `✏️ Corrections testeur`.

---

## Le lien dans la data (ce qui existe DÉJÀ — rien à inventer ici)

Chaîne réelle du projet de recette, telle qu'indexée aujourd'hui :

```
CameraUnitLogical::CameraUnit        → refine → PayloadModuleLogical::CameraUnit
PayloadModuleLogical::PayloadModule  → refine → MsatLogical::PayloadModule
GroundSegmentLogical::GroundSegment  → refine → MsatSystem::GroundSegment
NewPart1testLogical::NewPart1test    → refine → GroundSegmentLogical::…::NewPart1test
```

Côté fichiers SysML v2 (étage N puis étage N+1) :

```sysml
// system/logical/logical.sysml — étage N (tête)
package MsatLogical {
    part def PayloadModule {            // ← la boîte noire au niveau N
        port data : DataBusPort;
        port pwr  : PowerPort;
    }
}

// subsystems/payload-module/logical/logical.sysml — étage N+1
package PayloadModuleLogical {
    part def PayloadModule {
        refine MsatLogical::PayloadModule;   // ← LE PONT (créé par « Dériver »)
        part camera : PayloadModuleLogical::CameraUnit;
        part compressor : CompressionBoard;
    }
    part def CameraUnit { … }           // re-dérivable → étage N+2
}
```

**Invariants** :
- une dérivation = un dossier `subsystems/<nom>/` (à plat) + un `refine`
  de la racine du nouvel étage vers le `part def` d'origine ;
- la PROFONDEUR n'est nulle part dans les chemins : elle se **calcule** en
  suivant les refine (c'est déjà ce que font l'arbre « Systèmes » et la
  vue Décomposition) ;
- ce que l'IHM doit savoir pour chaque `part def` : *« a-t-il un étage
  dérivé ? »* = existe-t-il un refine ENTRANT depuis la racine d'un autre
  étage. Donnée disponible via `GET /api/model/relations?type=refine` —
  il manque juste de l'exposer par élément (proposition : champ
  `derived_subsystem: "payload-module" | null` sur les éléments/nœuds).

## La matrice N², de quoi parle-t-on

Pour UN étage : les composants de sa couche logique en diagonale, leurs
interfaces (`connect`/`flow`) hors diagonale. La data est déjà là (les
`connect X.port to Y.port` de chaque étage) — c'est une PROJECTION, comme
la matrice allocate existante (onglet Matrice). Ce qui est nouveau : la
**navigation verticale** entre les N² des différents étages (mockup 02).

```
✏️ Corrections testeur (le problème est-il bien posé ? autre chose à
   observer que la N² ?) :
-
-
```
