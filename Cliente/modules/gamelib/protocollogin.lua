-- @docclass
ProtocolLogin = extends(Protocol, "ProtocolLogin")

LoginServerError = 10
LoginServerUpdate = 17
LoginServerMotd = 20
LoginServerUpdateNeeded = 30
LoginServerCharacterList = 100
LoginServerExtendedCharacterList = 101

accountChacterName = ""
accountPokemon = 1
accountSexo = 0
accountCity = 1
accountWorld = 0
accountEmail = ""

function ProtocolLogin:CreateAccount(host, port, accountName, accountPassword, accountChacterName, accountPokemon, accountSexo, accountCity, accountEmail)
  if string.len(host) == 0 or port == nil or port == 0 then
    signalcall(self.onLoginError, self, tr("You must enter a valid server address and port."))
    return
  end

  self.accountName = accountName
  self.accountPassword = accountPassword
  self.accountChacterName = accountChacterName
  self.accountPokemon = accountPokemon
  self.accountSexo = accountSexo
  self.accountCity = accountCity
  self.accountWorld = accountWorld
  self.accountEmail = accountEmail
  self.connectCallback = self.sendCreateAccountPacket

  self:connect(host, port)
end

function ProtocolLogin:sendCreateAccountPacket()
  local msg = OutputMessage.create()
  msg:addU8(ClientOpcodes.ClientEnterAccount)
  msg:addU16(g_game.getOs())

  msg:addU16(0xFC)

  if g_game.getProtocolVersion() >= 971 then
    msg:addU32(g_game.getClientVersion())
  end

  msg:addU32(g_things.getDatSignature())
  msg:addU32(g_sprites.getSprSignature())
  msg:addU32(PIC_SIGNATURE)

  if g_game.getProtocolVersion() >= 971 then
    msg:addU8(0) -- clientType
  end

  local offset = msg:getMessageSize()

  if g_game.getProtocolVersion() >= 770 then
    -- first RSA byte must be 0
    msg:addU8(0)
    -- xtea key
    self:generateXteaKey()
    local xteaKey = self:getXteaKey()
    msg:addU32(xteaKey[1])
    msg:addU32(xteaKey[2])
    msg:addU32(xteaKey[3])
    msg:addU32(xteaKey[4])
  end
  
  if g_game.getFeature(GameAccountNames) then
    msg:addString(self.accountName)
  else
    msg:addU32(tonumber(self.accountName))
  end

  msg:addString(self.accountPassword)
  
  msg:addString(self.accountChacterName)
  msg:addU8(self.accountPokemon)
  msg:addU8(self.accountSexo)
  msg:addU8(self.accountCity)
  msg:addU8(self.accountWorld)
  msg:addString(self.accountEmail)

  if self.getLoginExtendedData then
    local data = self:getLoginExtendedData()
    msg:addString(data)
  end

  local paddingBytes = g_crypt.rsaGetSize() - (msg:getMessageSize() - offset)
  assert(paddingBytes >= 0)
  msg:addPaddingBytes(paddingBytes, 0)
  if g_game.getProtocolVersion() >= 770 then
    msg:encryptRsa()
  end

  if g_game.getFeature(GameProtocolChecksum) then
    self:enableChecksum()
  end

  self:send(msg)
  if g_game.getProtocolVersion() >= 770 then
    self:enableXteaEncryption()
  end
  self:recv()
end

function ProtocolLogin:LoginCreate(acc)
  LoginCreate = acc
end

function ProtocolLogin:CreateCharacter(host, port, accountName, accountChacterName, accountPokemon, accountSexo, accountCity)
  if string.len(host) == 0 or port == nil or port == 0 then
    signalcall(self.onLoginError, self, tr("You must enter a valid server address and port."))
    return
  end

  self.accountName = accountName
  self.accountChacterName = accountChacterName
  self.accountPokemon = accountPokemon
  self.accountSexo = accountSexo
  self.accountCity = accountCity
  self.accountWorld = accountWorld
  self.connectCallback = self.sendCreateCharacterPacket

  self:connect(host, port)
end

