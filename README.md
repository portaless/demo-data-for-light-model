# RR-100 — Jeu de données de démonstration pour light-model

Modèle SysML v2 d'un **radio-réveil grand public** (RR-100), jeu de
données de référence pour tester
[light-model](https://github.com/portaless/light-model) : cas réaliste
pensé pour exercer **toutes les vues** de l'outil — 200 éléments, six
couches ROFLP+IVVQ, trois étages d'analyse récursive.

➡ **Guide complet du jeu de données : [README-RADIO-REVEIL.md](README-RADIO-REVEIL.md)**
(système, sous-systèmes, parcours des vues, données de pilotage).

➡ **Mécanisme d'étages (décomposition récursive) : [README-DECOMPOSITION.md](README-DECOMPOSITION.md)**.

## Contenu

| Couche | Fichier | Contenu |
|---|---|---|
| R — Requirements | `system/requirements/requirements.sysml` | 13 exigences (6 sous-types ROFLP), dérivations `#refinement` par étage |
| O — Operational | `system/operational/operational.sysml` | acteurs et cas d'usage du réveil |
| F — Functional | `system/functional/functional.sysml` | fonctions, items, flux, machine à états `ModesFonctionnement`, flot d'actions du scénario réveil (fork/join, decide/merge avec gardes, réalisateurs `perform`) |
| L — Logical | `system/logical/logical.sysml` | 7 sous-systèmes SANS solution technique, ports typés, connexions (énergie, temps, audio, commandes) |
| P — Physical | `system/physical/physical.sysml` | LA solution : carte électronique au composant (MCU STM32L0, quartz 32 kHz, module FM RDA5807, ampli PAM8403…) |
| IVVQ | `system/ivvq/ivvq.sysml` | recette liée aux exigences par `verify` |

Trois **étages ancrés** (`ref part root`) : `base-de-temps`,
`chaine-radio` et `syntoniseur` (sous chaine-radio) — chaîne à 3 niveaux,
chaque étage avec ses exigences dérivées, ses fonctions et sa recette.

Plus les données de pilotage :
- `.lm-meta.json` — statuts, responsables, jalons SRR/PDR/CDR, verdicts
  (dont un **fail** volontaire sur la consommation en veille)
- `.lm-diagrams.json` — 4 diagrammes enregistrés (architecture logique,
  solution physique, chaîne fonctionnelle, étage chaîne radio)

La traçabilité est **volontairement incomplète** (2 exigences non
satisfaites, 4 non vérifiées) pour exercer le vérificateur de modèle et
les vues de couverture.

## Utilisation

```bash
pip install light-model   # ou installation depuis les sources

# Cloner et servir en une commande
light-model clone https://github.com/portaless/demo-data-for-light-model.git -p rr100 --serve

# Ou depuis l'outil déjà lancé : POST /api/project/clone {url, path}
```

Les fichiers `.sysml` sont du texte : éditez-les avec n'importe quel éditeur,
l'outil se resynchronise en direct (Git-natif : ce dépôt EST la donnée).

## Historique

L'ancien jeu **MSAT** (mini-satellite d'observation) a été le jeu initial
du dépôt ; il reste consultable dans l'historique Git (jusqu'à `810d718`).
Depuis 2026-07-29, `main` porte le RR-100 — anciennement branche
`demo-decomposition`, promue puis supprimée.
