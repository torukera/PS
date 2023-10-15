function onKill(cid, target, lastHit)

  -- Se for um monstro summon que morreu, ignora
  if getCreatureMaster(target) ~= target then    
    return true
  end

  local _creature_name = getCreatureName(target):lower() -- lembrando que o nome da task � sempre diferente

  local _taskname, _tasktable = task.getTaskTableByTarget(cid, _creature_name) -- funcao retorna duplo parametro  
    
  -- Achievement de matar bosses (configurar em lib/task_kill.lua) 
  local achiev = TABLE_ACHIEVEMENT_BOSS[_creature_name]
  if achiev then
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Parab�ns voc� achou o Pok�mon ditto.')
  end

  -- Sistema de Tasks de Monstros
  if not _taskname or not _tasktable then
    return true
  end

  if task.doing(cid, _taskname) then
    if not task.killedNeededCount(cid, _taskname) then
      local kills = task.kills(cid, _taskname)
      task.doSetKills(cid, _taskname, kills + 1)

      local response = {
         WindowName = "modulo",
         PokeName = _taskname,
         PokeInfo = {
         	PokeSprite = _taskname,
         	KillCount = kills + 1 .. " de " .. _tasktable.count,
         },
      }
	  doSendPlayerExtendedOpcode(cid, GameServerOpcodes.PokeKill, json.encode(response))
	  
      if kills + 1 == _tasktable.count then
      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Parab�ns voc� completou sua miss�o, colete sua recompensa no painel de miss�es.')
	  end
      
    end
  end

  return true
end