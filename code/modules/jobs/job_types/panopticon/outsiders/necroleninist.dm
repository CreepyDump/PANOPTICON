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
	if(H.mind)
		H.verbs += list(/mob/living/carbon/human/proc/chanting)	
		H.mind.add_antag_datum(/datum/antagonist/necroleninist)
		H.mind.adjust_skillrank(/datum/skill/combat/guns, pick(3,4,5), TRUE)
		ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, pick(2,3,4,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/blood, pick(1,2,3), TRUE)
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
	roundend_category = "Necroleninists"
	antagpanel_category = "necroleninist"
	increase_votepwr = FALSE
	job_rank = ROLE_LENINIST
	antag_hud_type = ANTAG_HUD_TRAITOR
	antag_hud_name = "necroleninist"
	confess_lines = list("HERETIC!", "SACRIFICE!", "BLOOD!")
	objectives = /datum/objective/martyr
	var/bloodshit = 1000
	var/last_use

/datum/antagonist/necroleninist/on_removal()
	var/mob/living/carbon/human/D = owner
	to_chat(owner.current, "<span class='danger'>LENIN LEFT US!!!</span>")
	owner.special_role = null
	D.gib(FALSE,FALSE,FALSE,FALSE)
	return ..()


/datum/antagonist/necroleninist/greet()
	return


/datum/antagonist/necroleninist/on_gain()
	owner.special_role = name
	ADD_TRAIT(owner.current, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	var/obj/item/organ/eyes/eyes = owner.current.getorganslot(ORGAN_SLOT_EYES)
	if(prob(5))
		if(eyes)
			eyes.Remove(owner.current,1)
			QDEL_NULL(eyes)
		eyes = new /obj/item/organ/eyes/night_vision/zombie
		eyes.Insert(owner.current)
	forge_necroleninist_objectives()
	finalize_necroleninist()
	return ..()

/datum/antagonist/necroleninist/proc/add_objective(datum/objective/O)
	objectives += O

/datum/antagonist/necroleninist/proc/remove_objective(datum/objective/O)
	objectives -= O

/datum/antagonist/necroleninist/proc/forge_necroleninist_objectives()
	return

/datum/antagonist/necroleninist/proc/finalize_necroleninist()
	to_chat(owner.current, "<span class='cult'>Foolish mortals tried to stop us, but this day is going to be an final song for them!.</span>")
	owner.current.playsound_local(get_turf(owner.current), 'sound/panopticon/revolutsia.ogg', 100, FALSE, pressure_affected = FALSE)

/mob/living/carbon/human/proc/chanting()
	set name = "Chant"
	set category = "Blood Magicka"

	var/datum/antagonist/necroleninist/chlenin = mind.has_antag_datum(/datum/antagonist/necroleninist)
	var/mob/living/carbon/C = usr
	var/mob/living/carbon/O //Остальные хуйлуши вокруг некролениниста
	if(!chlenin)
		return
	if(world.time < chlenin.last_use + 180 SECONDS)
		var/timet2 = (chlenin.last_use + 180 SECONDS) - world.time
		to_chat(src, "<span class='warning'>No.. not yet. [round(timet2/10)]s</span>")
		return
	else
		if(C.gender == FEMALE)
			playsound(get_turf(C), 'sound/vo/male/leninist/woman_chant.ogg', 90, ignore_walls = TRUE, soundping = TRUE)
		else
			playsound(get_turf(C), 'sound/vo/male/leninist/man_chant.ogg', 90, ignore_walls = TRUE, soundping = TRUE)
		C.visible_message("<span class='necrosis'>\The [C] humming a blood melody.</span>")
		var/turf/source = get_turf(src)
		for(O in get_hearers_in_view(15, source))
			if(!O.job == "Necroleninist")
				O.apply_status_effect(/datum/status_effect/debuff/chant)
			else
				O.apply_status_effect(/datum/status_effect/buff/chant)
	chlenin.last_use = world.time
