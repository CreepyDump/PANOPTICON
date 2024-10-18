
/datum/antagonist/bandit
	name = "Gnusar"
	roundend_category = "gnusari"
	antagpanel_category = "Gnusar"
	job_rank = ROLE_BANDIT
	antag_hud_type = ANTAG_HUD_TRAITOR
	antag_hud_name = "gnusar"
	var/tri_amt
	var/contrib
	confess_lines = list("ДА ЗРАВСТВУЕТ МАМА АНАРХИЯ!!!", "БЕЙ БЕЛЫХ, ПОКА НЕ ПОЧЕРНЕЮТ!", "ЗАКОН - ЗЛО!")

/datum/antagonist/bandit/examine_friendorfoe(datum/antagonist/examined_datum,mob/examiner,mob/examined)
	if(istype(examined_datum, /datum/antagonist/bandit))
		return "<span class='boldnotice'>Another free man. My ally.</span>"

/datum/antagonist/bandit/on_gain()
	owner.special_role = "Gnusar"
	owner.assigned_role = "Gnusar"
	owner.current.job = null
	forge_objectives()
	. = ..()
	equip_bandit()
	move_to_spawnpoint()
	finalize_bandit()

/datum/antagonist/bandit/proc/finalize_bandit()
	owner.current.playsound_local(get_turf(owner.current), 'sound/panopticon/banditspawn.ogg', 80, FALSE, pressure_affected = FALSE)
	var/mob/living/carbon/human/H = owner.current
	ADD_TRAIT(H, TRAIT_BANDITCAMP, TRAIT_GENERIC)
	ADD_TRAIT(H, RTRAIT_TORTURER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)

/datum/antagonist/bandit/greet()
	owner.current.playsound_local(get_turf(owner.current), 'sound/panopticon/banditspawn.ogg', 80, FALSE, pressure_affected = FALSE)
	to_chat(owner.current, "<span class='cult'>Time to rise and shine!.</span>")
	owner.announce_objectives()
	..()

/datum/antagonist/bandit/proc/forge_objectives()
	return
/*
	if(!(locate(/datum/objective/bandit) in objectives))
		var/datum/objective/bandit/bandit_objective = new
		bandit_objective.owner = owner
		objectives += bandit_objective
	if(!(locate(/datum/objective/escape) in objectives))
		var/datum/objective/escape/boat/escape_objective = new
		escape_objective.owner = owner
		objectives += escape_objective*/

/datum/antagonist/bandit/proc/move_to_spawnpoint()
	owner.current.forceMove(pick(GLOB.bandit_starts))

/datum/antagonist/bandit/proc/equip_bandit()

	owner.unknow_all_people()
	for(var/datum/mind/MF in get_minds())
		owner.become_unknown_to(MF)
	for(var/datum/mind/MF in get_minds("Bandit"))
		owner.i_know_person(MF)
		owner.person_knows_me(MF)

	var/mob/living/carbon/human/H = owner.current
	if(H.mobid in GLOB.character_list)
		GLOB.character_list[H.mobid] = null
	GLOB.chosen_names -= H.real_name
	if((H.dna.species?.id != "human"))
		H.age = AGE_ADULT
		H.set_species(/datum/species/human/northern) //setspecies randomizes body
		H.after_creation()
//		H.real_name = H.client.prefs.pref_species.random_name(MALE,1) //set_species randomizes name
	H.cmode_music = 'sound/music/combat/livinginhell.ogg'

	addtimer(CALLBACK(H, /mob/living/carbon/human/.proc/choose_name_popup, "BANDIT"), 5 SECONDS)
//	H.job = "Bandit"
//	H.advjob = pick("Cheesemaker", "Mercenary", "Barbarian", "Ranger", "Rogue")
	H.equipOutfit(/datum/outfit/job/roguetown/bandit)

	return TRUE

/datum/outfit/job/roguetown/bandit/pre_equip(mob/living/carbon/human/H)
	..()
	H.verbs += list(/mob/living/carbon/human/proc/insultsomeone)	
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	belt = /obj/item/storage/belt/rogue/leather
	backl = /obj/item/storage/backpack/rogue/satchel
	if(prob(45))
		mask = /obj/item/clothing/mask/coolio
	if(prob(23))
		pants = /obj/item/clothing/under/panopticon/dedushkapants
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
		shoes = /obj/item/clothing/shoes/panopticon/jackboots
	else
		pants = /obj/item/clothing/under/panopticon/gulag
		shirt = /obj/item/clothing/suit/panopticon/shirt/gulag
		if(prob(25))
			shoes = /obj/item/clothing/shoes/panopticon/zekboots

	var/loadoutm = rand(1,3)
	switch(loadoutm)
		if(1)
			beltr = /obj/item/rogueweapon/sword/iron
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
			beltl = /obj/item/storage/belt/rogue/pouch
		if(2)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		if(3)
			H.mind.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.change_stat("strength", 2)
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 1)
	H.change_stat("speed", 1)
	H.change_stat("intelligence", -4)
	var/obj/item/bodypart/B = H.get_bodypart("head")
	if(B)
		B.sellprice = rand(75, 500)

/datum/antagonist/bandit/roundend_report()
	if(owner?.current)
		var/the_name = owner.name
		if(ishuman(owner.current))
			var/mob/living/carbon/human/H = owner.current
			the_name = H.real_name
		to_chat(world, "[the_name] was a bandit.")
	return

	var/traitorwin = TRUE

	var/count = 0
	if(objectives.len)//If the traitor had no objectives, don't need to process this.
		for(var/datum/objective/objective in objectives)
			objective.update_explanation_text()
			if(!objective.check_completion())
				traitorwin = FALSE
			count += objective.triumph_count

	if(!count)
		count = 1

/mob/living/carbon/human/proc/insultsomeone()
	set name = "Insult"
	set category = "Noises"
	var/mob/living/carbon/C = usr
	if(C.gender == FEMALE)
		playsound(get_turf(C), pick('sound/panopticon/sdohni.ogg','sound/panopticon/fuckyou.ogg',), 90, ignore_walls = TRUE, soundping = TRUE)
	else
		playsound(get_turf(C), pick('sound/panopticon/suckmydick.ogg', 'sound/panopticon/unlucky.ogg', 'sound/panopticon/gondon.ogg', 'sound/panopticon/puppy.ogg'), 90, ignore_walls = TRUE, soundping = TRUE)
	C.visible_message("<span class='necrosis'>\The [C] slurs.</span>")
	var/turf/source = get_turf(src)
