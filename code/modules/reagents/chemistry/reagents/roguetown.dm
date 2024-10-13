/datum/reagent/miasmagas
	name = "miasmagas"
	description = "."
	color = "#801E28" // rgb: 128, 30, 40
	taste_description = "ugly"
	metabolization_rate = 1

/datum/reagent/miasmagas/on_mob_life()
	addtimer(CALLBACK(src, .proc/tryinfect), 5 SECONDS)

	. = ..()

/datum/reagent/miasmagas/proc/tryinfect(mob/living/carbon/M)
	if(HAS_TRAIT(M, TRAIT_WEARING_GAS_MASK))
		return

	var/datum/disease/advance/anthrax = new /datum/disease/anthrax
	if(!HAS_TRAIT(M, RTRAIT_NOSTINK))
		if(!M.wear_mask == new/obj/item/clothing/mask/gas(M))
			M.add_nausea(15)
			M.add_stress(/datum/stressevent/miasmagas)
			if(prob(1))
				anthrax.try_infect(M)
