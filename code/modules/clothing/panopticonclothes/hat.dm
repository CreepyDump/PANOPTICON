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

/obj/item/clothing/head/panopticon/hijab
	name = "Hijab"
	desc = "One of the recognizable symbols of Jidat culture. It is worn by women of sultans or wife-beaters."
	icon_state = "hijab"
	item_state = "hijab"
	dynamic_hair_suffix = ""
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	block2add = FOV_BEHIND

/obj/item/clothing/head/panopticon/hijab/black
	color = CLOTHING_BLACK

/obj/item/clothing/head/panopticon/hijab/yellow
	color = CLOTHING_BLUE

/obj/item/clothing/head/panopticon/hijab/green
	color = CLOTHING_GREEN

/obj/item/clothing/head/panopticon/jeremyden
	name = "Old hunter hat"
	icon_state = "jeremyhat"
	item_state = "jeremyhat"
	dynamic_hair_suffix = ""
	flags_inv = HIDEEARS|HIDEHAIR|HIDEEYES
	block2add = FOV_BEHIND

/obj/item/clothing/head/panopticon/shtrafbathelm
	name = "Strafbat-Helm"
	desc = "A helmet worn primarily by the exiled battalion troops, or by those who succeeded in killin' those fuckers."
	icon_state = "shtrafbat"
	item_state = "shtrafbat"
	armor = list("melee" = 60, "bullet" = 60, "laser" = 0, "energy" = 0, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 60, "acid" = 0)
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/head/panopticon/vargcap
	name = "Folker Cap"
	icon_state = "varg"
	item_state = "varg"
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/head/panopticon/mayor
	name = "Major's furajka"
	desc = ""
	icon_state = "mayor"
	item_state = "mayor"
	flags_inv = HIDEEARS

/obj/item/clothing/head/panopticon/nkvd
	name = "NKVD Cap"
	desc = ""
	icon_state = "nkvd"
	item_state = "nkvd"
	flags_inv = HIDEEARS

/obj/item/clothing/head/panopticon/furajka
	name = "Sailor Cap"
	desc = ""
	icon_state = "furajka"
	item_state = "furajka"
	flags_inv = HIDEEARS

/obj/item/clothing/head/panopticon/holycap
	name = "Helek officer-cap"
	desc = ""
	icon_state = "holycap"
	item_state = "holycap"
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/head/panopticon/grandnecroleninist
	name = "Grand-Necroleninist hood"
	desc = ""
	icon_state = "grand"
	item_state = "grand"
	mob_overlay_icon = 'icons/panopticon/obj/clothes/onmob/64x64.dmi'
	worn_x_dimension = 64
	worn_y_dimension = 64
	flags_inv = HIDEEARS|HIDEHAIR|HIDEFACE|HIDEEYES

/obj/item/clothing/head/panopticon/platok
	name = "Babushka bandana"
	icon_state = "platok"
	item_state = "platok"
	flags_inv = HIDEEARS|HIDEHAIR


/obj/item/clothing/head/panopticon/cannibal
	name = "Cannibal helmet"
	desc = "A helmet worn primarily by the exiled battalion troops, or by those who succeeded in killin' those fuckers."
	icon_state = "cannibal"
	item_state = "cannibal"
	mob_overlay_icon = 'icons/panopticon/obj/clothes/onmob/64x64.dmi'
	worn_x_dimension = 64
	worn_y_dimension = 64
	armor = list("melee" = 60, "bullet" = 45, "laser" = 0, "energy" = 0, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	flags_inv = HIDEEARS|HIDEHAIR|HIDEFACE|HIDEEYES|HIDENECK

/obj/item/clothing/head/panopticon/creep
	name = "Creep Mask"
	desc = "A typical robber's mask made as a weird monkey's head."
	icon_state = "creep"
	item_state = "creep"
	flags_inv = HIDEEARS|HIDEHAIR|HIDEFACE|HIDEEYES|HIDENECK

/obj/item/clothing/head/panopticon/grey
	name = "Iron helmet"
	icon_state = "iron_helm3"
	item_state = "iron_helm3"
	armor = list("melee" = 60, "bullet" = 60, "laser" = 0, "energy" = 0, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 60, "acid" = 0)
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/head/panopticon/meshok
	name = "Fool bag"
	icon_state = "meshok"
	item_state = "meshok"
	dynamic_hair_suffix = ""
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	block2add = FOV_BEHIND|FOV_RIGHT|FOV_LEFT
	equip_delay_other = 30