function ProtocolLogin:sendCreateCharacterPacket()
  local msg = OutputMessage.create()
  msg:addU8(ClientOpcodes.ClientEnterAccount)
  msg:addU16(g_game.getOs())

  msg:addU16(0xFD)

  if g_game.getProtocolVersion() >= 971 then
    msg:addU32(g_game.getClientVersion())
  end

  msg:addU32(g_things.getDatSignature())
  msg:addU32(g_sprites.getSprSignature())
  msg:addU32(PIC_SIGNATURE)

  if g_game.getProtocolVersion() >= 971 then
    msg:addU8(0) -- clientType
  end

  local offset = msg:getMessageSize()

  if g_game.getProtocolVersion() >= 770 then
    -- first RSA byte must be 0
    msg:addU8(0)
    -- xtea key
    self:generateXteaKey()
    local xteaKey = self:getXteaKey()
    msg:addU32(xteaKey[1])
    msg:addU32(xteaKey[2])
    msg:addU32(xteaKey[3])
    msg:addU32(xteaKey[4])
  end
  
  if g_game.getFeature(GameAccountNames) then
    msg:addString(self.accountName)
  else
    msg:addU32(tonumber(self.accountName))
  end
  
  msg:addString(self.accountChacterName)
  msg:addU8(self.accountPokemon)
  msg:addU8(self.accountSexo)
  msg:addU8(self.accountCity)
  msg:addU8(self.accountWorld)

  if self.getLoginExtendedData then
    local data = self:getLoginExtendedData()
    msg:addString(data)
  end

  local paddingBytes = g_crypt.rsaGetSize() - (msg:getMessageSize() - offset)
  assert(paddingBytes >= 0)
  msg:addPaddingBytes(paddingBytes, 0)
  if g_game.getProtocolVersion() >= 770 then
    msg:encryptRsa()
  end

  if g_game.getFeature(GameProtocolChecksum) then
    self:enableChecksum()
  end

  self:send(msg)
  if g_game.getProtocolVersion() >= 770 then
    self:enableXteaEncryption()
  end
  self:recv()
end

function ProtocolLogin:login(host, port, accountName, accountPassword)
  if string.len(host) == 0 or port == nil or port == 0 then
    signalcall(self.onLoginError, self, tr("You must enter a valid server address and port."))
    return
  end

  self.accountName = accountName
  self.accountPassword = accountPassword
  self.connectCallback = self.sendLoginPacket

  self:connect(host, port)
end

function ProtocolLogin:cancelLogin()
  self:disconnect()
end

function ProtocolLogin:sendLoginPacket()
  g_game.enableFeature(GameMagicEffectU16)
  g_game.enableFeature(GameCreatureIcons)
  g_game.enableFeature(GameSpritesAlphaChannel)
  g_game.enableFeature(GamePlayerMarket)

  local msg = OutputMessage.create()

  msg:addU8(ClientOpcodes.ClientEnterAccount)
  msg:addU16(g_game.getOs())
  msg:addU16(312)
  msg:addU8(modules.client_locales.getCurrentLocale().id)

  if g_game.getProtocolVersion() >= 971 then
    msg:addU32(g_game.getClientVersion())
  end

  msg:addU32(g_things.getDatSignature())
  msg:addU32(g_sprites.getSprSignature())
  msg:addU32(PIC_SIGNATURE)

  if g_game.getProtocolVersion() >= 971 then
    msg:addU8(0) -- clientType
  end

  local offset = msg:getMessageSize()

  if g_game.getProtocolVersion() >= 770 then
    -- first RSA byte must be 0
    msg:addU8(0)
    -- xtea key
    self:generateXteaKey()
    local xteaKey = self:getXteaKey()
    msg:addU32(xteaKey[1])
    msg:addU32(xteaKey[2])
    msg:addU32(xteaKey[3])
    msg:addU32(xteaKey[4])
  end

  if g_game.getFeature(GameAccountNames) then
    msg:addString(self.accountName)
  else
    msg:addU32(tonumber(self.accountName))
  end

  msg:addString(self.accountPassword)

  if self.getLoginExtendedData then
    local data = self:getLoginExtendedData()
    msg:addString(data)
  end

  local paddingBytes = g_crypt.rsaGetSize() - (msg:getMessageSize() - offset)
  assert(paddingBytes >= 0)
  msg:addPaddingBytes(paddingBytes, 0)
  if g_game.getProtocolVersion() >= 770 then
    msg:encryptRsa()
  end

  if g_game.getFeature(GameProtocolChecksum) then
    self:enableChecksum()
  end

  self:send(msg)
  if g_game.getProtocolVersion() >= 770 then
    self:enableXteaEncryption()
  end
  self:recv()
