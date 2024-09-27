/datum/job/panopticon/greydivision
	title = "Gendarme"
	flag = GREYDIVISION
	department_flag = TOWN
	faction = "Station"
	total_positions = 10
	spawn_positions = 10
	selection_color = JCOLOR_TOWN
	allowed_sexes = list(MALE)
	allowed_races = list("Humen")
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	outfit = /datum/outfit/job/panopticon/greydivision
	bypass_lastclass = TRUE
	bypass_jobban = TRUE
	tutorial = "The stronghold of the town's regimes is the 'The Grey Division' troopers. Rumors spread about them, but no one has accurate knowledge about them due to their secrecy."
	display_order = JDO_GREYDIVISION
	show_in_credits = TRUE
	give_bank_account = FALSE
	can_random = FALSE
	cmode_music = 'sound/music/combat/time2die.ogg'

/datum/job/panopticon/greydivision/New()
	. = ..()
	peopleknowme = list("Gendarme")
	peopleiknow = list("Gendarme")

/datum/outfit/job/panopticon/greydivision/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/panopticon/jackboots
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
	pants = /obj/item/clothing/under/panopticon/greys
	mask = /obj/item/clothing/mask/gas/panopticon/greys
	gloves = /obj/item/clothing/gloves/roguetown/angle
	belt = /obj/item/storage/belt/rogue/panopticon
	neck = /obj/item/roguekey/armory
	if(prob(35))
		cloak = /obj/item/clothing/armor/panopticon/cloak/grey/hitman
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/guns, pick(2,3,4,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 4, TRUE)
		ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 5, TRUE)
		H.STASPD = rand(6,12)
		H.STACON = rand(10,15)
		H.STASTR = rand(8,16)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)

/datum/outfit/job/panopticon/greydivision
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
