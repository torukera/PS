MOVES["Razor Shell"] = {
    description = "Razor Shell deals damage and has a 50% chance of lowering the target's Defense by one stage.",
    makeContact = true,
    category = MOVE_CATEGORY.PHYSICAL,
    clientIconId = 12110,
    iconId = 0,
    dType = DAMAGE_TYPE_WATER,
    functionName = "RazorShell",
    type = SKILLS_TYPES.TARGET,
    -- requiredEnergy = 75,
    requiredEnergy = 0,
    requiredLevel = 30,
    damage = 75,
    damageType = ELEMENT_WATER,
    effect = EFFECT_DOUBLE_SCRATCH,
    projectile = PROJECTILE_GRAVEL,
    maxDistance = 1,
    cooldownTime = 12,
    cooldownStorage = 15205
}