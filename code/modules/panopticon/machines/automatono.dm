/obj/structure/panopticon/automat/meatgrind
	name = "man-eater"
	desc = "MEAT MEAT MEAT"
	icon = 'icons/panopticon/obj/indoorsen.dmi'
	icon_state = "human_eater"
	density = FALSE
	anchored = TRUE
	can_buckle = TRUE
	buckle_lying = 0
	destroy_sound = 'sound/foley/breaksound.ogg'
	break_sound = 'sound/foley/machinebreak.ogg'
	anchored = TRUE
	var/datum/looping_sound/deus/soundloop
	max_integrity = 0

/obj/structure/panopticon/automat/meatgrind/Initialize()
	soundloop = new(list(src), FALSE)
	soundloop.start()
	. = ..()

/obj/structure/panopticon/automat/meatgrind/post_buckle_mob(mob/living/M)
	if(has_buckled_mobs())
		if(buckled_mobs.len < 2)
			new /obj/item/reagent_containers/food/snacks/meatcube(get_turf(M), 5)
			buckled_mobs[1].gib()
			playsound(get_turf(src), 'sound/misc/hahahahah.wav', 50, FALSE, FALSE)

/obj/structure/panopticon/automat/meatgrind/Destroy()
	if(soundloop)
		soundloop.stop()
	..()

/obj/structure/panopticon/automat/meatgrind/obj_break(damage_flag)
	if(soundloop)
		soundloop.stop()
	..()

/obj/effect/mine/explosive/panopticon/landmine
	name = " "
	density = FALSE
	anchored = TRUE
	icon = 'icons/panopticon/obj/mirkwood.dmi'
	icon_state = "mine"

/obj/structure/panopticon/automat/radio
	name = "old-world radio"
	desc = "Play something for me!"
	icon = 'icons/panopticon/obj/indoorsen.dmi'
	icon_state = "radio0"
	density = FALSE
	max_integrity = 0
	anchored = TRUE
	var/datum/looping_sound/musloop/soundloop
	var/curfile
	var/playing = FALSE
	var/curvol = 70
	var/list/music_tracks

/obj/structure/panopticon/automat/radio/Initialize()
	soundloop = new(list(src), FALSE)
	music_tracks = MUSIC_TAV
	. = ..()

/obj/structure/panopticon/automat/radio/attack_right(mob/user)
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
	playsound(loc, 'sound/misc/frequency.ogg', 80, FALSE, -1)
	playing = FALSE
	soundloop.stop()
	curfile = music_tracks[selection]

/obj/structure/panopticon/automat/radio/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	playsound(loc, 'sound/misc/frequency.ogg', 80, FALSE, -1)
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

/obj/structure/panopticon/automat/kotel
	name = "Rusty boiler"
	desc = "Warms a bunkers soul"
	icon = 'icons/panopticon/obj/bigass.dmi'
	icon_state = "kotel"
	density = TRUE
	anchored = TRUE
	destroy_sound = 'sound/misc/smelter_sound.ogg'
	break_sound = 'sound/misc/smelter_sound.ogg'
	var/datum/looping_sound/reactor/soundloop
	max_integrity = 0

/obj/structure/panopticon/automat/kotel/Initialize()
	soundloop = new(list(src), FALSE)
	soundloop.start()
	. = ..()

/obj/structure/panopticon/automat/kotel/Destroy()
	if(soundloop)
		soundloop.stop()
	..()

/obj/structure/panopticon/automat/kotel/obj_break(damage_flag)
	if(soundloop)
		soundloop.stop()
	..()

/obj/structure/mineral_door/panopticon/bunker
	name = "bunker door"
	desc = ""
	icon_state = "bunkerdoor"
	openSound = 'sound/foley/doors/bunkerdoor.ogg'
	closeSound = 'sound/foley/doors/bunkerdoor.ogg'
	resistance_flags = null
	max_integrity = 2000
	damage_deflection = 15
	layer = ABOVE_MOB_LAYER
	icon = 'icons/roguetown/misc/doors.dmi'
	locksound = 'sound/foley/doors/lock.ogg'
	unlocksound = 'sound/foley/doors/unlock.ogg'
	rattlesound = 'sound/foley/doors/lockrattlemetal.ogg'
	attacked_sound = list("sound/combat/hits/onmetal/metalimpact (1).ogg", "sound/combat/hits/onmetal/metalimpact (2).ogg")

/obj/structure/panopticon/automat/heroinmachine
	name = "COP Automato"
	desc = "An automatic-drug-machine, that is a true trove for heroin crackheads."
	icon = 'icons/panopticon/obj/indoorsen.dmi'
	icon_state = "HEROIN_AUTOMAT"
	layer = BELOW_OBJ_LAYER
	density = TRUE
	anchored = TRUE
	destroy_sound = 'sound/foley/breaksound.ogg'
	break_sound = 'sound/foley/machinebreak.ogg'
	max_integrity = 300
	integrity_failure = 0.33
	var/datum/looping_sound/reactor/soundloop
	var/playing = TRUE
	var/curvol = 70

