/obj/structure/bed/panopticon/bunker
	name = "Steel bed"
	icon_state = "bunker_bed"
	icon = 'icons/panopticon/obj/indoorsen.dmi'
	sleepy = 3

/obj/structure/bed/panopticon/wooden
	name = "Wood bed"
	icon_state = "wooden_bed"
	icon = 'icons/panopticon/obj/indoorsen.dmi'
	sleepy = 5

/obj/structure/bed/panopticon/pigs
	name = "Garbage bed"
	icon_state = "pig_bed"
	icon = 'icons/panopticon/obj/indoorsen.dmi'
	sleepy = 1

/obj/structure/panopticon/barrel/red
	name = "Red barrel"
	desc = "Blows up well."
	icon_state = "red_barrel"
	icon = 'icons/panopticon/obj/indoorsen.dmi'
	density = TRUE
	attacked_sound = 'sound/foley/slap (1).ogg'

/obj/structure/panopticon/barrel/red/fire_act(added, maxstacks)
	explosion(get_turf(src), 0, 1, 5, flame_range = 5)
	qdel(src)

/obj/structure/reagent_dispensers/fueltank/bullet_act(obj/projectile/P)
	. = ..()
	if(!QDELETED(src)) //wasn't deleted by the projectile's effects.
		explosion(get_turf(src), 0, 1, 5, flame_range = 5)
		qdel(src)

/obj/structure/panopticon/barrel/red/propan
	name = "Propane tank"
	desc = ""
	icon_state = "propan"
	icon = 'icons/panopticon/obj/64x64.dmi'

/obj/structure/panopticon/barrel/blue
	name = "Blue barrel"
	desc = "Pointless, a completely hollow barrel."
	icon_state = "blue_barrel"
	icon = 'icons/panopticon/obj/indoorsen.dmi'
	density = TRUE
	attacked_sound = 'sound/foley/slap (1).ogg'

/obj/structure/panopticon/relsi
	name = "track"
	desc = ""
	icon_state = "relsi"
	icon = 'icons/panopticon/obj/indoorsen.dmi'
	max_integrity = 0

/obj/structure/closet/crate/drawer/bunkercabinet
	name = "Steel cabinet"
	desc = ""
	icon = 'icons/panopticon/obj/indoorsen.dmi'
	icon_state = "komod"
	base_icon_state = "komod"
	density = TRUE
	climbable = TRUE
	attacked_sound = list("sound/combat/hits/onmetal/metalimpact (1).ogg", "sound/combat/hits/onmetal/metalimpact (2).ogg")

/obj/structure/closet/crate/drawer/bunkercabinet/sidetable
	name = "Side table"
	icon = 'icons/panopticon/obj/town.dmi'
	icon_state = "sidetable"
	base_icon_state = "sidetable"

/obj/structure/rack/panopticon/shelf
	name = "Shelf"
	icon = 'icons/panopticon/obj/town.dmi'
	icon_state = "shelf"
	climbable = FALSE

/obj/structure/closet/crate/panopticoncrate
	name = "Wooden crate"
	icon = 'icons/panopticon/obj/town.dmi'
	base_icon_state = "crate"
	icon_state = "crate"

/obj/structure/closet/crate/metalshkaf
	name = "Metal cabinet"
	icon = 'icons/panopticon/obj/indoorsen.dmi'
	base_icon_state = "shkaf"
	icon_state = "shkaf"

/obj/structure/closet/crate/bigshkaf
	name = "Closet"
	icon = 'icons/panopticon/obj/64x64.dmi'
	icon_state = "closet"
	dir = SOUTH
	pixel_y = 32

/obj/effect/turf_decal/panopticon/mysor
	name = "Rubbish"
	icon_state = "rubbish"
	icon = 'icons/panopticon/obj/indoorsen.dmi'
	max_integrity = 0

/obj/effect/turf_decal/panopticon/mysor/doski
	icon_state = "broken_doski"
	icon = 'icons/panopticon/obj/town.dmi'

/obj/effect/turf_decal/panopticon/mysor/town
	icon_state = "trash"
	icon = 'icons/panopticon/obj/town.dmi'

/obj/effect/turf_decal/panopticon/mysor/town/alt
	icon_state = "musorinki"
	icon = 'icons/panopticon/obj/town.dmi'

