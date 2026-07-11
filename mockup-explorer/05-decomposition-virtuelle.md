# Mockup 05 — Décomposition virtuelle : la donnée reste UNE, l'étage est une VUE

> Proposition utilisateur (2026-07-11) : « garder le format de données de
> base et rendre la décomposition purement visuelle — par l'encapsulation
> on sait déjà qui est sous-système de qui ; le clic deviendrait
> "**architecturer le sous-système**" et on verrait un package ROFLP+IVVQ
> apparaître dans l'explorateur, indenté sous le système principal ».

## Le problème qu'elle règle (et qui est réel)

La dérivation actuelle **COPIE** le sous-arbre du `part def` dans le
scaffold de l'étage dérivé. Deux sources de vérité, donc :

1. **Renommage** : renommer le `part def` dérivé (ou un de ses ports)
   propage les *références* (refine, typages — corrigé en peer review C1)
   mais PAS la **copie** de l'autre étage : `PayloadModuleLogical::CameraUnit`
   et `CameraUnitLogical::CameraUnit` divergent au premier rename.
2. **Ajouts** : ajouter un sous-élément au `part def` dans le dossier
   dérivé n'apparaît pas dans la vue de l'étage parent (et inversement) —
   la vue « Systèmes » ne « redéplie » pas ce qui a été ajouté ailleurs.
3. **Homonymes** : chaque copie porte le même nom → les références par nom
   simple deviennent ambiguës (constaté en recette : `sat1 : Satellite`
   silencieusement non résolu après dérivation).

Ces trois problèmes ont la même cause : **la duplication**. Deux options
pour la supprimer.

---

## Option A — Purement visuel (la proposition telle quelle)

**Data** : le format de base, un seul arbre. L'encapsulation EST la
décomposition :

```sysml
// system/logical/logical.sysml — TOUTE la structure vit ici
package MsatLogical {
    part def PayloadModule {
        port data : DataBusPort;
        part def CameraUnit {          // ← sous-système par ENCAPSULATION
            part def Detector;         // ← sous-sous-système, etc.
        }
        part def CompressionBoard;
    }
}
```

**IHM** : clic droit sur `CameraUnit` → « **Architecturer le
sous-système** ». AUCUN dossier créé : l'explorateur affiche un nœud
virtuel d'étage, indenté sous le principal :

```
▾ msat
  ▸ Requirements … IVVQ                ← les couches (les vraies)
  ▾ 🟣 payload-module (architecture)   ← VIRTUEL : regroupement visuel
    ▾ Logical                          ← = le sous-arbre RÉEL de PayloadModule
      ▾ part def PayloadModule
        ▸ part def CameraUnit  🟣 ▸    ← re-architecturable (étage N+2 virtuel)
    ▸ Requirements (payload)           ← ses exigences dérivées… mais OÙ ?
```

**La question qui reste ouverte** : où vivent les artefacts d'analyse
PROPRES à l'étage (exigences dérivées, fonctions, campagne IVVQ) ? Si tout
est dans les couches de base, il faut un **critère de regroupement** pour
que le nœud virtuel sache quoi montrer : par les relations (ce qui
`refine`/`satisfy`/est `allocate` vers le part def) ? par un tag
`#Stage("payload")` ? Le « purement visuel » a donc quand même besoin d'un
marqueur dans la data — ou d'accepter un regroupement heuristique.

**Ce qu'on PERD par rapport à aujourd'hui** (acquis récents, demandés) :
- `.lm` et docs PAR ÉTAGE (REQ-MULTI-008) : plus de dossier d'étage → plus
  de shard qui « voyage avec » ;
- l'export/import d'un sous-système comme unité (REQ-MULTI-006) ;
- des fichiers de tête qui restent petits (tout l'arbre L dans un fichier).

---

## Option B — Hybride : l'étage garde un DOSSIER, mais ne copie plus rien

L'idée : le dossier d'étage ne contient QUE ce qui appartient en propre à
l'étage (ses exigences dérivées, ses fonctions, son IVVQ, ses docs, ses
`.lm`). **La structure logique n'est JAMAIS copiée** : l'étage référence
le `part def` d'origine, qui reste l'unique vérité.

```sysml
// system/logical/logical.sysml — la structure UNE SEULE FOIS
package MsatLogical {
    part def PayloadModule {
        part def CameraUnit { … }      // ajouts/renommages : UN seul endroit
    }
}

// subsystems/payload-module/requirements/requirements.sysml — le PROPRE de l'étage
package PayloadModuleRequirements {
    requirement def PlImageResolution {
        refine MsatRequirements::Imaging::ImageResolution;  // pont exigences
    }
}
// subsystems/payload-module/.lm-subsystem.yaml (ou équivalent)
//   root: MsatLogical::PayloadModule    ← LE lien étage → part def
```

- « Architecturer le sous-système » crée le dossier avec R/O/F/IVVQ (+P si
  besoin) **sans couche L copiée** — le pont n'est plus un refine entre
  deux copies homonymes mais une simple référence `root:` (ou un refine
  porté par l'exigence racine de l'étage).
- La vue « Systèmes » montre, sous l'étage : ses couches propres + **le
  sous-arbre RÉEL du part def** (vivant : un ajout au part def apparaît
  immédiatement, un renommage ne propage RIEN car il n'y a rien à
  propager).
- Re-architecturer `CameraUnit` = même geste, depuis le vrai `part def`.

**Ce qu'on garde** : MULTI-008 (docs/.lm par étage), l'export d'un étage
(son dossier = ses artefacts propres + la référence racine), les fichiers
git par étage. **Ce qu'on supprime** : la duplication et ses trois
problèmes. **Ce que ça coûte** : migration du derive actuel (retirer la
copie + le part def scaffold), le champ `root` à porter, et la démo à
reprendre.

---

## Comparatif

| | Actuel (copie) | A — virtuel pur | B — hybride sans copie |
|---|---|---|---|
| Renommage à propager entre étages | ⚠️ oui (divergence) | ✅ non | ✅ non |
| Ajouts visibles partout | ⚠️ non | ✅ oui | ✅ oui |
| Homonymes/ambiguïté | ⚠️ oui | ✅ non | ✅ non |
| .lm + docs par étage (MULTI-008) | ✅ | ❌ à réinventer | ✅ |
| Export/import d'un étage (MULTI-006) | ✅ | ❌ difficile | ✅ |
| Où vivent les exigences de l'étage | dossier étage | ❓ à définir | dossier étage |
| Taille des fichiers de tête | petite | ⚠️ grossit avec N | petite (L seulement) |
| Effort de migration | — | élevé | moyen |

**Ma recommandation : l'option B**, en adoptant le VERBE de l'option A
(« Architecturer le sous-système » dit mieux l'intention que « Dériver »).
Elle prend le meilleur des deux : la donnée structurelle reste UNE (les
trois problèmes de propagation disparaissent), et les étages restent des
unités réelles exportables avec leurs métadonnées — ce qui avait été
explicitement demandé (REQ-MULTI-008).

```
✏️ Corrections testeur / décision :
[ ] Option A (virtuel pur)   [ ] Option B (hybride)   [ ] statu quo + sync
-
-
```
