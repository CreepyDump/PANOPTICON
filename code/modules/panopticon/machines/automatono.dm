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
//	var/shrapnel_type = /obj/projectile/bullet/shrapnel
//	var/shrapnel_magnitude = 3
//	var/shred_triggerer = FALSE

/obj/effect/mine/explosive/panopticon/landmine/triggermine(atom/movable/AM)
//	AddComponent(/datum/component/pellet_cloud, projectile_type=shrapnel_type, magnitude=shrapnel_magnitude)
	return ..()


/obj/structure/panopticon/automat/radio
	name = "old-world radio"
	desc = "It is interesting that such an expensive item is here!"
	icon = 'icons/panopticon/obj/indoorsen.dmi'
	icon_state = "radio0"
	density = FALSE
	max_integrity = 0
	anchored = TRUE
	var/datum/looping_sound/musloop/soundloop
	var/curfile
	var/playing = FALSE
	var/curvol = 85
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

/obj/structure/panopticon/automat/radio/bar
	name = "Bar radio"
	desc = "Play something for me!"
	icon = 'icons/panopticon/obj/indoorsen.dmi'
	icon_state = "radio0"
	density = FALSE
	max_integrity = 0
	anchored = TRUE

/obj/structure/panopticon/automat/radio/bar/Initialize()
	. = ..()
	soundloop = new(list(src), FALSE)
	music_tracks = MUSIC_BAR

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
	plane = WALL_PLANE
	icon_state = "bunkerdoor"
	openSound = 'sound/foley/doors/bunkerdoor.ogg'
	closeSound = 'sound/foley/doors/bunkerdoor.ogg'
	resistance_flags = null
	max_integrity = 2000
	damage_deflection = 15
	icon = 'icons/roguetown/misc/doors.dmi'
	locksound = 'sound/foley/doors/lock.ogg'
	unlocksound = 'sound/foley/doors/unlock.ogg'
	rattlesound = 'sound/foley/doors/lockrattlemetal.ogg'
	attacked_sound = list("sound/combat/hits/onmetal/metalimpact (1).ogg", "sound/combat/hits/onmetal/metalimpact (2).ogg")

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
	var/thing = input(user, "Old-World Announcer") in list("Make an announce", "Declare martial law", "Cancel")
	if(!thing)
		return
	if(thing == "Make an announce")	
		if(!can_scream)
			return
		scream(user)
	else if(thing == "Declare martial law")
		if(martial_law == FALSE)
			return
		martial_law()
	else
		return

/obj/structure/panopticon/automat/announcer/proc/martial_law()
	priority_announce("Major is dead", "Old-World Announcer", 'sound/misc/alert.ogg', "Captain")
/obj/structure/panopticon/automat/announcer/proc/scream(mob/living/carbon/user)
	var/inputshit = stripped_input(user, "What you want to say?", "")
	if(!inputshit)
		return
	if(get_dist(src, user) >= 2)
		return
	if(!can_scream)
		return
	priority_announce(inputshit, "Old-World Announcer", 'sound/misc/alert.ogg', "Captain")
//	SEND_SOUND(world, sound('sound/misc/alert.ogg'))
	can_scream = FALSE
	addtimer(CALLBACK(src, .proc/cann_scream), timeout)

/obj/structure/panopticon/automat/announcer/proc/cann_scream()
	if(QDELETED(src))
		return
	can_scream = TRUE

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
	var/moneyz = 0

/obj/structure/panopticon/automat/heroinmachine/Initialize()
	desc = "An automatic-drug-machine, that is a true trove for heroin crackheads. It has [moneyz] farkas."
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

/obj/structure/panopticon/automat/heroinmachine/attack_hand(mob/living/carbon/user)
	. = ..()
	if(.)
		return
	if(!user.client)
		return
	else
		var/thing = input(user, "COP", "What i gonna pick!") as null|anything in list("Heroin", "Injector", "Jeltomor", "GIVE MY FUCKING MONEY BACK!")
		if(!thing)
			return
		if(get_dist(src, user) >= 2)
			return
		if(moneyz < 10)
			return
