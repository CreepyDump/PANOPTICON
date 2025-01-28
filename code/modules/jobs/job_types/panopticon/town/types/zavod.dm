/datum/advclass/factoryworker
	name = "Proletariat"
	allowed_sexes = list("male", "female")
	allowed_races = list("Humen")
	outfit = /datum/outfit/job/roguetown/adventurer/rabochii
	islodger = TRUE

/datum/outfit/job/roguetown/adventurer/rabochii/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, rand(1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, rand(1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, rand(2,3), TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/carpentry, rand(3,4), TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/masonry, rand(1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/engineering, rand(2,3), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	if(prob(50))
		head = /obj/item/clothing/head/roguetown/hatblu
	pants = /obj/item/clothing/under/panopticon/civilianpants
	shirt = /obj/item/clothing/suit/panopticon/shirt/vatnik
	shoes = /obj/item/clothing/shoes/panopticon/jackboots
	belt = /obj/item/storage/belt/rogue/leather/cloth/bandit
	beltr = /obj/item/panopticonweapon/molotok
	H.change_stat("strength", 1)
	H.change_stat("intelligence", -2)
	H.change_stat("endurance", 2)
