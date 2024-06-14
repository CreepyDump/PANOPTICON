/datum/job/panopticon/necroleninist
	title = "Necrolenninist"
	flag = LENINIST
	department_flag = OUTSIDERS
	faction = "Station"
	total_positions = 15
	spawn_positions = 15
	selection_color = JCOLOR_OUTSIDERS
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	outfit = /datum/outfit/job/panopticon/necroleninist
	bypass_lastclass = TRUE
	bypass_jobban = TRUE
	tutorial = "A Cult of people who idolize a legendary revolutionary named Lennin. But this man is probably not connected to their fascination with bio-magick."
	display_order = JDO_LENINIST
	show_in_credits = TRUE
	give_bank_account = FALSE
	can_random = FALSE
/datum/job/panopticon/necroleninist/New()
	. = ..()
	peopleknowme = list()

/datum/outfit/job/panopticon/necroleninist/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, pick(3,4,5,6), TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/farming, pick(2,3,4,5,6,7,8), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, pick(1,2,3,4,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, pick(3,4,5,6), TRUE)
		H.STASTR = rand(6, 20)
	if(prob(25))
		r_hand = /obj/item/gun/ballistic/rifle/gusyevboltovka
		beltr = /obj/item/panopticonweapon/knife
	else
		beltl = /obj/item/rogueweapon/sickle
		beltr = /obj/item/rogueweapon/hammer

/datum/outfit/job/panopticon/necroleninist
	uniform = null
	id = null
	head = /obj/item/clothing/head/hooded/panopticon/necroleninist
	cloak = /obj/item/clothing/cloak/panopticon/necroleninist
	ears = null
	belt = /obj/item/storage/belt/rogue/leather
	back = null
	shoes = /obj/item/clothing/shoes/panopticon
	box = null
	backpack = null
	satchel  = null
	duffelbag = null
