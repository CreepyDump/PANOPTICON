
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
	desc = "Poster refers to an incident when a few flies inside of a bunker caused an infestation that resulted a 25-person exodus to the outside of the bunker"
	icon_state = "pnposter2"

/obj/structure/panopticon/onwall/leprosyposter
	name = "The leper"
	desc = "Poster portrays a leper in his HazMat suit"
	icon_state = "pnposter3"

/obj/structure/panopticon/onwall/consulposter
	name = "Grand Conseil"
	desc = "Painting portrays Grand Counseil de la Concorde, who has already departed the world a long time ago"
	icon_state = "pnposter4"

/obj/structure/panopticon/onwall/grobposter
	name = "Grazhdanskaya Oborona"
	desc = "Punks hoi!"
	icon_state = "pnposter5"

/obj/structure/panopticon/onwall/kitarik
	name = "Kristopher Tarkovski"
	desc = "Painting portrays an unidentified man. The frame is signed, possible name is written on it"
	icon_state = "pnposter6"

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

/obj/structure/panopticon/onwall/vostoksign
	name = "Welcome to Vostok"
	desc = "A sign that greets newcomers to Vostok Bunker."
	icon = 'icons/panopticon/obj/bigass.dmi'
	icon_state = "vostok_sign"
