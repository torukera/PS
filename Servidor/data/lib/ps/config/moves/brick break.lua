MOVES["Brick Break"] = {
    description = "Brick Break deals damage, but removes the effects of Reflect before attacking.",
    makeJump = true,
    makeContact = true,
    category = MOVE_CATEGORY.PHYSICAL,
    clientIconId = 11700,
    iconId = 13326,
    dType = DAMAGE_TYPE_FIGHTING,
    functionName = "BrickBreak",
    type = SKILLS_TYPES.TARGET,
    -- requiredEnergy = 75,
    requiredEnergy = 0,
    requiredLevel = 30,
    damage = 75,
    damageType = ELEMENT_FIGHT,
    effect = EFFECT_BIG_PUNCH,
    projectile = nil,
    maxDistance = 1,
    cooldownTime = 12,
    cooldownStorage = 15008
}