/datum/job/roguetown/panopticon/slug
	title = "Slug"
	flag = SLUG
	department_flag = BUNKER
	faction = "Station"
	total_positions = 15
	spawn_positions = 15
	selection_color = JCOLOR_BUNKER
	allowed_sexes = list(MALE)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	outfit = /datum/outfit/job/panopticon/slug
	bypass_lastclass = TRUE
	bypass_jobban = TRUE

	tutorial = "Cogito ergo sum."
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
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, pick(1,2,3,4,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, pick(1,2,3,4,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, pick(1,2,3,4,5), TRUE)
		H.STALUC = rand(1, 20)
	if(prob(10))
		r_hand = /obj/item/gun/ballistic/rifle/gusyevboltovka
	if(prob(25))
		cloak = /obj/item/clothing/cloak/panopticon/bomjaracoat
		head = /obj/item/clothing/head/panopticon/bomjara
		beltl = null
		beltr = null
		l_hand = /obj/item/panopticonweapon/boner/nailplank
	if(prob(5))
		cloak = /obj/item/clothing/armor/panopticon
		head = /obj/item/clothing/head/panopticon/jeremyden
		back = /obj/item/gun/ballistic/automatic/panopticon/krasnik
	if(prob(75))
		beltr = /obj/item/roguecoin/silver

/datum/outfit/job/panopticon/slug
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
