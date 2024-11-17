
//Here are the procs used to modify status effects of a mob.
//The effects include: stun, knockdown, unconscious, sleeping, resting, jitteriness, dizziness, ear damage,
// eye damage, eye_blind, eye_blurry, druggy, TRAIT_BLIND trait, and TRAIT_NEARSIGHT trait.

///Set the slowdown of a mob
/mob/proc/Slowdown(amount)
	return

///Set the jitter of a mob
/mob/proc/Jitter(amount)
	jitteriness = max(jitteriness,amount,0)

/**
  * Set the dizzyness of a mob to a passed in amount
  *
  * Except if dizziness is already higher in which case it does nothing
  */
/mob/proc/Dizzy(amount)
	dizziness = max(dizziness,amount,0)

///FOrce set the dizzyness of a mob
/mob/proc/set_dizziness(amount)
	dizziness = max(amount, 0)

///Blind a mobs eyes by amount
/mob/proc/blind_eyes(amount)
	adjust_blindness(amount)

/**
  * Adjust a mobs blindness by an amount
  *
  * Will apply the blind alerts if needed
  */
/mob/proc/adjust_blindness(amount)
	var/old_eye_blind = eye_blind
	eye_blind = max(0, eye_blind + amount)
	if(!old_eye_blind || !eye_blind && !HAS_TRAIT(src, TRAIT_BLIND))
		update_blindness()
/**
  * Force set the blindness of a mob to some level
  */
/mob/proc/set_blindness(amount)
	var/old_eye_blind = eye_blind
	eye_blind = max(amount, 0)
	if(!old_eye_blind || !eye_blind && !HAS_TRAIT(src, TRAIT_BLIND))
		update_blindness()

/// proc that adds and removes blindness overlays when necessary
/mob/proc/update_blindness()
	if(stat == UNCONSCIOUS || HAS_TRAIT(src, TRAIT_BLIND) || eye_blind) // UNCONSCIOUS or has blind trait, or has temporary blindness
		if(stat == CONSCIOUS)
//			throw_alert("blind", /atom/movable/screen/alert/blind)
			overlay_fullscreen("blind", /atom/movable/screen/fullscreen/blind)
		else
			overlay_fullscreen("blind", /atom/movable/screen/fullscreen/blackimageoverlay)
		// You are blind why should you be able to make out details like color, only shapes near you
//		add_client_colour(/datum/client_colour/monochrome/blind)
	else // CONSCIOUS no blind trait, no blindness
//		clear_alert("blind")
		clear_fullscreen("blind")
//		remove_client_colour(/datum/client_colour/monochrome/blind)
/**
  * Make the mobs vision blurry
  */
/mob/proc/blur_eyes(amount)
	if(amount>0)
		eye_blurry = max(amount, eye_blurry)
	update_eye_blur()

/**
  * Adjust the current blurriness of the mobs vision by amount
  */
/mob/proc/adjust_blurriness(amount)
	eye_blurry = max(eye_blurry+amount, 0)
	update_eye_blur()

///Set the mobs blurriness of vision to an amount
/mob/proc/set_blurriness(amount)
	eye_blurry = max(amount, 0)
	update_eye_blur()

///Apply the blurry overlays to a mobs clients screen
/mob/proc/update_eye_blur()
	if(!client)
		return
	var/atom/movable/screen/plane_master/floor/OT = locate(/atom/movable/screen/plane_master/floor) in client.screen
	var/atom/movable/screen/plane_master/game_world/GW = locate(/atom/movable/screen/plane_master/game_world) in client.screen
	GW.backdrop(src)
	OT.backdrop(src)
	GW = locate(/atom/movable/screen/plane_master/game_world_fov_hidden) in client.screen
	GW.backdrop(src)
	GW = locate(/atom/movable/screen/plane_master/game_world_above) in client.screen
	GW.backdrop(src)

///Adjust the drugginess of a mob
/mob/proc/adjust_drugginess(amount)
	return

///Set the drugginess of a mob
/mob/proc/set_drugginess(amount)
	return

///Adjust the disgust level of a mob
/mob/proc/adjust_disgust(amount)
	return

///Set the disgust level of a mob
/mob/proc/set_disgust(amount)
	return

///Adjust the body temperature of a mob, with min/max settings
/mob/proc/adjust_bodytemperature(amount,min_temp=0,max_temp=INFINITY)
	if(bodytemperature >= min_temp && bodytemperature <= max_temp)
		bodytemperature = CLAMP(bodytemperature + amount,min_temp,max_temp)

/mob/living/carbon/proc/leninprivet()
	if(prob(40))
		src.overlay_fullscreen("maniac", /atom/movable/screen/fullscreen/maniac)
		src.emote("scream")

//HEAD RAPE
/mob/living/proc/IsHeadRape()
	return has_status_effect(STATUS_EFFECT_HEADRAPE)

/mob/living/proc/AmountHeadRape()
	var/datum/status_effect/incapacitating/headrape/I = IsHeadRape()
	if(I)
		return I.duration - world.time
	return 0

/mob/living/proc/HeadRape(amount, updating = TRUE, ignore_canstun = FALSE) //Can't go below remaining duration
	if(SEND_SIGNAL(src, COMSIG_LIVING_STATUS_HEADRAPE, amount, updating, ignore_canstun) & COMPONENT_NO_STUN)
		return
	if(!ignore_canstun && (!(status_flags & CANSTUN) || HAS_TRAIT(src, TRAIT_STUNIMMUNE)))
		return
	if(absorb_stun(amount, ignore_canstun))
		return
	var/datum/status_effect/incapacitating/headrape/I = IsHeadRape()
	if(I)
		I.duration = max(world.time + CEILING(amount, 4 SECONDS), I.duration)
	else if(amount > 0)
		I = apply_status_effect(STATUS_EFFECT_HEADRAPE, CEILING(amount, 4), updating)
	return I

/mob/living/proc/SetHeadRape(amount, updating = TRUE, ignore_canstun = FALSE) //Sets remaining duration
	if(SEND_SIGNAL(src, COMSIG_LIVING_STATUS_HEADRAPE, amount, updating, ignore_canstun) & COMPONENT_NO_STUN)
		return
	if(!ignore_canstun && (!(status_flags & CANSTUN) || HAS_TRAIT(src, TRAIT_STUNIMMUNE)))
		return
	var/datum/status_effect/incapacitating/headrape/I = IsHeadRape()
	if(amount <= 0)
		if(I)
			qdel(I)
	else
		if(absorb_stun(amount, ignore_canstun))
			return
		if(I)
			I.duration = world.time + amount
		else
			I = apply_status_effect(STATUS_EFFECT_HEADRAPE, CEILING(amount, 4 SECONDS), updating)
	return I

/mob/living/proc/AdjustHeadRape(amount, updating = TRUE, ignore_canstun = FALSE) //Adds to remaining duration
	if(SEND_SIGNAL(src, COMSIG_LIVING_STATUS_HEADRAPE, amount, updating, ignore_canstun) & COMPONENT_NO_STUN)
		return
	if(!ignore_canstun && (!(status_flags & CANSTUN) || HAS_TRAIT(src, TRAIT_STUNIMMUNE)))
		return
	if(absorb_stun(amount, ignore_canstun))
		return
	var/datum/status_effect/incapacitating/headrape/I = IsHeadRape()
	if(I)
		I.duration += amount
	else if(amount > 0)
		I = apply_status_effect(STATUS_EFFECT_HEADRAPE, CEILING(amount, 4 SECONDS), updating)
	return I
