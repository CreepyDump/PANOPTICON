/obj/item/clothing/shoes/panopticon
	name = "old shoes"
	icon = 'icons/panopticon/obj/clothes/boots.dmi'
	mob_overlay_icon = 'icons/panopticon/obj/clothes/onmob/boots.dmi'
	desc = "A pair of ugly shoes."
	icon_state = "civilian"
	item_state = "civilian"
	gender = PLURAL
	slot_flags = ITEM_SLOT_SHOES
	body_parts_covered = FEET
	sleeved = 'icons/panopticon/obj/clothes/onmob/boots.dmi'
	sleevetype = "leg"
	bloody_icon_state = "shoeblood"

/obj/item/clothing/shoes/panopticon/jackboots
	name = "workboots"
	icon_state = "jackboots"
	item_state = "jackboots"
	sleevetype = "leg"
	bloody_icon_state = "shoeblood"
	equip_delay_self = 30
	resistance_flags = FIRE_PROOF

/obj/item/clothing/shoes/panopticon/zekboots
	name = "Wool boots"
	icon_state = "wool_shit"
	item_state = "wool_shit"
	sleevetype = "leg"
	bloody_icon_state = "shoeblood"
	resistance_flags = FREEZE_PROOF

/obj/item/clothing/shoes/panopticon/bastardo
	name = "Police boots"
	icon_state = "bastard"
	item_state = "bastard"
	bloody_icon_state = "shoeblood"
	resistance_flags = FREEZE_PROOF | FIRE_PROOF