/obj/structure/panopticon/automat/heroinmachine/Initialize()
	soundloop = new(list(src), FALSE)
	soundloop.start()
	. = ..()

/obj/structure/panopticon/automat/heroinmachine/Destroy()
	if(soundloop)
		soundloop.stop()
	..()

/obj/structure/panopticon/automat/heroinmachine/obj_break(damage_flag)
	if(soundloop)
		soundloop.stop()
	..()

/obj/structure/panopticon/automat/heroinmachine/attackby(obj/item/I, mob/living/carbon/user, params)
	if(istype(I, /obj/item/panopticonmoney/ten))
		var/obj/item/panopticonmoney/ten/M = I
		user.visible_message("<span class='warning'>[user] stuffs some [M] inside the Automato</span>", "<span class='notice'>I stick [M] inside the Automato.</span>")
		playsound(get_turf(src), 'sound/panopticon/automatono_accept.ogg', 100 , FALSE, FALSE)
		new /obj/item/reagent_containers/glass/bottle/heroinium(drop_location())
		qdel(M)
	if(istype(I, /obj/item/panopticonmoney/one))
		var/obj/item/panopticonmoney/one/M = I
		user.visible_message("<span class='warning'>[user] stuffs some [M] inside the Automato</span>", "<span class='notice'>I stick [M] inside the Automato.</span>")
		playsound(get_turf(src), 'sound/panopticon/automatono_accept.ogg', 100 , FALSE, FALSE)
		new /obj/item/reagent_containers/syringe(drop_location())
		qdel(M)

/datum/looping_sound/tvloop
	mid_sounds = list('sound/ambience/tv.ogg')
	mid_length = 25
	volume = 50
	extra_range = 5
	persistent_loop = TRUE
	var/stresstogive = /datum/stressevent/tv

/datum/looping_sound/tvloop/on_hear_sound(mob/M)
	. = ..()
	if(stresstogive)
		if(isliving(M))
			var/mob/living/L = M
			L.add_stress(stresstogive)

/obj/structure/panopticon/automat/televizor
	name = "Strange TV"
	desc = "I wonder if it still works..."
	icon = 'icons/panopticon/obj/indoorsen.dmi'
	icon_state = "tv0"
	density = FALSE
	max_integrity = 30
	anchored = TRUE
	var/datum/looping_sound/tvloop/soundloop
	var/playing = FALSE
	var/curvol = 70

/obj/structure/panopticon/automat/televizor/Initialize()
	soundloop = new(list(src), FALSE)
	. = ..()

/obj/structure/panopticon/automat/televizor/Destroy()
	if(soundloop)
		soundloop.stop()
	..()

/obj/structure/panopticon/automat/televizor/obj_break(damage_flag)
	if(soundloop)
		soundloop.stop()
	..()

/obj/structure/panopticon/automat/televizor/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	if(!playing)
		playing = TRUE
		soundloop.start()
		icon_state = "tv1"
	else
		playing = FALSE
		soundloop.stop()
		icon_state = "tv0"

/obj/structure/panopticon/automat/proc/newbudget(budget, mob/user, specify)
	var/turf/T
	if(!user || (!ismob(user)))
		T = get_turf(src)
	else
		T = get_turf(user)
	if(!budget)
		return
	budget = round(budget)
	var/found
	if(specify)
		found = TRUE
		switch(specify)
			if("THOUSAND")
				var/zenars = budget/10
				if(zenars >= 1)
					var/obj/item/panopticonmoney/hundred/G = new (T)
					if(zenars > 1)
						for(var/i in 2 to zenars)
							var/obj/item/panopticonmoney/hundred/GV = new /obj/item/panopticonmoney/hundred(G)
							G.held += GV
					G.update_icon()
					user.put_in_hands(G)
			if("TEN")
				var/zenars = budget/5
				if(zenars >= 1)
					var/obj/item/panopticonmoney/ten/G = new (T)
					if(zenars > 1)
						for(var/i in 2 to zenars)
							var/obj/item/panopticonmoney/ten/GV = new /obj/item/panopticonmoney/ten(G)
							G.held += GV
					G.update_icon()
					user.put_in_hands(G)
			if("ONE")
				var/zenars = budget
				if(zenars >= 1)
					var/obj/item/panopticonmoney/one/G = new (T)
					if(zenars > 1)
						for(var/i in 2 to zenars)
							var/obj/item/panopticonmoney/one/GV = new /obj/item/panopticonmoney/one(G)
							G.held += GV
					G.update_icon()
					user.put_in_hands(G)
	else
		var/zenars = budget/10
		if(zenars >= 1)
			for(var/i in 1 to zenars)
				budget -= 10
				found = TRUE
				new /obj/item/panopticonmoney/hundred(T)
		zenars = budget/5
		if(zenars >= 1)
			for(var/i in 1 to zenars)
				budget -= 5
				found = TRUE
				new /obj/item/panopticonmoney/ten(T)
		if(budget >= 1)
			for(var/i in 1 to budget)
				found = TRUE
				new /obj/item/panopticonmoney/one(T)
	if(found)
		playsound(T, 'sound/misc/coindispense.ogg', 100, FALSE, -1)

