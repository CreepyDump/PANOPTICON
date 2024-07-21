/datum/job/panopticon/nomad
	title = "Nomad"
	flag = NOMAD
	department_flag = OUTSIDERS
	faction = "Station"
	total_positions = 7
	spawn_positions = 7
	selection_color = JCOLOR_OUTSIDERS
	allowed_races = list("Odongh")
	outfit = /datum/outfit/job/panopticon/nomad
	bypass_lastclass = TRUE
	bypass_jobban = TRUE
	tutorial = "A small commune of worms living in caves. they are pretty powerful and struggle all their lives to remain independent from humans."
	display_order = JDO_NOMAD
	show_in_credits = TRUE
	give_bank_account = FALSE
	can_random = FALSE
	cmode_music = 'sound/music/combat/odongh_cmbt.ogg'


/datum/job/panopticon/nomad/New()
	. = ..()
	peopleknowme = list("Nomad")
	peopleiknow = list("Nomad")

/datum/outfit/job/panopticon/nomad/pre_equip(mob/living/carbon/human/H)
	..()
	backr = /obj/item/storage/backpack/rogue/backpack
	belt = /obj/item/storage/belt/rogue/leather/hand
	beltr =/obj/item/rogueweapon/pick
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/labor/mining, pick(1,2,3,4,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/masonry, pick(1,2,3,), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, pick(1,2,3,4), TRUE)

/datum/outfit/job/panopticon/nomad
	shirt = /obj/item/clothing/suit/panopticon/shirt/odongh
	pants = /obj/item/clothing/under/panopticon/odongh
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
