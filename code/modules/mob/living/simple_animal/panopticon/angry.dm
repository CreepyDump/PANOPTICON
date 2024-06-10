/mob/living/simple_animal/hostile/panopticon/kalodemon
	name = "Golgothan"
	desc = ""
	icon = 'icons/panopticon/mob/npc.dmi'
	icon_state = "kalodemon"
	icon_dead = "kal"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	movement_type = GROUND
	speak_chance = 80
	speak_emote = list("roars")
	maxHealth = 450
	health = 450
	melee_damage_lower = 15
	melee_damage_upper = 18
	attack_verb_continuous = "shits"
	attack_verb_simple = "shit"
	attack_sound = 'sound/misc/poo2.ogg'
	speed = 0.5
	STASTR = 20
	STAEND = 20
	STASPD = 20
	obj_damage = 20
	environment_smash = ENVIRONMENT_SMASH_WALLS|ENVIRONMENT_SMASH_STRUCTURES
	faction = list("shit-demons")
	robust_searching = TRUE
	wander = TRUE
	stat_attack = SOFT_CRIT
	footstep_type = FOOTSTEP_GENERIC_HEAVY

/mob/living/simple_animal/hostile/panopticon/kalodemon/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_SIMPLE_WOUNDS, TRAIT_GENERIC)

/mob/living/simple_animal/hostile/retaliate/panopticon/baun
	name = "Bayun Cat"
	desc = "Deadliest cute creature in the world!"
	icon = 'icons/panopticon/mob/npc.dmi'
	icon_state = "lynx"
	icon_dead = "lynx_dead"
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	movement_type = GROUND
	speak_chance = 3
	emote_see = ("Meows!")
	turns_per_move = 5
	speed = 1
	maxHealth = 100
	health = 100
	taunt_chance = 50
	vision_range = 10
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 2,
						/obj/item/natural/hide = 2,
						/obj/item/natural/fur = 1)
	base_intents = list(/datum/intent/simple/claw)
	see_in_dark = 5
	aggro_vision_range = 9
	environment_smash = ENVIRONMENT_SMASH_NONE
	retreat_distance = 0
	minimum_distance = 0
	move_to_delay = 1.1
	food_type = list(/obj/item/reagent_containers/food/snacks/rogue/meat, /obj/item/bodypart, /obj/item/organ)
	footstep_type = FOOTSTEP_MOB_CLAW
	melee_damage_lower = 10
	melee_damage_upper = 25
	STASPD = 15
	STACON = 8
	STASTR = 12
	faction = list("lynx")
	attack_sound = list('sound/vo/mobs/baun/attack (1).ogg','sound/vo/mobs/baun/attack (2).ogg',)
	food = 0
	aggressive = 1


/mob/living/simple_animal/hostile/retaliate/panopticon/baun/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/baun/attack (1).ogg','sound/vo/mobs/baun/attack (2).ogg',)
		if("pain")
			return pick('sound/vo/mobs/baun/pain (1).ogg','sound/vo/mobs/baun/pain (2).ogg')
		if("death")
			return pick('sound/vo/mobs/baun/death (1).ogg','sound/vo/mobs/baun/death (2).ogg')
		if("idle")
			return pick('sound/vo/mobs/baun/idle (1).ogg','sound/vo/mobs/baun/idle (2).ogg','sound/vo/mobs/baun/idle (3).ogg')
