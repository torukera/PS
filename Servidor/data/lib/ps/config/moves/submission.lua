MOVES["Submission"] = {
    description = "Submission deals damage and has no secondary effect.",
    makeContact = true,
    makeRecoil = true,
    category = MOVE_CATEGORY.PHYSICAL,
    clientIconId = 12097,
    iconId = 0,
    dType = DAMAGE_TYPE_FIGHTING,
    functionName = "Submission",
    type = SKILLS_TYPES.TARGET,
    -- requiredEnergy = 8
    requiredEnergy = 0,0,
    requiredLevel = 35,
    damage = 80,
    damageType = ELEMENT_FIGHT,
    effect = EFFECT_FIRE_PUNCH,
    projectile = nil,
    maxDistance = 1,
    cooldownTime = 12,
    cooldownStorage = 15193
}