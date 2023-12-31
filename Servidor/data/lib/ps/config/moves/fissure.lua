MOVES["Fissure"] = {
    description = "Fissure deals damage and has no secondary effect.",
    makeJump = true,
    category = MOVE_CATEGORY.PHYSICAL,
    clientIconId = 11717,
    iconId = 13343,
    dType = DAMAGE_TYPE_GROUND,
    functionName = "Fissure",
    type = SKILLS_TYPES.TARGET,
    -- requiredEnergy = 110,
    requiredEnergy = 0,
    requiredLevel = 40,
    damage = 110,
    damageType = ELEMENT_GROUND,
    effect = EFFECT_EARTH_CRATER,
    projectile = nil,
    maxDistance = 1,
    cooldownTime = 17,
    cooldownStorage = 15025
}