MOVES["Bonemerang"] = {
    description = "Bonemerang inflicts damage, hitting the target 2 times per use.",
    category = MOVE_CATEGORY.PHYSICAL,
    clientIconId = 11699,
    iconId = 13325,
    dType = DAMAGE_TYPE_GROUND,
    functionName = "Bonemerang",
    type = SKILLS_TYPES.TARGET,
    -- requiredEnergy = 35,
    requiredEnergy = 0,
    requiredLevel = 18,
    damage = 50,
    damageType = ELEMENT_GROUND,
    effect = EFFECT_SCRATCH,
    projectile = PROJECTILE_DOUBLE_BONE,
    backProjectile = PROJECTILE_DOUBLE_BONE,
    maxDistance = 6,
    cooldownTime = 8,
    cooldownStorage = 15007
}