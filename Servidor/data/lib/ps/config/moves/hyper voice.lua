MOVES["Hyper Voice"] = {
    description = "Hyper Voice inflicts damage and has no secondary effect.",
    makeSound = true,
    category = MOVE_CATEGORY.SPECIAL,
    clientIconId = 11791,
    iconId = 13417,
    dType = DAMAGE_TYPE_NORMAL,
    functionName = "HyperVoice",
    type = SKILLS_TYPES.AREA,
    -- requiredEnergy = 100,
    requiredEnergy = 0,
    requiredLevel = 40,
    damage = 90,
    damageType = ELEMENT_NORMAL,
    effect = EFFECT_BLOW,
    areaEffect = EFFECT_BLUE_SOUND,
    projectile = PROJECTILE_SOUND,
    areaName = "bigArea",
    area = bigArea,
    cooldownTime = 21,
    cooldownStorage = 15100
}