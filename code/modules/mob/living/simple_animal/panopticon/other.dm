/mob/living/simple_animal/hostile/retaliate/rogue/panopticon/skotolud
	icon = 'icons/panopticon/mob/npc.dmi'
	name = "Cattlehuman"
	desc = ""
	icon_state = "skot"
	icon_living = "skot"
	icon_dead = "skot_dead"
	gender = MALE
	mob_biotypes = MOB_ORGANIC|MOB_BEAST|MOB_HUMANOID
	emote_hear = list("mumbles.")
	speak_chance = 1
	turns_per_move = 5
	see_in_dark = 6
	move_to_delay = 8
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/human = 6,
						/obj/item/stack/sheet/animalhide/human =2)
	base_intents = list(/datum/intent/simple/headbutt)
	health = 80
	maxHealth = 80
	food_type = list(/obj/item/reagent_containers/food/snacks/seltshmack/fake, /obj/item/reagent_containers/food/snacks/seltshmack, /obj/item/reagent_containers/food/snacks/throbber)
	footstep_type = FOOTSTEP_MOB_SHOE
	pooptype = /obj/item/reagent_containers/food/snacks/poo
	faction = list("cows")
	attack_verb_continuous = "headbutts"
	attack_verb_simple = "headbutt"
	melee_damage_lower = 10
	melee_damage_upper = 25
	STASPD = 2
	STACON = 20
	STASTR = 12
	remains_type = /obj/effect/decal/remains/human

/mob/living/simple_animal/hostile/retaliate/rogue/panopticon/skotolud/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/mimic/c2780_v_attack.wav.ogg','sound/vo/mobs/mimic/c2780_v_attack1.wav.ogg','sound/vo/mobs/mimic/c2780_v_attack2.wav.ogg')
		if("pain")
			return pick('sound/vo/mobs/mimic/c2780_v_attack.wav.ogg','sound/vo/mobs/mimic/c2780_v_attack1.wav.ogg','sound/vo/mobs/mimic/c2780_v_attack2.wav.ogg')
		if("death")
			return pick('sound/vo/mobs/mimic/c2780_v_dead.wav.ogg')
		if("idle")
			return pick('sound/vo/mobs/mimic/c2780_v_attack.wav.ogg','sound/vo/mobs/mimic/c2780_v_attack1.wav.ogg','sound/vo/mobs/mimic/c2780_v_attack2.wav.ogg')

/obj/structure/panopticon/trader
	name = "Trader"
	desc = "THE SCREAM!"
	mouse_drag_pointer = MOUSE_INACTIVE_POINTER
	var/in_use = FALSE
	var/moneygave = 0
	var/moneyhas = 500
	icon = 'icons/panopticon/mob/npc.dmi'
	icon_state = "torgash"
	anchored = 1
	density = 1
	max_integrity = 9999999

/obj/structure/panopticon/trader/proc/speak(message)
	say()
	playsound(get_turf(src), 'sound/panopticon/dealer.ogg', 100 , FALSE, FALSE)

/obj/structure/panopticon/trader/attack_hand(mob/user)
	if(in_use == TRUE)
		return
	else
		in_use = TRUE
		speak(pick("Welcome-welcome..","Hello there!","Hope you gonna find something for yourself!"))
		var/whatineed = input("What do I want?", "") as text
		switch(whatineed)
			if("gun")
				speak("Alright.. Which one? Let me show you some.")
				var/choice = alert(user,"Trader shows you some guns that he have. Choose wisely.","Knuckleshot","Gusyev","Krasnikov")
				switch(choice)
					if("Knuckleshot")
						if(moneygave < 75)
							speak("Sorry, I can't give it for free!")
						else
							new /obj/item/gun/ballistic/automatic/pistol/knuckleshot(drop_location())
							moneygave -= 75
							moneyhas += 75
					if("Gusyev")
						if(moneygave < 150)
							speak("Sorry, I can't give it for free!")
						else
							new /obj/item/gun/ballistic/rifle/gusyevboltovka(drop_location())
							moneygave -= 150
							moneyhas += 150
					if("Krasnikov")
						if(moneygave < 300)
							speak("Sorry, I can't give it for free!")
						else
							new /obj/item/gun/ballistic/automatic/panopticon/krasnik(drop_location())
							moneygave -= 300
							moneyhas += 300
			if("drugs")
				speak("O-o-oh.. I got something very special for someone like you..")
				var/choice = alert(user,"Trader shows you some luxury items that he have. Choose wisely.","Heroin","Pervitin","LSD")
				switch(choice)
					if("Heroin")
						if(moneygave < 35)
							speak("Sorry, I can't give it for free!")
						else
							new /obj/item/reagent_containers/glass/bottle/heroinium(drop_location())
							moneygave -= 35
							moneyhas += 35
					if("Pervitin")
						if(moneygave < 10)
							speak("Sorry, I can't give it for free!")
						else
							new /obj/item/reagent_containers/pill/pervitin(drop_location())
							moneygave -= 10
							moneyhas += 10
					if("LSD")
						if(moneygave < 300)
							speak("Sorry, I can't give it for free!")
						else
							new /obj/item/gun/ballistic/automatic/panopticon/krasnik(drop_location())
							moneygave -= 300
							moneyhas += 300

		in_use = FALSE

/obj/structure/panopticon/trader/attackby(obj/item/I, mob/living/carbon/user, params)
	if(I.sellprice > 0)
		var/sellpriss = I.sellprice
		if(moneyhas > sellpriss)
			moneyhas -= I.sellprice
			new /obj/item/panopticonmoney/one(get_turf(user), sellpriss)
			qdel(I)
			speak("Deal!")
		else
			speak("I don't have that much money currently...")
	else if(istype(I, /obj/item/panopticonmoney/hundred))
		moneygave += I.sellprice
		moneyhas += I.sellprice
		qdel(I)
	else if(istype(I, /obj/item/panopticonmoney/ten))
		moneygave += I.sellprice
		moneyhas += I.sellprice
		qdel(I)
	else if(istype(I, /obj/item/panopticonmoney/one))
		moneygave += I.sellprice
		moneyhas += I.sellprice
		qdel(I)
	else
		speak("You think I gonna buy this?")
