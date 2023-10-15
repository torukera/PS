MOVES["Phantom Force"] = {
    description = "The user vanishes somewhere, then strikes the target on the next turn.",
    category = MOVE_CATEGORY.PHYSICAL,
    clientIconId = 27592,
    iconId = 0,
    dType = DAMAGE_TYPE_GHOST,
    type = SKILLS_TYPES.TARGET,
    -- requiredEnergy = 10
    requiredEnergy = 0,0,
    damage = 90,
    damageType = ELEMENT_GHOST,
    effect = EFFECT_DARK_PULSE,
    projectile = PROJECTILE_DARK_SHOT,
    maxDistance = 6,
    cooldownTime = 20,
    cooldownStorage = 15425,
    makeContact = true,
}