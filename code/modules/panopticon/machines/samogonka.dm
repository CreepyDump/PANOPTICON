//////////////ETHANOL REFINERY/////////////////

/obj/structure/distillery
	name = "hooch distiller"
	desc = "An moonshine apparat. Turns any shrooms into alcohol."
	density = FALSE
	layer = WALL_OBJ_LAYER+0.1
	plane = AREA_PLANE
	anchored = TRUE
	icon = 'icons/panopticon/obj/samogon.dmi'
	icon_state = "samogon"

/datum/crafting_recipe/roguetown/hooch
	structurecraft = /obj/structure/distillery
	skillcraft = /datum/skill/misc/hooch
	name = "Psychick samogon"
	result = list(/obj/item/reagent_containers/glass/bottle/psychicksamogonka)
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/psychickgrib = 3,
				/obj/item/reagent_containers/glass/bottle = 1)
	craftdiff = 0

///datum/crafting_recipe/roguetown/hooch/seltshmack
//	name = "Seltshmack samogon"
//	result = list(/obj/item/reagent_containers/glass/bottle/shmacksamogonka)
//	reqs = list(/obj/item/reagent_containers/food/snacks/seltshmack = 3,
//				/obj/item/reagent_containers/glass/bottle = 1)
//	craftdiff = 0
