/obj/item
	var/blade_int = 0
	var/max_blade_int = 0
	var/required_repair_skill = 0
	var/dismember_blade_int = 0
	var/sword_spark

/obj/item/proc/remove_bintegrity(amt as num)
	blade_int = blade_int - amt
	if(blade_int <= 0)
		blade_int = 0
	return TRUE

/obj/item/proc/degrade_bintegrity(amt as num)
	if(max_blade_int <= 10)
		max_blade_int = 10
		return FALSE
	else
		max_blade_int = max_blade_int - amt
		if(max_blade_int <= 10)
			max_blade_int = 10
		return TRUE

/obj/item/proc/add_bintegrity(amt as num)
	if(blade_int >= max_blade_int)
		blade_int = max_blade_int
		return FALSE
	else
		blade_int = blade_int + amt
		if(blade_int >= max_blade_int)
			blade_int = max_blade_int
		return TRUE

/obj/structure/attackby(obj/item/I, mob/user, params)
	user.changeNext_move(user.used_intent.clickcd)
	..()


/obj/machinery/attackby(obj/item/I, mob/user, params)
	user.changeNext_move(user.used_intent.clickcd)
	..()

/obj/item/attackby(obj/item/I, mob/user, params)
	user.changeNext_move(user.used_intent.clickcd)
	if(max_blade_int)
		if(istype(I, /obj/item/natural/stone))
			playsound(src.loc, pick('sound/items/sharpen_long1.ogg','sound/items/sharpen_long2.ogg'), 100)
			user.visible_message("<span class='notice'>[user] sharpens [src]!</span>")
			degrade_bintegrity(0.5)
			add_bintegrity(max_blade_int * 0.1)
			if(!locate(/obj/item) in get_turf(src))
				if(prob(35))
					if(sword_spark == TRUE)
						grind_spark_sword(user)
					else
						grind_spark(user)

			if(locate(/obj/item) in get_turf(src))
				ground_spark(src)
			return
	. = ..()
