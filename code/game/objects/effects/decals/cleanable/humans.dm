/obj/effect/decal/cleanable/blood
	name = "blood"
	desc = ""
	icon = 'icons/effects/blood.dmi'
	icon_state = "floor1"
	random_icon_states = list("floor1", "floor2", "floor3", "floor4", "floor5", "floor6")
	blood_state = BLOOD_STATE_HUMAN
	bloodiness = BLOOD_AMOUNT_PER_DECAL
	beauty = -100
	alpha = 200
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	appearance_flags = NO_CLIENT_COLOR
	var/blood_timer
	var/wash_precent = 0
	COOLDOWN_DECLARE(wash_cooldown)

/obj/effect/decal/cleanable/blood/weather_act_on(weather_trait, severity)
	if(weather_trait != PARTICLEWEATHER_RAIN || !COOLDOWN_FINISHED(src, wash_cooldown))
		return
	wash_precent += min(10, severity / 4)
	alpha = 255 * (100 - wash_precent)
	if(wash_precent >= 100)
		qdel(src)
	COOLDOWN_START(src, wash_cooldown, 15 SECONDS)

/obj/effect/decal/cleanable/blood/Initialize(mapload, list/datum/disease/diseases)
	. = ..()
	if(. == INITIALIZE_HINT_QDEL)
		return .
	pixel_x = rand(-5,5)
	pixel_y = rand(5,5)
	blood_timer = addtimer(CALLBACK(src, .proc/become_dry), rand(5 MINUTES,8 MINUTES), TIMER_STOPPABLE)
	GLOB.weather_act_upon_list += src

/obj/effect/decal/cleanable/blood/proc/become_dry()
	if(QDELETED(src))
		return
	name = "dry [initial(name)]"
	color = "#967c69"
	bloodiness = 0

/obj/effect/decal/cleanable/blood/replace_decal(obj/effect/decal/cleanable/C)
	. = ..()
	if(C)
		C.alpha = initial(alpha)
		C.bloodiness = initial(bloodiness)
		C.name = initial(name)
		C.color = initial(color)

/obj/effect/decal/cleanable/blood/Destroy()
	deltimer(blood_timer)
	blood_timer = null
	GLOB.weather_act_upon_list -= src
	return ..()

/obj/effect/decal/cleanable/blood/old
	name = "dried blood"
	desc = ""
	bloodiness = 0
	icon_state = "floor1-old"

/obj/effect/decal/cleanable/blood/old/Initialize(mapload, list/datum/disease/diseases)
	add_blood_DNA(list("Non-human DNA" = random_blood_type())) // Needs to happen before ..()
	. = ..()
	icon_state = "[icon_state]-old" //change from the normal blood icon selected from random_icon_states in the parent's Initialize to the old dried up blood.

/obj/effect/decal/cleanable/blood/splatter
	icon_state = "gibbl1"
	random_icon_states = list("gibbl1", "gibbl2", "gibbl3", "gibbl4", "gibbl5")
	var/drips = 1
///Absorb the /squirt subtype when it exists on the turf
	var/absorb_squirts = TRUE

/obj/effect/decal/cleanable/blood/splatter/Initialize(mapload)
	. = ..()
	var/obj/effect/decal/cleanable/blood/squirt/existing_squirt = locate() in loc
	if(existing_squirt)
		add_blood_DNA(existing_squirt.return_blood_DNA())
		bloodiness = min((existing_squirt.bloodiness + bloodiness), BLOOD_AMOUNT_PER_DECAL)
		qdel(existing_squirt)

/obj/effect/decal/cleanable/blood/splatter/over_window // special layer/plane set to appear on windows
	layer = ABOVE_WINDOW_LAYER
	plane = GAME_PLANE
	turf_loc_check = FALSE
	alpha = 180
	absorb_squirts = FALSE

/obj/effect/decal/cleanable/blood/splatter/replace_decal(obj/effect/decal/cleanable/C) // Returns true if we should give up in favor of the pre-existing decal
	if(..())
		var/obj/effect/decal/cleanable/blood/splatter/P = C
		P.drips++
		if(P.drips > 2)
			var/turf/T = loc
			if(istype(T))
				new /obj/effect/decal/cleanable/blood(T)
				qdel(P)
		return TRUE


