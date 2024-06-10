//Basic zones

/area/panopticon
	name = "PANOPTICON"
	icon_state = "invi"
	has_gravity = STANDARD_GRAVITY
	ambientsounds = null
	always_unpowered = TRUE
	poweralm = FALSE
	power_environ = TRUE
	power_equip = TRUE
	power_light = TRUE
	dynamic_lighting = DYNAMIC_LIGHTING_FORCED
	requires_power = FALSE

/area/panopticon/indoors
	name = "INDOORS PANOPTICON"
	icon_state = "green"
	ambientrain = RAIN_IN
	ambientsounds = AMB_INGEN
	ambientnight = AMB_INGEN
	spookysounds = SPOOKY_BUNKER
	spookynight = SPOOKY_BUNKER
	droning_sound = 'sound/music/area/town.ogg'
	droning_sound_dusk = 'sound/music/area/jutkayahyina.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	soundenv = 2
	plane = INDOOR_PLANE
	converted_type = /area/panopticon/outdoors

/area/panopticon/outdoors
	name = "OUTDOORS PANOPTICON"
	icon_state = "isnear"
	outdoors = TRUE
	ambientrain = RAIN_OUT
	ambientsounds = AMB_TOWNDAY
	ambientnight = AMB_TOWNNIGHT
	spookysounds = HORROR_FOREST
	spookynight = SPOOKY_NIGHT
	droning_sound = 'sound/music/area/derevnya.ogg'
	droning_sound_dusk = 'sound/music/area/jutkayahyina.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	converted_type = /area/panopticon/indoors
	soundenv = 16

/area/rogue/indoors/shelter
	droning_sound = 'sound/music/area/prison.ogg'
	droning_sound_dusk = 'sound/music/area/jutkayahyina.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'

//BUNKER
/area/panopticon/indoors/bunker
	name = "bunker"
	icon_state = "bunkerzone"
	droning_sound = 'sound/music/area/bunker.ogg'
	ambientsounds = AMB_BASEMENT
	ambientnight = AMB_BASEMENT
	spookysounds = SPOOKY_BUNKER
	droning_sound_dusk = null
	droning_sound_night = null
	soundenv = 16
	converted_type = /area/rogue/outdoors/caves

/area/panopticon/indoors/bunker/special
	name = "bunker special"
	icon_state = "bunkerspecial"
	droning_sound = 'sound/music/area/bunkerspecial.ogg'

/area/panopticon/indoors/caves
	name = "cave"
	ambientsounds = AMB_GENCAVE
	ambientnight = AMB_GENCAVE
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	droning_sound = 'sound/music/area/caves.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/panopticon/outdoors/caves

/area/panopticon/outdoors/caves
	droning_sound = 'sound/music/area/caves.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

//FOREST

/area/panopticon/outdoors/darkwood
	name = "mirkwood"
	icon_state = "forest"
	ambientsounds = AMB_FORESTDAY
	ambientnight = AMB_FORESTNIGHT
	spookysounds = HORROR_FOREST
	spookynight = HORROR_FOREST
	droning_sound = 'sound/music/area/forest.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	soundenv = 15
	first_time_text = "DARKWOOD"
	converted_type = /area/rogue/indoors/shelter/woods
	ambush_times = list("night", "dawn", "day")
	ambush_types = list(
				/turf/open/floor/panopticon/darkgrass,
				/turf/open/floor/panopticon/mud)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 36,
				/mob/living/simple_animal/hostile/retaliate/panopticon/baun = 30)

/area/panopticon/indoors/shelter/darkwood
	droning_sound = 'sound/music/area/deadcats.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/panopticon/outdoors/darkwood/deadvillage
	name = "dead village"
	icon_state = "isnear"
	ambientrain = RAIN_OUT
	ambientsounds = AMB_FORESTDAY
	ambientnight = AMB_FORESTNIGHT
	spookysounds = SPOOKY_MYSTICAL
	spookynight = SPOOKY_NIGHT
	droning_sound = 'sound/music/area/derevnya.ogg'
	droning_sound_dusk = 'sound/music/area/derevnya.ogg'
	droning_sound_night = 'sound/music/area/forest.ogg'

/area/panopticon/outdoors/darkwood/pole
	name = "fields"
	ambientrain = RAIN_OUT
	ambientsounds = AMB_FORESTDAY
	ambientnight = AMB_FORESTNIGHT
	spookysounds = HORROR_FOREST
	spookynight = HORROR_FOREST
	droning_sound = 'sound/music/area/pole.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
