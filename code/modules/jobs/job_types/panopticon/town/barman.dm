/datum/job/panopticon/barman
	title = "Tippler"
	flag = BARMAN
	department_flag = TOWN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	selection_color = JCOLOR_TOWN
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	outfit = /datum/outfit/job/panopticon/barman
	bypass_lastclass = TRUE
	bypass_jobban = TRUE
	tutorial = "2 men providing the town with alcohol and grub."
	display_order = JDO_BARMAN
	show_in_credits = TRUE
	give_bank_account = FALSE
	can_random = FALSE

/datum/job/panopticon/barman/New()
	. = ..()
	peopleknowme = list("Lodger")

/datum/outfit/job/panopticon/barman/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/panopticon
	pants = /obj/item/clothing/under/panopticon/civilianpants
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	cloak = /obj/item/clothing/cloak/apron
	head = /obj/item/clothing/head/roguetown/cookhat
	gloves = /obj/item/clothing/gloves/roguetown/leather
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, pick(1,2,3,4,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/butchering, pick(1,2,3,4,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, pick(1,2,3,4,5), TRUE)
		H.STASTR = rand(6,20)
		H.STAINT = rand(4,15)

/datum/outfit/job/panopticon/barman
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
