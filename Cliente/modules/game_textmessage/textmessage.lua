MessageSettings = {
  none            = {},
  consoleRed      = { color = TextColors.red,    consoleTab='Default' },
  consoleOrange   = { color = TextColors.orange, consoleTab='Default' },
  consoleBlue     = { color = TextColors.blue,   consoleTab='Default' },
  centerRed       = { color = TextColors.red,    consoleTab='Server Log', screenTarget='lowCenterLabel' },
  centerGreen     = { color = TextColors.green,  consoleTab='Server Log', screenTarget='highCenterLabel',   consoleOption='showInfoMessagesInConsole' },
  centerWhite     = { queue = true, color = TextColors.white,  consoleTab='Server Log', screenTarget='middleCenterLabel', consoleOption='showEventMessagesInConsole' },
  bottomWhite     = { color = TextColors.white,  consoleTab='Server Log', screenTarget='statusLabel',       consoleOption='showEventMessagesInConsole' },
  status          = { color = TextColors.white,  consoleTab='Server Log', screenTarget='statusLabel',       consoleOption='showStatusMessagesInConsole' },
  statusSmall     = { color = TextColors.white,                           screenTarget='statusLabel' },
  private         = { color = TextColors.lightblue,                       screenTarget='privateLabel' }
}

local currentQueue
local queue = {}

local function proccessQueue()
    if (currentQueue) then
        return
    end

    if #queue > 0 then
        local msg = queue[1]
        msg.execute()
        currentQueue = msg
    end
end

local function insertQueue(messageFunction)
    queue[#queue + 1] = {execute = messageFunction}
    proccessQueue()
end

MessageTypes = {
  [MessageModes.MonsterSay] = MessageSettings.consoleOrange,
  [MessageModes.MonsterYell] = MessageSettings.consoleOrange,
  [MessageModes.BarkLow] = MessageSettings.consoleOrange,
  [MessageModes.BarkLoud] = MessageSettings.consoleOrange,
  [MessageModes.Failure] = MessageSettings.statusSmall,
  [MessageModes.Login] = MessageSettings.bottomWhite,
  [MessageModes.Game] = MessageSettings.centerWhite,
  [MessageModes.Status] = MessageSettings.status,
  [MessageModes.Warning] = MessageSettings.centerRed,
  [MessageModes.Look] = MessageSettings.centerGreen,
  [MessageModes.Loot] = MessageSettings.centerGreen,
  [MessageModes.Red] = MessageSettings.consoleRed,
  [MessageModes.Blue] = MessageSettings.consoleBlue,
  [MessageModes.PrivateFrom] = MessageSettings.consoleBlue,

  [MessageModes.GamemasterBroadcast] = MessageSettings.consoleRed,

  [MessageModes.DamageDealed] = MessageSettings.status,
  [MessageModes.DamageReceived] = MessageSettings.status,
  [MessageModes.Heal] = MessageSettings.status,
  [MessageModes.Exp] = MessageSettings.status,

  [MessageModes.DamageOthers] = MessageSettings.none,
  [MessageModes.HealOthers] = MessageSettings.none,
  [MessageModes.ExpOthers] = MessageSettings.none,

  [MessageModes.TradeNpc] = MessageSettings.centerWhite,
  [MessageModes.Guild] = MessageSettings.centerWhite,
  [MessageModes.Party] = MessageSettings.centerGreen,
  [MessageModes.PartyManagement] = MessageSettings.centerWhite,
  [MessageModes.TutorialHint] = MessageSettings.centerWhite,
  [MessageModes.Market] = MessageSettings.centerWhite,
  [MessageModes.BeyondLast] = MessageSettings.centerWhite,
  [MessageModes.Report] = MessageSettings.consoleRed,
  [MessageModes.HotkeyUse] = MessageSettings.centerGreen,

  [254] = MessageSettings.private
}

messagesPanel = nil

function init()
  connect(g_game, 'onTextMessage', displayMessage)
  connect(g_game, 'onGameEnd', clearMessages)
  messagesPanel = g_ui.loadUI('textmessage', modules.game_interface.getRootPanel())
end

function terminate()
  disconnect(g_game, 'onTextMessage', displayMessage)
  disconnect(g_game, 'onGameEnd', clearMessages)
  clearMessages()
  messagesPanel:destroy()
end

function calculateVisibleTime(text)
  return math.max(#text * 100, 4000)
end

function displayMessage(mode, text)
  if not g_game.isOnline() then return end

  local msgtype = MessageTypes[mode]

  if not msgtype then
    perror('unhandled onTextMessage message mode ' .. mode .. ': ' .. text)
    return
  end

  if msgtype == MessageSettings.none then return end

  if msgtype.consoleTab ~= nil and (msgtype.consoleOption == nil or modules.client_options.getOption(msgtype.consoleOption)) then
    modules.game_chat.addText(text, msgtype, tr(msgtype.consoleTab))
    --TODO move to game_console
  end

  if msgtype.screenTarget then
    if msgtype.queue then
        insertQueue(function()
        local label = messagesPanel:recursiveGetChildById(msgtype.screenTarget)
        label:setText(text)
        label:setColor(msgtype.color)
        label:setVisible(true)
        removeEvent(label.hideEvent)
        label.hideEvent = scheduleEvent(function() label:setVisible(false) table.remove(queue, 1) currentQueue = nil proccessQueue() end,
            calculateVisibleTime(text))
      end)
        return
    end

    local label = messagesPanel:recursiveGetChildById(msgtype.screenTarget)
    label:setText(text)
    label:setColor(msgtype.color)
    label:setVisible(true)
    removeEvent(label.hideEvent)
    label.hideEvent = scheduleEvent(function() label:setVisible(false) end, calculateVisibleTime(text))
	if string.find(text, '&sco&') then return end
    local label = messagesPanel:recursiveGetChildById(msgtype.screenTarget)
    label:setText(text)
    if label:getOpacity() == 0 then
      addEvent(function() g_effects.fadeIn(label, 250) end)
    end
    label:setColor(msgtype.color)
    removeEvent(label.hideEffect)
    label.hideEffect = scheduleEvent(function() addEvent(function() g_effects.fadeOut(label, 250) end) end, calculateVisibleTime(text) - 250)
  end
end

function displayPrivateMessage(text)
  displayMessage(254, text)
end

function displayStatusMessage(text)
  displayMessage(MessageModes.Status, text)
end

function displayFailureMessage(text)
  displayMessage(MessageModes.Failure, text)
end

function displayGameMessage(text)
  displayMessage(MessageModes.Game, text)
end

function displayBroadcastMessage(text)
  displayMessage(MessageModes.Warning, text)
end

function clearMessages()
  for _i,child in pairs(messagesPanel:recursiveGetChildren()) do
    if child:getId():match('Label') then
      child:hide()
      removeEvent(child.hideEvent)
    end
  end
  currentQueue = nil
  queue = {}
end

function LocalPlayer:onAutoWalkFail(player)
  modules.game_textmessage.displayFailureMessage(tr('There is no way.'))
end
