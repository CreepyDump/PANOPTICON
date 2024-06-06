/mob/living/simple_animal/hostile/panopticon/kalodemon
	name = "Golgothan"
	desc = ""
	icon = 'icons/panopticon/mob/npc.dmi'
	icon_state = "kalodemon"
	icon_living = "kalodemon"
	del_on_death = TRUE
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	movement_type = GROUND
	speak_chance = 80
	speak_emote = list("roars")
	maxHealth = 450
	health = 450
	melee_damage_lower = 15
	melee_damage_upper = 18
	attack_verb_continuous = "shits"
	attack_verb_simple = "shits"
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
	playsound(loc, 'sound/music/combat/desperation.ogg', 100, FALSE, -1)
