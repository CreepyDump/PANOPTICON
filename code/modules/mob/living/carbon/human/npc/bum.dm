GLOBAL_LIST_INIT(bum_quotes, world.file2list("strings/rt/bumlines.txt"))
GLOBAL_LIST_INIT(bum_aggro, world.file2list("strings/rt/bumaggrolines.txt"))

/mob/living/carbon/human/species/human/northern/bum
	aggressive=0
	mode = AI_IDLE
	faction = list("bums", "station")
	ambushable = FALSE
	dodgetime = 30
	flee_in_pain = TRUE
	possible_rmb_intents = list()

	wander = FALSE

/mob/living/carbon/human/species/human/northern/bum/ambush
	aggressive=1

	wander = TRUE

/mob/living/carbon/human/species/human/northern/bum/retaliate(mob/living/L)
	var/newtarg = target
	.=..()
	if(target)
		aggressive=1
		wander = TRUE
		if(target != newtarg)
			say(pick(GLOB.bum_aggro))
			linepoint(target)

/mob/living/carbon/human/species/human/northern/bum/should_target(mob/living/L)
	if(L.stat != CONSCIOUS)
		return FALSE
	. = ..()

/mob/living/carbon/human/species/human/northern/bum/Initialize()
	. = ..()
	set_species(/datum/species/human/northern)
	spawn(10)
		after_creation()
	//addtimer(CALLBACK(src, PROC_REF(after_creation)), 10)

/mob/living/carbon/human/species/human/northern/bum/after_creation()
	..()
	job = "Lodger"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/panopticon/citizen/bum)

/mob/living/carbon/human/species/human/northern/bum/npc_idle()
	if(m_intent == MOVE_INTENT_SNEAK)
		return
	if(world.time < next_idle)
		return
	next_idle = world.time + rand(30, 70)
	if((mobility_flags & MOBILITY_MOVE) && isturf(loc) && wander)
		if(prob(20))
			var/turf/T = get_step(loc,pick(GLOB.cardinals))
			if(!istype(T, /turf/open/transparent/openspace))
				Move(T)
		else
			face_atom(get_step(src,pick(GLOB.cardinals)))
	if(!wander && prob(10))
		face_atom(get_step(src,pick(GLOB.cardinals)))
	if(prob(3))
		say(pick(GLOB.bum_quotes))
	if(prob(3))
		emote(pick("laugh","burp","yawn","grumble","mumble","blink_r","clap"))

/datum/outfit/job/panopticon/citizen/bum/pre_equip(mob/living/carbon/human/H)
	..()
	var/datum/disease/advance/chuma = new /datum/disease/anthrax
	shoes = /obj/item/clothing/shoes/panopticon
	pants = /obj/item/clothing/under/panopticon/civilianpants
	if(prob(20))
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	if(prob(40))
		cloak = /obj/item/clothing/armor/panopticon/cloak/brown
	if(prob(10))
		backr = /obj/item/storage/backpack/rogue/satchel
	switch(pick(1,2,3))
		if(1)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, pick(1,2,3,4,5), TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/crafting, pick(1,2,3,4,5), TRUE)
		if(2)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, pick(1,2,3,4,5), TRUE)
			H.mind.adjust_skillrank(/datum/skill/labor/butchering, pick(1,2,3,4,5), TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, pick(1,2,3,4,5), TRUE)
			head = /obj/item/clothing/head/panopticon/furajka
		if(3)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, pick(1,2,3,4,5), TRUE)
			wrists = /obj/item/clothing/wrists/roguetown/wrappings
	if(H.gender == FEMALE)
		var/list/skin_slop = H.dna.species.get_skin_list()
		if(H.skin_tone == skin_slop["Blackamoor"])
			var/sosi_hyi_churka = pick(1,2,3,4)
			switch(sosi_hyi_churka)
				if(1)
					head = /obj/item/clothing/head/panopticon/hijab
				if(2)
					head = /obj/item/clothing/head/panopticon/hijab/black
				if(3)
					head = /obj/item/clothing/head/panopticon/hijab/yellow
				if(4)
					head = /obj/item/clothing/head/panopticon/hijab/green
		else if(prob(35))
			head = /obj/item/clothing/head/panopticon/platok
	if(prob(25))
		chuma.try_infect(H)
		mask = /obj/item/clothing/mask/infected
	uniform = null
	id = null
	ears = null
	belt = null
	back = null
	box = null
	backpack = null
	satchel  = null
	duffelbag = null

/datum/outfit/job/panopticon/citizen/bum
	uniform = null
	id = null
	ears = null
	belt = null
	back = null
	box = null
	backpack = null
	satchel  = null
	duffelbag = null
