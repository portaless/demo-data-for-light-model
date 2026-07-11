---
generated_by: light-model
generated_at: 2026-07-11T09:57:33+00:00
---

# Sous-système payload-module — document global

# Couche Requirements (R)

3 élément(s).

## PayloadModuleRequirements

<!-- lm:id=PayloadModuleRequirements -->

`package`

Exigences du sous-système PayloadModule, DÉRIVÉES des exigences
système par refine (traçabilité verticale du cycle récursif).

### PlImageResolution

<!-- lm:id=PayloadModuleRequirements::PlImageResolution -->

`requirement_def`

Résolution image au niveau charge utile — dérive de
l'exigence système ImageResolution.

- **Satisfaite par** : `MsatLogical::PayloadModule::CameraUnit`
- **Vérifiée par** : `PayloadModuleIvvq::VerifyPlResolution`

### PlMassBudget

<!-- lm:id=PayloadModuleRequirements::PlMassBudget -->

`requirement_def`

Budget de masse alloué à la charge utile — dérive du budget
de masse total plateforme.

- **Satisfaite par** : `MsatLogical::PayloadModule::CompressionBoard`
- **Vérifiée par** : `PayloadModuleIvvq::VerifyPlMass`

---

# Couche Operational (O)

1 élément(s).

## PayloadModuleOperational

<!-- lm:id=PayloadModuleOperational -->

`package`

Couche Operational du sous-système PayloadModule
(analyse dérivée de MsatLogical::PayloadModule).

---

# Couche Functional (F)

5 élément(s).

## PayloadModuleFunctional

<!-- lm:id=PayloadModuleFunctional -->

`package`

Chaîne fonctionnelle image de la charge utile (ActionFlow :
succession = flot de contrôle, créable au mode lien T).

### AcquireFrame

<!-- lm:id=PayloadModuleFunctional::AcquireFrame -->

`action_def`

### CompressFrame

<!-- lm:id=PayloadModuleFunctional::CompressFrame -->

`action_def`

### acquire

<!-- lm:id=PayloadModuleFunctional::acquire -->

`action` · type : `AcquireFrame`

### compress

<!-- lm:id=PayloadModuleFunctional::compress -->

`action` · type : `CompressFrame`

---

# Couche Logical (L)

2 élément(s).

## PayloadModuleLogical

<!-- lm:id=PayloadModuleLogical -->

`package`

Architecture du sous-système payload-module, ancrée sur
MsatLogical::PayloadModule — la structure logique vit au niveau
parent (aucune copie, REQ-MULTI-005 v2). Cette couche ne porte
que l'ancre et les liens propres à l'étage.

### root

<!-- lm:id=PayloadModuleLogical::root -->

`part` · type : `MsatLogical::PayloadModule`

---

# Couche Physical (P)

1 élément(s).

## PayloadModulePhysical

<!-- lm:id=PayloadModulePhysical -->

`package`

Couche Physical du sous-système PayloadModule
(analyse dérivée de MsatLogical::PayloadModule).

---

# Couche IVVQ (IVVQ)

3 élément(s).

## PayloadModuleIvvq

<!-- lm:id=PayloadModuleIvvq -->

`package`

Campagne de vérification du sous-système : chaque étage
d'analyse porte sa propre recette IVVQ.

### VerifyPlResolution

<!-- lm:id=PayloadModuleIvvq::VerifyPlResolution -->

`verification_def`

Banc optique : mesure de la résolution bout en bout.

- **Vérifie** : `PayloadModuleRequirements::PlImageResolution`

### VerifyPlMass

<!-- lm:id=PayloadModuleIvvq::VerifyPlMass -->

`verification_def`

Pesée du module intégré.

- **Vérifie** : `PayloadModuleRequirements::PlMassBudget`
