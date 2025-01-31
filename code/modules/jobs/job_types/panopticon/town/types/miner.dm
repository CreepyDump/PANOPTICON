/datum/advclass/miner
	name = "Miner"
	allowed_sexes = list("male")
	allowed_races = list("Humen")
	outfit = /datum/outfit/job/roguetown/adventurer/minerrr
	islodger = TRUE

/datum/outfit/job/roguetown/adventurer/minerrr/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, rand(1,3), TRUE)
		H.mind.adjust_skillrank(/datum/skill/mining, rand(1,3), TRUE)
	pants = /obj/item/clothing/under/roguetown/tights
	if(prob(65))
		shirt = /obj/item/clothing/suit/panopticon/shirt/vatnik
	else
		shirt = null
	shoes = /obj/item/clothing/shoes/panopticon/zekboots
	belt = /obj/item/storage/belt/rogue/leather/cloth/bandit
	beltl = /obj/item/rogueweapon/pick
	beltr = /obj/item/flashlight/flare/torch/lantern
	if(prob(45))
		head = /obj/item/clothing/head/panopticon/huliganka
	H.change_stat("constitution", 1)
	H.change_stat("intelligence", -2)
	H.change_stat("speed", -1)
	H.change_stat("endurance", 3)

