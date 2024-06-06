/obj/item/clothing/head/panopticon
	name = "hat"
	desc = ""
	icon = 'icons/panopticon/obj/clothes/head.dmi'
	mob_overlay_icon = 'icons/panopticon/obj/clothes/onmob/head.dmi'
	body_parts_covered = HEAD|HAIR
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	dynamic_hair_suffix = "+generic"
	bloody_icon_state = "helmetblood"
	experimental_onhip = TRUE


/obj/item/clothing/head/panopticon/equipped(mob/user, slot)
	. = ..()
	user.update_fov_angles()

/obj/item/clothing/head/panopticon/dropped(mob/user)
	. = ..()
	user.update_fov_angles()

/obj/item/clothing/head/panopticon/bomjara
	name = "Slug hood"
	icon_state = "bomjhead"
	item_state = "bomjhead"
	dynamic_hair_suffix = ""
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	block2add = FOV_BEHIND|FOV_RIGHT|FOV_LEFT

/obj/item/clothing/head/panopticon/jeremyden
	name = "Old hunter hat"
	icon_state = "jeremyhat"
	item_state = "jeremyhat"
	dynamic_hair_suffix = ""
	flags_inv = HIDEEARS|HIDEHAIR|HIDEEYES
	block2add = FOV_BEHIND

/obj/item/clothing/head/panopticon/govnar
	name = "Fool bag"
	icon_state = "govnar"
	item_state = "govnar"
	dynamic_hair_suffix = ""
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDEEYES
	block2add = FOV_BEHIND|FOV_RIGHT|FOV_LEFT
	equip_delay_other = 30

/obj/item/clothing/head/panopticon/shtrafbathelm
	name = "Strafbat-Helm"
	desc = "A helmet worn primarily by the exiled battalion troops, or by those who succeeded in killin' those fuckers."
	icon_state = "shtrafbat"
	item_state = "shtrafbat"
	flags_inv = HIDEEARS|HIDEHAIR
