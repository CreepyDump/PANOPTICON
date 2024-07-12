/mob
	var/bladder = 0
	var/bowels = 0

//#####DECALS#####
/obj/effect/decal/cleanable/poo
	name = "shit"
	desc = "This fucking awful."
	icon = 'icons/effects/blood.dmi'
	icon_state = "floor1"
	random_icon_states = list("poosplat1", "poosplat2", "poosplat3", "poosplat4", "poosplat5", "poosplat6", "poosplat7", "poosplat8")
	blood_state = BLOOD_STATE_SHIT

/obj/effect/decal/cleanable/poo/Initialize()
	. = ..()
	icon_state = pick(src.random_icon_states)
	create_reagents(5)
	reagents.add_reagent(/datum/reagent/poo,5)
	for(var/obj/effect/decal/cleanable/poo/shit in src.loc)
		if(shit != src)
			qdel(shit)


/obj/effect/decal/cleanable/poo/tracks
	icon_state = "tracks"
	random_icon_states = null

/obj/effect/decal/cleanable/urine
	name = "urine stain"
	desc = "Someone couldn't hold it.."
	density = 0
	anchored = 1
	layer = 2
	icon = 'icons/effects/blood.dmi'
	icon_state = "pee1"
	random_icon_states = list("pee1", "pee2", "pee3")

/obj/effect/decal/cleanable/urine/Initialize()
	. = ..()
	create_reagents(5)
	icon_state = pick(random_icon_states)
	reagents.add_reagent(/datum/reagent/urine,5)
	for(var/obj/effect/decal/cleanable/urine/piss in src.loc)
		if(piss != src)
			qdel(piss)

//#####REAGENTS#####

//SHIT
/datum/reagent/poo
	name = "Shit"
	description = "It's poo."
	reagent_state = LIQUID
	color = "#643200"
	taste_description = "literal shit"

/datum/reagent/poo/on_mob_life(mob/living/carbon/M)
	if(!HAS_TRAIT(M, RTRAIT_NOSTINK))
		M.adjustToxLoss(1)
		M.add_nausea(100)

/datum/reagent/poo/reaction_turf(var/turf/T)
	if(isturf(T))
		new /obj/effect/decal/cleanable/poo(T)

//URINE
/datum/reagent/urine
	name = "urine"
	description = "It's pee."
	reagent_state = LIQUID
	color = COLOR_YELLOW
	taste_description = "urine"

/datum/reagent/urine/reaction_turf(var/turf/T)
	if(isturf(T))
		new /obj/effect/decal/cleanable/urine(T)


/obj/item/reagent_containers/food/snacks/poo
	name = "Excrement"
	desc = "Dinner is ready."
	icon = 'icons/panopticon/items/consumable.dmi'
	icon_state = "poo1"
	list_reagents = list(/datum/reagent/poo, 10)
	bitesize = 3

/obj/item/reagent_containers/food/snacks/poo/New()
	..()
	icon_state = pick("poo1", "poo2", "poo3", "poo4")

/obj/item/reagent_containers/food/snacks/poo/throw_impact(atom/hit_atom)
	var/turf/T = src.loc
	if(isturf(T))
		new /obj/effect/decal/cleanable/poo(T)
	qdel(src)
//shit and piss code
/mob/living/carbon/human/proc/handle_excrement()
	if(bowels <= 0)
		bowels = 0
	if(bladder <= 0)
		bladder = 0

	if(bowels >= 250)
		switch(bowels)
			if(250 to 400)
				if(prob(5))
					to_chat(src, "<span class='notice'>You need to use the bathroom.</span>")
					bowels += 15
			if(400 to 450)
				if(prob(5))
					to_chat(src, "<span class='danger'>You really need to use the restroom!</span>")
					bowels += 15
			if(450 to 500)
				if(prob(2))
					defecate()
				else if(prob(10))
					to_chat(src, "<span class='phobia'>You're about to shit yourself!</span>")
					bowels += 25
			if(500 to 550)
				if(prob(15))
					defecate()
				else if(prob(30))
					to_chat(src, "<span class='phobia'>OH MY GOD YOU HAVE TO SHIT!</span>")
					bowels += 35
			if(550 to INFINITY)
				defecate()

	if(bladder >= 100)//Your bladder is smaller than your colon
		switch(bladder)
			if(100 to 250)
				if(prob(5))
					to_chat(src, "<span class='notice'>You need to use the bathroom.</span>")
					bladder += 15
			if(250 to 400)
				if(prob(5))
					to_chat(src, "<span class='danger'>You really need to use the restroom!</span>")
					bladder += 15
			if(400 to 500)
				if(prob(2))
					urinate()
				else if(prob(10))
					to_chat(src, "<span class='phobia'>You're about to piss yourself!</span>")
					bladder += 25
			if(500 to 550)
				if(prob(15))
					urinate()
				else if(prob(30))
					to_chat(src, "<span class='phobia'>OH MY GOD YOU HAVE TO PEE!</span>")
					bladder += 35
			if(550 to INFINITY)
				urinate()

