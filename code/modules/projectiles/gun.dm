
#define DUALWIELD_PENALTY_EXTRA_MULTIPLIER 1.4

/particles/firing_smoke
	icon = 'icons/effects/96x96.dmi'
	icon_state = "smoke5"
	width = 500
	height = 500
	count = 5
	spawning = 15
	lifespan = 0.5 SECONDS
	fade = 2.4 SECONDS
	grow = 0.12
	drift = generator(GEN_CIRCLE, 8, 8)
	scale = 0.1
	spin = generator(GEN_NUM, -20, 20)
	velocity = list(50, 0)
	friction = generator(GEN_NUM, 0.3, 0.6)

/obj/item/gun
	name = "gun"
	desc = ""
	var/image/rust_overlay = null //for condition shit
	var/condition_icon = 'icons/obj/guns/projectile.dmi'
	icon = 'icons/obj/guns/projectile.dmi'
	icon_state = "detective"
	item_state = "gun"
	flags_1 =  CONDUCT_1
	slot_flags = ITEM_SLOT_BELT
	custom_materials = list(/datum/material/iron=2000)
	w_class = WEIGHT_CLASS_NORMAL
	possible_item_intents = list(INTENT_GENERIC, RANGED_FIRE)
	throwforce = 5
	throw_speed = 1
	throw_range = 5
	force = 5
	item_flags = NEEDS_PERMIT
	attack_verb = list("struck", "hit", "bashed")
	gripped_intents = list(INTENT_GENERIC, RANGED_FIRE)
	var/fire_sound = 'sound/blank.ogg'
	var/vary_fire_sound = TRUE
	var/fire_sound_volume = 50
	var/dry_fire_sound = 'sound/panopticon/empty.ogg'
	var/suppressed = null					//whether or not a message is displayed when fired
	var/can_suppress = FALSE
	var/suppressed_sound = 'sound/blank.ogg'
	var/suppressed_volume = 60
	var/can_unsuppress = TRUE
	///boom boom shake the room
	var/recoil = 0
	///a multiplier of the duration the recoil takes to go back to normal view, this is (recoil*recoil_backtime_multiplier)+1
	var/recoil_backtime_multiplier = 2
	///this is how much deviation the gun recoil can have, recoil pushes the screen towards the reverse angle you shot + some deviation which this is the max.
	var/recoil_deviation = 22.5
	var/clumsy_check = TRUE
	var/obj/item/ammo_casing/chambered = null
	trigger_guard = TRIGGER_GUARD_NORMAL	//trigger guard on the weapon, hulks can't fire them with their big meaty fingers
	var/sawn_desc = null				//description change if weapon is sawn-off
	var/sawn_off = FALSE
	var/burst_size = 1					//how large a burst is
	var/fire_delay = 0					//rate of fire for burst firing and semi auto
	var/firing_burst = 0				//Prevent the weapon from firing again while already firing
	var/semicd = 0						//cooldown handler
	var/weapon_weight = WEAPON_LIGHT
	var/barrel_smoke_on_shoot = FALSE
	var/dual_wield_spread = 24			//additional spread when dual wielding
	var/spread = 0						//Spread induced by the gun itself.
	var/randomspread = 1				//Set to 0 for shotguns. This is used for weapons that don't fire all their bullets at once.

	var/candeaf = 1 // can go deaf or nah
	lefthand_file = 'icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/guns_righthand.dmi'

	var/obj/item/firing_pin/pin = /obj/item/firing_pin //standard firing pin for most guns

	var/can_flashlight = FALSE //if a flashlight can be added or removed if it already has one.
	var/obj/item/flashlight/seclite/gun_light
	var/mutable_appearance/flashlight_overlay
	var/datum/action/item_action/toggle_gunlight/alight
	var/gunlight_state = "flight"

	var/can_bayonet = FALSE //if a bayonet can be added or removed if it already has one.
	var/obj/item/kitchen/knife/bayonet
	var/mutable_appearance/knife_overlay
	var/knife_x_offset = 0
	var/knife_y_offset = 0

	var/ammo_x_offset = 0 //used for positioning ammo count overlay on sprite
	var/ammo_y_offset = 0
	var/flight_x_offset = 0
	var/flight_y_offset = 0

	//Zooming
	var/zoomable = FALSE //whether the gun generates a Zoom action on creation
	var/zoomed = FALSE //Zoom toggle
	var/zoom_amt = 3 //Distance in TURFs to move the user's screen forward (the "zoom" effect)
	var/zoom_out_amt = 0
	var/datum/action/toggle_scope_zoom/azoom

	var/automatic = 0 //can gun use it, 0 is no, anything above 0 is the delay between clicks in ds
	var/pb_knockback = 0

	var/is_jammed = FALSE	//Whether this gun is jammed
	var/condition = 100
