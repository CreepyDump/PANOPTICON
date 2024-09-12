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

/datum/reagent/psychick/overdose_process(mob/living/carbon/M)
	M.adjustToxLoss(10, 0)
	if(prob(25))
		if(M.can_heartattack())
			M.set_heartattack(TRUE)

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

/datum/reagent/psychick/on_mob_end_metabolize(mob/living/M)
	to_chat(M, "<span class='danger'>I feel mentally retarded</span>")
	M.playsound_local(M, 'sound/misc/mechsound.ogg', 100, FALSE)
	M.SetSleeping(100)
	M.clear_fullscreen("narcos")
	M.update_body_parts_head_only()
	REMOVE_TRAIT(M, TRAIT_PSYCHICK, "based")
	SSdroning.play_area_sound(get_area(M), M.client)

/datum/reagent/heroin/overdose_process(mob/living/M)
	M.adjustToxLoss(1, 0)
	M.adjustOxyLoss(1.5*REM, 0)

/datum/reagent/heroin/on_mob_end_metabolize(mob/living/M)
	REMOVE_TRAIT(M, TRAIT_DRUQK, "based")
	M.update_body_parts_head_only()
	SSdroning.area_entered(get_area(M), M.client)

/datum/reagent/psychicksamogon
	name = "Fungus jus"
	reagent_state = LIQUID
	description = "An psychickshroom brew. Made in moonshiner."
	color = "#7E399090"
	taste_description = "purple"
	overdose_threshold = 35
	metabolization_rate = 1

/datum/reagent/psychicksamogon/on_mob_life(mob/living/carbon/lean_monster, delta_time, times_fired)
	if(lean_monster.has_flaw(/datum/charflaw/addiction/junkie))
		lean_monster.sate_addiction()
	lean_monster.apply_status_effect(/datum/status_effect/buff/moondust)
	if(prob(5))
		if(lean_monster.can_heartattack())
			lean_monster.set_heartattack(TRUE)
	var/static/list/funnies = list(
			'sound/misc/comic1.ogg',
			'sound/misc/comic2.ogg',
			'sound/misc/comic3.ogg',
			'sound/misc/comic4.ogg',
		)
	if(prob(25))
		lean_monster.playsound_local(lean_monster, pick(funnies), 100)


/datum/reagent/psychicksamogon/on_mob_metabolize(mob/living/carbon/lean_monster, delta_time)
	ADD_TRAIT(lean_monster, TRAIT_HHHHH, "based")
	to_chat(lean_monster, span_love(span_big("SHIT !!!")))
	lean_monster.playsound_local(lean_monster, 'sound/misc/leanend.ogg', 50)
	SSdroning.area_entered(get_area(lean_monster), lean_monster.client)
	lean_monster.flash_fullscreen("maniac")
	var/static/list/funnies = list(
			'sound/misc/comic1.ogg',
			'sound/misc/comic2.ogg',
			'sound/misc/comic3.ogg',
			'sound/misc/comic4.ogg',
		)
	lean_monster.playsound_local(lean_monster, pick(funnies), 100)

/datum/reagent/psychicksamogon/on_mob_end_metabolize(mob/living/carbon/lean_monster)
	REMOVE_TRAIT(lean_monster, TRAIT_HHHHH, "based")
	SSdroning.area_entered(get_area(lean_monster), lean_monster.client)
	if(prob(15))
		if(lean_monster.can_heartattack())
			lean_monster.set_heartattack(TRUE)
	lean_monster.update_body_parts_head_only()
	SSdroning.play_area_sound(get_area(lean_monster), lean_monster.client)

/datum/reagent/shmacksamogonka
	name = "Fungus jus"
	reagent_state = LIQUID
	description = "An seltshmack brew. Made in moonshiner."
	color = "#5c721fd0"
	taste_description = "purple"
	overdose_threshold = 35
	metabolization_rate = 0.5

/datum/reagent/shmacksamogonka/on_mob_life(mob/living/carbon/lean_monster, delta_time, times_fired)
	if(lean_monster.has_flaw(/datum/charflaw/addiction/junkie))
		lean_monster.sate_addiction()
	lean_monster.apply_status_effect(/datum/status_effect/buff/moondust)
	if(prob(5))
		if(lean_monster.can_heartattack())
			lean_monster.set_heartattack(TRUE)
