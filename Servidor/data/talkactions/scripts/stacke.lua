function onSay(cid, words, param, channel)
	setPlayerStorageValue(cid, 188734, getPlayerMoney(cid))
	doPlayerRemoveMoney(cid, getPlayerMoney(cid))
	doPlayerAddMoney(cid, getPlayerStorageValue(cid, 188734))
	setPlayerStorageValue(cid, 188734, 0)
    doSendMagicEffect(getCreaturePosition(cid), 165)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voc� tem " .. getPlayerMoney(cid) .. " d�lares.")
	return true
end