/obj/effect/decal/cleanable/blood/tracks
	icon_state = "tracks"
	desc = ""
	random_icon_states = null
	beauty = -50

/obj/effect/decal/cleanable/trail_holder //not a child of blood on purpose
	name = "blood"
	icon = 'icons/effects/blood.dmi'
	desc = ""
	beauty = -50
	var/list/existing_dirs = list()
	alpha = 200
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	appearance_flags = NO_CLIENT_COLOR
	var/blood_timer
	var/wash_precent = 0
	COOLDOWN_DECLARE(wash_cooldown)

/obj/effect/decal/cleanable/trail_holder/Initialize(mapload, list/datum/disease/diseases)
	. = ..()
	if(. == INITIALIZE_HINT_QDEL)
		return .
	blood_timer = addtimer(CALLBACK(src, .proc/become_dry), rand(5 MINUTES,8 MINUTES), TIMER_STOPPABLE)

/obj/effect/decal/cleanable/trail_holder/Destroy()
	deltimer(blood_timer)
	blood_timer = null
	return ..()

/obj/effect/decal/cleanable/trail_holder/proc/become_dry()
	if(QDELETED(src))
		return
	name = "dry [initial(name)]"
	color = "#967c69"
	alpha = 100
	bloodiness = 0

/obj/effect/decal/cleanable/trail_holder/can_bloodcrawl_in()
	return TRUE

/obj/effect/decal/cleanable/blood/gibs
	name = "gibs"
	desc = ""
	icon = 'icons/effects/blood.dmi'
	icon_state = "gib1"
	layer = LOW_OBJ_LAYER
	random_icon_states = list("gib1", "gib2", "gib3", "gib4", "gib5", "gib6")
	mergeable_decal = FALSE
	var/nice_noises = list('sound/panopticon/fleshstep1.ogg', 'sound/panopticon/fleshstep2.ogg', 'sound/panopticon/fleshstep3.ogg')
	var/already_rotting = FALSE


/obj/effect/decal/cleanable/blood/gibs/Crossed(mob/living/L)
	if(istype(L) && has_gravity(loc))
		playsound(loc, nice_noises, HAS_TRAIT(L, TRAIT_LIGHT_STEP) ? 20 : 50, TRUE)
	. = ..()

/obj/effect/decal/cleanable/blood/gibs/proc/streak(list/directions)
	set waitfor = FALSE
	var/list/diseases = list()
	SEND_SIGNAL(src, COMSIG_GIBS_STREAK, directions, diseases)
	var/direction = pick(directions)
	for(var/i in 0 to rand(1,3))
		sleep(2)
		if(i > 0)
			new /obj/effect/decal/cleanable/blood/splatter(loc, diseases)
		if(!step_to(src, get_step(src, direction), 0))
			break

/obj/effect/decal/cleanable/blood/gibs/up
	icon_state = "gibup1"
	random_icon_states = list("gib1", "gib2", "gib3", "gib4", "gib5", "gib6","gibup1","gibup1","gibup1")

/obj/effect/decal/cleanable/blood/gibs/down
	icon_state = "gibdown1"
	random_icon_states = list("gib1", "gib2", "gib3", "gib4", "gib5", "gib6","gibdown1","gibdown1","gibdown1")

/obj/effect/decal/cleanable/blood/gibs/body
	icon_state = "gibtorso"
	random_icon_states = list("gibhead", "gibtorso")

/obj/effect/decal/cleanable/blood/gibs/torso
	icon_state = "gibtorso"
	random_icon_states = null

/obj/effect/decal/cleanable/blood/gibs/limb
	icon_state = "gibleg"
	random_icon_states = list("gibleg", "gibarm")

/obj/effect/decal/cleanable/blood/gibs/core
	icon_state = "gibmid1"
	random_icon_states = list("gibmid1", "gibmid2", "gibmid3")

/obj/effect/decal/cleanable/blood/gibs/old
	name = "old rotting gibs"
	desc = ""
	bloodiness = 0
	already_rotting = TRUE

/obj/effect/decal/cleanable/blood/gibs/old/Initialize(mapload, list/datum/disease/diseases)
	. = ..()
	setDir(pick(1,2,4,8))
	icon_state += "-old"
	add_blood_DNA(list("Non-human DNA" = random_blood_type()))

