/turf/open/floor/panopticon
	name = ""
	desc = ""
	canSmoothWith = null
	smooth = SMOOTH_FALSE
	var/smooth_icon = null
	var/prettifyturf = FALSE
	icon = 'icons/turf/panopticonfloor.dmi'
	baseturfs = list(/turf/open/transparent/openspace)
	neighborlay = ""

/turf/open/floor/panopticon/break_tile()
	return //unbreakable

/turf/open/floor/panopticon/burn_tile()
	return //unburnable

/turf/open/floor/panopticon/Initialize()
	if(smooth_icon)
		icon = smooth_icon
	. = ..()

/turf/open/floor/panopticon/darkwood
	icon_state = "darkwood_floor"
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/woodland.wav'

/turf/open/floor/panopticon/darkwood/parket
	icon_state = "parket"

/turf/open/floor/panopticon/darkwood/birchwood
	icon_state = "birch"

/turf/open/floor/panopticon/bunker
	icon_state = "bunkershit"
	landsound = 'sound/foley/jumpland/metalland.wav'
	footstep = FOOTSTEP_PLATING
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/floor/panopticon/bunker/oblivion
	icon_state = "oblivion_floor"
	footstepstealth = TRUE

/turf/open/floor/panopticon/bunker/metal
	icon_state = "metallic_floor"

/turf/open/floor/panopticon/bunker/cargo
	icon_state = "bunker_floor"
	footstepstealth = TRUE

/turf/open/floor/panopticon/bunker/cargo/typetwo
	icon_state = "rust"
	footstepstealth = TRUE

/turf/open/floor/panopticon/bunker/scorched
	icon_state = "dick_scorched"
	footstepstealth = TRUE

/turf/open/floor/panopticon/bunker/bunkergrid
	icon_state = "reshetka_floor"

/turf/open/floor/panopticon/bunker/gridbunker
	icon_state = "ebanyto"

/turf/open/floor/panopticon/darkgrass
	name = "dark grass"
	icon_state = "darkgrass"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/grassland.wav'
	var/grassgenerator = FALSE


/turf/open/floor/panopticon/darkgrass/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)
	if(grassgenerator)
		if(locate(/obj/structure/) in get_turf(src))
			return
		if(locate(/turf/open/water/) in get_turf(src))
			return
		if(prob(45))
			new /turf/open/floor/panopticon/darkgrass(get_turf(src))
			if (prob(50))
				new /obj/structure/flora/panopticon/grass(get_turf(src))
			if (prob(25))
				new /obj/structure/flora/roguegrass/bush(get_turf(src))
			if (prob(10))
				new /obj/structure/closet/dirthole/closed(get_turf(src))
		if(prob(40))
			var/stonegener = pick(1,2)
			switch(stonegener)
				if(1)
					new /obj/structure/panopticon/mirkstones(get_turf(src))
				if(2)
					new /obj/item/natural/stone(get_turf(src))
		if(prob(5))
			var/unluckyjuw = pick(1,2,3)
			switch(unluckyjuw)
				if(1)
					new /obj/structure/panopticon/seltshmack(get_turf(src))
				if(2)
					new /obj/structure/panopticon/psychickgrib(get_turf(src))
				if(3)
					new /obj/structure/panopticon/throbber(get_turf(src))
		if(prob(15))
			new /obj/structure/panopticon/panopticontree(get_turf(src))
			new /turf/open/floor/panopticon/mud(get_turf(src))
		if (prob(20))
			var/randomwater = pick(1,2)
			switch(randomwater)
				if(1)
					new /turf/open/water/swamp/deep(get_turf(src))
				if(2)
					new /turf/open/water/cleanshallow(get_turf(src))
		if (prob(30))
			new /turf/open/floor/panopticon/mud(get_turf(src))
		if (prob(1))
			new /obj/effect/mine/explosive/panopticon/landmine(get_turf(src))
		if (prob(1))
			new /obj/structure/panopticon/skull(get_turf(src))
		if (prob(1))
			new /obj/structure/flora/panopticontree/log(get_turf(src))

/turf/open/floor/panopticon/mud
	icon_state = "mud"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_MUD
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/dirtland.wav'
	slowdown = 1

/turf/open/floor/panopticon/beton
	icon_state = "beton"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'

/turf/open/floor/panopticon/beton/stone
	icon_state = "stone"

/turf/open/floor/panopticon/hell
	icon_state = "hell"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_LAVA
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'

/turf/open/floor/panopticon/road
	icon_state = "road"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/grassland.wav'

/obj/structure/panopticon/road
	name = ""
	icon = 'icons/turf/panopticonfloor.dmi'
	icon_state = "roadover"

/turf/open/floor/panopticon/town
	icon_state = "townroof"
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/woodland.wav'

/turf/open/floor/panopticon/town/streets
	icon_state = "town"
	footstep = FOOTSTEP_STONE
	landsound = 'sound/foley/jumpland/stoneland.wav'

/turf/open/floor/panopticon/town/plitka
	icon_state = "plitka_old"
	footstep = FOOTSTEP_STONE
	landsound = 'sound/foley/jumpland/stoneland.wav'

/turf/open/floor/panopticon/cement
	icon_state = "tsement"
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/dirtland.wav'

/obj/structure/panopticon/pepeldeco
	name = ""
	icon = 'icons/turf/panopticonfloor.dmi'
	icon_state = "pepeldeco"

/turf/open/floor/panopticon/cement/pepel
	icon_state = "burnthemall"

/turf/open/floor/panopticon/gulag/snow
	icon_state = "sneg"
	footstep = FOOTSTEP_SNOW
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/dirtland.ogg'

/turf/open/floor/panopticon/gulag/snow/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)


/obj/structure/panopticon/townborders
	name = ""
	icon = 'icons/turf/panopticonfloor.dmi'
	icon_state = "bordur"
