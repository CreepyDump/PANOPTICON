/mob/living/carbon/proc/update_shock_penalty(incoming = 0, duration = 5 SECONDS)
	//use remove_shock_penalty() you idiot
	if(!incoming || !duration)
		return
	if(shock_penalty_timer)
		deltimer(shock_penalty_timer)
		shock_penalty_timer = null
	//pick the bigger value between what we already are suffering and the incoming modification
	shock_penalty = max(incoming, shock_penalty)
//	attributes?.add_or_update_variable_attribute_modifier(/datum/attribute_modifier/shock_penalty, TRUE, list(STAT_DEXTERITY = -shock_penalty, STAT_INTELLIGENCE = -shock_penalty))
	shock_penalty_timer = addtimer(CALLBACK(src, .proc/remove_shock_penalty), duration, TIMER_STOPPABLE)

/mob/living/carbon/proc/remove_shock_penalty()
//	attributes?.remove_attribute_modifier(/datum/attribute_modifier/shock_penalty)
	shock_penalty = 0
	shock_penalty_timer = null

/mob/living/carbon/proc/major_wound_effects(incoming_pain = 0, body_zone = BODY_ZONE_CHEST, wound_messages = TRUE)
	//Try not to stack too much
	if((world.time - last_major_wound) <= 1 SECONDS)
		return
//	var/attribute_modifier = GET_MOB_ATTRIBUTE_VALUE(src, STAT_ENDURANCE)
	var/modifier = 0
	switch(body_zone)
		if(BODY_ZONE_PRECISE_NECK, BODY_ZONE_HEAD, BODY_ZONE_PRECISE_R_EYE, BODY_ZONE_PRECISE_L_EYE)
			modifier -= 10
	//Got out scott free!
	//Oof!
	if(wound_messages)
		SEND_SIGNAL(src, COMSIG_CARBON_ADD_TO_WOUND_MESSAGE, span_danger(" Major Wound!"))
//	var/vomiting = FALSE
	switch(body_zone)
		if(BODY_ZONE_HEAD, BODY_ZONE_PRECISE_MOUTH, BODY_ZONE_PRECISE_R_EYE, BODY_ZONE_PRECISE_L_EYE)
			drop_all_held_items()
			HeadRape(8 SECONDS)
			flash_pain_major()
			//rev deconversion through trauma
			var/datum/antagonist/rev/rev = mind?.has_antag_datum(/datum/antagonist/rev)
			if(rev && prob(incoming_pain * 3))
				rev.remove_revolutionary(FALSE)
			if(wound_messages)
				SEND_SIGNAL(src, COMSIG_CARBON_ADD_TO_WOUND_MESSAGE, span_danger(" [src] is disoriented!"))
		if(BODY_ZONE_PRECISE_NECK)
			flash_pain_major()
			adjustOxyLoss(rand(30, 45))
			if(wound_messages)
				SEND_SIGNAL(src, COMSIG_CARBON_ADD_TO_WOUND_MESSAGE, span_danger(" [src] [p_are()] deoxygenated!"))
		if(BODY_ZONE_PRECISE_R_HAND, BODY_ZONE_R_ARM)
			var/obj/item/held_item = get_item_for_held_index(RIGHT_HANDS)
			if(held_item)
				//if it's an offhand, drop the main item
				dropItemToGround(held_item)
				flash_pain_major()
				if(wound_messages)
					SEND_SIGNAL(src, COMSIG_CARBON_ADD_TO_WOUND_MESSAGE, span_danger(" [src] got sec neuritis!"))
		if(BODY_ZONE_PRECISE_L_HAND, BODY_ZONE_L_ARM)
			var/obj/item/held_item = get_item_for_held_index(LEFT_HANDS)
			if(held_item)
				//if it's an offhand, drop the main item
				dropItemToGround(held_item)
				flash_pain_major()
				if(wound_messages)
					SEND_SIGNAL(src, COMSIG_CARBON_ADD_TO_WOUND_MESSAGE, span_danger(" [src] got sec neuritis!"))
		if(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN)
			flash_pain_major()
//			Daze(3 SECONDS)
			blur_eyes(3)
			if(wound_messages)
				SEND_SIGNAL(src, COMSIG_CARBON_ADD_TO_WOUND_MESSAGE, span_danger(" [src] [p_are()] impulsed!"))
/*
		if(BODY_ZONE_PRECISE_GROIN)
			if(getorganslotefficiency(ORGAN_SLOT_TESTICLES) > ORGAN_FAILING_EFFICIENCY)
				flash_pain_major()
				Stumble(10 SECONDS)
				if(wound_messages)
					SEND_SIGNAL(src, COMSIG_CARBON_ADD_TO_WOUND_MESSAGE, span_danger(" [src] [p_are()] gelding blowed!"))
*/
/*
	if(LAZYACCESS(diceroll, RETURN_DICE_INDEX_SUCCESS) == DICE_SUCCESS)
		KnockToFloor(5 SECONDS)
	if(LAZYACCESS(diceroll, RETURN_DICE_INDEX_SUCCESS) <= DICE_SUCCESS)
		KnockToFloor(7 SECONDS)
*/
	//OW!
	if(prob(25))
		//vomit with blood
//		if(vomiting && (stat < DEAD))
//			vomit(10, TRUE, FALSE)
		Unconscious(4 SECONDS)
//		if(wound_messages)
//			if((body_zone == BODY_ZONE_PRECISE_VITALS) && prob(10))
//				//gut status: busted
//				playsound(src, 'modular_septic/sound/effects/gutbusted.ogg', 100, 0)
//				SEND_SIGNAL(src, COMSIG_CARBON_ADD_TO_WOUND_MESSAGE, span_bolddanger(" [span_big("<u>Gut busted</u>!")]"))
//			else
//				SEND_SIGNAL(src, COMSIG_CARBON_ADD_TO_WOUND_MESSAGE, span_bolddanger(" [span_big("<u>Knock-out</u>!")]"))
//	else if(vomiting)
//		//vomit without blood
//		vomit(10, FALSE, FALSE)
	last_major_wound = world.time

/mob/proc/flash_pain_major()
	if(!hud_used?.pain_flash)
		return
	flick("pain", hud_used.pain_flash)
