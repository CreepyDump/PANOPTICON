/obj/item/shrapnel // frag grenades
	name = "shrapnel shard"
	custom_materials = list(/datum/material/iron=50)
	armor_penetration = 4
	icon = 'icons/obj/shards.dmi'
	icon_state = "large"
	w_class = WEIGHT_CLASS_TINY
	item_flags = DROPDEL
	sharpness = IS_SHARP

/obj/item/shrapnel/stingball // stingbang grenades
	name = "stingball"
	icon_state = "tiny"
	sharpness = IS_BLUNT

/obj/item/shrapnel/bullet // bullets
	name = "bullet"
	icon = 'icons/obj/ammo.dmi'
	icon_state = "s-casing"

/obj/projectile/bullet/shrapnel
	name = "flying shrapnel shard"
	damage = 14
	range = 20
	armor_penetration = 1
	dismemberment = 5
	ricochets_max = 2
	ricochet_chance = 70
	shrapnel_type = /obj/item/shrapnel
	sharpness = IS_SHARP
	embedchance = 70

/obj/projectile/bullet/shrapnel/mega
	name = "flying shrapnel hunk"
	range = 45
	dismemberment = 15
	ricochets_max = 6
	ricochet_chance = 130
