/datum/job/panopticon/biskup
	title = "Bisquop"
	flag = BISQUOP
	department_flag = TOWN
	faction = "Station"
	total_positions = 15
	spawn_positions = 15
	selection_color = JCOLOR_TOWN
	allowed_races = list("Humen")
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	outfit = /datum/outfit/job/panopticon/biskup
	bypass_lastclass = TRUE
	bypass_jobban = TRUE
	tutorial = "The town's leading clergyman. He's considered useless by most people, but when there's a big deal with occult activity, he's always invited."
	display_order = JDO_BISQUOP
	show_in_credits = TRUE
	give_bank_account = FALSE
	can_random = FALSE

/datum/job/panopticon/biskup/New()
	. = ..()
	peopleknowme = list("Lodger")
	peopleiknow = list("Lodger")

/datum/outfit/job/panopticon/biskup/pre_equip(mob/living/carbon/human/H)
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
	if(H.mind)
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
		H.playsound_local(H, 'sound/misc/littlescary1.ogg', 60)
		to_chat(H, "<span class='cult italic'><b><span class='big'>I AM SICK WITH DISEASE.</span></b></span>")
		chuma.try_infect(H)
		mask = /obj/item/clothing/mask/infected

/datum/outfit/job/panopticon/biskup
	uniform = null
	id = null
	ears = null
	belt = null
	back = null
	shoes = /obj/item/clothing/shoes/panopticon
	pants = /obj/item/clothing/under/panopticon/civilianpants
	shirt = /obj/item/clothing/suit/panopticon/shirt/civilianshirt
	box = null
	backpack = null
	satchel  = null
	duffelbag = null
