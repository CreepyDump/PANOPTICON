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
	droning_sound = 'sound/music/area/indoorsen.ogg'
	droning_sound_dusk = 'sound/music/area/indoorsen.ogg'
	droning_sound_night = 'sound/music/area/indoorsen.ogg'
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
	ambientsounds = 'sound/ambience/ambient.ogg'
	droning_sound = null
	droning_sound_dusk = null
	droning_sound_night = null

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

/area/panopticon/indoors/caves/odonghs
	name = "cave"
	icon_state = "blueold"
	ambientsounds = AMB_GENCAVE
	ambientnight = AMB_GENCAVE
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	droning_sound = 'sound/music/area/Odongh.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/panopticon/outdoors/caves

//FOREST

/area/panopticon/outdoors/darkwood
	name = "mirkwood"
	icon_state = "forest"
	ambientsounds = AMB_FORESTDAY
	ambientnight = AMB_FORESTNIGHT
	spookysounds = HORROR_FOREST
	spookynight = HORROR_FOREST
	droning_sound_dawn = 'sound/music/area/morning.ogg'
	droning_sound = 'sound/music/area/forest.ogg'
	droning_sound_dusk = 'sound/music/area/forest.ogg'
	droning_sound_night = 'sound/music/area/forest.ogg'
	soundenv = 15
	first_time_text = "DARKWOOD"
	converted_type = /area/rogue/indoors/shelter/woods
	ambush_times = list("night", "dawn", "day")
	ambush_types = list(
				/turf/open/floor/panopticon/darkgrass,
				/turf/open/floor/panopticon/mud)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 36,
				/mob/living/simple_animal/hostile/retaliate/rogue/panopticon/baun = 30)

/area/panopticon/indoors/shelter/darkwood
	ambientsounds = null
	droning_sound = 'sound/music/area/indoorsen.ogg'
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
	droning_sound_dawn = 'sound/music/area/derevnya_utro.ogg'
	droning_sound = 'sound/music/area/derevnya.ogg'
	droning_sound_dusk = 'sound/music/area/derevnya.ogg'
	droning_sound_night = 'sound/music/area/forest.ogg'

/area/panopticon/outdoors/darkwood/pole
	name = "fields"
	ambientrain = RAIN_OUT
	ambientsounds = 'sound/ambience/desertday.ogg'
	ambientnight = 'sound/ambience/desertnight.ogg'
	spookysounds = HORROR_FOREST
	spookynight = HORROR_FOREST
	droning_sound_dawn = 'sound/music/area/derevnya_utro.ogg'
	droning_sound = 'sound/music/area/lustmord.ogg'
	droning_sound_dusk = 'sound/music/area/darkwood.ogg'
	droning_sound_night = 'sound/music/area/pole.ogg'

//TOWN

/area/panopticon/outdoors/town
	name = "Town"
	icon_state = "isnear"
	outdoors = TRUE
	ambientrain = RAIN_OUT
	ambientsounds = AMB_TOWNDAY
	ambientnight = AMB_TOWNNIGHT
	spookysounds = null
	spookynight = TOWN_AMBIENT
	droning_sound = 'sound/music/area/town.ogg'
	droning_sound_dusk = 'sound/music/area/town_dusk.ogg'
	droning_sound_night = 'sound/music/area/jutkayahyina.ogg'
	converted_type = /area/panopticon/indoors
	soundenv = 16

/area/panopticon/indoors/town
	name = "Town"
	icon_state = "yellow"
	ambientrain = RAIN_OUT
	spookysounds = SPOOKY_RATS
	spookynight = null
	droning_sound = 'sound/music/area/town_indoors.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/panopticon/outdoors/town
	soundenv = 5

/area/panopticon/indoors/town/church
	name = "Town"
	icon_state = "purple"
	ambientrain = RAIN_OUT
	spookysounds = SPOOKY_RATS
	spookynight = null
	droning_sound = 'sound/music/area/indoorsen.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/panopticon/outdoors/town
	soundenv = 7

/area/panopticon/indoors/town/shop
	name = "Shop"
	icon_state = "dk_yellow"
	ambientrain = RAIN_OUT
	spookysounds = SPOOKY_RATS
	spookynight = null
	droning_sound = 'sound/music/area/shop.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/panopticon/outdoors/town
	soundenv = 5

/area/panopticon/indoors/sewerslut
	name = "Sewers"
	icon_state = "green"
	ambientrain = RAIN_SEWER
	ambientsounds = AMB_SEWERS
	ambientnight = AMB_SEWERS
	spookysounds = SPOOKY_RATS
	spookynight = SPOOKY_CAVE
	droning_sound = 'sound/music/area/sewers.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	soundenv = 8
	plane = INDOOR_PLANE
	converted_type = /area/panopticon/outdoors

/area/panopticon/outdoors/hell
	name = "HELL"
	icon_state = "isnear"
	outdoors = FALSE
	ambientrain = null
	ambientsounds = AMB_CAVELAVA
	ambientnight = AMB_CAVELAVA
	spookysounds = SPOOKY_BUNKER
	spookynight = SPOOKY_BUNKER
	droning_sound = 'sound/music/area/deathdeathdeath.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/panopticon/indoors/hell
	soundenv = 4

/area/panopticon/outdoors/hell/andanother
	name = "HELL"
	icon_state = "isnear"
	outdoors = FALSE
	ambientrain = null
	ambientsounds = AMB_BASEMENT
	ambientnight = AMB_CAVELAVA
	spookysounds = SPOOKY_BUNKER
	spookynight = SPOOKY_BUNKER
	droning_sound = 'sound/music/area/deathdeathdeath.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/panopticon/indoors/hell
	soundenv = 4

/area/panopticon/indoors/hell
	name = "HELL INDOORS"
	icon_state = "isnear"
	outdoors = FALSE
	ambientrain = null
	ambientsounds = AMB_INGEN
	ambientnight = AMB_INGEN
	spookysounds = SPOOKY_BUNKER
	spookynight = SPOOKY_BUNKER
	droning_sound = 'sound/music/area/deathdeathdeath.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	soundenv = 0

/area/panopticon/indoors/hell/dinner
	name = "HELL DINNER"
	icon_state = "isnear"
	droning_sound = 'sound/music/area/dinner.ogg'
