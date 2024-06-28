/datum/job/panopticon/shtrafbat
	title = "Strafbat"
	flag = SHTRAFBAT
	department_flag = OUTSIDERS
	faction = "Station"
	total_positions = 7
	spawn_positions = 7
	selection_color = JCOLOR_OUTSIDERS
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	outfit = /datum/outfit/job/panopticon/shtrafbat
	bypass_lastclass = TRUE
	bypass_jobban = TRUE
	tutorial = "Soldiers thrown away by their government for acts of terror. It was mostly murders of their fellow soldiers or torture of civilians."
	display_order = JDO_SHTRAFBAT
	show_in_credits = TRUE
	give_bank_account = FALSE
	can_random = FALSE

/datum/job/panopticon/shtrafbat/New()
	. = ..()
	peopleknowme = list("Strafbat")
	peopleiknow = list("Strafbat")

/datum/outfit/job/panopticon/shtrafbat/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/panopticon/jackboots
	shirt = /obj/item/clothing/suit/panopticon/shirt/shtrafbatshirt
	pants = /obj/item/clothing/under/panopticon/dedushkapants
	head = /obj/item/clothing/head/panopticon/shtrafbathelm
	backl = null
	backr = /obj/item/storage/backpack/rogue/satchel
	back = null
	id = null
	belt = /obj/item/storage/belt/rogue/leather/hand
	beltl = null
	beltr = /obj/item/gun/ballistic/automatic/pistol/knuckleshot
	backpack_contents = list(/obj/item/panopticonweapon/molotok = 1)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/guns, pick(1,2,3,4,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, pick(1,2,3,4,5), TRUE)
	if(prob(50))
		backpack_contents = list(/obj/item/reagent_containers/glass/bottle/heroinium = 1)
		neck = null
		head = /obj/item/clothing/head/panopticon/govnar
	if(prob(60))
		backl = /obj/item/gun/ballistic/rifle/gusyevboltovka

/datum/outfit/job/panopticon/shtrafbat
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
