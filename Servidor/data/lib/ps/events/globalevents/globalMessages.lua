local GLOBALMESSAGES = {
	{
		"Jamais informe os dados da sua conta em qualquer site que n�o seja o pokecenter.com, a equipe n�o da itens ou pokemons.",
		"Never let the data of your account on any site other than pokecenter.com, the staff not give any item or pokemon."
	},
	{
		"Pense duas vezes antes de usar qualquer tipo de bot ou hack no seu personagem, isto n�o ser� tolerado e seu personagem ser� deletado. Jogue limpo.",
		"Think twice before using any bot or hack on your character, it will not be tolerated and your character will be deleted. Play nice."
	},
	{
		"Voc� precisa de alguma informa��o sobre o jogo? Acesse agora: http://www.pokecenter.com",
		"Do you need any information about the game? Visit now: http://www.pokecenter.com"
	},
	{
		"Gostou do jogo? Ent�o comece a divulga-lo agora mesmo! Chame seus amigos para jogar! Assim voc� se diverte muito mais e ajuda a manter o projeto!",
		"Did you like the game? Then start to publish it right now! Call your friends to play! So you enjoy a lot more and helps keep the project!"
	},
	{
		"Nunca coloque os dados de sua conta em qualquer site que n�o seja o oficial do pokecenter (http://www.pokecenter.com)! Cuide de sua conta!",
		"Never put your account information at any site other than the official pokecenter (http://www.pokecenter.com)! Take care of your account!"
	},
	{
		"Fique por dentro das novidades, d� sua opini�o e participe do desenvolvimento do jogo! Acesse: http://forum.pokecenter.com/",
		"Check out the news, give your opinion and participate in the development of the game! Access: http://forum.pokecenter.com/"
	},
	{
		"Voc� quer deixar alguma mensagem, coment�rio ou sugest�o para os desenvolvedores do pokecenter? Acesse: http://www.pokecenter.com",
		"You want to leave a message, comment or suggestion to the pokecenter developers? Visit now: http://www.pokecenter.com"
	},
}

local MSGTYPES = {
	MESSAGE_STATUS_WARNING, --[[Red message in game window and in the console]]
	MESSAGE_EVENT_ADVANCE, --[[White message in game window and in the console]]
	MESSAGE_INFO_DESCR --[[Green message in game window and in the console]]
}

local LAST_MESSAGE_ID = 0
local LAST_TYPE_ID = 0

function onThink()
	local msgs = GLOBALMESSAGES[LAST_MESSAGE_ID + 1]
	if (msgs) then
		LAST_MESSAGE_ID = LAST_MESSAGE_ID + 1
	else
		msgs = GLOBALMESSAGES[1]
		LAST_MESSAGE_ID = 1
	end

	local msgtype = MSGTYPES[LAST_TYPE_ID + 1]
	if (msgtype) then
		LAST_TYPE_ID = LAST_TYPE_ID + 1
	else
		msgtype = MSGTYPES[1]
		LAST_TYPE_ID = 1
	end

	for i, msg in ipairs(msgs) do
		doBroadcastMessage(msg, msgtype)
	end
	return true
end
