/datum/job/panopticon/necroleninist
	title = "Necroleninist"
	flag = LENINIST
	department_flag = OUTSIDERS
	faction = "Station"
	total_positions = 15
	spawn_positions = 15
	selection_color = JCOLOR_OUTSIDERS
	allowed_races = list("Humen")
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	outfit = /datum/outfit/job/panopticon/necroleninist
	bypass_lastclass = TRUE
	bypass_jobban = TRUE
	tutorial = "A Cult of people who idolize a legendary revolutionary named Lenin. But this man is probably not connected to their fascination with bio-magick."
	display_order = JDO_LENINIST
	show_in_credits = TRUE
	give_bank_account = FALSE
	can_random = FALSE
	cmode_music = 'sound/music/combat/bladesymphony.ogg'
	spells = list(/obj/effect/proc_holder/spell/targeted/touch/necroleninistrevive)

/datum/job/panopticon/necroleninist/New()
	. = ..()
	peopleknowme = list("Necroleninist")
	peopleiknow = list("Necroleninist")

/datum/outfit/job/panopticon/necroleninist/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind?.add_antag_datum(/datum/antagonist/necroleninist)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/guns, pick(3,4,5), TRUE)
		ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, pick(2,3,4,5), TRUE)
		H.STASTR = rand(8, 13)
		if(prob(25))
			r_hand = /obj/item/gun/ballistic/rifle/gusyevboltovka
			beltr = /obj/item/panopticonweapon/knife
			H.mind.adjust_skillrank(/datum/skill/combat/knives, pick(3,4,5,6), TRUE)
		else
			beltl = /obj/item/rogueweapon/sickle
			beltr = /obj/item/rogueweapon/hammer
			H.mind.adjust_skillrank(/datum/skill/labor/farming, pick(3,4,5,6), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, pick(1,2,3,4,5), TRUE)
	if(H.dna?.species)
		if(H.dna.species.id == "human")
			H.dna.species.soundpack_m = new /datum/voicepack/male/leninist()

/datum/outfit/job/panopticon/necroleninist
	uniform = null
	id = null
	head = /obj/item/clothing/head/hooded/panopticon/necroleninist
	cloak = /obj/item/clothing/cloak/panopticon/necroleninist
	pants = /obj/item/clothing/under/panopticon/civilianpants
	ears = null
	belt = /obj/item/storage/belt/rogue/leather
	back = null
	shoes = /obj/item/clothing/shoes/panopticon
	box = null
	backpack = null
	satchel  = null
	duffelbag = null

///datum/outfit/job/panopticon/grandnecroleninist
//	uniform = null
//	id = null
//	head = /obj/item/clothing/cloak/panopticon/grandnecroleninist
//	armor = /obj/item/clothing/armor/panopticon
//	cloak = /obj/item/clothing/cloak/panopticon/grandnecroleninist
//	pants = /obj/item/clothing/under/panopticon/civilianpants
//	ears = null
//	belt = /obj/item/storage/belt/rogue/leather
//	back = null
//	shoes = /obj/item/clothing/shoes/panopticon
//	box = null
//	backpack = null
//	satchel  = null
//	duffelbag = null

///datum/job/panopticon/necroleninist/after_spawn(mob/living/L, mob/M, latejoin = FALSE)
//	var/grand = FALSE
 //   if(var/grand = FALSE)
//		if(ishuman(L))
//			to_chat(L, "<span class='cult italic'><b><span class='big'>I am Grand-Necroleninist. How rare!</span></b></span>")
//			equipOutfit(new /datum/outfit/job/panopticon/grandnecroleninist)
//			grand = TRUE

/datum/antagonist/necroleninist
	name = "Necroleninist"
	increase_votepwr = FALSE
	objectives = /datum/objective/lenin

/datum/antagonist/necroleninist/on_gain()
	var /datum/objective/lenin/revive = new
	revive.owner = owner
	src.objectives += revive
	ADD_TRAIT(owner.current, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	return ..()

/datum/antagonist/necroleninist/on_removal()
	return ..()


/datum/antagonist/necroleninist/greet()
	owner.current.playsound_local(get_turf(owner.current), 'sound/music/traitor.ogg', 80, FALSE, pressure_affected = FALSE)
	owner.announce_objectives()
	..()
