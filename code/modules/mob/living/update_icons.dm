/mob/living/regenerate_icons()
	if(notransform)
		return 1
	update_inv_hands()
	update_inv_handcuffed()
	update_inv_legcuffed()

/mob/living/update_fire(var/fire_icon = "Generic_mob_burning")
	QDEL_NULL(particles)
	remove_overlay(FIRE_LAYER)
	if(on_fire || islava(loc))
		var/mutable_appearance/new_fire_overlay = mutable_appearance('icons/mob/OnFire.dmi', fire_icon, -FIRE_LAYER)
		new_fire_overlay.appearance_flags = RESET_COLOR
		overlays_standing[FIRE_LAYER] = new_fire_overlay
		particles = new/particles/embers()
	apply_overlay(FIRE_LAYER)

/mob/living/proc/update_turflayer(input)
	return

/mob/living/update_turflayer(input)
	return
	remove_overlay(TURF_LAYER)

	if(input)
		var/mutable_appearance/new_fire_overlay = mutable_appearance('icons/turf/mob_overlay.dmi', input, -TURF_LAYER)
		new_fire_overlay.appearance_flags = RESET_COLOR
		overlays_standing[TURF_LAYER] = new_fire_overlay
	apply_overlay(TURF_LAYER)

/particles/embers
	icon = 'icons/effects/particles/generic.dmi'
	icon_state = list("dot"=4,"cross"=1,"curl"=1)
	width = 64
	height = 96
	count = 500
	spawning = 5
	lifespan = 3 SECONDS
	fade = 1 SECONDS
	color = 0
	color_change = 0.05
	gradient = list("#FF6A06", "#FF9B06", "#FF5106")
	position = generator("box", list(-16,-12,-32), list(16,32,32), NORMAL_RAND)
	drift = generator("vector", list(-0.1,0), list(0.1,0.2), UNIFORM_RAND)
	scale = generator("vector", list(0.5,0.5), list(2,2), NORMAL_RAND)
	spin = generator("num", list(-30,30), NORMAL_RAND)
