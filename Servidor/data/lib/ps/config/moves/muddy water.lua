MOVES["Muddy Water"] = {
    description = "Muddy Water deals damage and has a 30% chance of lowering the target's Accuracy by one stage.",
    category = MOVE_CATEGORY.SPECIAL,
    clientIconId = 12138,
    iconId = 0,
    dType = DAMAGE_TYPE_WATER,
    functionName = "MuddyWater",
    type = SKILLS_TYPES.AREA,
    -- requiredEnergy = 100,
    requiredEnergy = 0,
    requiredLevel = 45,
    damage = 9,
    damageType = ELEMENT_WATER,
    effect = EFFECT_SPLASH,
    projectile = PROJECTILE_BUBBLES,
    areaName = "bigArea",
    area = bigArea,
    cooldownTime = 22,
    cooldownStorage = 15231
}