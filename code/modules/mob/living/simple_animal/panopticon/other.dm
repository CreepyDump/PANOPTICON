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
