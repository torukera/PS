local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler, CONVERSATION_DEFAULT)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

local npcBattle = NpcBattle:new(getNpcName(), 9204, 9604, npcHandler, 11041)
npcBattle:setPokemons({"Ampharos", "Ledian", "Noctowl", "Meganium", "Tauros", "Kangaskhan"})
npcBattle:setDifficulty(75)
npcBattle:setRewardUniqueItems({18128, 6})
npcBattle:setOnWin(function(cid)
    doPlayerAddHighscoreValue(cid, HIGHSCORE_IDS.BATTLE_TOWER_TWENTY, 110)
    doPlayerAddHighscoreValue(cid, HIGHSCORE_IDS.FRONTIER_ISLAND, 11)
end)
npcBattle:setEvolve(false)
npcBattle:setRequired(function(cid)
    return getPlayerFrontierIsland(cid)
end)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink()	npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(msgcontains(msg, 'battle') or msgcontains(msg, 'fight') or msgcontains(msg, 'duel') or msgcontains(msg, 'batalha') or msgcontains(msg, 'duelar')) then
		talkState[talkUser] =  npcBattle:doTalkStart(getNpcId(), cid)

	elseif(msgcontains(msg, 'yes') or msgcontains(msg, 'sim')) then
		talkState[talkUser] =  npcBattle:doTalkEnd(getNpcId(), cid, talkState[talkUser])

	else
		selfSay("Ok..", cid)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
