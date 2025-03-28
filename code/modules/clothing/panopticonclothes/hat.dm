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
	name = "Straf-Helm"
	desc = "A helmet worn primarily by the exiled battalion troops, or by those who succeeded in killin' those fuckers."
	icon_state = "shtrafbat"
	item_state = "shtrafbat"
	armor = list("blunt" = 50, "slash" = 65, "stab" = 50, "bullet" = 45, "laser" = 0, "energy" = 0, "bomb" = 46, "bio" = 15, "rad" = 0, "fire" = 45, "acid" = 0)
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
	armor = list("blunt" = 60, "bullet" = 45, "laser" = 0, "energy" = 0, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	flags_inv = HIDEEARS|HIDEHAIR|HIDEFACE|HIDEEYES|HIDENECK

/obj/item/clothing/head/panopticon/bandit
	name = "Strelok Mask"
	icon_state = "bandit"
	item_state = "bandit"
	dynamic_hair_suffix = ""
	flags_inv = HIDEEARS|HIDEHAIR|HIDEFACE|HIDENECK

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
	armor = list("blunt" = 60, "bullet" = 60, "laser" = 0, "energy" = 0, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 60, "acid" = 0)
	flags_inv = HIDEEARS|HIDEHAIR
/obj/item/clothing/head/panopticon/meshok
	name = "Fool bag"
	icon_state = "meshok"
	item_state = "meshok"

/obj/item/clothing/head/panopticon/keptyouwaitinghuh
	name = "Kir Adams headband"
	desc = " "
	icon_state = "snake"
	item_state = "snake"
	flags_inv = null
	block2add = FOV_BEHIND
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_MASK
	dynamic_hair_suffix = "+bigboss"
/obj/item/clothing/head/panopticon/shtrafbathelm/helek
	name = "Ofizieren-Helm"
	desc = "The helmet of an officer of Helek's holy army. If you have it in your hands, it means you've either killed a bastard or become one."
	icon_state = "helek"
	item_state = "helek"
	armor = list("blunt" = 60, "bullet" = 60, "laser" = 0, "energy" = 0, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 60, "acid" = 0)
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/head/panopticon/papakha
	name = "Papakha"
	desc = "Anarchia mama!"
	icon = 'icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/head.dmi'
	icon_state = "papakha"
	item_state = "papakha"
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/head/panopticon/santa
	name = "Winter-festal hat"
	desc = "Merry Krauxmas!"
	icon_state = "santahat"
	item_state = "santahat"
	flags_inv = HIDEEARS|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/head/panopticon/huliganka
	name = "Hooliganka"
	icon_state = "huliganka"
	item_state = "huliganka"
	flags_inv = HIDEEARS|HIDEHAIR
