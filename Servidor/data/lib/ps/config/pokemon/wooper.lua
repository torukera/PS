POKEMON["Wooper"] = {
    pTypes = { ELEMENT_WATER, ELEMENT_GROUND },
    dexStorage = 10194,
    hp = 55,
    speed = 15,

    atk = 45,
    def = 45,
    spAtk = 25,
    spDef = 25,
    energy = 100,
    chance = 100,
    portrait = 17483,
    dexPortrait = 15841,
    fastcallPortrait = 16041,
    catchStorage = 16194,
    evolutions = { { name = "Quagsire", requiredLevel = 35 } },
    description = "When it walks around on the ground, it coats its body with a slimy, poisonous film.",
    skills = { "Tackle", 1, "Water Gun", 5, "Mud Shot", 10, "Slam", 15, "Mud Bomb", 20, "Amnesia", 25, "Earth Power", 30 },
    abilities = { POKEMON_ABILITIES.DIG, POKEMON_ABILITIES.WATERFALL, "Flash", "Surf", "Dive", "Headbutt" },
    eggGroup = { POKEMON_EGG_GROUP_WATER_1, POKEMON_EGG_GROUP_FIELD },
    eggId = 17758,
    eggChance = 20,
    specialAbilities = { POKEMON_SPECIAL_ABILITY_IDS.DAMP, POKEMON_SPECIAL_ABILITY_IDS.WATER_ABSORB },
    learnableTms = { TM_IDS.WATER_PULSE, TM_IDS.DEFENSE_CURL, TM_IDS.SLUDGE_BOMB, TM_IDS.ICE_PUNCH, TM_IDS.MUD_SLAP, TM_IDS.IRON_TAIL, TM_IDS.HEADBUTT, TM_IDS.DYNAMIC_PUNCH, TM_IDS.BLIZZARD, TM_IDS.TOXIC, TM_IDS.DOUBLE_EDGE, TM_IDS.ICE_BEAM, TM_IDS.RAGE, TM_IDS.EARTHQUAKE, TM_IDS.MIMIC, TM_IDS.DOUBLE_TEAM, TM_IDS.REST, TM_IDS.BIDE, TM_IDS.SUBSTITUTE, TM_IDS.HAIL, TM_IDS.SAFEGUARD, TM_IDS.SANDSTORM },
    eggMoves = { "Acid Spray", "After You", "Ancient Power", "Body Slam", "Counter", "Curse", "Double Kick", "Eerie Impulse", "Encore", "Guard Swap", "Mud Sport", "Recover", "Sleep Talk" --[[, "Spit Up", "Stockpile", "Swallow"]] }
}