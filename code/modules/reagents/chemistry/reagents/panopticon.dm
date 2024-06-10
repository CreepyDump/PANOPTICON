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
//	if(!M.hud_used)
//		return

//	var/list/obj/screen/plane_master/plane_masters = M.hud_used.plane_masters[GAME_PLANE]
//	game_plane_master_controller.add_filter("heroino",1,list("type"="radial_blur", "x"=5, "y"=15))

/datum/reagent/heroin/on_mob_end_metabolize(mob/living/M)
//	var/list/obj/screen/plane_master/plane_masters = M.hud_used.plane_masters[GAME_PLANE]
//	game_plane_master_controller.remove_filter("heroino")
	M.update_body_parts_head_only()
	REMOVE_TRAIT(M, TRAIT_DRUQK, "based")
	SSdroning.play_area_sound(get_area(M), M.client)
