/datum/job/panopticon/slug
	title = "Slug"
	flag = SLUG
	department_flag = BUNKER
	faction = "Station"
	total_positions = 15
	spawn_positions = 15
	selection_color = JCOLOR_BUNKER
	allowed_races = list("Humen")
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


/datum/outfit/job/panopticon/slug/proc/handle_speech(original_message, wrapped_message)
	var/message = wrapped_message[1]
	if(message)
		message = "[replacetext(message, ".", "!")]!!"
	wrapped_message[1] = message
	return COMPONENT_UPPERCASE_SPEECH

/datum/outfit/job/panopticon/slug/pre_equip(mob/living/carbon/human/H)
	..()
	back = null
	id = null
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, pick(1,2,3,4,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, pick(1,2,3,4,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, pick(1,2,3,4,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, pick(2,3,4), TRUE)
		RegisterSignal(H, COMSIG_MOB_SAY, .proc/handle_speech)
		ADD_TRAIT(H, TRAIT_POHYI, TRAIT_GENERIC)
		H.apply_status_effect(/datum/status_effect/shizophrenia)
		H.STALUC = rand(1, 20)
		H.STASTR = rand(5, 15)
		H.STAINT = rand(1, 10)
		H.STAPER = rand(8,18)
		if(prob(10))
			r_hand = /obj/item/gun/ballistic/rifle/gusyevboltovka
			head = /obj/item/clothing/mask/pig
		else
			if(prob(35))
				head = /obj/item/clothing/head/panopticon/creep
			else
				head = /obj/item/clothing/head/panopticon/cannibal
			belt = /obj/item/storage/belt/rogue/leather
			switch(pick(1,2,3,4,5))
				if(1)
					beltl = /obj/item/panopticonweapon/knife
				if(2)
					r_hand = /obj/item/panopticonweapon/boner/nailplank
				if(3)	
					l_hand = /obj/item/panopticonweapon/rebar
				if(4)
					l_hand = /obj/item/panopticonweapon/bonespear
				if(5)
					r_hand = /obj/item/panopticonweapon/boner
		if(prob(25))
			cloak = /obj/item/clothing/cloak/panopticon/bomjaracoat
			head = /obj/item/clothing/head/panopticon/bomjara
			pants = /obj/item/clothing/under/panopticon/civilianpants	
			shirt = /obj/item/clothing/suit/panopticon/shirt/civilianshirt
			beltl = null
			beltr = null
		if(H.gender == MALE)
			if(prob(5))
				cloak = /obj/item/clothing/armor/panopticon/cloak
				head = /obj/item/clothing/head/panopticon/jeremyden
				backl = /obj/item/gun/ballistic/automatic/panopticon/krasnik
	if(prob(35))
		l_hand = /obj/item/panopticonmoney/ten
	if(H.dna?.species)
		if(H.dna.species.id == "human")
			H.dna.species.soundpack_m = new /datum/voicepack/male/shizoid()

/datum/outfit/job/panopticon/slug
	shoes = /obj/item/clothing/shoes/panopticon
	shirt = null
	pants = /obj/item/clothing/under/panopticon/gulfik
	back = null
	id = null
	belt = null
	beltl = null
	beltr = null
