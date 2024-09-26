/obj/item/clothing/armor/panopticon/cloak
	name = "Trench coat"
	icon = 'icons/panopticon/obj/clothes/armor.dmi'
	mob_overlay_icon = 'icons/panopticon/obj/clothes/onmob/armor.dmi'
	sleeved = 'icons/panopticon/obj/clothes/onmob/armor.dmi'
	sleevetype = "shirt"
	icon_state = "oldcoat"
	item_state = "oldcoat"
	gender = MALE
	body_parts_covered = ARMS|LEGS|CHEST|GROIN|VITALS
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK
	edelay_type = 1
	equip_delay_self = 10
	bloody_icon_state = "bodyblood"

/obj/item/clothing/armor/panopticon/cloak/grey
	name = "Major kitel"
	allowed_sex = list(MALE)
	icon_state = "greycoat"
	item_state = "greycoat"
	armor = list("blunt" = 45, "bullet" = 26, "laser" = 0,"energy" = 0, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/armor/panopticon/cloak/grey/hitman
	name = "Gendarme kitel"
	allowed_sex = list(MALE, FEMALE)
	icon = 'icons/panopticon/obj/clothes/cloak.dmi'
	mob_overlay_icon = 'icons/panopticon/obj/clothes/onmob/cloak.dmi'
	sleeved = 'icons/panopticon/obj/clothes/onmob/cloak.dmi'
	icon_state = "hitman"
	item_state = "hitman"
	armor = list("blunt" = 15, "slash" = 15, "stab" = 15, "bullet" = 5, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/armor/panopticon/cloak/holycloak
	name = "Helek officer-jacket"
	allowed_sex = list(MALE, FEMALE)
	icon = 'icons/panopticon/obj/clothes/cloak.dmi'
	mob_overlay_icon = 'icons/panopticon/obj/clothes/onmob/cloak.dmi'
	sleeved = 'icons/panopticon/obj/clothes/onmob/cloak.dmi'
	icon_state = "holy_cloak"
	item_state = "holy_cloak"
	armor = list("blunt" = 5, "slash" = 5, "stab" = 5, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 10, "acid" = 0)


/obj/item/clothing/armor/panopticon/cloak/brown
	name = "Brown coat"
	icon_state = "bosinn"
	item_state = "bosinn"

/obj/item/clothing/armor/panopticon
	name = "steel armor"
	icon = 'icons/panopticon/obj/clothes/armor.dmi'
	mob_overlay_icon = 'icons/panopticon/obj/clothes/onmob/armor.dmi'
	icon_state = "armor"
	item_state = "armor"
	gender = MALE
	body_parts_covered = CHEST|VITALS
	slot_flags = ITEM_SLOT_ARMOR
	edelay_type = 1
	equip_delay_self = 15
	bloody_icon_state = "bodyblood"
	armor = list("blunt" = 26, "bullet" = 45, "laser" = 0,"energy" = 0, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
