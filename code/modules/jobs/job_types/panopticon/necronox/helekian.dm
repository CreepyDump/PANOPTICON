/datum/job/panopticon/shtrafbat
	title = "Strafbat"
	flag = SHTRAFBAT
	department_flag = OUTSIDERS
	faction = "Station"
	total_positions = 7
	spawn_positions = 7
	selection_color = JCOLOR_OUTSIDERS
	allowed_races = list("Humen")
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
	shirt = /obj/item/clothing/suit/panopticon/shirt/strafbatshirt
	pants = /obj/item/clothing/under/panopticon/strafbatpants
	head = /obj/item/clothing/head/panopticon/shtrafbathelm
	backl = null
	backr = /obj/item/storage/backpack/rogue/satchel
	back = null
	id = null
	belt = /obj/item/storage/belt/rogue/panopticon/strafbat
	beltl = null
	beltr = null
	backpack_contents = list(/obj/item/panopticonweapon/molotok = 1)
	if(H.mind)
		ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
		H.mind.adjust_skillrank(/datum/skill/combat/guns, pick(1,2,3,4,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, pick(1,2,3), TRUE)
	if(prob(50))
		backpack_contents = list(/obj/item/reagent_containers/glass/bottle/heroinium = 1)
		neck = /obj/item/clothing/neck/panopticon/govnar
	if(prob(60))
		var/obj/item/gun/ballistic/rifle/gusyevboltovka/gb
		gb.condition = rand(45,85)
		r_hand = gb
		H.mind.adjust_skillrank(/datum/skill/misc/reading, pick(3,4,5), TRUE)
		backpack_contents = list(/obj/item/ammo_box/a762 = 4)
		head = /obj/item/clothing/head/panopticon/shtrafbathelm/helek
		cloak = /obj/item/clothing/armor/panopticon/cloak/strafbat/holycloak
		beltl = /obj/item/flashlight/flare/torch/lantern
	else if(prob(5))
		var/obj/item/flashlight/flare/torch/lantern/T = new()
		T.spark_act()
		H.put_in_hands(T)
		r_hand = /obj/item/panopticonweapon/sledge

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
