/datum/advclass/defaultlodger
	name = "Lodger"
	allowed_sexes = list("male", "female")
	allowed_races = list("Humen")
	outfit = /datum/outfit/job/roguetown/adventurer/lodgger
	islodger = TRUE

/datum/outfit/job/roguetown/adventurer/lodgger/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, rand(1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, rand(1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, rand(2,3), TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/carpentry, rand(3,4), TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/masonry, rand(1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/engineering, rand(2,3), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
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
	pants = /obj/item/clothing/under/panopticon/civilianpants
	shirt = /obj/item/clothing/suit/panopticon/shirt/civilianshirt
	shoes = /obj/item/clothing/shoes/panopticon
	belt = /obj/item/storage/belt/rogue/leather/cloth/bandit
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
	H.change_stat("strength", -1)
	H.change_stat("intelligence", 1)
	H.change_stat("perception", 1)
