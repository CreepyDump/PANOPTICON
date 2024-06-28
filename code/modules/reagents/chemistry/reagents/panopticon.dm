/datum/reagent/psychick
	name = "psychick spores"
	reagent_state = GAS
	description = ""
	color = "#4E3259"
	taste_description = "crazy"
	overdose_threshold = 15
	metabolization_rate = 0.5

/datum/reagent/psychick/on_mob_metabolize(mob/living/M)
	M.playsound_local(M, 'sound/misc/mechsound.ogg', 100, FALSE)
	ADD_TRAIT(M, TRAIT_PSYCHICK, "based")
	M.update_body_parts_head_only()
	SSdroning.area_entered(get_area(M), M.client)
	M.overlay_fullscreen("narcos", /obj/screen/fullscreen/narcos)

/datum/reagent/psychick/on_mob_life(mob/living/carbon/M)
	if(M.has_flaw(/datum/charflaw/addiction/junkie))
		M.sate_addiction()
	M.apply_status_effect(/datum/status_effect/buff/ozium)
	..()

/datum/reagent/psychick/on_mob_end_metabolize(mob/living/M)
	to_chat(M, "<span class='danger'>I feel mentally retarded</span>")
	M.playsound_local(M, 'sound/misc/mechsound.ogg', 100, FALSE)
	M.SetSleeping(100)
	M.clear_fullscreen("narcos")
	M.update_body_parts_head_only()
	REMOVE_TRAIT(M, TRAIT_PSYCHICK, "based")
	SSdroning.play_area_sound(get_area(M), M.client)

/datum/reagent/psychick/overdose_start(mob/living/M)
	M.playsound_local(M, 'sound/misc/lobotomy.ogg', 100, FALSE)

/datum/reagent/psychick/overdose_process(mob/living/M)
	M.adjustToxLoss(10, 0)

/datum/reagent/heroin
	name = "heroin"
	reagent_state = LIQUID
	description = "."
	color = "#eeeae2"
	taste_description = "bitterness"
	overdose_threshold = 30
	metabolization_rate = 0.7

/datum/reagent/heroin/on_mob_metabolize(mob/living/M)
	ADD_TRAIT(M, TRAIT_DRUQK, "based")
	M.update_body_parts_head_only()
	SSdroning.area_entered(get_area(M), M.client)
	REMOVE_TRAIT(M, TRAIT_DISFIGURED, TRAIT_GENERIC)
//	if(!M.hud_used)
//		return

/datum/reagent/heroin/overdose_process(mob/living/M)
	M.adjustToxLoss(1, 0)
	M.adjustOxyLoss(1.5*REM, 0)

/datum/reagent/heroin/on_mob_life(mob/living/carbon/M)
	M.Jitter(5)
	M.Dizzy(5)
	M.heal_bodypart_damage(1,1)
	if(prob(5))
		if(M.gender == FEMALE)
			M.emote(pick("twitch_s","giggle"))
		else
			M.emote(pick("twitch_s","chuckle"))
	if(M.has_flaw(/datum/charflaw/addiction/junkie))
		M.sate_addiction()
	M.apply_status_effect(/datum/status_effect/buff/druqks)
	..()
