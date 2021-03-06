champhra_agriculturalist = Creature:new {
	objectName = "@mob/creature_names:farmer_agriculturalist",
	randomNameType = NAME_GENERIC_TAG,
	socialGroup = "townsperson",
	faction = "townsperson",
	level = 10,
	chanceHit = 0.28,
	damageMin = 90,
	damageMax = 110,
	baseXp = 292,
	baseHAM = 810,
	baseHAMmax = 990,
	armor = 0,
	resists = {0,0,0,0,0,0,0,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = NONE,
	creatureBitmask = HERD,
	optionsBitmask = 136,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_quest_farmer.iff",
		"object/mobile/dressed_commoner_tatooine_nikto_male_04.iff",
		"object/mobile/dressed_commoner_tatooine_aqualish_female_07.iff",
		"object/mobile/dressed_commoner_tatooine_ishitib_male_02.iff"},
	lootGroups = {},
	weapons = {},
	conversationTemplate = "champhra_biahin_mission_target_convotemplate",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(champhra_agriculturalist, "champhra_agriculturalist")
