/obj/item/clothing/mask/gas/panopticon
	name = "old-imperia mask"
	desc = "Hopefully the filters on this thing still works."
	icon = 'icons/panopticon/obj/clothes/head.dmi'
	mob_overlay_icon = 'icons/panopticon/obj/clothes/onmob/head.dmi'
	flags_inv = HIDEEARS|HIDEHAIR|HIDEEYES|HIDEFACE|HIDENECK|HIDEFACIALHAIR
	icon_state = "gasmaske"
	item_state = "gasmaske"
	slot_flags = ITEM_SLOT_MASK
	equip_delay_self = 30

/obj/item/clothing/mask/gas/panopticon/zelinskiy
	name = "Major gas mask"
	desc = "Despite the fact that it is an old model gas mask, it is made high quality and compact."
	icon = 'icons/panopticon/obj/clothes/masks.dmi'
	mob_overlay_icon = 'icons/panopticon/obj/clothes/onmob/mask.dmi'
	flags_inv = HIDEEYES|HIDEFACE|HIDEFACIALHAIR
	icon_state = "zelinskiy"
	item_state = "zelinskiy"
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP

/obj/item/clothing/mask/infected
	name = "sterile mask"
	desc = ""
	icon = 'icons/panopticon/obj/clothes/head.dmi'
	mob_overlay_icon = 'icons/mob/clothing/mask.dmi'
	icon_state = "sterile"
	item_state = "sterile"
	w_class = WEIGHT_CLASS_TINY
	slot_flags = ITEM_SLOT_MASK
	flags_inv = HIDEFACE
	flags_cover = MASKCOVERSMOUTH
	gas_transfer_coefficient = 0.9
	permeability_coefficient = 0.01
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 25, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/mask/pig
	name = "Pig mask"
	desc = "WEEEEK WEEEEEK!!"
	icon = 'icons/panopticon/obj/clothes/masks.dmi'
	mob_overlay_icon = 'icons/panopticon/obj/clothes/onmob/mask.dmi'
	flags_inv = HIDEEARS|HIDEHAIR|HIDEEYES|HIDEFACE|HIDENECK|HIDEFACIALHAIR
	icon_state = "pig"
	item_state = "pig"
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HEAD
