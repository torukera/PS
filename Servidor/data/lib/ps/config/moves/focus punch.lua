MOVES["Focus Punch"] = {
    description = "Focus Punch charge during 5 turns and then deals damage.",
    makeContact = true,
    makePunch = true,
    category = MOVE_CATEGORY.PHYSICAL,
    clientIconId = 13109,
    iconId = 0,
    dType = DAMAGE_TYPE_FIGHTING,
    functionName = "FocusPunch",
    type = SKILLS_TYPES.TARGET,
    -- requiredEnergy = 150,
    requiredEnergy = 0,
    requiredLevel = 35,
    damage = 150,
    damageType = ELEMENT_FIGHT,
    effect = EFFECT_SCRATCH_SEVEN,
    projectile = PROJECTILE_GRAVEL,
    maxDistance = 1,
    cooldownTime = 25,
    cooldownStorage = 15245
}