/obj/effect/turf_decal/panopticon/mysor/town/alt/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/obj/structure/panopticon/kol
	name = "Spike"
	desc = "I hope it feels fantastic!"
	icon_state = "loh_sdoh"
	icon = 'icons/panopticon/obj/mirkwood.dmi'
	max_integrity = 0
	layer = ABOVE_MOB_LAYER
	plane = GAME_PLANE_UPPER

/obj/structure/panopticon/pit
	name = "Pit"
	desc = "How deep the humanity-hole goes."
	icon_state = "pit"
	icon = 'icons/panopticon/obj/mirkwood.dmi'

/obj/structure/panopticon/radiator
	name = "Radiator"
	icon_state = "radiator"
	icon = 'icons/panopticon/obj/indoorsen.dmi'
	max_integrity = 0
	attacked_sound = 'sound/foley/slap (1).ogg'

/obj/structure/panopticon/stove
	name = "Stove"
	icon_state = "plitka"
	icon = 'icons/panopticon/obj/town.dmi'
	max_integrity = 0
	attacked_sound = 'sound/foley/slap (1).ogg'


/obj/structure/panopticon/pallet
	name = "Pallet"
	icon_state = "pallet"
	icon = 'icons/panopticon/obj/mirkwood.dmi'
	max_integrity = 100
	layer = LYING_MOB_LAYER

/obj/structure/panopticon/skull
	name = "Skull"
	desc = "Poor Yorick!"
	icon_state = "skull"
	icon = 'icons/panopticon/obj/mirkwood.dmi'

/obj/structure/panopticon/skull/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/obj/structure/panopticon/wartrash
	name = "Trash"
	icon_state = "wartrash"
	icon = 'icons/panopticon/obj/mirkwood.dmi'

/obj/structure/panopticon/minesdoski
	name = ""
	desc = ""
	icon_state = "mines"
	icon = 'icons/panopticon/obj/bigass.dmi'
	max_integrity = 0
	layer = ABOVE_MOB_LAYER
	plane = GAME_PLANE_UPPER

/obj/structure/panopticon/meatpile
	name = "Big meatpile"
	desc = "It has a dreadful stench to it, and it's no longer possible to eat it because of the rot."
	icon_state = "meat"
	icon = 'icons/panopticon/obj/bigass.dmi'
	max_integrity = 0
	attacked_sound = 'sound/misc/fleisch.ogg'
	var/datum/looping_sound/fliesloop/soundloop
	layer = ABOVE_MOB_LAYER
	plane = GAME_PLANE_UPPER

/obj/structure/panopticon/meatpile/Initialize()
	soundloop = new(list(src), FALSE)
	soundloop.start()
	. = ..()

/obj/structure/panopticon/meatpile/Destroy()
	if(soundloop)
		soundloop.stop()
	..()

/obj/structure/panopticon/meatpile/obj_break(damage_flag)
	if(soundloop)
		soundloop.stop()
	..()

/obj/effect/turf_decal/panopticon/sewergrate
	name = "grate"
	desc = "smells fucking awful"
	icon_state = "sewer"
	icon = 'icons/panopticon/obj/indoorsen.dmi'

/obj/structure/panopticon/idol
	name = "Idol of an God"
	icon_state = "idol"
	icon = 'icons/panopticon/obj/mirkwood.dmi'
	max_integrity = 0

/obj/structure/panopticon/idol/attack_hand(mob/living/carbon/human/user)
	. = ..()
	var/mob/living/carbon/C = user
	to_chat(user, span_notice("I need to pray for gods help..."))
	if(do_after(user, 60 SECONDS, target = src))
		if(prob(60))
			if(C.can_heartattack())
				C.set_heartattack(TRUE)
				C.say(pick("OH MY BALLSSSSSSS!!", "ARGHH!", "AAAAAAH, HELP!!!!", "I AM DYING!!!", "AAAAAAAAAAA!"))
				playsound(user, 'sound/misc/DEATH.ogg', 85)
				C.playsound_local(user, 'sound/misc/deadbell.ogg', 100)
				to_chat(user, span_cultlarge("FUCKING WEAKLING CREATURE, IT'S TIME TO DIE!"))
		else
			var/choice = alert(user,"The gods have heard you. What do you want?",,"Medicinae dose...","Sclopetis...","Magicae Sanitatem...")
			switch(choice)
				if("Medicinae dose...")
					playsound(src, 'sound/misc/Logic_transform.ogg', 100)
					new /obj/item/reagent_containers/glass/bottle/heroinium(get_turf(user))
				if("Sclopetis...")
					playsound(src, 'sound/misc/Logic_transform.ogg', 100)
					var/gun = pick(1,2,3)
					switch(gun)
						if(1)
							new /obj/item/gun/ballistic/automatic/panopticon/krasnik(get_turf(user))
						if(2)
							new /obj/item/gun/ballistic/automatic/panopticon/krasnik(get_turf(user))
						if(3)
							new /obj/item/gun/ballistic/rifle/gusyevboltovka(get_turf(user))
				if("Magicae Sanitatem...")
					playsound(src, 'sound/misc/Logic_transform.ogg', 100)
					C.fully_heal()
					for(var/datum/disease/anthrax/A in C.diseases)
						A.cure()
					ADD_TRAIT(C, TRAIT_VIRUSIMMUNE, TRAIT_GENERIC)


