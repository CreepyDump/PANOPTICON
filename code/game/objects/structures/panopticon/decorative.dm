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
