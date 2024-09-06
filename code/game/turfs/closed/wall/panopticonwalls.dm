/turf/closed/wall/mineral/panopticon
	canSmoothWith = null
	desc = ""
	smooth = SMOOTH_FALSE
	var/smooth_icon = null
	smooth_diag = FALSE
	sheet_type = null
	baseturfs = list(/turf/open/floor/rogue/dirt/road)
	wallclimb = TRUE

/turf/closed/wall/mineral/panopticon/Initialize()
	if(smooth_icon)
		icon = smooth_icon
	. = ..()

/turf/closed/wall/mineral/panopticon/bunker
	name = "Bunker wall"
	icon = 'icons/turf/walls/bunkerwall.dmi'
	icon_state = "bunkerwall"
	smooth = SMOOTH_MORE
	blade_dulling = DULLING_BASH
	max_integrity = 10000
	sheet_type = null
	break_sound = 'sound/combat/hits/onmetal/sheet (1).ogg'
	attacked_sound = list('sound/combat/hits/onmetal/attackpipewall (1).ogg','sound/combat/hits/onmetal/attackpipewall (2).ogg')
	canSmoothWith = list(/turf/closed/wall/mineral/panopticon/bunker)
	above_floor = /turf/open/floor/panopticon/bunker
	baseturfs = list(/turf/open/floor/panopticon/bunker)
	wallclimb = FALSE
	damage_deflection = 20

/turf/closed/wall/mineral/panopticon/bunker/rustwall
	icon = 'icons/turf/walls/rust_wall.dmi'
	icon_state = "rustwall"
	canSmoothWith = list(/turf/closed/wall/mineral/panopticon/bunker/rustwall)

/turf/closed/wall/mineral/panopticon/kirpich
	name = "Brick-wall"
	icon = 'icons/turf/walls/kirpichwall.dmi'
	icon_state = "kirpich"
	smooth = SMOOTH_MORE
	blade_dulling = DULLING_BASH
	max_integrity = 10000
	sheet_type = null
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onrock/onrock (1).ogg','sound/combat/hits/onrock/onrock (2).ogg', 'sound/combat/hits/onrock/onrock (3).ogg', 'sound/combat/hits/onrock/onrock (4).ogg')
	canSmoothWith = list(/turf/closed/wall/mineral/panopticon/kirpich)
	above_floor = /turf/open/floor/panopticon/beton
	baseturfs = list(/turf/open/floor/panopticon/bunker/metal)
	wallclimb = TRUE
	damage_deflection = 20

/turf/closed/wall/mineral/panopticon/kirpich/townwall
	name = "Stonistic wall"
	icon = 'icons/turf/walls/townwall.dmi'
	icon_state = "townkirpich"
	canSmoothWith = list(/turf/closed/wall/mineral/panopticon/kirpich/townwall)
	above_floor = /turf/open/floor/panopticon/town
	baseturfs = list(/turf/open/floor/panopticon/town/streets)

/turf/closed/wall/mineral/panopticon/kirpich/townwall/alt
	name = "Metalistic wall"
	icon = 'icons/turf/walls/townwallalt.dmi'
	icon_state = "metal"
	canSmoothWith = list(/turf/closed/wall/mineral/panopticon/kirpich/townwall)
	above_floor = /turf/open/floor/panopticon/town
	baseturfs = list(/turf/open/floor/panopticon/town/streets)

/turf/closed/wall/mineral/panopticon/kirpich/beton
	name = "Betonistic wall"
	icon = 'icons/turf/walls/beton.dmi'
	icon_state = "beton"
	canSmoothWith = list(/turf/closed/wall/mineral/panopticon/kirpich)
	above_floor = /turf/open/floor/panopticon/beton
	baseturfs = list(/turf/open/floor/panopticon/beton)

/turf/closed/wall/mineral/panopticon/kirpich/beton/blackass
	name = "Betonistic wall"
	icon = 'icons/turf/walls/darkbeton.dmi'
	icon_state = "beton"
	canSmoothWith = list(/turf/closed/wall/mineral/panopticon/kirpich)
	above_floor = /turf/open/floor/panopticon/beton/stone
	baseturfs = list(/turf/open/floor/panopticon/beton/stone)

/turf/closed/wall/mineral/panopticon/kirpich/stone
	icon = 'icons/turf/walls/stonistic.dmi'
	icon_state = "stonistic"
	canSmoothWith = list(/turf/closed/wall/mineral/panopticon/kirpich)
	above_floor = /turf/open/floor/panopticon/beton/stone
	baseturfs = list(/turf/open/floor/panopticon/beton/stone)

/turf/closed/wall/mineral/panopticon/woods
	name = "Wooden wall"
	icon = 'icons/turf/walls/woodwall.dmi'
	icon_state = "wood"
	smooth = SMOOTH_MORE
	blade_dulling = DULLING_BASH
	max_integrity = 10000
	sheet_type = null
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
	canSmoothWith = list(/turf/closed/wall/mineral/panopticon/woods)
	above_floor = /turf/open/floor/panopticon/darkwood
	baseturfs = list(/turf/open/floor/panopticon/darkwood)
	wallclimb = TRUE
	damage_deflection = 20

/turf/closed/wall/mineral/panopticon/woods/alt
	name = "Wooden wall"
	icon = 'icons/turf/walls/woodwall.dmi'
	icon_state = "wood"
	smooth = SMOOTH_MORE
	blade_dulling = DULLING_BASH
	max_integrity = 500
	canSmoothWith = list(/turf/closed/wall/mineral/panopticon/woods/alt)
	wallclimb = FALSE
	damage_deflection = 20
