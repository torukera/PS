local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

-- function greetCallback(cid)
	-- talkState[cid] = 0
	-- return true
-- end

-- npcHandler:setCallback(CALLBACK_GREET, greetCallback)

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
	
	if (getTaskDificultyByLevel(getPlayerLevel(cid)) > DIFFICULTY_HARD) then
		selfSay("Ol� treinador, voc� n�o pode iniciar uma tarefa comigo, voc� � muito forte.", cid)
		talkState[talkUser] = 0
	return true
	end
	
	if (getTaskDificultyByLevel(getPlayerLevel(cid)) < DIFFICULTY_HARD) then
		selfSay("Ol� treinador, voc� precisa ser pelo menos n�vel 100 para fazer uma tarefa comigo.", cid)
		talkState[talkUser] = 0
	return true
	end
	
	if (msgcontains(msg, 'iniciar')) then
		if (hasTaskStarted(cid) == true) then
			selfSay("Desculpe, voc� n�o pode iniciar outra tarefa at� concluir a tarefa iniciada... ("..getStartedTask(cid)..")", cid)
			talkState[talkUser] = 0
		elseif getTaskCooldown(cid) > 1 then
			selfSay("Desculpe, voc� j� concluiu todas as tr�s tarefas de hoje! Volte amanh� para novas tarefas.", cid)
			talkState[talkUser] = 0
		else
			if not hasDualList(cid) then
				if not generateDualList(cid) then
					selfSay("Desculpe, n�o tenho tarefas para voc� agora.", cid)
					talkState[talkUser] = 0
					return true
				end
			end
			
			if (getFirstTaskPokemon(cid) and getSecondTaskPokemon(cid)) then
				selfSay("Nesse n�vel dif�cio voc� pode derrotar ( "..getFirstTaskPokemon(cid).." ) ou ( "..getSecondTaskPokemon(cid).." ) qual voc� escolhe ?", cid)
				talkState[talkUser] = 1
			else
				selfSay("Desculpe, voc� precisa ter pelo menos n�vel 100 para fazer uma tarefa comigo.", cid)
				talkState[talkUser] = 0
			end
		end
	elseif (msgcontains(msg, 'entregar')) then
		if hasTaskStarted(cid) then
			if getTaskRemainingTime(cid) < 0 then
				selfSay("Voc� n�o conseguiu derrotar os pok�mons a tempo e falhou em sua tarefa, tente iniciar uma nova terefa.", cid)
				doFinishTask(cid, getStartedTaskId(cid), true)
				talkState[talkUser] = 0
			else
				if (getCurrentTaskKills(cid) >= getTaskKillsById(getStartedTaskId(cid))) then
					selfSay("Parab�ns, voc� terminou a tarefa.", cid)
					doFinishTask(cid, getStartedTaskId(cid), false)
					talkState[talkUser] = 0
				else
					selfSay("Desculpe, voc� ainda precisa derrotar "..(getTaskKillsById(getStartedTaskId(cid)) - getCurrentTaskKills(cid)).." "..getStartedTask(cid).." para concluir esta tarefa.", cid)
					talkState[talkUser] = 0
				end
			end
		else
			selfSay("Desculpe, voc� n�o tem nenhuma tarefa iniciada.", cid)
			talkState[talkUser] = 0
		end
	elseif (talkState[talkUser] >= 1 and talkState[talkUser] < 100) then
		for i = 1, #pokemonTaskTable do
			if (msgcontains(msg, getTaskNameById(i))) then 
				if hasTaskStarted(cid) then
					selfSay("Desculpe, voc� n�o pode iniciar outra tarefa at� concluir a tarefa iniciada. ( "..getStartedTask(cid).." )", cid)
					talkState[talkUser] = 0
					break
				else
					if canStartTask(cid, i) then
						selfSay("Voc� ter� que derrotar "..getTaskKillsById(i).." "..getTaskNameById(i).."s, tem certeza?", cid)
						talkState[talkUser] = 100 + i
						break
					else
						selfSay(EXCEED_TASK_LEVEL_ERROR, cid)
						break
					end
				end
			end
		end
	elseif talkState[talkUser] > 100 then
		local taskId = talkState[talkUser] - 100
		selfSay("Tudo bem, n�o perca seu tempo! Voc� deve derrotar todos esses pok�mons e voltar aqui para receber sua recompensa!", cid)
		startTask(cid, taskId)
		talkState[talkUser] = 0
	end
return true
end

npcHandler:setMessage(MESSAGE_GREET, "Ol�, eu posso te dar uma tarefa di�ria para derrotar Pok�mons! Pode ajud�-lo a treinar sua experi�ncia de batalha. Eu posso te dar tr�s miss�es no n�vel Dif�cio por dia. Oque voc� deseja ( iniciar ) ou ( entregar )?")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())