/obj/structure/panopticon/automat/bank/obj_break(damage_flag)
	..()
	newbudget(budget)
	budget = 0
	update_icon()

/obj/structure/panopticon/automat/bank/update_icon()
	cut_overlays()
	if(obj_broken)
		set_light(0)
		return
	set_light(1, 1, "#1b7bf1")

/obj/structure/panopticon/automat/bank/Destroy()
	set_light(0)
	newbudget(budget)
	budget = 0
	return ..()


/obj/structure/panopticon/automat/bank
	name = "Money Keeper"
	desc = "An automaton that keeps your money savings. Don't forget to link an account!"
	icon = 'icons/panopticon/obj/mirkwood.dmi'
	icon_state = "zarplata"
	layer = BELOW_OBJ_LAYER
	density = FALSE
	anchored = TRUE
	destroy_sound = 'sound/foley/breaksound.ogg'
	break_sound = 'sound/foley/machinebreak.ogg'
	max_integrity = 0
	integrity_failure = 0.33
	pixel_y = 32
	var/budget = 0

/obj/structure/panopticon/automat/bank/attack_hand(mob/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	if(H.real_name in SStreasury.bank_accounts)
		var/amt = SStreasury.bank_accounts[H.real_name]
		if(!amt)
			say("Your balance is nothing.")
			return
		if(amt < 0)
			say("Your balance is NEGATIVE.")
			return
		var/list/choicez = list()
		if(amt > 10)
			choicez += "THOUSAND"
		if(amt > 5)
			choicez += "TEN"
		choicez += "ONE"
		var/selection = input(user, "Make a Selection", src) as null|anything in choicez
		if(!selection)
			return
		amt = SStreasury.bank_accounts[H.real_name]
		var/mod = 1
		if(selection == "THOUSAND")
			mod = 10
		if(selection == "TEN")
			mod = 5
		var/coin_amt = input(user, "There is [SStreasury.treasury_value] banknotes. You may withdraw [amt/mod] [selection] from your account.", src) as null|num
		coin_amt = round(coin_amt)
		if(coin_amt < 1)
			return
		amt = SStreasury.bank_accounts[H.real_name]
		if(!Adjacent(user))
			return
		if((coin_amt*mod) > amt)
			playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
			return
		if(!SStreasury.withdraw_money_account(coin_amt*mod, H.real_name))
			playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
			return
		newbudget(coin_amt*mod, user, selection)
	else
		SStreasury.create_bank_account(H.real_name)
		spawn(5)
			say("New account created.")
			playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)

/obj/structure/panopticon/automat/bank/attackby(obj/item/P, mob/user, params)
	if(ishuman(user))
		if(istype(P, /obj/item/panopticonmoney))
			var/mob/living/carbon/human/H = user
			if(H.real_name in SStreasury.bank_accounts)
				SStreasury.generate_money_account(P.get_real_price(), H.real_name)
				qdel(P)
				playsound(src, 'sound/misc/coininsert.ogg', 100, FALSE, -1)
				return
			else
				say("No account found. Register it at first.")
	return ..()

/obj/structure/panopticon/automat/announcer
	name = "Town-announcer"
	desc = "THE SCREAM!"
	icon = 'icons/panopticon/obj/town.dmi'
	icon_state = "announcer"
	plane = GAME_PLANE_UPPER
	layer = FLY_LAYER
	anchored = 1
	density = 1
	max_integrity = 1000
	var/can_scream = TRUE
	var/timeout = 100 SECONDS

/obj/structure/panopticon/automat/announcer/attack_hand(mob/living/carbon/user, list/modifiers)
	. = ..()
	var/thing = input(user, "You want to scream something for the lands?") in list("Yes", "No")
	if(!thing)
		return
	if(thing == "Yes")
		if(!can_scream)
			return
		scream(user)
	else
		return

/obj/structure/panopticon/automat/announcer/proc/scream(mob/living/carbon/user)
	var/thingy = stripped_input(user, "What you want to say?", "")
	if(!thingy)
		return
	if(get_dist(src, user) >= 2)
		return
	if(!can_scream)
		return
	priority_announce(thingy, "Old-World Announcer", 'sound/misc/alert.ogg', "Captain")
//	SEND_SOUND(world, sound('sound/misc/alert.ogg'))
	can_scream = FALSE
	addtimer(CALLBACK(src, .proc/cann_scream), timeout)

/obj/structure/panopticon/automat/announcer/proc/cann_scream()
	if(QDELETED(src))
		return
	can_scream = TRUE
