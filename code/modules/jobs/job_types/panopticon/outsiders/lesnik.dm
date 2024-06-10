/datum/job/panopticon/lesnik
	title = "Leshiy"
	flag = LESHIY
	department_flag = OUTSIDERS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	selection_color = JCOLOR_OUTSIDERS
	allowed_sexes = list(MALE)
	allowed_ages = list(AGE_OLD)
	outfit = /datum/outfit/job/panopticon/lesnik
	bypass_lastclass = TRUE
	bypass_jobban = TRUE
	tutorial = "Totally mad oldman with axe. He claims to be protecting the woods, however, we know that he's just another fuckhead. (OLD AGE MEN ONLY)"
	display_order = JDO_LESHIY
	show_in_credits = TRUE
	give_bank_account = FALSE
	can_random = FALSE
/datum/job/panopticon/lesnik/New()
	. = ..()
	peopleknowme = list()

/datum/outfit/job/panopticon/lesnik/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/panopticon
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/merc
	pants = /obj/item/clothing/under/panopticon/civilianpants
	head = /obj/item/clothing/head/panopticon/vargcap
	backl = /obj/item/storage/backpack/rogue/backpack
	back = null
	id = null
	r_hand = /obj/item/rogueweapon/stoneaxe/woodcut
	backpack_contents = list(/obj/item/reagent_containers/food/snacks/grown/psychickgrib = 2)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/guns, pick(1,2,3,4,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, pick(4,5), TRUE)
	ADD_TRAIT(H, TRAIT_NOGUNS, TRAIT_GENERIC)

/datum/outfit/job/panopticon/lesnik
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
