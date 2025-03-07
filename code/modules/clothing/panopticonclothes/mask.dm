/obj/item/clothing/mask/gas/panopticon
	name = "Major gas mask"
	desc = "Despite the fact that it is an old model gas mask, it is made high quality and compact."
	icon = 'icons/panopticon/obj/clothes/masks.dmi'
	mob_overlay_icon = 'icons/panopticon/obj/clothes/onmob/mask.dmi'
	flags_inv = HIDEEYES|HIDEFACE|HIDEFACIALHAIR
	icon_state = "zelinskiy"
	item_state = "zelinskiy"
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP
	equip_delay_self = 30
	experimental_onhip = TRUE

/obj/item/clothing/neck/panopticon/govnar
	name = "Strafbat Balaclava"
	icon = 'icons/panopticon/obj/clothes/head.dmi'
	mob_overlay_icon = 'icons/panopticon/obj/clothes/onmob/head.dmi'	
	icon_state = "govnar"
	item_state = "govnar"
	dynamic_hair_suffix = null
	dynamic_fhair_suffix = null
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	block2add = FOV_BEHIND
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HIP|ITEM_SLOT_MASK
	body_parts_covered = NECK|HAIR|EARS|HEAD|FACE
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE

/obj/item/clothing/neck/panopticon/govnar/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "[initial(icon_state)]_t"
			flags_inv = HIDEEARS|HIDEHAIR
			body_parts_covered = NECK|HAIR|EARS
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_neck()
				dynamic_fhair_suffix = "+generic"
				H.update_inv_head()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_neck()
					H.update_inv_head()
					dynamic_fhair_suffix = null

/obj/item/clothing/mask/gas/panopticon/greys
	name = "old-imperia mask"
	desc = "Hopefully the filters on this thing still works."
	icon = 'icons/panopticon/obj/clothes/head.dmi'
	mob_overlay_icon = 'icons/panopticon/obj/clothes/onmob/head.dmi'
	flags_inv = HIDEEARS|HIDEHAIR|HIDEEYES|HIDEFACE|HIDENECK|HIDEFACIALHAIR
	icon_state = "gasmaske"
	item_state = "gasmaske"

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
	armor = list("blunt" = 0, "slash" = 0, "stab" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 25, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/mask/pig
	name = "Pig mask"
	desc = "WEEEEK WEEEEEK!!"
	icon = 'icons/panopticon/obj/clothes/masks.dmi'
	mob_overlay_icon = 'icons/panopticon/obj/clothes/onmob/mask.dmi'
	flags_inv = HIDEEARS|HIDEHAIR|HIDEEYES|HIDEFACE|HIDENECK|HIDEFACIALHAIR
	icon_state = "pig"
	item_state = "pig"
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HEAD

/obj/item/clothing/mask/carnaval
	name = "Gourmet-Club official mask"
	desc = "Made with the expensive fabric and smells like dead children."
	icon = 'icons/panopticon/obj/clothes/masks.dmi'
	mob_overlay_icon = 'icons/panopticon/obj/clothes/onmob/mask.dmi'
	flags_inv = HIDEEYES|HIDEFACE
	icon_state = "gourmet_man"
	item_state = "gourmet_man"
	slot_flags = ITEM_SLOT_MASK

/obj/item/clothing/mask/carnaval/female
	icon_state = "gourmet_fem"
	item_state = "gourmet_fem"

/obj/item/clothing/mask/coolio
	name = "Thug sunglasses"
	icon = 'icons/panopticon/obj/clothes/masks.dmi'
	mob_overlay_icon = 'icons/panopticon/obj/clothes/onmob/mask.dmi'	
	flash_protect = FLASH_PROTECTION_FLASH
	icon_state = "cool"
	item_state = "cool"
	tint = 1
	dynamic_hair_suffix = null
	dynamic_fhair_suffix = null
	flags_inv = HIDEEYES
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HEAD
	body_parts_covered = EYES

/obj/item/clothing/neck/panopticon/nightvision
	name = "iron mask"
	icon_state = "nv-mask"
	item_state = "nv-mask"
	max_integrity = 100
	blocksound = PLATEHIT
	icon = 'icons/panopticon/obj/clothes/masks.dmi'
	mob_overlay_icon = 'icons/panopticon/obj/clothes/onmob/mask.dmi'	
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	resistance_flags = FIRE_PROOF
	armor = list("blunt" = 100, "bullet" = 25, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 25, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	flags_inv = HIDEFACE
	body_parts_covered = FACE
	block2add = FOV_BEHIND

/obj/item/clothing/neck/panopticon/nightvision/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)

/obj/item/clothing/neck/panopticon/nightvision/equipped(mob/living/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_MASK)
		user.apply_status_effect(/datum/status_effect/lobotomized)

/obj/item/clothing/neck/panopticon/nightvision/dropped(mob/living/carbon/human/user)
	. = ..()
	if(QDELETED(src))
		return
	qdel(src)
	user.remove_status_effect(/datum/status_effect/lobotomized)
