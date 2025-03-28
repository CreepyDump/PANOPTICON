#define MUSIC_BOOMBOX list("Boombox {1}" = 'sound/music/jukeboxes/boombox1.ogg', "Boombox {2}" = 'sound/music/jukeboxes/boombox2.ogg', "Boombox {3}" = 'sound/music/jukeboxes/boombox3.ogg', "Boombox {4}" = 'sound/music/jukeboxes/boombox4.ogg', "Boombox {5}" = 'sound/music/jukeboxes/planet_burg.ogg', "Boombox {?}" = 'sound/music/jukeboxes/hava.ogg')
#define CTYPE_THOUSAND 1
#define CTYPE_TEN 2
#define CTYPE_ONE 3

/obj/item/panopticonmoney
	name = ""
	icon_state = ""
	icon = 'icons/panopticon/items/misc.dmi'
	desc = ""
	lefthand_file = 'icons/mob/inhands/misc/food_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/food_righthand.dmi'
	desc = ""
	w_class = WEIGHT_CLASS_TINY
	slot_flags = ITEM_SLOT_MOUTH
	var/list/held = list()
	dropshrink = 0.2
	sellprice = 0
	static_price = TRUE
	simpleton_price = TRUE
	var/flintcd
	var/base_type //used for compares

/obj/item/panopticonmoney/getonmobprop(tag)
	. = ..()
	if(tag)
		if(held.len)
			if(tag == "gen")
				return list("shrink" = 0.10,"sx" = -6,"sy" = 6,"nx" = 6,"ny" = 7,"wx" = 0,"wy" = 5,"ex" = -1,"ey" = 7,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -50,"sturn" = 40,"wturn" = 50,"eturn" = -50,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
		else
			if(tag == "gen")
				return list("shrink" = 0.10,"sx" = -6,"sy" = 6,"nx" = 6,"ny" = 7,"wx" = 0,"wy" = 5,"ex" = -1,"ey" = 7,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -50,"sturn" = 40,"wturn" = 50,"eturn" = -50,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)

/obj/item/panopticonmoney/dropped()
	scatter(get_turf(src))
	..()

/obj/item/panopticonmoney/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	scatter(get_turf(src))
	..()

/obj/item/panopticonmoney/proc/scatter(turf/T)
	pixel_x = rand(-8,8)
	pixel_y = rand(-5,5)
	if(T)
		var/turf/HT = T
		if(held.len)
			var/obj/structure/table/TA = locate() in HT
			if(!TA) //no table
				for(var/obj/item/panopticonmoney/C in held)
					held -= C
					C.forceMove(HT)
					C.scatter()
//	dropped()
	update_icon()
	update_transform()
/*
/obj/item/panopticonmoney/proc/mergeground(turf/T)
	if(T)
		var/turf/HT = T
		if(held.len)
			var/obj/structure/coinpile/CP = locate() in HT
			if(CP) //no table
				for(var/obj/item/roguegem/C in held)
					held -= C
					C.forceMove(CP)
					CP.held += C
				src.forceMove(CP)
				CP.held += src
				CP.update_icon()
	update_icon()
*/
/obj/item/panopticonmoney/get_real_price()
	var/SP = sellprice
	for(var/obj/item/O in held)
		SP += O.sellprice
	return SP

/obj/item/panopticonmoney/pre_sell()
	if(held.len)
		scatter(get_turf(loc))
	update_icon()
	..()

/obj/item/panopticonmoney/examine(mob/user)
	. = ..()
	if(held.len)
		. += "<span class='info'>Mortelg [held.len + 1] banknotes.</span>"

/obj/item/panopticonmoney/proc/merge(var/obj/item/panopticonmoney/G, mob/user)
	if(!G)
		return
	if(G.base_type != base_type)
		return
	if(user)
		if((user.get_inactive_held_item() != G) && !isturf(G.loc))
			return
	if(G.held.len)
		for(var/obj/item/panopticonmoney/H in G.held)
			if(held.len < 19)
				H.forceMove(src)
				held += H
				G.held -= H
		G.update_icon()
		update_icon()
	if(!G.held.len && held.len < 19)
		G.forceMove(src)
		held += G
	update_icon()
	user.update_inv_hands()


/obj/item/panopticonmoney/attack_hand(mob/user)
	if((user.get_inactive_held_item() == src) && held.len)
		var/list/based = held.Copy()
		based += src
		var/numbers = list()
		for(var/i = 1, i < based.len, i++)
			numbers += i
		var/amount = input(user,"How many?") as null|anything in sortList(numbers)
		if(!amount)
			return
		if(amount == based.len)
			return ..()
		for(var/obj/item/panopticonmoney/Parent in based) //find a coin to take
			if(Parent == src)
				continue
			based -= Parent
			held -= Parent
			amount--
			if(amount > 0) //take more if that's what we chose to do
				for(var/x in 1 to amount)
					for(var/obj/item/panopticonmoney/G in based)
						if(G == src) //we don't want to take the parent coin
							continue
						Parent.held += G
						held -= G
						based -= G
						G.loc = Parent
						break
			user.put_in_hands(Parent)
			Parent.update_icon()
			update_icon()
			return
	..()

/obj/item/panopticonmoney/update_icon()
	..()
	if(held.len > 1)
		dropshrink = 1
	else
		dropshrink = 0.2


/obj/item/panopticonmoney/attackby(obj/item/I, mob/user)
	if(istype(I,/obj/item/panopticonmoney))
		var/obj/item/panopticonmoney/G = I
		G.merge(src, user)
	else
		return ..()

/obj/item/panopticonmoney/hundred
	name = "One-hundred Farkas banknote"
	icon_state = "hundred"
	sellprice = 100
	
/obj/item/panopticonmoney/ten
	name = "Ten Farkas banknote"
	icon_state = "ten"
	sellprice = 10

/obj/item/panopticonmoney/one
	name = "One Farkas banknote"
	icon_state = "one"
	sellprice = 1

#undef CTYPE_THOUSAND
#undef CTYPE_TEN
#undef CTYPE_ONE

/obj/item/storage/fancy/cigarettes/jeltomorkanal
	name = "Jeltomorkanal"
	desc = ""
	icon = 'icons/panopticon/items/misc.dmi'
	icon_state = "jeltomor"
	item_state = "jeltomor"
	icon_type = "cig"
	w_class = WEIGHT_CLASS_TINY

/obj/item/brick
	name = "brick"
	icon_state = "stone1"
	icon = 'icons/panopticon/items/misc.dmi'
	icon_state = "brick"
	desc = ""
	gripped_intents = null
	dropshrink = 0.75
	possible_item_intents = list(INTENT_GENERIC)
	force = 13
	throw_speed = 2
	throw_range = 7
	throwforce = 20
	obj_flags = null
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/brick/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.3,"sx" = 0,"sy" = -1,"nx" = 13,"ny" = -1,"wx" = 4,"wy" = 0,"ex" = 7,"ey" = -1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 2,"sflip" = 0,"wflip" = 0,"eflip" = 8)

