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

/turf/open/floor/panopticon/darkwood/parketpizda
	icon_state = "oldass"

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
		var/state = pick_weight(list("darkgrass" = 6, "bush" = 5, "tree" = 4, "log" = 1, "dirthole" = 1, "stones" = 5, "smallstone" = 2, "seltshmack" = 3, "psychickshroom" = 2, "throbber" = 2, "mud" = 1, "water" = 2, "nothing" = 40))
		switch(state)
			if ("darkgrass")
				new /obj/structure/flora/panopticon/grass(get_turf(src))
			if("nothing")
				return
			if ("bush")
				new /obj/structure/flora/roguegrass/bush(get_turf(src))
			if ("dirthole")
				new /obj/structure/closet/dirthole/closed(get_turf(src))
			if("stones")
				new /obj/structure/panopticon/mirkstones(get_turf(src))
			if("smallstone")
				new /obj/item/natural/stone(get_turf(src))
			if("seltshmack")
				new /obj/structure/panopticon/seltshmack(get_turf(src))
			if("psychickshroom")
				new /obj/structure/panopticon/psychickgrib(get_turf(src))
			if("throbber")
				new /obj/structure/panopticon/throbber(get_turf(src))
			if("tree")
				var/canspawn = TRUE
				var/near_t = range(2, src)
				if((locate(/turf/closed/wall) in near_t) || (locate(/obj/structure/panopticon/panopticontree) in near_t) || (locate(/obj/structure/flora/panopticontree/log) in near_t))
					canspawn = FALSE
				if(canspawn)
					new /obj/structure/panopticon/panopticontree(get_turf(src))
					new /turf/open/floor/panopticon/mud(get_turf(src))
			if ("water")
				var/randomwater = pick(1,2)
				switch(randomwater)
					if(1)
						new /turf/open/water/swamp/deep(get_turf(src))
					if(2)
						new /turf/open/water/cleanshallow(get_turf(src))
			if ("mud")
				new /turf/open/floor/panopticon/mud(get_turf(src))
			if ("log")
				new /obj/structure/flora/panopticontree/log(get_turf(src))
		if (prob(1))
			var/canspawn = TRUE
			var/near_t = range(1, src)
			if((locate(/turf/closed/wall) in near_t) || (locate(/turf/open/water/cleanshallow) in near_t) || (locate(/turf/open/water/swamp/deep) in near_t))
				canspawn = FALSE
			if(canspawn)
				new /obj/effect/mine/explosive/panopticon/landmine(get_turf(src))
		if (prob(1))
			new /obj/structure/panopticon/skull(get_turf(src))

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
	initial_gas_mix = FROZEN_ATMOS
	slowdown = 2

/turf/open/floor/panopticon/gulag/snow/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/obj/effect/turf_decal/panopticon/snowcorner
	name = ""
	icon = 'icons/turf/panopticonfloor.dmi'
	icon_state = "snow_corner"

/obj/structure/panopticon/metalgrate
	name = "metal grating"
	icon = 'icons/turf/panopticonfloor.dmi'
	icon_state = "metalreshet"

/turf/open/floor/panopticon/gulag/snow/Crossed(mob/living/carbon/human/A)
	if(istype(A.wear_mask, /obj/item/clothing/shoes))
		slowdown = 0
	else
		return

/turf/open/floor/panopticon/gulag/derevo
	icon_state = "derevogulag"
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/woodland.ogg'

/turf/open/floor/panopticon/gulag/derevo/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/obj/structure/panopticon/townborders
	name = ""
	icon = 'icons/turf/panopticonfloor.dmi'
	icon_state = "bordur"
