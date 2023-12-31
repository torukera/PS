MOVES["Toxic Spikes"] = {
    description = "Toxic Spikes deals damage and inflicts Poison, if the target already is Poisoned then inflicits Badly Poison.",
    category = MOVE_CATEGORY.STATUS,
    clientIconId = 12066,
    iconId = 0,
    dType = DAMAGE_TYPE_POISON,
    functionName = "ToxicSpikes",
    type = SKILLS_TYPES.TARGET,
    -- requiredEnergy = 70,
    requiredEnergy = 0,
    requiredLevel = 20,
    damage = 10,
    damageType = ELEMENT_POISON,
    effect = EFFECT_POISON_TWO,
    projectile = nil,
    areaEffect = EFFECT_POISON_GAS_TWO,
    maxDistance = 6,
    cooldownTime = 8,
    cooldownStorage = 15159
}