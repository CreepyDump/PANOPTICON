/obj/structure/flora/panopticon/grass
	name = "Grass"
	icon_state = "g1"
	icon = 'icons/panopticon/obj/mirkwood.dmi'
	layer = ABOVE_MOB_LAYER
	max_integrity = 1
	layer = ABOVE_MOB_LAYER
	plane = GAME_PLANE_UPPER

/obj/structure/flora/panopticon/grass/Initialize()
	. = ..()
	icon_state = "g[rand(1,4)]"

/obj/structure/flora/panopticon/grass/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		playsound(src,'sound/misc/shelest.ogg', 50, TRUE)
	qdel(src)

/obj/structure/panopticon/psychickgrib
	name = "Psychickshroom"
	icon_state = "grib1"
	icon = 'icons/panopticon/obj/mirkwood.dmi'
	max_integrity = 1

/obj/structure/panopticon/psychickgrib/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/reagent_containers/food/snacks/grown/psychickgrib(get_turf(src))
		playsound(src,'sound/misc/vampirespell.ogg', 50, TRUE)
	qdel(src)

/obj/structure/panopticon/psychickgrib/attack_hand(mob/user)
	. = ..()
	if(INTENT_GRAB)
		user.visible_message("<span class='notice'>[user] harvests shroom.</span>")
		deconstruct(src)

/obj/structure/panopticon/throbber
	name = "Throbbershroom"
	icon_state = "grib2"
	icon = 'icons/panopticon/obj/mirkwood.dmi'
	max_integrity = 1

/obj/structure/panopticon/throbber/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/reagent_containers/food/snacks/throbber(get_turf(src))
		playsound(src,'sound/misc/throbber.ogg', 50, TRUE)
	qdel(src)

/obj/structure/panopticon/throbber/attack_hand(mob/user)
	. = ..()
	if(INTENT_GRAB)
		user.visible_message("<span class='notice'>[user] harvests shroom.</span>")
		deconstruct(src)

/obj/structure/panopticon/seltshmack
	name = "Seltshmack"
	icon_state = "grib3"
	icon = 'icons/panopticon/obj/mirkwood.dmi'
	max_integrity = 1

/obj/structure/panopticon/seltshmack/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/reagent_containers/food/snacks/seltshmack(get_turf(src))
		playsound(src,'sound/items/seedextract.ogg', 50, TRUE)
	qdel(src)

/obj/structure/panopticon/seltshmack/attack_hand(mob/user)
	. = ..()
	if(INTENT_GRAB)
		user.visible_message("<span class='notice'>[user] harvests shroom.</span>")
		deconstruct(src)

/obj/structure/panopticon/panopticontree
	name = "Strange tree"
	desc = "Looks bizzare!"
	icon = 'icons/panopticon/obj/longass_trees.dmi'
	icon_state = "panoptree_1"
	density = 1
	max_integrity = 200
	blade_dulling = DULLING_CUT
	layer = ABOVE_MOB_LAYER
	plane = GAME_PLANE_UPPER
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
	icon_state = "panoptree_[rand(1,8)]"

/obj/structure/panopticon/mirkstones
	name = "Stones"
	icon_state = "ston"
	icon = 'icons/panopticon/obj/mirkwood.dmi'
	max_integrity = 100

/obj/structure/panopticon/mirkstones/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/obj/structure/panopticon/mirkstones/Crossed(mob/living/L)
	if(istype(L) && !L.throwing)
		if(L.m_intent == MOVE_INTENT_RUN)
			L.visible_message("<span class='warning'>[L] trips over the rock!</span>","<span class='warning'>I trip over the rock!</span>")
			L.Knockdown(10)
			L.consider_ambush()
	..()


/obj/structure/panopticon/mirkstones/attackby(obj/item/W, mob/user, params)
	user.changeNext_move(CLICK_CD_MELEE)
	if(istype(W, /obj/item/natural/stone))
		user.visible_message("<span class='info'>[user] strikes the stone against the rock.</span>")
		playsound(src.loc, 'sound/items/stonestone.ogg', 100)
		if(prob(35))
			var/datum/effect_system/spark_spread/S = new()
			var/turf/front = get_turf(src)
			S.set_up(1, 1, front)
			S.start()
		return
	if(istype(W, /obj/item/natural/rock))
		playsound(src.loc, pick('sound/items/stonestone.ogg'), 100)
		user.visible_message("<span class='info'>[user] strikes the rocks together.</span>")
		if(prob(10))
			var/datum/effect_system/spark_spread/S = new()
			var/turf/front = get_turf(src)
			S.set_up(1, 1, front)
			S.start()
		return
	..()

/obj/structure/flora/panopticontree/log
	name = "Strange log"
	icon = 'icons/panopticon/obj/mirkwood.dmi'
	icon_state = "brevno"
	opacity = 0
	max_integrity = 100
	climbable = TRUE
	climb_time = 0
	layer = TABLE_LAYER
	plane = GAME_PLANE
	blade_dulling = DULLING_PICK
	static_debris = null
	debris = null
	alpha = 255
	pixel_x = -16
	climb_offset = 14
