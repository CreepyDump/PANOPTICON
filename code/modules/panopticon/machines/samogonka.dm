/obj/structure/panopticon/automat/samogonapparat
	name = "\improper All-In-One Grinder"
	desc = ""
	icon = 'icons/panopticon/obj/samogon.dmi'
	icon_state = "samogon1"
	layer = BELOW_OBJ_LAYER
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
	drop_all_items()
	return ..()

/obj/structure/panopticon/automat/samogonapparat/contents_explosion(severity, target)
	if(beaker)
		beaker.ex_act(severity, target)

/obj/structure/panopticon/automat/samogonapparat/examine(mob/user)
	. = ..()
	if(!in_range(user, src) && !issilicon(user) && !isobserver(user))
		. += "<span class='warning'>You're too far away to examine [src]'s contents and display!</span>"
		return

	if(operating)
		. += "<span class='warning'>\The [src] is operating.</span>"
		return

	if(beaker || length(holdingitems))
		. += "<span class='notice'>\The [src] contains:</span>"
		if(beaker)
			. += "<span class='notice'>- \A [beaker].</span>"
		for(var/i in holdingitems)
			var/obj/item/O = i
			. += "<span class='notice'>- \A [O.name].</span>"

/obj/structure/panopticon/automat/samogonapparat/handle_atom_del(atom/A)
	. = ..()
	if(A == beaker)
		beaker = null
		update_icon()
	if(holdingitems[A])
		holdingitems -= A

/obj/structure/panopticon/automat/samogonapparat/proc/drop_all_items()
	for(var/i in holdingitems)
		var/atom/movable/AM = i
		AM.forceMove(drop_location())
	holdingitems = list()

/obj/structure/panopticon/automat/samogonapparat/update_icon()
	if(beaker)
		icon_state = "samogon1"
	else
		icon_state = "samogon0"

/obj/structure/panopticon/automat/samogonapparat/attackby(obj/item/I, mob/user, params)
	if (istype(I, /obj/item/reagent_containers) && !(I.item_flags & ABSTRACT) && I.is_open_container())
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

	if(INTENT_GRAB)
		for(var/i in holdingitems)
			var/obj/item/O = i
			O.forceMove(drop_location())
			holdingitems -= O

	if(user.transferItemToLoc(I, src))
		to_chat(user, "<span class='notice'>I add [I] to [src].</span>")
		holdingitems[I] = TRUE
		return FALSE

/obj/structure/panopticon/automat/samogonapparat/proc/remove_object(obj/item/O)
	holdingitems -= O
	qdel(O)
