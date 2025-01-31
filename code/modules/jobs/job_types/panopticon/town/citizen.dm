/datum/job/panopticon/citizen
	title = "Lodger"
	flag = CITIZEN
	department_flag = TOWN
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	allowed_races = list("Humen")
	tutorial = "A regular fella living in this shithole. Nothing fancy."
	outfit = /datum/outfit/job/panopticon/citizen
	outfit_female = null
	var/islodger = TRUE
	selection_color = JCOLOR_TOWN
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	display_order = JDO_CITIZEN
	show_in_credits = FALSE
	give_bank_account = FALSE
	can_random = FALSE

/datum/job/panopticon/citizen/New()
	. = ..()
	peopleknowme = list("Lodger")
	peopleiknow = list("Lodger")

/datum/outfit/job/panopticon/citizen/pre_equip(mob/living/carbon/human/H)
	..()
	var/datum/disease/advance/chuma = new /datum/disease/anthrax
	if(prob(25))
		H.playsound_local(H, 'sound/misc/littlescary1.ogg', 60)
		to_chat(H, "<span class='cult italic'><b><span class='big'>I AM SICK WITH DISEASE.</span></b></span>")
		chuma.try_infect(H)
		mask = /obj/item/clothing/mask/infected

/datum/job/panopticon/citizen/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
		H.Stun(100)
		if(!H.possibleclass)
			H.possibleclass = list()
		var/list/classes = GLOB.adv_classes.Copy()
		var/list/special_classes = list()
		var/classamt = 5
		if(M.client)
			if(M.client.patreonlevel() >= 1)
				classamt = 999
#ifdef TESTSERVER
		classamt = 999
#endif
		for(var/I in shuffle(classes))
			var/datum/advclass/A = I
			if(!(H.gender in A.allowed_sexes))
				testing("[A.name] fail11")
				continue
			if(!(H.dna.species.name in A.allowed_races))
				testing("[A.name] fail22")
				continue
			if(!(H.age in A.allowed_ages))
				testing("[A.name] fail33")
				continue
			if(A.maxchosen > -1)
				if(A.amtchosen >= A.maxchosen)
					testing("[A.name] fail9")
					continue
			if(islodger) //lodger
				if(!A.islodger)
					continue
//			if(ispilgrim) //pilgrim
//				if(A.ispilgrim)
//					continue

			if(A.plevel_req > M.client.patreonlevel())
				testing("[A.name] fail6")
				continue
			if(A.special_req)
				special_classes += A
				testing("[A.name] fail5")
				continue
			if(CONFIG_GET(flag/usewhitelist))
				if(M.client)
					if((!M.client.whitelisted()) && A.whitelist_req)
						testing("[A.name] fail4")
						continue
			if(H.possibleclass.len >= classamt)
				testing("[A.name] fail3")
				continue
			var/the_prob = A.pickprob
#ifdef TESTSERVER
			the_prob = 100
#endif
			if(M.client.patreonlevel() >= 3)
				the_prob = 100
			if(prob(the_prob))
				testing("[A.name] SUC1")
				H.possibleclass += A

		for(var/X in special_classes)
			var/datum/advclass/A = X
			if(!A.special_req)
				continue
			if(!M.client)
				continue
			else
				if(find_class_json(A.name, M.client.ckey))
					if(prob(A.pickprob))
						H.possibleclass += A
						continue
