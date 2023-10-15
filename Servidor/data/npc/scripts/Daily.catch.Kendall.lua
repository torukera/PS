local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {} -- VERY HARD -->

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

local function timeString(timeDiff)
	local dateFormat = {
		{"dia", timeDiff / 60 / 60 / 24},
		{"hora", timeDiff / 60 / 60 % 24},
		{"minuto", timeDiff / 60 % 60},
		{"segundo", timeDiff % 60}
	}

    local out = {}
	for k, t in ipairs(dateFormat) do
        local v = math.floor(t[2])
		if(v > 0) then
            table.insert(out, (k < #dateFormat and (#out > 0 and ', ' or '') or ' e ') .. v .. ' ' .. t[1] .. (v ~= 1 and 's' or ''))
        end
    end

    local ret = table.concat(out)
	if ret:len() < 16 and ret:find("segundo") then
        local a, b = ret:find(" e ")
        ret = ret:sub(b+1)
    end
return ret
end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if talkState[talkUser] == nil then
		talkState[talkUser] = 0
	end
	
	if (getCatchDificultyByLevel(getPlayerLevel(cid)) < PCATCH_DIFFICULTY_VERY_HARD) then
		selfSay("Ol� treinador, voc� precisa ter pelo menos lvl 150 para iniciar uma tarefa de captura.", cid)
		talkState[talkUser] = 0
	return true
	end
	
	if (getCatchDificultyByLevel(getPlayerLevel(cid)) > PCATCH_DIFFICULTY_VERY_HARD) then
		selfSay("Ol� treinador, suas habilidades s�o muito maior do que as que eu procuro.", cid)
		talkState[talkUser] = 0
	return true
	end
	
	if (msgcontains(msg, 'tarefa')) then
		if (hasCatchStarted(cid) == true) then
			selfSay("Desculpe, voc� n�o pode iniciar outra tarefa de captura at� concluir a tarefa iniciada... ("..getStartedCatch(cid)..")", cid)
			talkState[talkUser] = 0
		elseif getCatchCooldown(cid) < 1 then
			selfSay("Desculpe, voc� j� concluiu todas as tr�s tarefas diarias! Volte amanh� para mais tarefas.", cid)
			talkState[talkUser] = 0
		else
			if not hasDualCList(cid) then
				if not generateDualCList(cid) then
					selfSay("Desculpe, n�o tenho tarefas de captura para voc� agora.", cid)
					talkState[talkUser] = 0
					return true
				end
			end
			
			if (getFirstCatchPokemon(cid) and getSecondCatchPokemon(cid)) then
				selfSay("Voc� j� � forte o suficiente para come�ar com uma captura Muito dificil, voc� pode tentar pegar um "..getFirstCatchPokemon(cid).." ou um "..getSecondCatchPokemon(cid)..", qual voc� quer tentar?", cid)
				talkState[talkUser] = 1
			else
				selfSay("Desculpe, voc� precisa ter pelo menos lvl 150 para iniciar uma tarefa de captura.", cid)
				talkState[talkUser] = 0
			end
		end
	elseif (msgcontains(msg, 'entregar')) then
		if hasCatchStarted(cid) then
			if haveDoneCatchTask(cid) then
				selfSay("Parab�ns conseguiu capturar o pok�mon, vamos para a pr�xima miss�o ? diga ( tarefa ) novamente.", cid)
				doFinishCatch(cid, getStartedCatchId(cid), false)
				talkState[talkUser] = 0
			else
				selfSay("Desculpe, voc� ainda precisa pegar um "..getStartedCatch(cid).." para concluir esta tarefa.", cid)
				talkState[talkUser] = 0
			end
		else
			selfSay("Desculpe, voc� n�o tem nenhuma tarefa de captura iniciada.", cid)
			talkState[talkUser] = 0
		end
	elseif (talkState[talkUser] >= 1 and talkState[talkUser] < 100) then
		for i = 1, #pokemonCatchTable do
			if (msgcontains(msg, getCatchNameById(i))) then 
				if hasCatchStarted(cid) then
					selfSay("Desculpe, voc� n�o pode iniciar outra tarefa de captura at� concluir a tarefa iniciada. ("..getStartedCatch(cid)..")", cid)
					talkState[talkUser] = 0
					break
				else
					if canStartCatch(cid, i) then
						selfSay("Voc� ter� que capturar um "..getCatchNameById(i)..", tem certeza?", cid)
						talkState[talkUser] = 100 + i
						break
					else
						selfSay(EXCEED_CTASK_LEVEL_ERROR, cid)
						break
					end
				end
			end
		end
	elseif talkState[talkUser] > 100 then
		local taskId = talkState[talkUser] - 100
		selfSay("Ok, n�o perca seu tempo! voc� deve capturar o pok�mon e voltar aqui para continuar sua miss�o antes que o dia acabe, vejo voc� em breve.", cid)
		startCatch(cid, taskId)
		talkState[talkUser] = 0
	end
return true
end

npcHandler:setMessage(MESSAGE_GREET, "Ol�, posso dar-lhe algumas tarefas di�rias de captura! Pode ajudar a melhorar sua experi�ncia de captura. Eu posso te dar tres tarefas por dia, voc� quer come�ar ? Deseja iniciar uma ( tarefa ) ou ( entregar )?")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())