/obj/item/storage/pill_bottle/pervitin
	name = "Pervitin"
	desc = "Some drug that helps with anesthesia."
	icon = 'icons/panopticon/items/misc.dmi'
	icon_state = "pervitin"
	item_state = "pervitin"
	w_class = WEIGHT_CLASS_TINY
	sellprice = 50

/obj/item/storage/pill_bottle/pervitin/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/pervitin(src)

/obj/item/natural/cloth/bandages
	name = "bandage"
	icon = 'icons/panopticon/items/misc.dmi'
	icon_state = "bandage"
	possible_item_intents = list(/datum/intent/use)
	max_integrity = 50

/obj/item/storage/firstaid/panopticon
	desc = "should at least help with anything."
	icon_state = "medkit"
	icon = 'icons/panopticon/obj/clothes/storage.dmi'
	throw_speed = 0
	throw_range = 0
	empty = FALSE

/obj/item/storage/firstaid/panopticon/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.3,"sx" = 0,"sy" = -1,"nx" = 13,"ny" = -1,"wx" = 4,"wy" = 0,"ex" = 7,"ey" = -1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 2,"sflip" = 0,"wflip" = 0,"eflip" = 8)

/obj/item/storage/firstaid/panopticon/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/natural/cloth/bandages = 2,
		/obj/item/needle = 3,
		/obj/item/storage/pill_bottle/pervitin = 1,
		/obj/item/clothing/mask/infected = 1)
	generate_items_inside(items_inside,src)

