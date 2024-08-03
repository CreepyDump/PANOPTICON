/obj/item/storage/belt/rogue/panopticon
	name = "Policeman belt"
	icon = 'icons/panopticon/obj/clothes/storage.dmi'
	mob_overlay_icon = 'icons/panopticon/obj/clothes/onmob/cloak.dmi'
	icon_state = "greybelt"
	item_state = "greybelt"

/obj/item/storage/belt/rogue/panopticon/strafbat
	name = "Soldier webbing"
	icon_state = "razgruz"
	item_state = "razgruz"

/obj/item/storage/belt/rogue/panopticon/strafbat/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 21
		STR.max_w_class = WEIGHT_CLASS_NORMAL
		STR.max_items = 6

/obj/item/storage/belt/rogue/panopticon/strafbat/attack_right(mob/user)
	var/datum/component/storage/CP = GetComponent(/datum/component/storage)
	if(CP)
		CP.rmb_show(user)
		return TRUE

/obj/item/storage/belt/rogue/panopticon/mayor
	name = "Major belt"
	icon = 'icons/panopticon/obj/clothes/storage.dmi'
	mob_overlay_icon = 'icons/panopticon/obj/clothes/onmob/cloak.dmi'
	icon_state = "mayorbelt"
	item_state = "mayorbelt"
