POKEMON["Wurmple"] = {
    pTypes = { ELEMENT_BUG },
    dexStorage = 10265,
    hp = 45,
    speed = 20,

    atk = 45,
    def = 35,
    spAtk = 20,
    spDef = 30,
    energy = 100,
    chance = 60,
    portrait = 28413,
    dexPortrait = -1,
    fastcallPortrait = 27257,
    catchStorage = -1,
    evolutions = {
        { name = "Silcoon", requiredLevel = 15, random = true },
        { name = "Cascoon", requiredLevel = 15, random = true },
    },
    description = "It loves to eat leaves. If it is attacked by a Starly, it will defend itself with its spiked rear.",
    skills = { "Tackle", 1, "Poison Sting", 5, "String Shot", 7, "Bug Bite", 10 },
    abilities = {  },
    eggGroup = { POKEMON_EGG_GROUP_BUG },
    eggId = 28595,
    eggChance = 20,
    specialAbilities = { POKEMON_SPECIAL_ABILITY_IDS.SHIELD_DUST },
    learnableTms = { --[[ TODO ]] },
    eggMoves = { --[[ TODO ]] }
}