/obj/effect/turf_decal/panopticon/skulldraw
	name = ""
	icon_state = "skull"
	icon = 'icons/panopticon/obj/bigass.dmi'

/obj/structure/panopticon/plaque
	name = "Broken Plaque"
	desc = "remains of the former grandeur of the Church is here."
	icon_state = "plaque"
	max_integrity = 20
	icon = 'icons/panopticon/obj/indoorsen.dmi'
	density = TRUE

/obj/structure/panopticon/brkcloset
	name = "Broken closet"
	desc = ""
	icon_state = "junk_cabinet"
	icon = 'icons/panopticon/obj/indoorsen.dmi'
	max_integrity = 0

/obj/structure/panopticon/brklocker
	name = "Broken locker"
	desc = ""
	icon_state = "junk_locker"
	icon = 'icons/panopticon/obj/indoorsen.dmi'
	max_integrity = 0

/obj/structure/panopticon/brklocker/Initialize()
	. = ..()
	if(prob(12))
		new /obj/item/ammo_box/m10mm(get_turf(src))
	if(prob(26))
		new /obj/item/panopticonweapon/boner/nailplank(get_turf(src))
	if(prob(10))
		new /obj/item/reagent_containers/glass/bottle/heroinium(get_turf(src))
	if(prob(30))
		new /obj/item/panopticonweapon/molotok(get_turf(src))

/obj/structure/panopticon/shutters
	name = "Mine shutters"
	desc = "They are here so long ago opened up that they've been driven into the ground."
	icon_state = "shutter"
	icon = 'icons/panopticon/obj/town.dmi'
	max_integrity = 0

/obj/structure/chair/bench/oldasscouch
	icon = 'icons/panopticon/obj/indoorsen.dmi'
	icon_state = "divan1"

/obj/structure/chair/bench/oldasscouch/r
	icon_state = "divan2"

/obj/structure/panopticon/crate
	name = "Steel stash"
	icon_state = "tainik"
	icon = 'icons/panopticon/obj/town.dmi'
	max_integrity = 20
	attacked_sound = 'sound/combat/hits/onmetal/sheet (2).ogg'

/obj/structure/panopticon/crate/deconstruct()
	if(prob(5))
		new /obj/item/storage/firstaid/panopticon(get_turf(src))
	if(prob(17))
		new /obj/item/storage/pill_bottle/pervitin(get_turf(src))
	if(prob(45))
		new /obj/item/storage/fancy/cigarettes/jeltomorkanal(get_turf(src))
	else
		new /obj/item/panopticonmoney/one(get_turf(src))
	if(prob(29))
		new /obj/item/panopticonmoney/ten(get_turf(src))
	if(prob(1))
		new /obj/item/panopticonmoney/hundred(get_turf(src))
	playsound(src,'sound/combat/hits/onmetal/grille (2).ogg', 50, TRUE)
	qdel(src)

/obj/structure/climbshit
	icon_state = null
	opacity = 0
	max_integrity = 100
	climbable = TRUE
	climb_time = 0
	layer = TABLE_LAYER
	plane = GAME_PLANE
	blade_dulling = DULLING_PICK
	static_debris = null
	debris = null
	alpha = 255
	climb_offset = 14

/obj/structure/panopticon/randomshit
	name = ""
	desc = ""
	icon_state = "townthing"
	icon = 'icons/panopticon/obj/bigass.dmi'
	max_integrity = 310
	layer = ABOVE_MOB_LAYER
	plane = GAME_PLANE_UPPER
	density = FALSE