//	var/safety = FALSE	//Whether or not the safety is on.
	var/broken = FALSE //weapon broken or no
	var/jammed_icon
	var/can_jam = FALSE

/obj/item/gun/Initialize()
	. = ..()
	if(pin)
		pin = new pin(src)
	if(gun_light)
		alight = new(src)
	build_zooming()

/obj/item/gun/Destroy()
	if(isobj(pin)) //Can still be the initial path, then we skip
		QDEL_NULL(pin)
	if(gun_light)
		QDEL_NULL(gun_light)
	if(bayonet)
		QDEL_NULL(bayonet)
	if(chambered) //Not all guns are chambered (EMP'ed energy guns etc)
		QDEL_NULL(chambered)
	if(azoom)
		QDEL_NULL(azoom)
	return ..()

/obj/item/gun/handle_atom_del(atom/A)
	if(A == pin)
		pin = null
	if(A == chambered)
		chambered = null
		update_icon()
	if(A == bayonet)
		clear_bayonet()
	if(A == gun_light)
		clear_gunlight()
	return ..()

/obj/item/gun/CheckParts(list/parts_list)
	..()
	var/obj/item/gun/G = locate(/obj/item/gun) in contents
	if(G)
		G.forceMove(loc)
		QDEL_NULL(G.pin)
		visible_message(span_notice("[G] can now fit a new pin, but the old one was destroyed in the process."), null, null, 3)
		qdel(src)

/obj/item/gun/examine(mob/user)
	. = ..()
	if(is_jammed)
		. += span_warning("[src] looks <b>jammed</b>.</span>")
	. += span_info("CONDITION: <b>[CheckCondition()]</b>")
//	if(pin)
//		. += "It has \a [pin] installed."
//	else
//		. += "It doesn't have a <b>firing pin</b> installed, and won't fire."

//	if(gun_light)
//		. += "It has \a [gun_light] [can_flashlight ? "" : "permanently "]mounted on it."
//		if(can_flashlight) //if it has a light and this is false, the light is permanent.
//			. += span_info("[gun_light] looks like it can be <b>unscrewed</b> from [src].")
//	else if(can_flashlight)
//		. += "It has a mounting point for a <b>seclite</b>."

//	if(bayonet)
//		. += "It has \a [bayonet] [can_bayonet ? "" : "permanently "]affixed to it."
//		if(can_bayonet) //if it has a bayonet and this is false, the bayonet is permanent.
//			. += span_info("[bayonet] looks like it can be <b>unscrewed</b> from [src].")
//	else if(can_bayonet)
//		. += "It has a <b>bayonet</b> lug on it."

/obj/item/gun/equipped(mob/living/user, slot)
	. = ..()
	if(zoomed && user.get_active_held_item() != src)
		zoom(user, FALSE) //we can only stay zoomed in if it's in our hands	//yeah and we only unzoom if we're actually zoomed using the gun!!

//called after the gun has successfully fired its chambered ammo.
/obj/item/gun/proc/process_chamber()
	return FALSE

//check if there's enough ammo/energy/whatever to shoot one time
//i.e if clicking would make it shoot
/obj/item/gun/proc/can_shoot()
	if(is_jammed) //If it's jammed always melee attack.
		return FALSE
	return TRUE

