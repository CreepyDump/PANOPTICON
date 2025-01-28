/datum/brain_trauma/mild/phobia
	name = "Phobia"
	desc = ""
	scan_desc = ""
	gain_text = "<span class='warning'>I have a phobia.. default values...</span>"
	lose_text = "<span class='notice'>I no longer feel my default values.</span>"
	var/phobia_type
	var/next_check = 0
	var/next_scare = 0
	var/list/trigger_words
	//instead of cycling every atom, only cycle the relevant types
	var/list/trigger_mobs
	var/list/trigger_objs //also checked in mob equipment
	var/list/trigger_turfs
	var/list/trigger_species

/datum/brain_trauma/mild/phobia/New(new_phobia_type)
	if(new_phobia_type)
		phobia_type = new_phobia_type

	if(!phobia_type)
		phobia_type = pick(SStraumas.phobia_types)

	gain_text = "<span class='warning'>I have a phobia.. [phobia_type]...</span>"
	lose_text = "<span class='notice'>I no longer feel my [phobia_type].</span>"
	scan_desc += " of [phobia_type]"
	trigger_words = SStraumas.phobia_words[phobia_type]
	trigger_mobs = SStraumas.phobia_mobs[phobia_type]
	trigger_objs = SStraumas.phobia_objs[phobia_type]
	trigger_turfs = SStraumas.phobia_turfs[phobia_type]
	trigger_species = SStraumas.phobia_species[phobia_type]
	..()


/datum/brain_trauma/mild/phobia/on_clone()
	if(clonable)
		return new type(phobia_type)

/datum/brain_trauma/mild/phobia/on_life()
	..()
	if(HAS_TRAIT(owner, TRAIT_FEARLESS))
		return
	if(is_blind(owner))
		return
	if(world.time > next_check && world.time > next_scare)
		next_check = world.time + 50
		var/list/seen_atoms = view(7, owner)

		if(LAZYLEN(trigger_objs))
			for(var/obj/O in seen_atoms)
				if(is_type_in_typecache(O, trigger_objs))
					freak_out(O)
					return
			for(var/mob/living/carbon/human/HU in seen_atoms) //check equipment for trigger items
				for(var/X in HU.get_all_slots() | HU.held_items)
					var/obj/I = X
					if(!QDELETED(I) && is_type_in_typecache(I, trigger_objs))
						freak_out(I)
						return

		if(LAZYLEN(trigger_turfs))
			for(var/turf/T in seen_atoms)
				if(is_type_in_typecache(T, trigger_turfs))
					freak_out(T)
					return

		seen_atoms -= owner //make sure they aren't afraid of themselves.
		if(LAZYLEN(trigger_mobs) || LAZYLEN(trigger_species))
			for(var/mob/M in seen_atoms)
				if(is_type_in_typecache(M, trigger_mobs))
					freak_out(M)
					return

				else if(ishuman(M)) //check their species
					var/mob/living/carbon/human/H = M

					if(LAZYLEN(trigger_species) && H.dna && H.dna.species && is_type_in_typecache(H.dna.species, trigger_species))
						freak_out(H)
						return

/datum/brain_trauma/mild/phobia/handle_hearing(datum/source, list/hearing_args)
	if(!owner.can_hear() || world.time < next_scare) //words can't trigger you if you can't hear them *taps head*
		return
	if(HAS_TRAIT(owner, TRAIT_FEARLESS))
		return
	for(var/word in trigger_words)
		var/regex/reg = regex("(\\b|\\A)[REGEX_QUOTE(word)]'?s*(\\b|\\Z)", "i")

		if(findtext(hearing_args[HEARING_RAW_MESSAGE], reg))
			addtimer(CALLBACK(src, .proc/freak_out, null, word), 10) //to react AFTER the chat message
			hearing_args[HEARING_MESSAGE] = reg.Replace(hearing_args[HEARING_MESSAGE], "<span class='phobia'>$1</span>")
			break

/datum/brain_trauma/mild/phobia/handle_speech(datum/source, list/speech_args)
	if(HAS_TRAIT(owner, TRAIT_FEARLESS))
		return
	for(var/word in trigger_words)
		var/regex/reg = regex("(\\b|\\A)[REGEX_QUOTE(word)]'?s*(\\b|\\Z)", "i")

		if(findtext(speech_args[SPEECH_MESSAGE], reg))
			to_chat(owner, "<span class='warning'>I can't bring myself to say the word \"<span class='phobia'>[word]</span>\"!</span>")
			speech_args[SPEECH_MESSAGE] = ""

/datum/brain_trauma/mild/phobia/proc/freak_out(atom/reason, trigger_word)
	next_scare = world.time + 120
	if(owner.stat == DEAD)
		return
	var/message = pick("spooks you to the bone", "shakes you up", "terrifies you", "sends you into a panic", "sends chills down your spine")
	if(reason)
		to_chat(owner, "<span class='phobia'>Seeing [reason] [message]!</span>")
	else if(trigger_word)
		to_chat(owner, "<span class='phobia'>Hearing \"[trigger_word]\" [message]!</span>")
	else
		to_chat(owner, "<span class='phobia'>Something [message]!</span>")
	var/reaction = rand(1,4)
	switch(reaction)
		if(1)
			to_chat(owner, "<span class='phobia'>I are paralyzed with fear!</span>")
			owner.Stun(70)
			owner.Jitter(8)
		if(2)
			owner.emote("scream")
			owner.Jitter(5)
			owner.say("AAAAH!!", forced = "phobia")
			if(reason)
				owner.pointed(reason)
		if(3)
			to_chat(owner, "<span class='phobia'>I shut eyes in terror!</span>")
			owner.Jitter(5)
			owner.blind_eyes(10)
			owner.eyesclosed = 1
		if(4)
			owner.dizziness += 10
			owner.confused += 10
			owner.Jitter(10)
			owner.stuttering += 10

// Defined phobia types for badminry, not included in the RNG trauma pool to avoid diluting.

/datum/brain_trauma/mild/phobia/spiders
	phobia_type = "Arachnophobia"
	random_gain = FALSE

/datum/brain_trauma/mild/phobia/blood
	phobia_type = "Hemophobia"
	random_gain = FALSE

/datum/brain_trauma/mild/phobia/clowns
	phobia_type = "Coulrophobia"
	random_gain = FALSE

/datum/brain_trauma/mild/phobia/skeletons
	phobia_type = "Cartilogenophobia"
	random_gain = FALSE

/datum/brain_trauma/mild/phobia/doctors
	phobia_type = "Iatrophobia"
	random_gain = FALSE

/datum/brain_trauma/mild/phobia/god
	phobia_type = "Theophobia"
	random_gain = FALSE

/datum/brain_trauma/mild/phobia/guns
	phobia_type = "Hoplophobia"
	random_gain = FALSE
