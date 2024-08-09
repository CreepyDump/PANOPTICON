//////////////ETHANOL REFINERY/////////////////

/obj/structure/distillery
	name = "hooch distiller"
	desc = "An moonshine apparat. Turns any shrooms into alcohol."
	density = FALSE
	anchored = TRUE
	icon = 'icons/panopticon/obj/samogon.dmi'
	icon_state = "samogon"

/datum/crafting_recipe/roguetown/hooch
	structurecraft = /obj/structure/distillery
	skillcraft =/datum/skill/misc/hooch
	reqs = list(/obj/item/reagent_containers/glass/bottle = 1)
/datum/crafting_recipe/roguetown/hooch
	name = "Psychick samogon"
	result = list(/obj/item/reagent_containers/glass/bottle/heroinium)
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/psychickgrib = 1)
	craftdiff = 1
	sellprice = 4
