/datum/job/panopticon/meatmen
	title = "Meat-man"
	flag = SHTRAFBAT
	department_flag = OUTSIDERS
	faction = "Station"
	total_positions = 7
	spawn_positions = 7
	selection_color = JCOLOR_OUTSIDERS
	allowed_races = list("Humen")
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	outfit = /datum/outfit/job/panopticon/meatmen
	bypass_lastclass = TRUE
	bypass_jobban = TRUE
	tutorial = "A loyal Helekian force that would never go against due to their mindlessness."
	display_order = JDO_SHTRAFBAT
	show_in_credits = TRUE
	give_bank_account = FALSE
	can_random = FALSE


/datum/job/panopticon/meatmen/New()
	. = ..()
	peopleknowme = list("Strafbat")
	peopleiknow = list("Strafbat")

/datum/outfit/job/panopticon/meatmen/pre_equip(mob/living/carbon/human/H)
	..()
	var/obj/item/bodypart/head/head = H.get_bodypart(BODY_ZONE_HEAD)
	head?.add_wound(/datum/wound/facial/tongue)
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

/datum/outfit/job/panopticon/meatmen
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
