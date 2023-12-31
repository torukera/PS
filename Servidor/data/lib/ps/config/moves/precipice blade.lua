MOVES["Precipice Blade"] = {
    description = "Precipice Blade does damage and has no secondary effect.",
    category = MOVE_CATEGORY.PHYSICAL,
    clientIconId = 27596,
    iconId = 0,
    dType = DAMAGE_TYPE_GROUND,
    type = SKILLS_TYPES.TARGET,
    -- requiredEnergy = 120,
    requiredEnergy = 0,
    damage = 120,
    damageType = ELEMENT_GROUND,
    effect = EFFECT_EARTH_EXPLOSION,
    projectile = nil,
    maxDistance = 6,
    cooldownTime = 18,
    cooldownStorage = 15411,
    makeContact = false,
}