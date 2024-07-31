
/obj/structure/panopticon/onwall
	name = ""
	desc = ""
	icon = 'icons/panopticon/obj/decoration.dmi'
	icon_state = "nazis_symbol"
	anchored = TRUE
	density = FALSE
	max_integrity = 0
	layer = ABOVE_MOB_LAYER+0.1

/obj/structure/panopticon/onwall/proc/get_attached_wall()
	return

/obj/structure/panopticon/onwall/skullposter
	name = "Smoke MORE and MORE!"
	desc = "Pro-smoking propaganda. It states: Smoke MORE, because the more people smoke, the closer they are to death!"
	icon_state = "pnposter1"

/obj/structure/panopticon/onwall/insectposter
	name = "Fly blight"
	desc = "Poster refers to an incident when a few flies inside of a bunker caused an infestation that resulted a 25-person exodus to the outside of the bunker."
	icon_state = "pnposter2"

/obj/structure/panopticon/onwall/leprosyposter
	name = "The leper"
	desc = "Poster portrays a leper in his HazMat suit"
	icon_state = "pnposter3"

/obj/structure/panopticon/onwall/consulposter
	name = "Grand Conseil"
	desc = "Painting portrays Grand Counseil de la Concorde, who has already departed the world a long time ago."
	icon_state = "pnposter4"

/obj/structure/panopticon/onwall/grobposter
	name = "Grazhdanskaya Oborona"
	desc = "Punks hoi!"
	icon_state = "pnposter5"

/obj/structure/panopticon/onwall/kitarik
	name = "Kristopher Tarkovski"
	desc = "Painting portrays an unidentified man. The frame is signed, possible name is written on it."
	icon_state = "pnposter6"

/obj/structure/panopticon/onwall/commies
	name = "Vladimir Ilich Lennin"
	desc = "Lennin lived. Lennin is alive. Lennin will live."
	icon_state = "pnposter7"

/obj/structure/panopticon/onwall/wanted
	name = "WANTED:"
	desc = "Untitled middle-aged guy. Total creep."
	icon_state = "pnposter8"

/obj/structure/panopticon/onwall/wanted/unabomber
	desc = "Middle-aged guy, identified as 'The Homicide Bomber'."
	icon_state = "pnposter9"

/obj/structure/panopticon/onwall/sam
	name = "Uncle Gray"
	desc = "Painting portrays the 'Uncle Gray', urging you to join The Gray Division."
	icon_state = "pnposter10"


/obj/structure/panopticon/onwall/pipe
	name = "Pipe"
	desc = ""
	icon = 'icons/panopticon/obj/mirkwood.dmi'
	icon_state = "pipe1"

/obj/structure/panopticon/onwall/pipe/Initialize()
	. = ..()
	icon_state = "pipe[rand(1,4)]"
	dir = pick(GLOB.cardinals)

/obj/structure/panopticon/onwall/inwallpipe
	name = "Pipe"
	desc = ""
	icon = 'icons/panopticon/obj/indoorsen.dmi'
	icon_state = "inwall_pipe"

/obj/structure/panopticon/onwall/wallpipe
	name = "Pipe"
	desc = ""
	icon = 'icons/panopticon/obj/indoorsen.dmi'
	icon_state = "wall_pipe"

/obj/structure/panopticon/onwall/flag
	name = "Viva"
	desc = "Great flag of revolutio!"
	icon_state = "viva_flag"

/obj/structure/panopticon/onwall/flag/hetmanat
	name = "Temnyi Hetmanat"
	desc = "You'd better not stay here."
	icon_state = "hetmanat_flag"

/obj/structure/panopticon/onwall/vent
	name = "Vent"
	icon_state = "vents"

/obj/structure/panopticon/onwall/vent/animated
	icon_state = "vent"

/obj/structure/panopticon/onwall/vostoksign
	name = "Welcome to Vostok"
	desc = "A sign that greets newcomers to Vostok Bunker."
	icon = 'icons/panopticon/obj/bigass.dmi'
	icon_state = "vostok_sign"

/obj/structure/panopticon/onwall/graffiti
	icon_state = "graffiti"

/obj/structure/panopticon/onwall/burnedposter
	name = "Unknown poster"
	desc = "The poster's content is shrouded in obscurity after the fire."
	icon_state = "burned"

/obj/structure/panopticon/onwall/burn
	icon_state = "burn"

/obj/structure/panopticon/onwall/carpet
	name = "Carpet"
	icon_state = "carpet"

/obj/structure/panopticon/onwall/there
	name = "Arrow"
	desc = "The way lays here!"
	icon_state = "there"

/obj/structure/panopticon/onwall/eroch
	name = "Bar 'Eroch' sign"
	desc = "All broken hearts are right there!"
	icon = 'icons/panopticon/obj/town.dmi'
	icon_state = "eroch"
	layer = ABOVE_MOB_LAYER
	plane = GAME_PLANE_UPPER

/obj/structure/panopticon/onwall/hospital
	name = "'Hospital' sign"
	desc = "Maybe there could be some medical help here."
	icon = 'icons/panopticon/obj/town.dmi'
	icon_state = "hospital"

/obj/structure/panopticon/onwall/greys
	name = "'Greys' sign"
	desc = "That's where the Empire's constabulary is based."
	icon = 'icons/panopticon/obj/town.dmi'
	icon_state = "greys"

/obj/structure/panopticon/onwall/oldass
	icon_state = "oldass_wall"
