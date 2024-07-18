var/leninalive = FALSE

/obj/effect/rune/panopticon
	cultist_name = "Rune"
	icon = 'icons/panopticon/obj/mirkwood.dmi'

/obj/effect/rune/panopticon/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	if(!user.job == "Necroleninist")
		return
	var/list/invokers = can_invoke(user)
	if(invokers.len >= req_cultists)
		invoke(invokers)
	else
		to_chat(user, "<span class='danger'>I need [req_cultists - invokers.len] more adjacent cultists to use this rune in such a manner.</span>")
		fail_invoke()

/obj/effect/rune/panopticon/lenin_summon
	cultist_name = "Rune Of The Returner"
	icon_state = "rune1"
	invocation = "Ленин жил, Ленин жив, Ленин будет жить!"
	req_cultists = 4
	invoke_damage = 0.5
	rune_in_use = FALSE

/obj/effect/rune/panopticon/lenin_summon/invoke(var/list/invokers)
	to_chat(invokers, "<span class='danger'>YOU HAVE MADE IT.</span>")
	priority_announce("Something imperishable is coming!", "Old-World Announcer", 'sound/misc/necrolenin_alert.ogg', "Captain")
	leninalive = TRUE
	qdel(src)

/obj/effect/rune/panopticon/sacrifice
	cultist_name = "Offer"
	cultist_desc = ""
	req_cultists_text = "2 for conversion, 3 for living sacrifices and sacrifice targets."
	invocation = "Mah'weyh pleggh at e'ntrath!"
	icon_state = "rune2"
	color = RUNE_COLOR_OFFER
	req_cultists = 1
	rune_in_use = FALSE

/obj/effect/rune/panopticon/sacrifice/do_invoke_glow()
	return

/obj/effect/rune/panopticon/sacrifice/invoke(var/list/invokers)
	if(rune_in_use)
		return
	var/mob/living/L
	var/list/in_range = range(1, L)
	rune_in_use = TRUE
	visible_message("<span class='warning'>[src] pulses blood red!</span>")
	var/oldcolor = color
	color = RUNE_COLOR_DARKRED
	if(src in range (in_range))
		L.gib()
	animate(src, color = oldcolor, time = 5)
	addtimer(CALLBACK(src, /atom/proc/update_atom_colour), 5)
	rune_in_use = FALSE

/obj/effect/proc_holder/spell/targeted/touch/necroleninistrevive
	name = "Revive"
	overlay_state = "Revive"
	desc = ""
	hand_path = /obj/item/melee/touch_attack/revive
	charge_max = 600
	clothes_req = FALSE

/obj/effect/proc_holder/spell/self/leninrunes
	name = "Draw a Rune"
	overlay_state = "lenin"
	antimagic_allowed = TRUE
	charge_max = 600

/obj/effect/proc_holder/spell/self/leninrunes/cast(list/targets,mob/user = usr)
	..()
	var/list/possible_spells = list()
	var/pickrune = input(user, "Pick a rune to draw") as null|anything in possible_spells
	if(!pickrune)
		return FALSE
	if(pickrune == "Rune Of The Returner")
		addtimer(CALLBACK(GLOBAL_PROC, .proc/hudFix, user), 12)
		new /obj/effect/rune/panopticon/lenin_summon(src)