/obj/item/signal_horn
	name = "signal horn"
	desc = "Used to sound the alarm."
	icon = 'icons/panopticon/items/misc.dmi'
	icon_state = "signalhorn"
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_NECK
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/signal_horn/attack_self(mob/living/user)
	. = ..()
	user.visible_message(span_warning("[user] is about to sound the [src]!"))
	if(do_after(user, 15))
		sound_horn(user)

/obj/item/signal_horn/proc/sound_horn(mob/living/user)
	var/mob/living/carbon/O //Остальные хуйлуши вокруг некролениниста
	user.visible_message(span_warning("[user] sounds the alarm!"))
	playsound(src, 'sound/misc/necrolenin_alert.ogg', 100, TRUE)
	for(O in get_hearers_in_view(7, src))
		shake_camera(user, 11, 2)

	for(var/mob/player in GLOB.player_list)

		if(!player.mind) continue
		if(player.stat == DEAD) continue
		if(isbrain(player)) continue

		//sound played for other players
		if(player == src) continue
		if(get_dist(player, src) > 7)
			player.playsound_local(get_turf(player), 'sound/misc/necrolenin_alert.ogg', 35, FALSE, pressure_affected = FALSE)
			to_chat(player, span_warningbig("I hear the horn alarm!"))

/obj/item/boombox
	name = "Boombox"
	desc = "It is interesting that such an expensive item is here!"
	icon = 'icons/panopticon/items/Boombox.dmi'
	icon_state = "boombox"
	var/datum/looping_sound/musloop/soundloop
	var/curfile
	var/playing = FALSE
	var/curvol = 85
	var/list/music_tracks

/obj/item/boombox/Initialize()
	soundloop = new(list(src), FALSE)
	music_tracks = MUSIC_BOOMBOX
	. = ..()

/obj/item/boombox/attack_right(mob/user)
	. = ..()
	if(.)
		return
	if(playing)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	var/selection = input(user, "Which song?", "Radio Frequency", name) as null|anything in music_tracks
	if(!selection)
		return
	if(!Adjacent(user))
		return
	playsound(loc, 'sound/panopticon/bominside.ogg', 80, FALSE, -1)
	playing = FALSE
	soundloop.stop()
	curfile = music_tracks[selection]

/obj/item/boombox/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(loc == user)
		if(!user.is_holding(src))
			return ..()
		user.changeNext_move(CLICK_CD_MELEE)
		playsound(loc, 'sound/panopticon/bomclick.ogg', 80, FALSE, -1)
		if(!playing)
			if(curfile)
				playing = TRUE
				soundloop.mid_sounds = list(curfile)
				soundloop.cursound = null
				soundloop.volume = curvol
				soundloop.start()
		else
			playing = FALSE
			soundloop.stop()

/obj/item/boombox/getonmobprop(tag)
	. = ..()
	if(tag)
		if(tag == "gen")
			return list("shrink" = 0.4,"sx" = -6,"sy" = 6,"nx" = 6,"ny" = 7,"wx" = 0,"wy" = 5,"ex" = -1,"ey" = 7,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -50,"sturn" = 40,"wturn" = 50,"eturn" = -50,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)