/obj/effect/decal/cleanable/blood/drip
	name = "drips of blood"
	desc = ""
	icon_state = "drip1"
	bloodiness = 0
	alpha = 150
	var/drips = 1
	var/blood_vol = 1
	random_icon_states = null

/obj/effect/decal/cleanable/blood/drip/Initialize(mapload, list/datum/disease/diseases)
	. = ..()
	if(. == INITIALIZE_HINT_QDEL)
		return .
	setDir(pick(1,2,4,8))

/obj/effect/decal/cleanable/blood/drip/can_bloodcrawl_in()
	return TRUE

/obj/effect/decal/cleanable/blood/drip/update_icon()
	icon_state = "drip[drips]"
	if(drips > 5)
		var/turf/T = loc
		if(istype(T))
			var/obj/effect/decal/cleanable/blood/puddle/PUD = locate() in T
			if(!PUD)
				PUD = new(T)
				PUD.blood_vol = blood_vol

/obj/effect/decal/cleanable/blood/drip/replace_decal(obj/effect/decal/cleanable/C) // Returns true if we should give up in favor of the pre-existing decal
	if(..())
		var/obj/effect/decal/cleanable/blood/drip/P = C
		P.drips++
		if(P.drips > 5)
			var/turf/T = loc
			if(istype(T))
				var/obj/effect/decal/cleanable/blood/puddle/PUD = new(T)
				PUD.blood_vol = blood_vol
				qdel(P)
		else
			P.update_icon()
		return TRUE

/obj/effect/decal/cleanable/blood/puddle
	name = "puddle of blood"
	desc = ""
	icon_state = "pool1"
	bloodiness = 0
	alpha = 150
	var/blood_vol = 10
	random_icon_states = null

/obj/effect/decal/cleanable/blood/puddle/update_icon()
	switch(blood_vol)
		if(450 to INFINITY)
			icon_state = "pool5"
		if(350 to 450)
			icon_state = "pool4"
		if(250 to 350)
			icon_state = "pool3"
		if(50 to 250)
			icon_state = "pool2"
		if(1 to 50)
			icon_state = "pool1"

/obj/effect/decal/cleanable/blood/puddle/replace_decal(obj/effect/decal/cleanable/C) // Returns true if we should give up in favor of the pre-existing decal
	if(..())
		var/obj/effect/decal/cleanable/blood/puddle/P = C
		P.blood_vol += 10
		P.update_icon()
		return TRUE


//BLOODY FOOTPRINTS
/obj/effect/decal/cleanable/blood/footprints
	name = "footprints"
	desc = ""
	icon = 'icons/effects/footprints.dmi'
	icon_state = "blood1"
	random_icon_states = null
	blood_state = BLOOD_STATE_HUMAN //the icon state to load images from
	var/entered_dirs = 0
	var/exited_dirs = 0
	alpha = 140
	bloodiness = 0
	var/list/shoe_types = list()

/obj/effect/decal/cleanable/blood/footprints/Initialize(mapload)
	. = ..()
	icon_state = "" //All of the footprint visuals come from overlays
	if(mapload)
		entered_dirs |= dir //Keep the same appearance as in the map editor
		update_icon()

//Rotate all of the footprint directions too
/obj/effect/decal/cleanable/blood/footprints/setDir(newdir)
	if(dir == newdir)
		return ..()

	var/ang_change = dir2angle(newdir) - dir2angle(dir)
	var/old_entered_dirs = entered_dirs
	var/old_exited_dirs = exited_dirs
	entered_dirs = 0
	exited_dirs = 0

	for(var/Ddir in GLOB.cardinals)
		if(old_entered_dirs & Ddir)
			entered_dirs |= angle2dir_cardinal(dir2angle(Ddir) + ang_change)
		if(old_exited_dirs & Ddir)
			exited_dirs |= angle2dir_cardinal(dir2angle(Ddir) + ang_change)

	update_icon()
	return ..()

/obj/effect/decal/cleanable/blood/footprints/Crossed(atom/movable/O)
	..()
	if(ishuman(O))
		var/mob/living/carbon/human/H = O
		var/obj/item/clothing/shoes/S = H.shoes
		if(S && S.bloody_shoes[blood_state])
			S.bloody_shoes[blood_state] = max(S.bloody_shoes[blood_state] - BLOOD_LOSS_PER_STEP, 0)
			shoe_types |= S.type
			if (!(entered_dirs & H.dir))
				entered_dirs |= H.dir
				update_icon()

