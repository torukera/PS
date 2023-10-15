POKEMON["Magmar"] = {
    pTypes = { ELEMENT_FIRE },
    dexStorage = 10126,
    hp = 65,
    speed = 93,

    atk = 95,
    def = 57,
    spAtk = 100,
    spDef = 85,
    energy = 100,
    chance = 800,
    portrait = 12827,
    dexPortrait = 13627,
    fastcallPortrait = 10760,
    catchStorage = 16126,
    evolutions = {},
    description = "Found near the mouth of a volcano. This fire-breather's body temperature is nearly 2,200 degrees Fahrenheit.",
    skills = { "Tackle", 1, "Smog", 5, "Ember", 10, "Faint Attack", 15, "Fire Spin", 20, "Clear Smog", 25, "Sunny Day", 30, "Fire Punch", 35, "Flamethrower", 40, "Flare Blitz", 45, "Lava Plume", 50, "Flame Burst", 55, "Confuse Ray", 60, "Fire Blast", 65, "Focus Punch", 70 },
    abilities = { POKEMON_ABILITIES.ROCK_CLIMB, POKEMON_ABILITIES.STRENGTH, "Rock Smash", "Headbutt" },
    eggGroup = { POKEMON_EGG_GROUP_HUMAN_LIKE },
    eggId = 14039,
    eggChance = 1,
    specialAbilities = { POKEMON_SPECIAL_ABILITY_IDS.FLAME_BODY },
    learnableTms = { TM_IDS.SOFTBOILED, TM_IDS.FLAMETHROWER, TM_IDS.FIRE_PUNCH, TM_IDS.THUNDER_PUNCH, TM_IDS.MUD_SLAP, TM_IDS.IRON_TAIL, TM_IDS.HEADBUTT, TM_IDS.DYNAMIC_PUNCH, TM_IDS.MEGA_PUNCH, TM_IDS.MEGA_KICK, TM_IDS.TOXIC, TM_IDS.BODY_SLAM, TM_IDS.TAKE_DOWN, TM_IDS.DOUBLE_EDGE, TM_IDS.HYPER_BEAM, TM_IDS.SUBMISSION, TM_IDS.COUNTER, TM_IDS.SEISMIC_TOSS, TM_IDS.RAGE, TM_IDS.PSYCHIC, TM_IDS.MIMIC, TM_IDS.DOUBLE_TEAM, TM_IDS.REFLECT, TM_IDS.BIDE, TM_IDS.METRONOME, TM_IDS.FIRE_BLAST, TM_IDS.SKULL_BASH, TM_IDS.REST, TM_IDS.PSYWAVE, TM_IDS.SUBSTITUTE, TM_IDS.FOCUS_PUNCH, TM_IDS.BRICK_BREAK, TM_IDS.OVERHEAT },
    eggMoves = { "Barrier", "Belch", "Belly Drum", "Cross Chop", "Dynamic Punch", "Flare Blitz", "Focus Energy", "Iron Tail", "Karate Chop", "Mach Punch", "Mega Punch", "Power Swap", "Screech", "Thunder Punch" }
}

POKEMON["RC Magmar"] = table.deepcopy(POKEMON["Magmar"])
POKEMON["RC Magmar"].pTypes = { ELEMENT_POISON, ELEMENT_NORMAL }
POKEMON["RC Magmar"].blockTransform = true

POKEMON["Cloned Magmar"] = table.deepcopy(POKEMON["Magmar"])
POKEMON["Cloned Magmar"].blockTransform = true