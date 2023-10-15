MOVES["Crunch"] = {
    description = "Crunch deals damage and has a 20% chance of lowering the target's Defense by one stage.",
    makeContact = true,
    category = MOVE_CATEGORY.PHYSICAL,
    clientIconId = 11705,
    iconId = 13331,
    dType = DAMAGE_TYPE_DARK,
    functionName = "Crunch",
    type = SKILLS_TYPES.TARGET,
    -- requiredEnergy = 80,
    requiredEnergy = 0,
    requiredLevel = 25,
    damage = 80,
    damageType = ELEMENT_DARK,
    effect = EFFECT_BIG_BITE,
    projectile = nil,
    maxDistance = 1,
    cooldownTime = 12,
    cooldownStorage = 15013
}