/obj/effect/decal/cleanable/blood/footprints/Uncrossed(atom/movable/O)
	..()
	if(ishuman(O))
		var/mob/living/carbon/human/H = O
		var/obj/item/clothing/shoes/S = H.shoes
		if(S && S.bloody_shoes[blood_state])
			S.bloody_shoes[blood_state] = max(S.bloody_shoes[blood_state] - BLOOD_LOSS_PER_STEP, 0)
			shoe_types  |= S.type
			if (!(exited_dirs & H.dir))
				exited_dirs |= H.dir
				update_icon()


/obj/effect/decal/cleanable/blood/footprints/update_icon()
	cut_overlays()

	for(var/Ddir in GLOB.cardinals)
		if(entered_dirs & Ddir)
			var/image/bloodstep_overlay = GLOB.bloody_footprints_cache["entered-[blood_state]-[Ddir]"]
			if(!bloodstep_overlay)
				GLOB.bloody_footprints_cache["entered-[blood_state]-[Ddir]"] = bloodstep_overlay = image(icon, "[blood_state]1", dir = Ddir)
			bloodstep_overlay.alpha = alpha
			add_overlay(bloodstep_overlay)
		if(exited_dirs & Ddir)
			var/image/bloodstep_overlay = GLOB.bloody_footprints_cache["exited-[blood_state]-[Ddir]"]
			if(!bloodstep_overlay)
				GLOB.bloody_footprints_cache["exited-[blood_state]-[Ddir]"] = bloodstep_overlay = image(icon, "[blood_state]2", dir = Ddir)
			bloodstep_overlay.alpha = alpha
			add_overlay(bloodstep_overlay)

//	alpha = BLOODY_FOOTPRINT_BASE_ALPHA+bloodiness


/obj/effect/decal/cleanable/blood/footprints/examine(mob/user)
	. = ..()
	if(isliving(user))
		var/mob/living/L = user
		if(L.STAINT < 12)
			return
	if(shoe_types.len)
		. += "You recognise the footprints as belonging to:\n"
		for(var/shoe in shoe_types)
			var/obj/item/clothing/shoes/S = shoe
			. += "[icon2html(initial(S.icon), user)] Some <B>[initial(S.name)]</B>.\n"

/obj/effect/decal/cleanable/blood/footprints/replace_decal(obj/effect/decal/cleanable/C)
	if(blood_state != C.blood_state) //We only replace footprints of the same type as us
		return
	return TRUE //no special overlay code

/obj/effect/decal/cleanable/blood/footprints/can_bloodcrawl_in()
	if(blood_state in list(BLOOD_STATE_HUMAN, BLOOD_STATE_XENO))
		return TRUE
	return FALSE

/obj/effect/decal/cleanable/blood/hitsplatter
	name = "blood splatter"
	pass_flags = PASSTABLE | PASSGRILLE
	icon_state = "hitsplatter1"
	random_icon_states = list("hitsplatter1", "hitsplatter2", "hitsplatter3")
	/// The turf we just came from, so we can back up when we hit a wall
	var/turf/prev_loc
	/// The cached info about the blood
	var/list/blood_dna_info
	/// Skip making the final blood splatter when we're done, like if we're not in a turf
	var/skip = FALSE
	/// How many tiles/items/people we can paint red
	var/splatter_strength = 3
	/// Insurance so that we don't keep moving once we hit a stoppoint
	var/hit_endpoint = FALSE

/obj/effect/decal/cleanable/blood/hitsplatter/Initialize(mapload, splatter_strength)
	. = ..()
	prev_loc = loc //Just so we are sure prev_loc exists
	if(splatter_strength)
		src.splatter_strength = splatter_strength
/obj/effect/decal/cleanable/blood/hitsplatter/Destroy()
	if(isturf(loc) && !skip)
		playsound(src, 'sound/panopticon/splatter.ogg', 60, TRUE, -1)
		if(blood_dna_info)
			loc.add_blood_DNA(blood_dna_info)
	return ..()