/obj/item/gun/proc/shoot_with_empty_chamber(mob/living/user as mob|obj)
	if(is_jammed)
		to_chat(user, span_danger("*jam jam*"))
		playsound(src, 'sound/panopticon/jam.ogg', 50, TRUE)
	else
		to_chat(user, span_danger("*click click*"))
		playsound(src, dry_fire_sound, 50, TRUE)


/obj/item/gun/proc/shoot_live_shot(mob/living/user as mob|obj, pointblank = 0, mob/pbtarget = null, message = 1)
	var/angle = get_angle(user, pbtarget)+rand(-recoil_deviation, recoil_deviation) + 180
	if(angle > 360)
		angle -= 360
	if(recoil)
		recoil_camera(user, recoil+1, (recoil*recoil_backtime_multiplier) + 1, recoil, angle)

	if(suppressed)
		playsound(user, suppressed_sound, suppressed_volume, vary_fire_sound, ignore_walls = FALSE)
	else
		playsound(user, fire_sound, fire_sound_volume, vary_fire_sound)
		if(message)
/*			if(pointblank)
				user.visible_message(span_danger("[user] shoots [src] point blank at [pbtarget]!"), \
								span_danger("I shoot [src] point blank at [pbtarget]!"), \
								COMBAT_MESSAGE_RANGE, pbtarget)
				to_chat(pbtarget, span_danger("[user] shoots [src] point blank at me!"))
				if(pb_knockback > 0)
					var/atom/throw_target = get_edge_target_turf(pbtarget, user.dir)
					pbtarget.throw_at(throw_target, pb_knockback, 2)

			else*/
			user.visible_message(span_danger("[user] shoots [src]!"), \
							span_danger("I shoot [src]!"), \
							COMBAT_MESSAGE_RANGE)
	user.overlay_fullscreen("supress",/atom/movable/screen/fullscreen/oxy, 6)
	if(!user.STAPER >= 11 && candeaf == 1)
		if(prob(85))
			user.soundbang_act()
	if(barrel_smoke_on_shoot)
		var/x_component = sin(get_angle(user, pbtarget)) * 40
		var/y_component = cos(get_angle(user, pbtarget)) * 40
		var/obj/effect/abstract/particle_holder/gun_smoke = new(get_turf(src), /particles/firing_smoke)
		gun_smoke.particles.velocity = list(x_component, y_component)
		addtimer(VARSET_CALLBACK(gun_smoke.particles, count, 0), 5)
		addtimer(VARSET_CALLBACK(gun_smoke.particles, drift, 0), 3)
		QDEL_IN(gun_smoke, 0.6 SECONDS)
	sleep(0.3 SECONDS)	
	user.clear_fullscreen("supress")


/obj/item/gun/emp_act(severity)
	. = ..()
	if(!(. & EMP_PROTECT_CONTENTS))
		for(var/obj/O in contents)
			O.emp_act(severity)

/obj/item/gun/afterattack(atom/target, mob/living/user, flag, params)
	. = ..()
	testing("gun afterattack")
	if(!target)
		testing("no target")
		return
	if(firing_burst)
		return
	if(!user?.used_intent.tranged) //melee attack
		return
	if(flag) //It's adjacent, is the user, or is on the user's person
		if(target in user.contents) //can't shoot stuff inside us.
			return
		if(!ismob(target)) //melee attack
			testing("gun with melee attack selected")
			return
		if(target == user && user.zone_selected != BODY_ZONE_PRECISE_MOUTH) //so we can't shoot ourselves (unless mouth selected)
			return

	if(istype(user))//Check if the user can use the gun, if the user isn't alive(turrets) assume it can.
		var/mob/living/L = user
		if(!can_trigger_gun(L))
			return

	if(flag)
		if(user.zone_selected == BODY_ZONE_PRECISE_MOUTH)
			handle_suicide(user, target, params)
			return

	if(!can_shoot()) //Just because you can pull the trigger doesn't mean it can shoot.
		shoot_with_empty_chamber(user)
		return

	if(user?.used_intent.arc_check())
		target = get_turf(target)

	//Exclude lasertag guns from the TRAIT_CLUMSY check.
	if(clumsy_check)
		if(istype(user))
			if (HAS_TRAIT(user, TRAIT_CLUMSY) && prob(40))
				to_chat(user, span_danger("I shoot myself in the foot with [src]!"))
				var/shot_leg = pick(BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)
				process_fire(user, user, FALSE, params, shot_leg)
				user.dropItemToGround(src, TRUE)
				return
	if(broken)
		to_chat(user, "<span class='danger'>The gun is broken!</span>")
		shoot_with_empty_chamber(user)
		return 0

	if(is_jammed)
		shoot_with_empty_chamber(user)
		return 0
