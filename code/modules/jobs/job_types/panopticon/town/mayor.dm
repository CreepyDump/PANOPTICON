/datum/job/panopticon/mayor
	title = "Major"
	flag = MAYOR
	department_flag = TOWN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	selection_color = JCOLOR_TOWN
	allowed_sexes = list(MALE)
	allowed_races = list("Humen")
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	outfit = /datum/outfit/job/panopticon/mayor
	bypass_lastclass = TRUE
	bypass_jobban = TRUE
	tutorial = "The town's de facto chief of defense. Rules 'The Grey Division' defense organization. His actual name is kept hidden from the public."
	display_order = JDO_MAYOR
	show_in_credits = TRUE
	give_bank_account = FALSE
	can_random = FALSE

/datum/job/panopticon/mayor/New()
	. = ..()
	peopleknowme = null
	peopleiknow = list("Lodger", "Tippler", "Gendarme")

/datum/outfit/job/panopticon/mayor/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/panopticon/jackboots
	shirt = /obj/item/clothing/suit/panopticon/shirt/greys/major
	pants = /obj/item/clothing/under/panopticon/greys
	mask = /obj/item/clothing/mask/gas/panopticon
	cloak = /obj/item/clothing/armor/panopticon/cloak/grey
	head = /obj/item/clothing/head/panopticon/mayor
	belt = /obj/item/storage/belt/rogue/panopticon/mayor
	beltr = /obj/item/keyring/major
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, pick(3,4,5), TRUE)
		ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
		H.mind.adjust_skillrank(/datum/skill/combat/guns, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 5, TRUE)

/datum/outfit/job/panopticon/mayor
	uniform = null
	id = null
	ears = null
	belt = null
	back = null
	shoes = null
	box = null
	backpack = null
	satchel  = null
	duffelbag = null
