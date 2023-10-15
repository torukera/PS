POKEMON["Muk"] = {
    pTypes = { ELEMENT_POISON },
    dexStorage = 10089,
    hp = 105,
    speed = 50,

    atk = 105,
    def = 75,
    spAtk = 65,
    spDef = 100,
    energy = 100,
    chance = 300,
    portrait = 12790,
    dexPortrait = 13590,
    fastcallPortrait = 10723,
    catchStorage = 16089,
    evolutions = {},
    description = "It is usually undetectable because it blends in with the ground. Touching it can cause terrible poisoning.",
    skills = { "Tackle", 1, "Pound", 5, "Acid Armor", 10, "Sludge", 15, "Poison Gas", 20, "Mud Bomb", 25, "Sludge Bomb", 30, "Sludge Wave", 40, "Mud-Slap", 45, "Gunk Shot", 50, "Poison Jab", 55, "Acid Spray", 60, "Disable", 65, "Belch", 70 },
    abilities = { POKEMON_ABILITIES.DIG, POKEMON_ABILITIES.STRENGTH },
    eggGroup = { POKEMON_EGG_GROUP_AMORPHOUS },
    eggId = 14015,
    eggChance = 20,
    specialAbilities = { POKEMON_SPECIAL_ABILITY_IDS.STENCH , POKEMON_SPECIAL_ABILITY_IDS.STICKY_HOLD },
    learnableTms = { TM_IDS.POISON_JAB, TM_IDS.FLAMETHROWER, TM_IDS.ROCK_TOMB, TM_IDS.FIRE_PUNCH, TM_IDS.THUNDER_PUNCH, TM_IDS.SLUDGE_BOMB, TM_IDS.ICE_PUNCH, TM_IDS.MUD_SLAP, TM_IDS.SHADOW_BALL, TM_IDS.GIGA_DRAIN, TM_IDS.RAIN_DANCE, TM_IDS.ZAP_CANNON, TM_IDS.DYNAMIC_PUNCH, TM_IDS.ROCK_SLIDE, TM_IDS.TOXIC, TM_IDS.BODY_SLAM, TM_IDS.HYPER_BEAM, TM_IDS.RAGE, TM_IDS.MEGA_DRAIN, TM_IDS.THUNDERBOLT, TM_IDS.THUNDER, TM_IDS.MIMIC, TM_IDS.DOUBLE_TEAM, TM_IDS.BIDE, TM_IDS.SELFDESTRUCT, TM_IDS.FIRE_BLAST, TM_IDS.REST, TM_IDS.EXPLOSION, TM_IDS.SUBSTITUTE, TM_IDS.FOCUS_PUNCH, TM_IDS.TAUNT, TM_IDS.BRICK_BREAK, TM_IDS.SHOCK_WAVE },
    eggMoves = { "Acid Spray", "Curse", "Haze", "Imprison", "Lick", "Mean Look", "Scary Face", "Shadow Punch", "Shadow Sneak" --[[, "Spit Up", "Stockpile", "Swallow"]] }
}

POKEMON["RC Muk"] = table.deepcopy(POKEMON["Muk"])
POKEMON["RC Muk"].pTypes = { ELEMENT_POISON, ELEMENT_NORMAL }
POKEMON["RC Muk"].blockTransform = true

POKEMON["Cloned Muk"] = table.deepcopy(POKEMON["Muk"])
POKEMON["Cloned Muk"].blockTransform = true