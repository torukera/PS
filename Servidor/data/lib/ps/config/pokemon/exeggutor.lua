POKEMON["Exeggutor"] = {
    pTypes = { ELEMENT_GRASS, ELEMENT_PSYCHIC },
    dexStorage = 10103,
    hp = 95,
    speed = 55,

    atk = 95,
    def = 85,
    spAtk = 125,
    spDef = 65,
    energy = 100,
    chance = 500,
    portrait = 12804,
    dexPortrait = 13604,
    fastcallPortrait = 10737,
    catchStorage = 16103,
    evolutions = {},
    description = "It is called 'The Walking Tropical Rainforest.' Each of the nuts has a face and a will of its own.",
    skills = { "Tackle", 1, "Leech Seed", 5, "Confusion", 10, "Bullet Seed", 15, "Poison Powder", 20, "Egg Bomb", 25, "Hypnosis", 30, "Razor Leaf", 40, "Stun Spore", 45, "Psychic", 50, "Leaf Storm", 55, "Solar Beam", 60, "Psyshock", 65, "Worry Seed", 70 },
    abilities = { POKEMON_ABILITIES.STRENGTH, "Rock Smash", "Headbutt" },
    eggGroup = { POKEMON_EGG_GROUP_GRASS },
    eggId = 14022,
    eggChance = 20,
    specialAbilities = { POKEMON_SPECIAL_ABILITY_IDS.CHLOROPHYLL },
    learnableTms = { TM_IDS.ENERGY_BALL, TM_IDS.NIGHTMARE, TM_IDS.SLUDGE_BOMB, TM_IDS.GIGA_DRAIN, TM_IDS.HEADBUTT, TM_IDS.DREAM_EATER, TM_IDS.TOXIC, TM_IDS.TAKE_DOWN, TM_IDS.DOUBLE_EDGE, TM_IDS.HYPER_BEAM, TM_IDS.RAGE, TM_IDS.MEGA_DRAIN, TM_IDS.SOLAR_BEAM, TM_IDS.PSYCHIC, TM_IDS.MIMIC, TM_IDS.DOUBLE_TEAM, TM_IDS.REFLECT, TM_IDS.BIDE, TM_IDS.SELFDESTRUCT, TM_IDS.EGG_BOMB, TM_IDS.REST, TM_IDS.PSYWAVE, TM_IDS.EXPLOSION, TM_IDS.SUBSTITUTE, TM_IDS.BULLET_SEED, TM_IDS.LIGHT_SCREEN },
    eggMoves = { "Ancient Power", "Block", "Curse", "Giga Drain", "Grassy Terrain", "Ingrain", "Leaf Storm", "Lucky Chant", "Moonlight", "Natural Gift", "Nature Power", "Power Swap", "Skill Swap", "Synthesis" }
}

POKEMON["Cloned Exeggutor"] = table.deepcopy(POKEMON["Exeggutor"])
POKEMON["Cloned Exeggutor"].blockTransform = true