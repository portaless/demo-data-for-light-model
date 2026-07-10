// Niveau SYSTEM (REQ-MULTI-004) : le niveau le plus abstrait de la mission.
// Le niveau est porté par le CHEMIN (levels/system/…) — aucun tag nécessaire.
package MsatSystem {
    doc /* Vue système de la mission MSAT : le satellite d'observation et
         son segment sol, à raffiner par les sous-systèmes. */
    part def ObservationSatellite {
        doc /* Le satellite d'observation vu comme une boîte noire mission. */
    }
    part def GroundSegment {
        doc /* Le segment sol vu du niveau mission. */
    }
}
