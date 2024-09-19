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
	name = "Grenade"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "stgnade"
	item_state = "stgnade"
	throwforce = 10
	throw_speed = 2
	throw_range = 6
//	shrapnel_type = /obj/projectile/bullet/shrapnel
//	shrapnel_radius = 3

/obj/item/grenade/syndieminibomb/frag/preprime(mob/user, delayoverride, msg = TRUE, volume = 70)
	. = ..()
	var/turf/T = get_turf(src)
	log_grenade(user, T) //Inbuilt admin procs already handle null users
	if(user)
		add_fingerprint(user)
		if(msg)
			to_chat(user, "<span class='warning'>I activate the [src]! [DisplayTimeText(det_time)]!</span>")
	playsound(src, 'sound/blank.ogg', volume, TRUE)
	icon_state = initial(icon_state) + "_active"
	active = TRUE
	addtimer(CALLBACK(src, .proc/prime), isnull(delayoverride)? det_time : delayoverride)

/*	spawner_type = /obj/item/ammo_casing/caseless/rogue/fragment
	var/spread_range = 7
	var/num_fragments = 30

	/obj/item/grenade/syndieminibomb/frag/prime()													// Prime now just handles the two loops that query for people in lockers and people who can see it.
		..()
		if (!ismob(loc))

			var/list/target_turfs = getcircle(T, spread_range)
			var/fragments_per_projectile = round(num_fragments/target_turfs.len)

			for (var/turf/TT in target_turfs)
				var/obj/item/ammo_casing/caseless/rogue/fragment/P = new spawner_type(T)
				P.pellets = fragments_per_projectile
				P.range = 5
				P.launch_fragment(TT)

				// any mob on the source turf, lying or not, absorbs 100% of shrapnel now
				for (var/mob/living/L in T)
					P.attack_mob(L, 0, 0)

		spawn (5)
			qdel(src)
*/
