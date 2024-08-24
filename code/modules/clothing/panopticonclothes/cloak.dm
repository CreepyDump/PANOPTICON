/obj/item/clothing/cloak/panopticon
	name = "cloak"
	icon = 'icons/panopticon/obj/clothes/cloak.dmi'
	mob_overlay_icon = 'icons/panopticon/obj/clothes/onmob/cloak.dmi'
	slot_flags = ITEM_SLOT_CLOAK
	desc = ""
	edelay_type = 1
	equip_delay_self = 10
	bloody_icon_state = "bodyblood"

/obj/item/clothing/cloak/panopticon/bomjaracoat
	name = "Slug coat"
	icon_state = "bomj"
	item_state = "bomj"
	alternate_worn_layer = TABARD_LAYER
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK

/obj/item/clothing/cloak/panopticon/necroleninist
	name = "necroleninist cloak"
	desc = ""
	icon_state = "commie"
	item_state = "commie"
	alternate_worn_layer = CLOAK_BEHIND_LAYER
	slot_flags = ITEM_SLOT_BACK_R|ITEM_SLOT_CLOAK
	boobed = TRUE
	sleeved = 'icons/panopticon/obj/clothes/onmob/cloak.dmi'
	sleevetype = "shirt"
	nodismemsleeves = TRUE
	inhand_mod = TRUE
	hoodtype = /obj/item/clothing/head/hooded/panopticon/necroleninist
	toggle_icon_state = FALSE

/obj/item/clothing/wash_act(clean)
	. = ..()
	if(hood)
		wash_atom(hood,clean)

/obj/item/clothing/cloak/panopticon/necroleninist/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/storage/concrete)
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 3
		STR.max_w_class = WEIGHT_CLASS_NORMAL
		STR.max_items = 1

/obj/item/clothing/cloak/panopticon/necroleninist/dropped(mob/living/carbon/human/user)
	..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		var/list/things = STR.contents()
		for(var/obj/item/I in things)
			STR.remove_from_storage(I, get_turf(src))

/obj/item/clothing/head/hooded/panopticon/necroleninist
	name = "necroleninist hood"
	desc = ""
	icon = 'icons/panopticon/obj/clothes/head.dmi'
	mob_overlay_icon = 'icons/panopticon/obj/clothes/onmob/head.dmi'
	icon_state = "commie"
	item_state = "commie"
	slot_flags = ITEM_SLOT_HEAD
	dynamic_hair_suffix = ""
	edelay_type = 1
	body_parts_covered = HEAD
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	block2add = FOV_BEHIND

/obj/item/clothing/head/hooded/panopticon/necroleninist/equipped(mob/user, slot)
	. = ..()
	user.update_fov_angles()

/obj/item/clothing/head/hooded/panopticon/necroleninist/dropped(mob/user)
	. = ..()
	user.update_fov_angles()


/obj/item/clothing/cloak/panopticon/nkvd
	name = "NKVD coat"
	icon_state = "nkvd"
	sleeved = 'icons/panopticon/obj/clothes/onmob/cloak.dmi'
	item_state = "nkvd"
	alternate_worn_layer = TABARD_LAYER
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	slot_flags = ITEM_SLOT_ARMOR


/obj/item/clothing/cloak/panopticon/grandnecroleninist
	name = "Grand-Necroleninist membrane"
	icon_state = "grand"
	sleeved = 'icons/panopticon/obj/clothes/onmob/cloak.dmi'
	item_state = "grand"
	alternate_worn_layer = TABARD_LAYER
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK

/obj/item/clothing/cloak/panopticon/douglas
	name = "Piss-camo cloak"
	icon_state = "douglas"
	sleeved = 'icons/panopticon/obj/clothes/onmob/cloak.dmi'
	item_state = "douglas"
	alternate_worn_layer = TABARD_LAYER
	body_parts_covered = CHEST|GROIN|ARMS
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK
