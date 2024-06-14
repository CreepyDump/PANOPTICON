/obj/structure/bed/panopticon/bunker
	name = "Steel bed"
	icon_state = "bunker_bed"
	icon = 'icons/panopticon/obj/indoorsen.dmi'

/obj/structure/bed/panopticon/wooden
	name = "Wood bed"
	icon_state = "wooden_bed"
	icon = 'icons/panopticon/obj/indoorsen.dmi'

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
		if(!P.nodamage && ((P.damage_type == BURN) || (P.damage_type == BRUTE)))
			explosion(get_turf(src), 0, 1, 5, flame_range = 5)
			qdel(src)

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

/obj/structure/panopticon/bunkercabinet
	name = "Steel cabinet"
	icon_state = "komod"
	icon = 'icons/panopticon/obj/indoorsen.dmi'
	max_integrity = 0
	density = TRUE
	climbable = TRUE
	attacked_sound = list("sound/combat/hits/onmetal/metalimpact (1).ogg", "sound/combat/hits/onmetal/metalimpact (2).ogg")

/obj/effect/decal/panopticon/mysor
	name = "Rubbish"
	icon_state = "rubbish"
	icon = 'icons/panopticon/obj/indoorsen.dmi'

/obj/structure/panopticon/kol
	name = "Spike"
	desc = "I hope it feels fantastic!"
	icon_state = "loh_sdoh"
	icon = 'icons/panopticon/obj/mirkwood.dmi'
	max_integrity = 0

/obj/effect/decal/panopticon/pit
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

/obj/effect/decal/panopticon/pallet
	name = "Pallet"
	icon_state = "pallet"
	icon = 'icons/panopticon/obj/mirkwood.dmi'

/obj/effect/decal/panopticon/skull
	name = "Skull"
	desc = "Poor Yorick!"
	icon_state = "skull"
	icon = 'icons/panopticon/obj/mirkwood.dmi'

/obj/effect/decal/panopticon/skull/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/obj/effect/decal/panopticon/mirkstones
	name = "Stones"
	icon_state = "ston"
	icon = 'icons/panopticon/obj/mirkwood.dmi'

/obj/effect/decal/panopticon/mirkstones/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/obj/effect/decal/panopticon/wartrash
	name = "Trash"
	icon_state = "wartrash"
	icon = 'icons/panopticon/obj/mirkwood.dmi'

/obj/structure/panopticon/minesdoski
	name = ""
	desc = ""
	icon_state = "mines"
	icon = 'icons/panopticon/obj/bigass.dmi'
	max_integrity = 0

/obj/structure/panopticon/meatpile
	name = "Big meatpile"
	desc = "It has a dreadful stench to it, and it's no longer possible to eat it because of the rot."
	icon_state = "meat"
	icon = 'icons/panopticon/obj/bigass.dmi'
	max_integrity = 0
	attacked_sound = 'sound/misc/fleisch.ogg'
	var/datum/looping_sound/fliesloop/soundloop
	layer = GHOST_LAYER

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