//	var/obj/item/bodypart/other_hand = user.has_hand_for_held_index(user.get_inactive_hand_index()) //returns non-disabled inactive hands
//	if(weapon_weight == WEAPON_HEAVY && (user.get_inactive_held_item() || !other_hand))
//		to_chat(user, "<span class='warning'>I need two hands to fire \the [src]!</span>")
//		return
	//DUAL (or more!) WIELDING
	var/bonus_spread = 0
	var/loop_counter = 0
	if(ishuman(user) && user.used_intent.type == INTENT_HARM)
		var/mob/living/carbon/human/H = user
		for(var/obj/item/gun/G in H.held_items)
			if(G == src || G.weapon_weight >= WEAPON_MEDIUM)
				continue
			else if(G.can_trigger_gun(user))
				bonus_spread += dual_wield_spread
				loop_counter++
				addtimer(CALLBACK(G, TYPE_PROC_REF(/obj/item/gun, process_fire), target, user, TRUE, params, null, bonus_spread), loop_counter)

	return process_fire(target, user, TRUE, params, null, bonus_spread)



/obj/item/gun/can_trigger_gun(mob/living/user)
	. = ..()
	if(is_jammed) //If it's jammed always melee attack.
		return FALSE
	if(check_for_jam())
		return null
	if(!handle_pins(user))
		return FALSE

/obj/item/gun/proc/handle_pins(mob/living/user)
	if(pin)
		if(pin.pin_auth(user) || (pin.obj_flags & EMAGGED))
			return TRUE
		else
			pin.auth_fail(user)
			return FALSE
	else
		to_chat(user, span_warning("[src]'s trigger is locked. This weapon doesn't have a firing pin installed!"))
	return FALSE

/obj/item/gun/proc/recharge_newshot()
	return

/obj/item/gun/proc/process_burst(mob/living/user, atom/target, message = TRUE, params=null, zone_override = "", sprd = 0, randomized_gun_spread = 0, randomized_bonus_spread = 0, rand_spr = 0, iteration = 0)
	if(!user || !firing_burst)
		firing_burst = FALSE
		return FALSE
	if(!issilicon(user))
		if(iteration > 1 && !(user.is_holding(src))) //for burst firing
			firing_burst = FALSE
			return FALSE
	if(chambered && chambered.BB)
		if(HAS_TRAIT(user, TRAIT_PACIFISM)) // If the user has the pacifist trait, then they won't be able to fire [src] if the round chambered inside of [src] is lethal.
			if(chambered.harmful) // Is the bullet chambered harmful?
				to_chat(user, span_warning("[src] is lethally chambered! You don't want to risk harming anyone..."))
				return
		if(randomspread)
			sprd = round((rand() - 0.5) * DUALWIELD_PENALTY_EXTRA_MULTIPLIER * (randomized_gun_spread + randomized_bonus_spread))
		else //Smart spread
			sprd = round((((rand_spr/burst_size) * iteration) - (0.5 + (rand_spr * 0.25))) * (randomized_gun_spread + randomized_bonus_spread))
		before_firing(target,user)
		if(!chambered.fire_casing(target, user, params, ,suppressed, zone_override, sprd, src))
			shoot_with_empty_chamber(user)
			firing_burst = FALSE
			return FALSE
		else
