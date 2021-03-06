--Generated by SWGEmu Conversation Editor
elder_convo_template = ConvoTemplate:new {
	initialScreen = "cs_jsPlumb_1_1",
	templateType = "Lua",
	luaClassHandler = "elder_conv_handler",
	screens = {}
}
cs_jsPlumb_1_1 = ConvoScreen:new {
	id = "cs_jsPlumb_1_1",
	leftDialog = "@conversation/village_elder:s_688b65",
	stopConversation = "false",
	options = {
		{"@conversation/village_elder:s_fb95fc83","cs_jsPlumb_1_55"},
		{"@conversation/village_elder:s_85e90557","cs_jsPlumb_1_42"}
	}
}
elder_convo_template:addScreen(cs_jsPlumb_1_1);
cs_jsPlumb_1_42 = ConvoScreen:new {
	id = "cs_jsPlumb_1_42",
	leftDialog = "@conversation/village_elder:s_bdd3bae5",
	stopConversation = "true",
	options = {
	}
}
elder_convo_template:addScreen(cs_jsPlumb_1_42);
cs_jsPlumb_1_55 = ConvoScreen:new {
	id = "cs_jsPlumb_1_55",
	leftDialog = "@conversation/village_elder:s_4dfe3937",
	stopConversation = "false",
	options = {
		{"@conversation/village_elder:s_efefc64f","cs_jsPlumb_1_120"},
		{"@conversation/village_elder:s_d931cb17","cs_jsPlumb_1_107"},
		{"@conversation/village_elder:s_a9e1f5c2","cs_jsPlumb_1_133"}
	}
}
elder_convo_template:addScreen(cs_jsPlumb_1_55);
cs_jsPlumb_1_107 = ConvoScreen:new {
	id = "cs_jsPlumb_1_107",
	leftDialog = "@conversation/village_elder:s_ba08eb80",
	stopConversation = "true",
	options = {
	}
}
elder_convo_template:addScreen(cs_jsPlumb_1_107);
cs_jsPlumb_1_120 = ConvoScreen:new {
	id = "cs_jsPlumb_1_120",
	leftDialog = "@conversation/village_elder:s_7f56b89c",
	stopConversation = "true",
	options = {
	}
}
elder_convo_template:addScreen(cs_jsPlumb_1_120);
cs_jsPlumb_1_133 = ConvoScreen:new {
	id = "cs_jsPlumb_1_133",
	leftDialog = "@conversation/village_elder:s_7d804cc7",
	stopConversation = "true",
	options = {
	}
}
elder_convo_template:addScreen(cs_jsPlumb_1_133);
cs_jsPlumb_1_161 = ConvoScreen:new {
	id = "cs_jsPlumb_1_161",
	leftDialog = "@conversation/village_elder:s_199fe2af",
	stopConversation = "true",
	options = {
	}
}
elder_convo_template:addScreen(cs_jsPlumb_1_161);

addConversationTemplate("elder_convo_template", elder_convo_template);