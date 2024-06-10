/datum/job/panopticon/New()
	. = ..()
	if(give_bank_account)
		for(var/X in GLOB.bunker_positions)
			peopleiknow += X
			peopleknowme += X
		for(var/X in GLOB.outside_positions)