/*
/obj/item/flashlight/crank
    name = "hand-crank flashlight"
    desc = "A flashlight powered by a hand crank. Crank it to generate power for illumination."
    icon = 'icons/obj/lighting.dmi' // Make sure to have appropriate icons
    icon_state = "flashlight-crank"
    item_state = "flashlight-crank"
    
    // Variables specific to the crank flashlight
    var/charge_level = 0 // Current charge (0-100)
    var/max_charge = 100 // Maximum charge capacity
    var/charge_per_crank = 10 // How much charge each crank provides
    var/charge_consumption_rate = 1 // How much charge is used per tick when on
    var/cranking = FALSE // Whether the flashlight is currently being cranked
    var/last_crank_time = 0 // For tracking crank cooldown
    var/crank_cooldown = 10 // Time between cranks (in deciseconds)

    // Override the default flashlight behavior
    light_power = 0.8 // Slightly dimmer than standard flashlight
    light_range = 4 // Default light range when powered

/obj/item/flashlight/crank/New()
    ..()
    update_icon() // Update appearance based on initial state

/obj/item/flashlight/crank/update_icon()
    if(charge_level > 0 && on)
        icon_state = "[initial(icon_state)]-on"
    else
        icon_state = initial(icon_state)
    ..()

// Crank verb - this is what players will use to charge the flashlight
/obj/item/flashlight/crank/verb/crank()
    set name = "Crank Flashlight"
    set category = "Object"
    set src in usr

    if(!usr.canUseTopic(src, BE_CLOSE))
        return

    // Check if we're already cranking or on cooldown
    if(cranking || (world.time - last_crank_time) < crank_cooldown)
        usr << "<span class='warning'>You're cranking too fast!</span>"
        return

    // Start cranking
    cranking = TRUE
    last_crank_time = world.time
    usr.visible_message(
        "<span class='notice'>[usr] starts cranking [src].</span>",
        "<span class='notice'>You start cranking [src].</span>"
    )

    // Cranking animation/sound (you'll need to implement these assets)
    usr << sound('sound/items/crank_turn.ogg', volume=50) // Placeholder sound
    animate(usr, pixel_y = usr.pixel_y + 2, time = 2)
    animate(pixel_y = usr.pixel_y - 2, time = 2)

    // Add charge
    if(charge_level < max_charge)
        charge_level = min(charge_level + charge_per_crank, max_charge)
        usr << "<span class='notice'>[src]'s charge level increases to [charge_level]%.</span>"
    else
        usr << "<span class='warning'>[src] is already fully charged!</span>"

    // Update appearance and light
    update_brightness()
    update_icon()

    // Reset cranking state after a short delay
    sleep(5)
    cranking = FALSE

// Override the toggle proc to check for charge
/obj/item/flashlight/crank/toggle()
    if(charge_level <= 0)
        usr << "<span class='warning'>[src] has no charge! Crank it to generate power.</span>"
        return
    ..() // Call parent toggle if we have charge
    update_brightness()
    update_icon()

// Process charge consumption when the light is on
/obj/item/flashlight/crank/process()
    if(!on)
        return

    if(charge_level > 0)
        charge_level = max(charge_level - charge_consumption_rate, 0)
        if(charge_level <= 0)
            on = FALSE
            usr << "<span class='warning'>[src] flickers and goes out!</span>"
            update_brightness()
            update_icon()
    else
        on = FALSE
        update_brightness()
        update_icon()

// Examine override to show charge level
/obj/item/flashlight/crank/examine(mob/user)
    ..()
    user << "<span class='notice'>The charge indicator shows [charge_level]% power remaining.</span>"

// Attack self for quick toggle
/obj/item/flashlight/crank/attack_self(mob/user)
    toggle()
    return ..()

// Start processing when turned on
/obj/item/flashlight/crank/turn_on()
    if(charge_level > 0)
        ..()
        START_PROCESSING(SSobj, src)
    else
        on = FALSE
        update_brightness()
        update_icon()

// Stop processing when turned off
/obj/item/flashlight/crank/turn_off()
    ..()
    STOP_PROCESSING(SSobj, src)
*/
