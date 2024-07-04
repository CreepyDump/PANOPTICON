/datum/job/panopticon/citizen
	title = "Lodger"
	flag = CITIZEN
	department_flag = TOWN
	faction = "Station"
	total_positions = 15
	spawn_positions = 15
	selection_color = JCOLOR_TOWN
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	outfit = /datum/outfit/job/panopticon/citizen
	bypass_lastclass = TRUE
	bypass_jobban = TRUE
	tutorial = "A regular fella living in this shithole. Nothing fancy"
	display_order = JDO_CITIZEN
	show_in_credits = TRUE
	give_bank_account = FALSE
	can_random = FALSE

/datum/job/panopticon/citizen/New()
	. = ..()
	peopleknowme = list("Lodger")
	peopleiknow = list("Lodger")

/datum/outfit/job/panopticon/citizen/pre_equip(mob/living/carbon/human/H)
	..()
	var/datum/disease/advance/chuma = new /datum/disease/anthrax
	chuma.name = "Unknown"
	shoes = /obj/item/clothing/shoes/panopticon
	pants = /obj/item/clothing/under/panopticon/civilianpants
	if(prob(80))
		shirt = /obj/item/clothing/suit/panopticon/shirt/civilianshirt
	else
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	if(H.mind)
		switch(pick(1,2,3))
			if(1)
				H.mind.adjust_skillrank(/datum/skill/misc/climbing, pick(1,2,3,4,5), TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/crafting, pick(1,2,3,4,5), TRUE)
			if(2)
				H.mind.adjust_skillrank(/datum/skill/combat/unarmed, pick(1,2,3,4,5), TRUE)
				H.mind.adjust_skillrank(/datum/skill/labor/butchering, pick(1,2,3,4,5), TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/cooking, pick(1,2,3,4,5), TRUE)
			if(3)
				H.mind.adjust_skillrank(/datum/skill/combat/knives, pick(1,2,3,4,5), TRUE)
				wrists = /obj/item/clothing/wrists/roguetown/wrappings
	if(prob(10))
		H.playsound_local(H, 'sound/misc/littlescary1.ogg', 60)
		to_chat(H, "<span class='cult italic'><b><span class='big'>i AM SICK WITH DISEASE.</span></b></span>")
		chuma.try_infect(H)
		mask = /obj/item/clothing/mask/infected

/datum/outfit/job/panopticon/citizen
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
