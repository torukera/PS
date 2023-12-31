MOVES["Grass Whistle"] = {
    description = "Grass Whistle puts the target to sleep.",
    makeSound = true,
    category = MOVE_CATEGORY.STATUS,
    clientIconId = 16311,
    iconId = 0,
    dType = DAMAGE_TYPE_GRASS,
    functionName = "GrassWhistle",
    type = SKILLS_TYPES.TARGET,
    -- requiredEnergy = 100,
    requiredEnergy = 0,
    requiredLevel = 15,
    damage = 0,
    damageType = ELEMENT_GRASS,
    effect = EFFECT_BIG_ENERGY_BALL,
    projectile = PROJECTILE_SOUND,
    maxDistance = 6,
    cooldownTime = 60,
    cooldownStorage = 15272
}