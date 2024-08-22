/mob/living/carbon/proc/handle_hygiene()
	adjust_hygiene(-HYGIENE_FACTOR)
	var/image/smell = image('icons/effects/effects.dmi', "smell")//This is a hack, there has got to be a safer way to do this but I don't know it at the moment.
	switch(hygiene)
		if(HYGIENE_LEVEL_NORMAL to INFINITY)
			add_stress(null, "hygiene", /datum/stressevent/clean)
			overlays -= smell
		if(HYGIENE_LEVEL_DIRTY to HYGIENE_LEVEL_NORMAL)
			remove_stress("hygiene")
			overlays -= smell
		if(0 to HYGIENE_LEVEL_DIRTY)
			overlays -= smell
			overlays += smell
			add_stress(null, "hygiene", /datum/stressevent/smelly)

/mob/living/carbon/human/handle_hygiene()
	adjust_hygiene(-HYGIENE_FACTOR)
	switch(hygiene)
		if(HYGIENE_LEVEL_NORMAL to INFINITY)
			add_stress(null, "hygiene", /datum/stressevent/clean)
			remove_smelly()
		if(HYGIENE_LEVEL_DIRTY to HYGIENE_LEVEL_NORMAL)
			remove_stress("hygiene")
			remove_smelly()
		if(0 to HYGIENE_LEVEL_DIRTY)
			add_smelly()
			add_stress(null, "hygiene", /datum/stressevent/smelly)


/mob/living/carbon/proc/adjust_hygiene(var/amount)
	var/old_hygiene = hygiene
	if(amount>0)
		hygiene = min(hygiene+amount, HYGIENE_LEVEL_CLEAN)

	else if(old_hygiene)
		hygiene = max(hygiene+amount, 0)

/mob/living/carbon/proc/set_hygiene(var/amount)
	if(amount >= 0)
		hygiene = min(HYGIENE_LEVEL_CLEAN, amount)