//			if(get_dist(user, target) <= 1) //Making sure whether the target is in vicinity for the pointblank shot
//				shoot_live_shot(user, 1, target, message)
//			else
			shoot_live_shot(user, 0, target, message)
			if (iteration >= burst_size)
				firing_burst = FALSE
	else
		shoot_with_empty_chamber(user)
		firing_burst = FALSE
		return FALSE
	process_chamber()
	update_icon()
	return TRUE

/obj/item/gun/proc/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	add_fingerprint(user)

	if(semicd)
		return

	var/sprd = 0
	var/randomized_gun_spread = 0
	var/rand_spr = rand()
	if(spread)
		randomized_gun_spread =	rand(0,spread)
	if(HAS_TRAIT(user, TRAIT_POOR_AIM)) //nice shootin' tex
		bonus_spread += 25
	var/randomized_bonus_spread = rand(0, bonus_spread)

	if(burst_size > 1)
		firing_burst = TRUE
		for(var/i = 1 to burst_size)
			addtimer(CALLBACK(src, PROC_REF(process_burst), user, target, message, params, zone_override, sprd, randomized_gun_spread, randomized_bonus_spread, rand_spr, i), fire_delay * (i - 1))
	else
		if(chambered)
			if(HAS_TRAIT(user, TRAIT_PACIFISM)) // If the user has the pacifist trait, then they won't be able to fire [src] if the round chambered inside of [src] is lethal.
				if(chambered.harmful) // Is the bullet chambered harmful?
					to_chat(user, span_warning("[src] is lethally chambered! You don't want to risk harming anyone..."))
					return
			sprd = round((rand() - 0.5) * DUALWIELD_PENALTY_EXTRA_MULTIPLIER * (randomized_gun_spread + randomized_bonus_spread))
			before_firing(target,user)
			if(!chambered.fire_casing(target, user, params, , suppressed, zone_override, sprd, src))
				shoot_with_empty_chamber(user)
				return
			else
//				if(get_dist(user, target) <= 1) //Making sure whether the target is in vicinity for the pointblank shot
//					shoot_live_shot(user, 1, target, message)
//				else
				shoot_live_shot(user, 0, target, message)
		else
			shoot_with_empty_chamber(user)
			return
		process_chamber()
		if(istype(src, /obj/item/gun/ballistic))
			var/obj/item/gun/ballistic/P = src
			if(P.can_jam)
				P.condition -= 1
		update_icon()
		semicd = TRUE
		addtimer(CALLBACK(src, PROC_REF(reset_semicd)), fire_delay)

	if(user)
		user.update_inv_hands()
	SSblackbox.record_feedback("tally", "gun_fired", 1, type)
	return TRUE

/obj/item/gun/update_icon()
	..()
	overlays.Remove(rust_overlay)
	var/icon/I = new/icon(icon, icon_state)
	I.Blend(new /icon(condition_icon,rgb(255,255,255)), ICON_MULTIPLY)
	I.Blend(new /icon(condition_icon, icon_state = "[get_condition_icon()]"), ICON_ADD)
	rust_overlay = image(I)
	rust_overlay.color = "#773d28"
	overlays += rust_overlay
	if(is_jammed)
		if(jammed_icon)
			icon_state = jammed_icon

/obj/item/gun/proc/reset_semicd()
	semicd = FALSE

/obj/item/gun/attack(mob/M as mob, mob/user)
	if(!user.used_intent.tranged) //Flogging
		if(bayonet)
			M.attackby(bayonet, user)
			return
		else
			return ..()
	return

/obj/item/gun/attack_obj(obj/O, mob/user)
	if(!user.used_intent.tranged)
		if(bayonet)
			O.attackby(bayonet, user)
			return
		else
			return ..()
	return

