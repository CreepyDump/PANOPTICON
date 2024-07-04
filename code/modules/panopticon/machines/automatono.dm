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

/obj/structure/mineral_door/bars/Initialize()
	..()
	add_overlay(mutable_appearance(icon, "bunkerdooropen", ABOVE_MOB_LAYER))

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
	armor = list("melee" = 20, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 70)


/obj/structure/panopticon/automat/heroinmachine/attackby(obj/item/I, mob/living/carbon/user, params)
	if(istype(I, /obj/item/panopticonmoney/ten))
		var/obj/item/panopticonmoney/ten/M = I
		user.visible_message("<span class='warning'>[user] stuffs some [M] inside the Automato</span>", "<span class='notice'>I stick [M] inside the Automato.</span>")
		playsound(get_turf(src), 'sound/misc/elec (2).ogg', 100 , FALSE, FALSE)
		new /obj/item/reagent_containers/glass/bottle/heroinium(drop_location())
		qdel(M)

/datum/looping_sound/tvloop
	mid_sounds = list('sound/ambience/tv1.ogg')
	end_sound = list('sound/ambience/tv2.ogg')
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
	var/curfile
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