//		playsound(get_turf(src), 'sound/panopticon/automatono_accept.ogg', 90 , FALSE, FALSE) НЕ НАШЕЛ ЕЩЁ ЗВУК
		if(thing == "Heroin")
			if(moneyz < 35)
				to_chat(user, span_alert("DUMB BITCH, I NEED MORE MONEY INSIDE!"))
			else
				playsound(get_turf(src), 'sound/misc/mail.ogg', 100 , FALSE, FALSE)
				new /obj/item/reagent_containers/glass/bottle/heroinium(drop_location())
				moneyz -= 35
				desc = "An automatic-drug-machine, that is a true trove for heroin crackheads. It has [moneyz] farkas."
		if(thing == "Injector")
			if(moneyz < 5)
				to_chat(user, span_alert("DUMB BITCH, I NEED MORE MONEY INSIDE!"))
			else
				playsound(get_turf(src), 'sound/misc/mail.ogg', 100 , FALSE, FALSE)
				new /obj/item/reagent_containers/syringe(drop_location())
				moneyz -= 5
				desc = "An automatic-drug-machine, that is a true trove for heroin crackheads. It has [moneyz] farkas."
		if(thing == "Jeltomor")
			if(moneyz < 89)
				to_chat(user, span_alert("DUMB BITCH, I NEED MORE MONEY INSIDE!"))
			else
				playsound(get_turf(src), 'sound/misc/mail.ogg', 100 , FALSE, FALSE)
				new /obj/item/storage/fancy/cigarettes/jeltomorkanal(drop_location())
				moneyz -= 89
				desc = "An automatic-drug-machine, that is a true trove for heroin crackheads. It has [moneyz] farkas."
		if(thing == "GIVE MY FUCKING MONEY BACK!")
			//moneygive()
			to_chat(user, span_alert("NO!!"))

/obj/structure/panopticon/automat/heroinmachine/attackby(obj/item/I, mob/living/carbon/user, params)
	if(istype(I, /obj/item/panopticonmoney/hundred))
		moneyz += I.sellprice
		qdel(I)
	if(istype(I, /obj/item/panopticonmoney/ten))
		moneyz += I.sellprice
		qdel(I)
	if(istype(I, /obj/item/panopticonmoney/one))
		moneyz += I.sellprice
		qdel(I)
	user.visible_message("<span class='warning'>[user] stuffs some [I] inside the Automato</span>", "<span class='notice'>I stick [I] inside the Automato.</span>")
	playsound(get_turf(src), 'sound/panopticon/automatono_accept.ogg', 100 , FALSE, FALSE)
	desc = "An automatic-drug-machine, that is a true trove for heroin crackheads. It has [moneyz] farkas."

/obj/structure/panopticon/automat/heroinmachine/proc/moneygive(mob/living/carbon/user)
	var/inputmoneyshit = input("COP", "I want it!") as num|null
	if(!inputmoneyshit)
		return
	if(get_dist(src, user) >= 2)
		return
	if(moneyz <= 0)
		return
	if(inputmoneyshit > moneyz)
		to_chat(user, span_alert("TOO MANY. PICK LESS."))
		return
	if(inputmoneyshit > 100)
		to_chat(user, span_alert("TOO MANY AT ONCE. PICK LESS."))
		return
	moneyz -= inputmoneyshit
	if(inputmoneyshit == 10)
		new /obj/item/panopticonmoney/ten(get_turf(user))
		playsound(get_turf(src), 'sound/panopticon/automatono_accept.ogg', 100 , FALSE, FALSE)
	if(inputmoneyshit == 100)
		new /obj/item/panopticonmoney/hundred(get_turf(user))
		playsound(get_turf(src), 'sound/panopticon/automatono_accept.ogg', 100 , FALSE, FALSE)
	else
		new /obj/item/panopticonmoney/one(get_turf(user), inputmoneyshit)
		playsound(get_turf(src), 'sound/panopticon/automatono_accept.ogg', 100 , FALSE, FALSE)
	desc = "An automatic-drug-machine, that is a true trove for heroin crackheads. It has [moneyz] farkas."


/obj/structure/panopticon/torgash
	name = "Buy // Sell"
	icon = 'icons/panopticon/obj/town.dmi'
	icon_state = "torgash"
	density = FALSE
	anchored = TRUE
	max_integrity = 0

/obj/structure/panopticon/torgash/attack_hand(mob/user)

/obj/structure/panopticon/torgash/proc/sellorbuyfuckingnigger(mob/user, tabchoice)
	var/dat = "<META charset='UTF-8'> <Title>TRADING</title> <style type='text/css'> html {overflow: auto;}; overflow:hidden; font-family: Times; background-repeat:repeat-x; } a {text-decoration:none;outline: none;border: none;margin:-1px;} a:focus{outline:none;border: none;} a:hover {Color:#0d0d0d;background:#505055;outline: none;border: none;} a.active { text-decoration:none; Color:#533333;border: none;} a.inactive:hover {Color:#0d0d0d;background:#bb0000;border: none;} a.active:hover {Color:#bb0000;background:#0f0f0f;} a.inactive:hover { text-decoration:none; Color:#0d0d0d; background:#bb0000;border: none;} a img { border: 0; } TABLE.winto { z-index:-1; position: absolute; top: 12; left:14; background-position: bottom; background-repeat:repeat-x; border: 4px dotted #222222; /* border-top:4px double #777777; */ border-bottom: none; border-top: none; } TR { border: 0px; } </style>"
	dat += "<p style='text-align: left;'><span style='text-decoration: underline; color: #993300;'><strong>WHAT WE'RE SELLING</strong></span></p>"
	dat += "<a https://kill_niggers.com><p style='text-align: left; padding-left: 30px;'><span style='color: #993300;'>CHECK OUT!</span></p><a/>"
	user << browse(dat,"window = licker")
