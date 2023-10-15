MOVES["Superpower"] = {
    description = "Superpower deals damage but lowers the user's Attack and Defense by one stage each after attacking.",
    makeContact = true,
    category = MOVE_CATEGORY.PHYSICAL,
    clientIconId = 12081,
    iconId = 0,
    dType = DAMAGE_TYPE_FIGHTING,
    functionName = "Superpower",
    type = SKILLS_TYPES.TARGET,
    -- requiredEnergy = 120,
    requiredEnergy = 0,
    requiredLevel = 50,
    damage = 120,
    damageType = ELEMENT_FIGHT,
    effect = EFFECT_MULTIPLE_BLOW,
    projectile = PROJECTILE_ROCK,
    maxDistance = 6,
    cooldownTime = 20,
    cooldownStorage = 15177
}