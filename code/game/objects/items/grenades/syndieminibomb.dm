/obj/item/ammo_casing/caseless/rogue/fragment
	name = "fragment"
	desc = ""
	projectile_type = /obj/projectile/bullet/reusable/arrow
	caliber = "fragment"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "fragment"
	force = 20
	dropshrink = 0.6
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust)
	max_integrity = 20

/obj/projectile/bullet/reusable/fragment
	name = "fragment"
	damage = 40
	damage_type = BRUTE
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "musketball_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/fragment
	range = 30
	hitsound = 'sound/combat/hits/hi_arrow2.ogg'
	embedchance = 75
	woundclass = BCLASS_STAB
	flag = "bullet"
	armor_penetration = 45
	speed = 0.1

/obj/item/ammo_casing/caseless/rogue/fragment/New()
	icon_state = pick("frag1","frag2","frag3")
	..()

/obj/item/grenade/syndieminibomb
	desc = ""
	name = "syndicate minibomb"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "syndicate"
	item_state = "flashbang"
	var/deliveryamt = 1 // amount of type to deliver
	var/spawner_type = null

/obj/item/grenade/syndieminibomb/prime()
	update_mob()
	explosion(src.loc,1,2,4,flame_range = 2)
	qdel(src)

/obj/item/grenade/syndieminibomb/concussion
	name = "HE Grenade"
	desc = ""
	icon_state = "concussion"

/obj/item/grenade/syndieminibomb/concussion/prime()
	update_mob()
	explosion(src.loc,0,2,3,flame_range = 3)
	qdel(src)

/obj/item/grenade/syndieminibomb/concussion/frag
	name = "frag grenade"
	desc = ""
	icon_state = "frag"

/obj/item/grenade/gluon
	desc = ""
	name = "gluon frag grenade"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "bluefrag"
	item_state = "flashbang"
	var/freeze_range = 4
	var/rad_damage = 350
	var/stamina_damage = 30

/obj/item/grenade/gluon/prime()
	update_mob()
	playsound(loc, 'sound/blank.ogg', 50, TRUE)
	radiation_pulse(src, rad_damage)
	for(var/turf/T in view(freeze_range,loc))
		if(isfloorturf(T))
			var/turf/open/floor/F = T
			F.MakeSlippery(TURF_WET_PERMAFROST, 6 MINUTES)
			for(var/mob/living/carbon/L in T)
				L.adjustStaminaLoss(stamina_damage)
				L.adjust_bodytemperature(-230)
	qdel(src)

/obj/item/grenade/syndieminibomb/frag
	desc = "Igniter with pin, casing, and explosive insides. What else do you need for a good gift?"
	name = "Fragmentation grenade"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "frag"
	item_state = "flashbang"
	deliveryamt = 30 // amount of type to deliver
	spawner_type = /obj/item/ammo_casing/caseless/rogue/fragment

	prime()													// Prime now just handles the two loops that query for people in lockers and people who can see it.
		explosion(src.loc,0,0,3,0)
		if(spawner_type && deliveryamt)
			var/turf/T = get_turf(src)
			var/list/turfs = circleview(T, 4)
			for(var/i=1, i<=deliveryamt, i++)
				var/atom/movable/x = new spawner_type
				x.loc = T
				for(var/j = 1, j <= rand(3, 6), j++)
					var/atom/TARGET
					var/turf/TUR = pick(turfs)
					TARGET = TUR
					for(var/mob/living/carbon/human/H in oview(4,T))
						if(prob(75))
							TARGET = H
					x.throw_at(TARGET, 4,10)
		qdel(src)
		return