/mob/living/carbon/human/proc/defecate(intentional = FALSE)
	if(src.bowels < 30)
		if(intentional)
			to_chat(src,"<span class='notice'>I don't need to shit.</span>")
		return
	if (src.bowels >= 30)

		//Poo in the loo.
		var/obj/structure/toilet/T = locate() in src.loc
		var/mob/living/M = locate() in src.loc
		if(T && T.open)
			M.visible_message("<span class='shiten'>[src] defecates into \the [T].</span>", "<span class='notice'>I shit into \the [T].</span>")

		else if(wear_pants)
			M.visible_message("<span class='shiten'>[src] shit \his pants!</span>", "<span class='shiten'>I shat my pants...</shiten>")
			reagents.add_reagent(/datum/reagent/poo, 10)

		//Poo on the face.
		else if(M != src && M.lying)//Can only shit on them if they're lying down.
			M.visible_message("<span class='shiten'><b>[src]</b> shits right on <b>[M]</b>'s face!</span>")
			M.reagents.add_reagent(/datum/reagent/poo, 10)

		//Poo on the floor.
		else
			M.visible_message("<span class='shiten'>[src] craps.</span>")
			var/obj/item/reagent_containers/food/snacks/poo/V = new/obj/item/reagent_containers/food/snacks/poo(src.loc)
			if(reagents)
				reagents.trans_to(V, rand(1,5))

		playsound(get_turf(src), 'sound/misc/poo2.ogg', 80)
		bowels -= rand(60,80)

/mob/living/carbon/human/proc/urinate(intentional = FALSE)
	if(bladder < 30)
		if(intentional)
			to_chat(src, "<span class='notice'>I don't need to piss.</span>")
		return

	var/obj/structure/urinal/U = locate() in src.loc
	var/obj/structure/toilet/T = locate() in src.loc
	var/obj/structure/sink/S = locate() in src.loc
	var/obj/item/reagent_containers/RC = locate() in src.loc
	var/mob/living/M = locate() in src.loc
	if(bladder >= 30)	
		if((U || S) && gender != FEMALE)//In the urinal or sink.
			M.visible_message("<span class='pissen'>[src] urinates into [U ? U : S].</span>")
			reagents.remove_any(rand(1,8))

		else if(T && T.open)//In the toilet.
			M.visible_message("<B>[src]</B> urinates into [T].")
			reagents.remove_any(rand(1,8))

		else if(RC && (istype(RC,/obj/item/reagent_containers/food/drinks || istype(RC,/obj/item/reagent_containers/glass))))
			if(RC.is_open_container())
				//Inside a beaker, glass, drink, etc.
				M.visible_message("<span class='pissen'>[src] urinates into [RC].</span>")
				var/amount = rand(1,8)
				RC.reagents.add_reagent(/datum/reagent/urine, amount)
				if(reagents)
					reagents.trans_to(RC, amount)

		else if(wear_pants)//In your pants.
			M.visible_message("<span class='pissen'>[src] pisses \his pants.</span>")
			var/obj/effect/decal/cleanable/urine/D = new/obj/effect/decal/cleanable/urine(src.loc)
			if(reagents)
				reagents.trans_to(D, rand(1,8))


		else//On the floor.
			var/turf/TT = src.loc
			var/obj/effect/decal/cleanable/urine/D = new/obj/effect/decal/cleanable/urine(src.loc)
			if(reagents)
				reagents.trans_to(D, rand(1,8))
			if(TT)//In case it's somehow not there.
				M.visible_message("<span class='pissen'>[src] pisses on the [TT.name].</span>")

		bladder -= rand(25,50)
		playsound(get_turf(src), 'sound/misc/pee.ogg', 60)

/mob/living/carbon/human/verb/shit()
	set category = "Filth"
	set name = "shit"

	defecate(TRUE)

/mob/living/carbon/human/verb/piss()
	set category = "Filth"
	set name = "piss"

	urinate(TRUE)
