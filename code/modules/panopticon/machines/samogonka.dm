/obj/structure/panopticon/automat/samogonapparat
	name = "Self-made distiller"
	desc = ""
	icon = 'icons/panopticon/obj/samogon.dmi'
	icon_state = "samogon1"
	layer = BELOW_OBJ_LAYER
	density = TRUE
	pass_flags = PASSTABLE
	resistance_flags = ACID_PROOF
	var/operating = FALSE
	var/obj/item/reagent_containers/beaker = null
	var/limit = 10
	var/speed = 1
	var/list/holdingitems

/obj/structure/panopticon/automat/samogonapparat/Initialize()
	. = ..()
	holdingitems = list()
	beaker = new /obj/item/reagent_containers/glass/beaker/jar(src)

/obj/structure/panopticon/automat/samogonapparat/Destroy()
	if(beaker)
		beaker.forceMove(drop_location())
	return ..()

	if(beaker || length(holdingitems))
		. += "<span class='notice'>\The [src] contains:</span>"
		if(beaker)
			. += "<span class='notice'>- \A [beaker].</span>"
		for(var/i in holdingitems)
			var/obj/item/O = i
			. += "<span class='notice'>- \A [O.name].</span>"

/obj/structure/panopticon/automat/samogonapparat/update_icon()
	if(beaker)
		icon_state = "samogon1"
	else
		icon_state = "samogon0"

/obj/structure/panopticon/automat/samogonapparat/attackby(obj/item/I, mob/user, params)
	if (istype(I, /obj/item/reagent_containers) && I.is_open_container())
		var/obj/item/reagent_containers/B = I
		. = TRUE //no afterattack
		if(!user.transferItemToLoc(B, src))
			return
		to_chat(user, "<span class='notice'>I add [B] to [src].</span>")
		update_icon()
		return TRUE //no afterattack

	if(holdingitems.len >= limit)
		to_chat(user, "<span class='warning'>[src] is filled to capacity!</span>")
		return TRUE

	if(user.transferItemToLoc(I, src))
		if(I.is_recipe_samogon)
			to_chat(user, "<span class='notice'>I add [I] to [src].</span>")
			holdingitems[I] = TRUE
			return FALSE
		else
			to_chat(user, "<span class='warning'>I can't put [I] to [src], that's would be so dumb!</span>")
			return TRUE
/obj/structure/panopticon/automat/samogonapparat/proc/remove_object(obj/item/O)
	holdingitems -= O
	qdel(O)

/obj/structure/panopticon/automat/samogonapparat/attack_hand(mob/user)
	. = ..()
	if(INTENT_GRAB)
		for(var/i in holdingitems)
			var/obj/item/O = i
			O.forceMove(drop_location())
			holdingitems -= O
