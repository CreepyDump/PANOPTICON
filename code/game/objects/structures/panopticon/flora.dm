/obj/structure/flora/panopticon/grass
	name = "Grass"
	icon_state = "g1"
	icon = 'icons/panopticon/obj/mirkwood.dmi'
	layer = ABOVE_MOB_LAYER

/obj/structure/flora/panopticon/grass/Initialize()
	. = ..()
	icon_state = "g[rand(1,4)]"

/obj/structure/flora/panopticon/grass/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		playsound(src,'sound/misc/shelest.ogg', 50, TRUE)
	qdel(src)

/obj/structure/panopticon/psychickgrib
	name = "Psychickshroom"
	icon_state = "grib"
	icon = 'icons/panopticon/obj/mirkwood.dmi'

/obj/structure/panopticon/psychickgrib/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/reagent_containers/food/snacks/grown/psychickgrib(get_turf(src))
		playsound(src,'sound/misc/vampirespell.ogg', 50, TRUE)
	qdel(src)

/obj/structure/panopticon/panopticontree
	name = "Strange tree"
	desc = "Looks bizzare!"
	icon = 'icons/panopticon/obj/longass_trees.dmi'
	icon_state = "panoptree_1"
	density = 1
	max_integrity = 200
	blade_dulling = DULLING_CUT
	pixel_x = -16
	layer = 4.81
	plane = GAME_PLANE_UPPER
	attacked_sound = 'sound/misc/woodhit.ogg'
	destroy_sound = 'sound/misc/woodhit.ogg'
	debris = list(/obj/item/grown/log/tree/stick = 2)
	static_debris = list(/obj/item/grown/log/tree = 1)
	alpha = 200
	var/stump_type = /obj/structure/flora/roguetree/stump

/obj/structure/panopticon/panopticontree/attack_right(mob/user)
	if(user.mind && isliving(user))
		if(user.mind.special_items && user.mind.special_items.len)
			var/item = input(user, "What will I take?", "STASH") as null|anything in user.mind.special_items
			if(item)
				if(user.Adjacent(src))
					if(user.mind.special_items[item])
						var/path2item = user.mind.special_items[item]
						user.mind.special_items -= item
						var/obj/item/I = new path2item(user.loc)
						user.put_in_hands(I)
			return

/obj/structure/panopticon/panopticontree/fire_act(added, maxstacks)
	if(added > 5)
		return ..()

/obj/structure/panopticon/panopticontree/obj_destruction(damage_flag)
	if(stump_type)
		new stump_type(loc)
	playsound(src, 'sound/misc/treefall.ogg', 100, FALSE)
	. = ..()


/obj/structure/panopticon/panopticontree/Initialize()
	. = ..()
	icon_state = "panoptree_[rand(1,5)]"
