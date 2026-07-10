# Branche demo-decomposition — jeu d'essai des niveaux d'abstraction

Setup de test de la vue **Décomposition** (REQ-MULTI-004) : trois niveaux
canoniques reliés par des relations `refine` (l'élément le plus concret
raffine le plus abstrait).

## Contenu ajouté (aucun fichier existant modifié)

- `levels/system/logical/` — `ObservationSatellite`, `GroundSegment`
  (niveau porté par le **chemin**)
- `levels/subsystem/logical/` — `ImagingPayload`, `SatellitePlatform`
  (raffinent le satellite), `MissionControl` (raffine le segment sol)
- `levels/component/logical/` — `OpticalCamera`, `ImageCompressor` (→ payload),
  `StarTracker`, `BatteryPack` (→ plateforme), `SpareAntenna` (**sans refine**)
- `logical/decomposition-extras.sysml` — `ThermalSensor` : niveau porté par
  **metadata** `#Component` (l'autre mode de tag)

## Ce qu'il faut voir

1. **Onglet Décomposition** : deux arbres — `ObservationSatellite` →
   {ImagingPayload → {OpticalCamera, ImageCompressor}, SatellitePlatform →
   {StarTracker, BatteryPack, ThermalSensor}} et `GroundSegment` →
   {MissionControl} ; badges indigo/bleu/cyan par niveau ; `SpareAntenna`
   dans « Non rattachés » ; clic = sélection partagée.
2. **Filtres « Niveau »** (apparus automatiquement) : explorateur + toolbar
   du diagramme (`-` = hors niveaux, breadcrumb `⟨niveau⟩`).
3. **Diagramme couche L** : les arêtes `refine` (triangle creux pointillé) ;
   mode lien **R** de la toolbox pour en créer d'autres au clic.
4. Supprimer un `refine` (clic sur l'arête) → l'élément bascule dans
   « Non rattachés » en live.

## Utilisation

    git checkout demo-decomposition   # additif : pas de conflit avec main

puis recharger l'application (le watcher réindexe tout seul).
