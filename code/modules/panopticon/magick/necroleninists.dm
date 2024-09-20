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

/obj/effect/rune/panopticon/lenin_summon/OnCrafted(dirin, mob/living/carbon/human/user)
	. = ..()
	var/obj/item/bodypart/chest/M
	user.emote("agony")
	user.adjustBruteLoss(20)
	M.add_wound(/datum/wound/cut, skipcheck = FALSE)
	user.visible_message("<span class='warning'>[user] cuts the [M] for ritual.</span>")

/obj/effect/rune/panopticon/lenin_summon/invoke(var/list/invokers)
	to_chat(invokers, "<span class='danger'>YOU HAVE MADE IT.</span>")
	priority_announce("Something imperishable is coming!", "Old-World Announcer", 'sound/misc/necrolenin_alert.ogg', "Captain")
	leninalive = TRUE
	qdel(src)

/obj/effect/proc_holder/spell/targeted/touch/necroleninistrevive
	name = "Revive"
	overlay_state = "Revive"
	desc = ""
	hand_path = /obj/item/melee/touch_attack/revive
	charge_max = 600
	clothes_req = FALSE

/datum/crafting_recipe/roguetown/leninstmagick
	always_availible = FALSE
	skillcraft = /datum/skill/magic/blood

/datum/crafting_recipe/roguetown/leninstmagick/first
	name = "first wonder"
	result = /obj/structure/wonder
	tools = (/obj/item/rogueweapon/sickle)
	reqs = list(
		/obj/item/bodypart = 2,
		/obj/item/organ/eyes = 1,
		/obj/item/organ/lungs = 1
	)

/datum/crafting_recipe/roguetown/leninstmagick/reviverunesickle
	name = "LENIN REVIVE RUNE (BY USING SICKLE)"
	result = /obj/effect/rune/panopticon/lenin_summon
	tools = (/obj/item/rogueweapon/sickle)
	craftdiff = 4

/datum/crafting_recipe/roguetown/leninstmagick/reviveruneknife
	name = "LENIN REVIVE RUNE (BY USING KNIFE)"
	result = /obj/effect/rune/panopticon/lenin_summon
	tools = (/obj/item/panopticonweapon/knife)
	craftdiff = 4

//Wonder structure
/obj/structure/wonder
	name = "wonder"
	desc = "What a disgusting thing, what type of maniac would make this!?"
	icon = 'icons/roguetown/maniac/creations.dmi'
	icon_state = "creation1"
	resistance_flags = INDESTRUCTIBLE
	density = TRUE
	anchored = TRUE
	
/obj/structure/wonder/Initialize()
	. = ..()
	icon_state = pick("creation1", "creation2", "creation3", "creation4")

/obj/structure/wonder/OnCrafted(dirin, mob/living/carbon/human/user)
	. = ..()
	var/obj/item/bodypart/chest/M
	user.emote("agony")
	user.adjustBruteLoss(10)
	M.add_wound(/datum/wound/stab, skipcheck = FALSE)

/obj/structure/panopticon/automat/meatgrind
	name = "man-eater"
	desc = "MEAT MEAT MEAT"
	icon = 'icons/panopticon/obj/indoorsen.dmi'
	icon_state = "human_eater"
	density = FALSE
	anchored = TRUE
	can_buckle = TRUE
	buckle_lying = 0
	destroy_sound = 'sound/foley/breaksound.ogg'
	break_sound = 'sound/foley/machinebreak.ogg'
	anchored = TRUE
	var/datum/looping_sound/deus/soundloop
	max_integrity = 0

/obj/structure/panopticon/automat/meatgrind/Initialize()
	soundloop = new(list(src), FALSE)
	soundloop.start()
	. = ..()

/obj/structure/panopticon/automat/meatgrind/post_buckle_mob(mob/living/M)
	if(has_buckled_mobs())
		if(buckled_mobs.len < 2)
			new /obj/item/reagent_containers/food/snacks/meatcube(get_turf(M), 5)
			buckled_mobs[1].gib()
			playsound(get_turf(src), 'sound/panopticon/badmood2.ogg', 50, FALSE, FALSE)