/obj/item/gun/attackby(obj/item/I, mob/user, params)
	if(!user.used_intent.tranged)
		return ..()
	else if(istype(I, /obj/item/flashlight/seclite))
		if(!can_flashlight)
			return ..()
		var/obj/item/flashlight/seclite/S = I
		if(!gun_light)
			if(!user.transferItemToLoc(I, src))
				return
			to_chat(user, span_notice("I click [S] into place on [src]."))
			if(S.on)
				set_light(0)
			gun_light = S
			update_gunlight()
			alight = new(src)
			if(loc == user)
				alight.Grant(user)
	else if(istype(I, /obj/item/kitchen/knife))
		var/obj/item/kitchen/knife/K = I
		if(!can_bayonet || !K.bayonet || bayonet) //ensure the gun has an attachment point available, and that the knife is compatible with it.
			return ..()
		if(!user.transferItemToLoc(I, src))
			return
		to_chat(user, span_notice("I attach [K] to [src]'s bayonet lug."))
		bayonet = K
		var/state = "bayonet"							//Generic state.
		if(bayonet.icon_state in icon_states('icons/obj/guns/bayonets.dmi'))		//Snowflake state?
			state = bayonet.icon_state
		var/icon/bayonet_icons = 'icons/obj/guns/bayonets.dmi'
		knife_overlay = mutable_appearance(bayonet_icons, state)
		knife_overlay.pixel_x = knife_x_offset
		knife_overlay.pixel_y = knife_y_offset
		add_overlay(knife_overlay, TRUE)
	else
		return ..()

