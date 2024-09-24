/obj/item/flint
	name = "flint"
	icon_state = "flint"
	desc = ""
	gripped_intents = null
	//dropshrink = 0.75
	force = 0
	throwforce = 0
	slot_flags = ITEM_SLOT_HIP
	obj_flags = null
	icon = 'icons/roguetown/items/lighting.dmi'
	var/flintcd = 0

/obj/item/flint/attack_self(mob/living/user)
	if(world.time < flintcd + 10)
		return
	flintcd = world.time
	playsound(user, 'sound/items/flint.ogg', 100, FALSE)
	flick("flintstrike", src)
	if(prob(25))
		grind_spark(user)
	if(prob(5))
		user.flash_fullscreen("whiteflash")

/obj/item/flint/afterattack(atom/movable/A, mob/user, proximity)
	. = ..()
	if(!proximity)
		return
	if(world.time < flintcd + 10)
		return
	flintcd = world.time
	playsound(user, 'sound/items/flint.ogg', 100, FALSE)
	flick("flintstrike", src)
	if(prob(50))
		A.spark_act()
		user.flash_fullscreen("whiteflash")
