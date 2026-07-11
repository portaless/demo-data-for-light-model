# MSAT — Jeu de données de démonstration pour light-model

Modèle SysML v2 d'un **mini-satellite d'observation terrestre** (MSAT),
jeu de données de référence pour tester [light-model](https://github.com/portaless/light-model).

## Contenu

| Couche | Fichier | Contenu |
|---|---|---|
| R — Requirements | `system/requirements/requirements.sysml` | 9 exigences (`MSAT-REQ-xxx`) réparties dans les packages `Imaging` et `Platform`, avec les 6 sous-types du profil ROFLP |
| O — Operational | `system/operational/operational.sysml` | 2 acteurs, 4 cas d'usage |
| F — Functional | `system/functional/functional.sysml` | 7 fonctions, 4 items, 5 flux, machine à modes |
| L — Logical | `system/logical/logical.sysml` | 6 sous-systèmes avec ports (bus, power, RF), 7 connexions ; `PayloadModule` porte sa structure interne, architecturée en étages `subsystems/` (voir README-DECOMPOSITION.md sur cette branche) |
| P — Physical | `system/physical/physical.sysml` | 8 équipements avec budgets masse/puissance, usages avec multiplicités |
| IVVQ | `system/ivvq/ivvq.sysml` | 6 cas de vérification (`MSAT-TC-xxx`) liés aux exigences par `verify` |

Plus les données de pilotage :
- `.lm-meta.json` — statuts, priorités, responsables, jalons (SRR/PDR/CDR), verdicts de vérification (dont un **fail** volontaire sur le budget de masse)
- `.lm-diagrams.json` — diagramme enregistré « Architecture logique »

La traçabilité est **volontairement incomplète** (exigences non satisfaites/non
vérifiées) pour exercer le vérificateur de modèle et les vues de couverture.

## Utilisation

```bash
pip install light-model   # ou installation depuis les sources

# Cloner et servir en une commande
light-model clone https://github.com/portaless/demo-data-for-light-model.git -p msat --serve

# Ou depuis l'outil déjà lancé : POST /api/project/clone {url, path}
```

Les fichiers `.sysml` sont du texte : éditez-les avec n'importe quel éditeur,
l'outil se resynchronise en direct (Git-natif : ce dépôt EST la donnée).