/obj/item/gun/screwdriver_act(mob/living/user, obj/item/I)
	. = ..()
	if(.)
		return
	if(!user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
		return
	if((can_flashlight && gun_light) && (can_bayonet && bayonet)) //give them a choice instead of removing both
		var/list/possible_items = list(gun_light, bayonet)
		var/obj/item/item_to_remove = input(user, "Select an attachment to remove", "Attachment Removal") as null|obj in sortNames(possible_items)
		if(!item_to_remove || !user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
			return
		return remove_gun_attachment(user, I, item_to_remove)

	else if(gun_light && can_flashlight) //if it has a gun_light and can_flashlight is false, the flashlight is permanently attached.
		return remove_gun_attachment(user, I, gun_light, "unscrewed")

	else if(bayonet && can_bayonet) //if it has a bayonet, and the bayonet can be removed
		return remove_gun_attachment(user, I, bayonet, "unfix")

/obj/item/gun/proc/remove_gun_attachment(mob/living/user, obj/item/tool_item, obj/item/item_to_remove, removal_verb)
	if(tool_item)
		tool_item.play_tool_sound(src)
	to_chat(user, span_notice("I [removal_verb ? removal_verb : "remove"] [item_to_remove] from [src]."))
	item_to_remove.forceMove(drop_location())

	if(Adjacent(user) && !issilicon(user))
		user.put_in_hands(item_to_remove)

	if(item_to_remove == bayonet)
		return clear_bayonet()
	else if(item_to_remove == gun_light)
		return clear_gunlight()

/obj/item/gun/proc/clear_bayonet()
	if(!bayonet)
		return
	bayonet = null
	if(knife_overlay)
		cut_overlay(knife_overlay, TRUE)
		knife_overlay = null
	return TRUE

/obj/item/gun/proc/clear_gunlight()
	if(!gun_light)
		return
	var/obj/item/flashlight/seclite/removed_light = gun_light
	gun_light = null
	update_gunlight()
	removed_light.update_brightness()
	QDEL_NULL(alight)
	return TRUE

/obj/item/gun/ui_action_click(mob/user, actiontype)
	if(istype(actiontype, alight))
		toggle_gunlight()
	else
		..()

/obj/item/gun/proc/toggle_gunlight()
	if(!gun_light)
		return

	var/mob/living/carbon/human/user = usr
	gun_light.on = !gun_light.on
	to_chat(user, span_notice("I toggle the gunlight [gun_light.on ? "on":"off"]."))

	playsound(user, 'sound/blank.ogg', 100, TRUE)
	update_gunlight()

/obj/item/gun/proc/update_gunlight()
	if(gun_light)
		if(gun_light.on)
			set_light(gun_light.light_power)
		else
			set_light(0)
		cut_overlays(flashlight_overlay, TRUE)
		var/state = "[gunlight_state][gun_light.on? "_on":""]"	//Generic state.
		if(gun_light.icon_state in icon_states('icons/obj/guns/flashlights.dmi'))	//Snowflake state?
			state = gun_light.icon_state
		flashlight_overlay = mutable_appearance('icons/obj/guns/flashlights.dmi', state)
		flashlight_overlay.pixel_x = flight_x_offset
		flashlight_overlay.pixel_y = flight_y_offset
		add_overlay(flashlight_overlay, TRUE)
		add_overlay(knife_overlay, TRUE)
	else
		set_light(0)
		cut_overlays(flashlight_overlay, TRUE)
		flashlight_overlay = null
	update_icon(TRUE)
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/gun/pickup(mob/user)
	..()
	if(azoom)
		azoom.Grant(user)

/obj/item/gun/dropped(mob/user)
	. = ..()
	if(azoom)
		azoom.Remove(user)
	if(zoomed)
		zoom(user,FALSE)

/obj/item/gun/proc/handle_suicide(mob/living/carbon/human/user, mob/living/carbon/human/target, params, bypass_timer)
	if(!ishuman(user) || !ishuman(target))
		return

	if(semicd)
		return

	if(user == target)
		target.visible_message(span_warning("[user] sticks [src] in [user.p_their()] mouth, ready to pull the trigger..."), \
			span_danger("I stick [src] in mouth, ready to pull the trigger..."))
	else
		target.visible_message(span_warning("[user] points [src] at [target]'s head, ready to pull the trigger..."), \
			span_danger("[user] points [src] at head, ready to pull the trigger..."))

	semicd = TRUE

	if(!bypass_timer && (!do_mob(user, target, 120) || user.zone_selected != BODY_ZONE_PRECISE_MOUTH))
		if(user)
			if(user == target)
				user.visible_message(span_notice("[user] decided not to shoot."))
			else if(target && target.Adjacent(user))
				target.visible_message(span_notice("[user] has decided to spare [target]"), span_notice("[user] has decided to spare your life!"))
		semicd = FALSE
		return

	semicd = FALSE

	target.visible_message(span_warning("[user] pulls the trigger!"), span_danger("[(user == target) ? "You pull" : "[user] pulls"] the trigger!"))

	if(chambered && chambered.BB)
		if(prob(95))
			var/obj/item/bodypart/head/head = target.get_bodypart(BODY_ZONE_HEAD)
			target.death(FALSE)
			head.dismember(BRUTE, destroy = TRUE)
			chambered.BB.damage *= 30
			var/obj/item/organ/brain/brain = target.getorganslot(ORGAN_SLOT_BRAIN)
			if(brain)
				brain.applyOrganDamage(500)
		else
			target.visible_message(span_alert("[target] is still alive after the shoot!"), span_userdanger("I AM STILL ALIVE!.."))
			target.emote("agony")
			target.Knockdown(110)
			target.Jitter(110)
			chambered.BB.damage *= 15
	process_fire(target, user, TRUE, params, BODY_ZONE_HEAD)

/obj/item/gun/proc/unlock() //used in summon guns and as a convience for admins
	if(pin)
		qdel(pin)
	pin = new /obj/item/firing_pin

//Happens before the actual projectile creation
/obj/item/gun/proc/before_firing(atom/target,mob/user)
	return

/////////////
// ZOOMING //
/////////////

/datum/action/toggle_scope_zoom
	name = "Toggle Scope"
	check_flags = AB_CHECK_CONSCIOUS|AB_CHECK_RESTRAINED|AB_CHECK_STUN|AB_CHECK_LYING
	icon_icon = 'icons/mob/actions/actions_items.dmi'
	button_icon_state = "sniper_zoom"
	var/obj/item/gun/gun = null

/datum/action/toggle_scope_zoom/Trigger()
	gun.zoom(owner)

/datum/action/toggle_scope_zoom/IsAvailable()
	. = ..()
	if(!. && gun)
		gun.zoom(owner, FALSE)

/datum/action/toggle_scope_zoom/Remove(mob/living/L)
	gun.zoom(L, FALSE)
	..()


/obj/item/gun/proc/zoom(mob/living/user, forced_zoom)
	if(!user || !user.client)
		return

	switch(forced_zoom)
		if(FALSE)
			zoomed = FALSE
		if(TRUE)
			zoomed = TRUE
		else
			zoomed = !zoomed

	if(zoomed)
		var/_x = 0
		var/_y = 0
		switch(user.dir)
			if(NORTH)
				_y = zoom_amt
			if(EAST)
				_x = zoom_amt
			if(SOUTH)
				_y = -zoom_amt
			if(WEST)
				_x = -zoom_amt

		user.client.change_view(zoom_out_amt)
		user.client.pixel_x = world.icon_size*_x
		user.client.pixel_y = world.icon_size*_y
	else
		user.client.change_view(CONFIG_GET(string/default_view))
		user.client.pixel_x = 0
		user.client.pixel_y = 0
	return zoomed

//Proc, so that gun accessories/scopes/etc. can easily add zooming.
/obj/item/gun/proc/build_zooming()
	if(azoom)
		return

	if(zoomable)
		azoom = new()
		azoom.gun = src

/obj/item/gun/proc/unjam(var/mob/M)
	if(is_jammed)
		M.visible_message("<span class='notice'>\The [M] begins to unjam [src].</span>", "<span class='notice'>You begin to clear the jam of [src]</span>")
		if(!do_after(M, 20, src))
			return
		is_jammed = 0
		playsound(src.loc, 'sound/panopticon/unjam.ogg', 65, 1)
		update_icon()
		return

/obj/item/gun/MiddleClick(mob/user, params)
	if(is_jammed)
		unjam(user)
//	else
//		safety = !safety
//		playsound(user, 'sound/panopticon/safety.ogg', 50, 1)
//		to_chat(user, "<span class='notice'>You toggle the safety [safety ? "on":"off"].</span>")
	return TRUE

/obj/item/gun/proc/GetConditionProb()
	switch(condition)
		if(0)
			return 100
		if(1 to 10)
			return rand(20,40)
		if(11 to 20)
			return rand(8,30)
		if(21 to 30)
			return rand(4,25)
		if(31 to 40)
			return rand(2,20)
		if(41 to 50)
			return rand(1,15)
		if(51 to 60)
			return rand(0,10)
		if(61 to 70)
			return rand(0,7)
		if(71 to 80)
			return rand(0,5)
		if(81 to 90)
			return rand(0,3)
		if(91 to 100)
			return rand(0,2)
		if(100 to INFINITY)
			return 0

/obj/item/gun/proc/check_for_jam()
	if(!can_jam)//If the gun can't jam then always return true.
		return FALSE
	if((!is_jammed && prob(GetConditionProb())))
		var/mob/user = usr
		playsound(src.loc, 'sound/panopticon/jam.ogg', 60, 1)
		to_chat(user, span_danger("The [src] jams!"))
		is_jammed = 1
		update_icon()
		return TRUE

/obj/item/gun/proc/get_condition_icon()
	switch(condition)
		if(1 to 30)
			return "condition_8"
		if(31 to 40)
			return "condition_7"
		if(41 to 50)
			return "condition_6"
		if(51 to 60)
			return "condition_5"
		if(61 to 70)
			return "condition_4"
		if(71 to 80)
			return "condition_3"
		if(81 to 90)
			return "condition_2"
		if(91 to INFINITY)
			return "condition_1"

/obj/item/gun/proc/CheckCondition()
	switch(condition)
		if(0)
			return "Broken"
		if(1 to 10)
			return "Terrible"
		if(11 to 20)
			return "Poor"
		if(21 to 30)
			return "Shoddy"
		if(31 to 40)
			return "Fair"
		if(41 to 50)
			return "Average"
		if(51 to 60)
			return "Good"
		if(61 to 70)
			return "Great"
		if(71 to 80)
			return "Excellent"
		if(81 to 90)
			return "Superb"
		if(91 to INFINITY)
			return "Perfect"
