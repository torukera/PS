MOVES["Healing Wish"] = {
    description = "The user become with 1 HP and all party members recover full HP.",
    makeHeal = false,
    wildBlock = true,
    category = MOVE_CATEGORY.STATUS,
    clientIconId = 12083,
    iconId = 0,
    dType = DAMAGE_TYPE_PSYCHIC,
    functionName = "HealingWish",
    type = SKILLS_TYPES.AREA,
    -- requiredEnergy = 150,
    requiredEnergy = 0,
    requiredLevel = 60,
    damage = 250,
    damageType = ELEMENT_PSYCHIC,
    effect = EFFECT_BLUE_BUFF,
    projectile = nil,
    areaEffect = EFFECT_LOVE_HEARTS_TWO,
    areaName = "bigArea",
    area = bigArea,
    cooldownTime = 90,
    cooldownStorage = 15179
}