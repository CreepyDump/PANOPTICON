/datum/job/panopticon/slug
	title = "Slug"
	flag = SLUG
	department_flag = BUNKER
	faction = "Station"
	total_positions = 15
	spawn_positions = 15
	selection_color = JCOLOR_BUNKER
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	outfit = /datum/outfit/job/panopticon/slug
	bypass_lastclass = TRUE
	bypass_jobban = TRUE
	tutorial = "A bunch of crackheads, hobos, outlaws and other dregs of society forced to hide deep in the wilds, occupying a godforsaken bunker."
	display_order = JDO_SLUG
	show_in_credits = TRUE
	give_bank_account = FALSE
	can_random = FALSE

/datum/job/panopticon/slug/New()
	. = ..()
	peopleknowme = list()

/datum/outfit/job/panopticon/slug/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/panopticon
	shirt = /obj/item/clothing/suit/panopticon/shirt/civilianshirt
	pants = /obj/item/clothing/under/panopticon/civilianpants
	back = null
	id = null
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/panopticonweapon/knife
	beltr = null
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, pick(1,2,3,4,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, pick(1,2,3,4,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, pick(1,2,3,4,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, pick(2,3,4), TRUE)
		H.STALUC = rand(1, 20)
		H.STASTR = rand(5, 12)
		H.STAINT = rand(1, 10)
		H.STAPER = rand(8,18)

		if(prob(10))
			r_hand = /obj/item/gun/ballistic/rifle/gusyevboltovka
		if(prob(25))
			cloak = /obj/item/clothing/cloak/panopticon/bomjaracoat
			head = /obj/item/clothing/head/panopticon/bomjara
			beltl = null
			beltr = null
			l_hand = /obj/item/panopticonweapon/boner/nailplank
		if(H.gender == MALE)
			if(prob(5))
				cloak = /obj/item/clothing/armor/panopticon/cloak
				head = /obj/item/clothing/head/panopticon/jeremyden
				backl = /obj/item/gun/ballistic/automatic/panopticon/krasnik
	if(prob(35))
		l_hand = /obj/item/panopticonmoney/ten

/datum/outfit/job/panopticon/slug
	shoes = /obj/item/clothing/shoes/panopticon
	shirt = /obj/item/clothing/suit/panopticon/shirt/civilianshirt
	pants = /obj/item/clothing/under/panopticon/civilianpants
	back = null
	id = null
	belt = null
	beltl = null
	beltr = null