/// Set the splatter up to fly through the air until it rounds out of steam or hits something
/obj/effect/decal/cleanable/blood/hitsplatter/proc/fly_towards(turf/target_turf, range)
	var/delay = 2
	var/datum/move_loop/loop = SSmove_manager.move_towards(src, target_turf, delay, timeout = delay * range, priority = MOVEMENT_ABOVE_SPACE_PRIORITY, flags = MOVEMENT_LOOP_START_FAST)
	RegisterSignal(loop, COMSIG_MOVELOOP_PREPROCESS_CHECK, .proc/pre_move)
	RegisterSignal(loop, COMSIG_MOVELOOP_POSTPROCESS, .proc/post_move)
	RegisterSignal(loop, COMSIG_PARENT_QDELETING, .proc/loop_done)
/obj/effect/decal/cleanable/blood/hitsplatter/proc/pre_move(datum/move_loop/source)
	SIGNAL_HANDLER
	prev_loc = loc

/obj/effect/decal/cleanable/blood/hitsplatter/proc/post_move(datum/move_loop/source)
	SIGNAL_HANDLER
	for(var/atom/iter_atom in get_turf(src))
	var/turf/T = get_turf(src)

	for(var/atom/movable/iter_atom as anything in T)
		if(hit_endpoint)
			return
		if(splatter_strength <= 0)
			break

		if(isitem(iter_atom))
			iter_atom.add_blood_DNA(blood_dna_info)
			splatter_strength--
		else if(ishuman(iter_atom))
			var/mob/living/carbon/human/splashed_human = iter_atom
			if(!splashed_human.is_eyes_covered())
				splashed_human.blur_eyes(3)
				to_chat(splashed_human, span_alert("You're blinded by a spray of blood!"))
			splatter_strength--

	if(splatter_strength <= 0) // we used all the puff so we delete it.
		qdel(src)
		return

	new /obj/effect/decal/cleanable/blood/squirt(T, get_dir(prev_loc, loc), blood_dna_info)

/obj/effect/decal/cleanable/blood/hitsplatter/proc/loop_done(datum/source)
	SIGNAL_HANDLER
	if(!QDELETED(src))
		qdel(src)
/obj/effect/decal/cleanable/blood/hitsplatter/Bump(atom/bumped_atom)
	if(!iswallturf(bumped_atom) && !istype(bumped_atom, /obj/structure/window))
		qdel(src)
		return
	if(istype(bumped_atom, /obj/structure/window))
		var/obj/structure/window/bumped_window = bumped_atom
		if(!bumped_window.fulltile)
			qdel(src)
			return
	hit_endpoint = TRUE
	if(isturf(prev_loc))
		abstract_move(bumped_atom)
		skip = TRUE
		//Adjust pixel offset to make splatters appear on the wall
		if(istype(bumped_atom, /obj/structure/window))
			land_on_window(bumped_atom)
		else
			var/obj/effect/decal/cleanable/blood/splatter/over_window/final_splatter = new(prev_loc)
			final_splatter.pixel_x = (dir == EAST ? 32 : (dir == WEST ? -32 : 0))
			final_splatter.pixel_y = (dir == NORTH ? 32 : (dir == SOUTH ? -32 : 0))
	else // This will only happen if prev_loc is not even a turf, which is highly unlikely.
		abstract_move(bumped_atom)
		qdel(src)
/// A special case for hitsplatters hitting windows, since those can actually be moved around, store it in the window and slap it in the vis_contents
/obj/effect/decal/cleanable/blood/hitsplatter/proc/land_on_window(obj/structure/window/the_window)
	if(!the_window.fulltile)
		return
	var/obj/effect/decal/cleanable/blood/splatter/over_window/final_splatter = new
	final_splatter.forceMove(the_window)
	the_window.vis_contents += final_splatter
	the_window.bloodied = TRUE
	qdel(src)

/obj/effect/decal/cleanable/blood/squirt
	name = "blood trail"
	icon_state = "squirt"
	random_icon_states = null

/obj/effect/decal/cleanable/blood/squirt/Initialize(mapload, direction, list/blood_dna)
	. = ..()
	dir = direction
	var/obj/effect/decal/cleanable/blood/splatter/existing_blood = locate() in get_turf(src)
	if(existing_blood?.absorb_squirts)
		if(blood_dna)
			existing_blood.add_blood_DNA(blood_dna)
			existing_blood.bloodiness = min((existing_blood.bloodiness + bloodiness), BLOOD_AMOUNT_PER_DECAL)
		return INITIALIZE_HINT_QDEL
