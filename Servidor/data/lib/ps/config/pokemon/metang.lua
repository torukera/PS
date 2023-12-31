POKEMON["Metang"] = {
    pTypes = { ELEMENT_STEEL, ELEMENT_PSYCHIC },
    dexStorage = 10375,
    hp = 60,
    speed = 50,

    atk = 75,
    def = 100,
    spAtk = 55,
    spDef = 80,
    energy = 100,
    chance = 750,
    portrait = 28524,
    dexPortrait = -1,
    fastcallPortrait = 27368,
    catchStorage = -1,
    evolutions = { { name = "Metagross", requiredLevel = 50 } },
    description = "It is formed by two Beldum joining together. Its steel body won't be scratched if it collides with a jet.",
    skills = { "Tackle", 1, "Confusion", 5, "Metal Claw", 10, "Take Down", 15, "Pursuit", 20, "Iron Defense", 25, "Psychic", 35, "Zen Headbutt", 40, "Bullet Punch", 45 },
    abilities = { "Cut", "Strenght", "Flash", "Rock Smash", POKEMON_ABILITIES.BLINK, POKEMON_ABILITIES.TELEPORT },
    eggGroup = { POKEMON_EGG_GROUP_MINERAL },
    eggId = 28542,
    eggChance = 20,
    specialAbilities = { POKEMON_SPECIAL_ABILITY_IDS.CLEAR_BODY },
    learnableTms = { TM_IDS.TOXIC, TM_IDS.HYPER_BEAM, TM_IDS.PROTECT, TM_IDS.RAIN_DANCE, TM_IDS.EARTHQUAKE, TM_IDS.PSYCHIC, TM_IDS.SHADOW_BALL, TM_IDS.DOUBLE_TEAM, TM_IDS.REFLECT, TM_IDS.SLUDGE_BOMB, TM_IDS.ROCK_TOMB, TM_IDS.AERIAL_ACE, TM_IDS.REST, TM_IDS.EXPLOSION, TM_IDS.ROCK_SLIDE, TM_IDS.SUBSTITUTE, TM_IDS.LIGHT_SCREEN, TM_IDS.BRICK_BREAK, TM_IDS.SANDSTORM },
    eggMoves = { --[[ TODO ]] }
}