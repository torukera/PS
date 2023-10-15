MOVES["Dark Pulse"] = {
    description = "Dark Pulse deals damage and has a 20% chance of causing the target to flinch.",
    category = MOVE_CATEGORY.SPECIAL,
    clientIconId = 12112,
    iconId = 0,
    dType = DAMAGE_TYPE_DARK,
    functionName = "DarkPulse",
    type = SKILLS_TYPES.AREA,
    -- requiredEnergy = 95,
    requiredEnergy = 0,
    requiredLevel = 45,
    damage = 8,
    damageType = ELEMENT_DARK,
    effect = EFFECT_SHADOW_VORTEX,
    projectile = PROJECTILE_NIGHT_SHADE,
    areaName = "bigArea",
    area = bigArea,
    cooldownTime = 18,
    cooldownStorage = 15210
}