end

function ProtocolLogin:onConnect()
  self.gotConnection = true
  self:connectCallback()
  self.connectCallback = nil
end

function ProtocolLogin:onRecv(msg)
  while not msg:eof() do
    local opcode = msg:getU8()
    if opcode == LoginServerError then
      self:parseError(msg)
    elseif opcode == LoginServerMotd then
      self:parseMotd(msg)
    elseif opcode == LoginServerUpdateNeeded then
      signalcall(self.onLoginError, self, tr("Client needs update."))
    elseif opcode == LoginServerCharacterList then
      self:parseCharacterList(msg)
    elseif opcode == LoginServerExtendedCharacterList then
      self:parseExtendedCharacterList(msg)
    elseif opcode == LoginServerUpdate then
      local signature = msg:getString()
      signalcall(self.onUpdateNeeded, self, signature)
    else
      self:parseOpcode(opcode, msg)
    end
  end
  self:disconnect()
end

function ProtocolLogin:parseError(msg)
  local errorMessage = msg:getString()
  signalcall(self.onLoginError, self, errorMessage)
end

function ProtocolLogin:parseMotd(msg)
  local motd = msg:getString()
  signalcall(self.onMotd, self, motd)
end

function ProtocolLogin:parseCharacterList(msg)
  local characters = {}

  if g_game.getProtocolVersion() > 1010 then
    local worlds = {}

    local worldsCount = msg:getU8()
    for i=1, worldsCount do
      local world = {}
      local worldId = msg:getU8()
      world.worldName = msg:getString()
      world.worldIp = msg:getString()
      world.worldPort = msg:getU16()
      msg:getU8() -- unknow byte?
      worlds[worldId] = world
    end

    local charactersCount = msg:getU8()
    for i=1, charactersCount do
      local character = {}
      local worldId = msg:getU8()
      character.name = msg:getString()
      character.worldName = worlds[worldId].worldName
      character.worldIp = worlds[worldId].worldIp
      character.worldPort = worlds[worldId].worldPort
      characters[i] = character
    end

  else
    local charactersCount = msg:getU8()
    for i=1,charactersCount do
      local character = {pokemonTeam = {}}
      character.name = msg:getString()
      character.worldName = msg:getString()
      character.worldIp = iptostring(msg:getU32())
      character.worldPort = msg:getU16()
      character.level = msg:getU16()
      character.vocation = msg:getU8()
      character.outfit = {type = 612, head = 0, body = 0, legs = 0, feet = 0}
      character.outfit.type = msg:getU16()
      character.outfit.head = msg:getU8()
      character.outfit.body = msg:getU8()
      character.outfit.legs = msg:getU8()
      character.outfit.feet = msg:getU8()
      character.outfit.addons = msg:getU8()

      local pokemonCount = msg:getU8()
      for j=1, pokemonCount do
        character.pokemonTeam[j] = {number = msg:getU16(), description = msg:getString()}
      end

      if g_game.getProtocolVersion() >= 971 then
        character.unknown = msg:getU8()
      end

      characters[i] = character
    end
  end

  local account = {}
  account.premDays = msg:getU16()
  --modules.game_time.setTime(msg:getU16())
  modules.game_poll.doPreparePollIconShow(msg:getU8() > 0)
  signalcall(self.onCharacterList, self, characters, account)
end

function ProtocolLogin:parseExtendedCharacterList(msg)
  local characters = msg:getTable()
  local account = msg:getTable()
  local otui = msg:getString()
  signalcall(self.onCharacterList, self, characters, account, otui)
end

function ProtocolLogin:parseOpcode(opcode, msg)
  signalcall(self.onOpcode, self, opcode, msg)
end

function ProtocolLogin:onError(msg, code)
  local text = translateNetworkError(code, self:isConnecting(), msg)
  signalcall(self.onLoginError, self, text)
end