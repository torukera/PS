InventorySlotStyles = {
  [InventorySlotHead] = "HeadSlot",
  [InventorySlotNeck] = "NeckSlot",
  [InventorySlotBack] = "BackSlot",
  [InventorySlotBody] = "BodySlot",
  [InventorySlotRight] = "RightSlot",
  [InventorySlotLeft] = "LeftSlot",
  [InventorySlotLeg] = "LegSlot",
  [InventorySlotFeet] = "FeetSlot",
  [InventorySlotFinger] = "FingerSlot",
  [InventorySlotAmmo] = "AmmoSlot"
}

inventoryWindow = nil
inventoryPanel = nil
inventoryButton = nil
purseButton = nil

function init()
  connect(LocalPlayer, { onInventoryChange = onInventoryChange })
  connect(g_game, { onGameStart = refresh })

  g_keyboard.bindKeyDown('Ctrl+I', toggle)

  inventoryButton = modules.client_topmenu.addRightGameToggleButton('inventoryButton', tr('Inventory') .. ' (Ctrl+I)', '/images/topbuttons/inventory', toggle)
  inventoryButton:setOn(true)

  inventoryWindow = g_ui.loadUI('inventory', modules.game_interface.getRightPanel())
  inventoryWindow:disableResize()
  inventoryPanel = inventoryWindow:getChildById('contentsPanel')

  purseButton = inventoryPanel:getChildById('purseButton')
  local function purseFunction()
    local purse = g_game.getLocalPlayer():getInventoryItem(InventorySlotPurse)
    if purse then
      g_game.use(purse)
    end
  end
  purseButton.onClick = purseFunction

  refresh()
  inventoryWindow:setup()
end

function terminate()
  disconnect(LocalPlayer, { onInventoryChange = onInventoryChange })
  disconnect(g_game, { onGameStart = refresh })

  g_keyboard.unbindKeyDown('Ctrl+I')

  inventoryWindow:destroy()
  inventoryButton:destroy()
end

function refresh()
  local player = g_game.getLocalPlayer()
  for i = InventorySlotFirst, InventorySlotPurse do
    if g_game.isOnline() then
      onInventoryChange(player, i, player:getInventoryItem(i))
    else
      onInventoryChange(player, i, nil)
    end
  end

  purseButton:setVisible(g_game.getFeature(GamePurseSlot))
end

function toggle()
  if inventoryButton:isOn() then
    inventoryWindow:close()
    inventoryButton:setOn(false)
  else
    inventoryWindow:open()
    inventoryButton:setOn(true)
  end
end

function onMiniWindowClose()
  inventoryButton:setOn(false)
end

function StackingMoney()
  local stackingButton = containerWindow:getChildById('stackingButton')
  stackingButton.onClick = function()
  local protocolGame = g_game.getProtocolGame()
  if protocolGame then
      protocolGame:sendExtendedOpcode(141, 1)
  end
  end
  stackingButton:setVisible(true)
end

-- hooked events
function onInventoryChange(player, slot, item, oldItem)
  if slot > InventorySlotPurse then return end

  if slot == InventorySlotPurse then
    if g_game.getFeature(GamePurseSlot) then
      purseButton:setEnabled(item and true or false)
    end
    return
  end

  local itemWidget = inventoryPanel:getChildById('slot' .. slot)
  if (not itemWidget) then
      return
  end
  if item then
    itemWidget:setStyle('Item')
    itemWidget:setItem(item)
  else
    itemWidget:setStyle(InventorySlotStyles[slot])
    itemWidget:setItem(nil)
  end
end
