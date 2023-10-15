POKEMON["Beedrill"] = {
    pTypes = { ELEMENT_BUG, ELEMENT_POISON },
    dexStorage = 10015,
    hp = 65,
    speed = 75,

    atk = 90,
    def = 40,
    spAtk = 45,
    spDef = 80,
    energy = 100,
    chance = 250,
    portrait = 12716,
    dexPortrait = 13516,
    fastcallPortrait = 10649,
    catchStorage = 16015,
    evolutions = {},
    description = "May appear in a swarm. Flies at violent speeds, all the while stabbing with the toxic stinger on its rear.",
    skills = { "Tackle", 1, "Bug Bite", 5, "String Shot", 10, "Fury Attack", 15, "Twineedle", 20, "Poison Jab", 25, "Roost", 30, "Pin Missile", 35, "Toxic Spikes", 40, "Harden", 45, "Assurance", 50, "Aerial Ace", 55, "Agility", 60, "X-Scissor", 65, "Endeavor", 70, "Focus Energy", 75 },
    abilities = { "Find", "Cut" },
    eggGroup = { POKEMON_EGG_GROUP_BUG },
    eggId = 13982,
    eggChance = 20,
    specialAbilities = { POKEMON_SPECIAL_ABILITY_IDS.SWARM },
    learnableTms = { TM_IDS.SOFTBOILED, TM_IDS.POISON_JAB, TM_IDS.AERIAL_ACE, TM_IDS.FURY_CUTTER, TM_IDS.SLUDGE_BOMB, TM_IDS.SWORDS_DANCE, TM_IDS.TOXIC, TM_IDS.TAKE_DOWN, TM_IDS.DOUBLE_EDGE, TM_IDS.HYPER_BEAM, TM_IDS.RAGE, TM_IDS.MEGA_DRAIN, TM_IDS.MIMIC, TM_IDS.DOUBLE_TEAM, TM_IDS.REFLECT, TM_IDS.BIDE, TM_IDS.SWIFT, TM_IDS.SKULL_BASH, TM_IDS.REST, TM_IDS.SUBSTITUTE, TM_IDS.BRICK_BREAK }
}

POKEMON["RC Beedrill"] = table.deepcopy(POKEMON["Beedrill"])
POKEMON["RC Beedrill"].pTypes = { ELEMENT_POISON, ELEMENT_NORMAL }
POKEMON["RC Beedrill"].blockTransform = true