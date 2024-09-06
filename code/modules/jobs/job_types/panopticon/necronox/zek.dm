GLOBAL_LIST_EMPTY(zekspawns)

/datum/job/necronox/zek
	title = "Zek"
	flag = ZEK
	department_flag = UNTERS
	faction = "Station"
	total_positions = 30
	spawn_positions = 30
	selection_color = JCOLOR_UNTER
	allowed_races = list("Humen")
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	outfit = /datum/outfit/job/panopticon/zek
	bypass_lastclass = TRUE
	bypass_jobban = TRUE
	tutorial = "Unlucky souls that ended up in the Empire's prison camp and now must end up suffering here."
	display_order = JDO_ZEK
	show_in_credits = TRUE
	give_bank_account = FALSE
	can_random = FALSE

/datum/job/necronox/zek/New()
	. = ..()
	for(var/X in GLOB.peasant_positions)
		peopleknowme += X

/datum/outfit/job/panopticon/zek/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.STALUC = rand(1, 12)
		H.STASTR = rand(5, 12)
		H.STAINT = rand(1, 12)
		H.STAPER = rand(8,12)
		H.STACON = rand(5,10)
		H.STAEND = rand(5,12)
	var/masti = pick(1, 2, 3, 4, 5)
	switch(masti)
		if(1)

		if(2)

		if(3)
			
		if(4)
			
		if(5)
			head = /obj/item/clothing/head/panopticon/meshok

/datum/outfit/job/panopticon/zek
	shoes = /obj/item/clothing/shoes/panopticon/zekboots
	shirt = /obj/item/clothing/suit/panopticon/shirt/gulag/necronox
	pants = /obj/item/clothing/under/panopticon/gulag/necronox
	back = null
	id = null
	belt = null
	beltl = null
	beltr = null
