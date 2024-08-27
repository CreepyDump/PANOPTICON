/mob/living/simple_animal/hostile/retaliate/rogue/panopticon/kalodemon
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

/mob/living/simple_animal/hostile/retaliate/rogue/panopticon/kalodemon/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_SIMPLE_WOUNDS, TRAIT_GENERIC)

/mob/living/simple_animal/hostile/retaliate/rogue/panopticon/baun
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
	speed = 0.5
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
	move_to_delay = 2
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


/mob/living/simple_animal/hostile/retaliate/rogue/panopticon/baun/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/baun/attack (1).ogg','sound/vo/mobs/baun/attack (2).ogg',)
		if("pain")
			return pick('sound/vo/mobs/baun/pain (1).ogg','sound/vo/mobs/baun/pain (2).ogg')
		if("death")
			return pick('sound/vo/mobs/baun/death (1).ogg','sound/vo/mobs/baun/death (2).ogg')
		if("idle")
			return pick('sound/vo/mobs/baun/idle (1).ogg','sound/vo/mobs/baun/idle (2).ogg','sound/vo/mobs/baun/idle (3).ogg')

/mob/living/simple_animal/hostile/retaliate/rogue/panopticon/flies
	name = "Corpseflies"
	desc = ""
	icon = 'icons/roguetown/mob/rotten.dmi'
	icon_state = "rotten"
	icon_living = "rotten"
	icon_dead = null
	mob_biotypes = MOB_UNDEAD|MOB_BUG
	mob_size = MOB_SIZE_SMALL
	movement_type = FLYING
	environment_smash = ENVIRONMENT_SMASH_NONE
	pass_flags = PASSTABLE|PASSMOB
	base_intents = list(/datum/intent/simple/bite)
	gender = NEUTER
	speak_chance = 0
	turns_per_move = 5
	response_help_continuous = "passes through"
	response_help_simple = "pass through"
	aggro_vision_range = 10
	maxHealth = 10
	health = 5
	layer = 16
	plane = 16
	spacewalk = TRUE
	stat_attack = UNCONSCIOUS
	robust_searching = 1
	speed = 1
	move_to_delay = 5 //delay for the automated movement.
	harm_intent_damage = 1
	obj_damage = 1
	melee_damage_lower = 5
	melee_damage_upper = 15
	attack_same = FALSE
	attack_sound = 'sound/misc/fliesloop.ogg'
	dodge_sound = 'sound/combat/dodge.ogg'
	parry_sound = 'sound/misc/fliesloop.ogg'
	d_intent = INTENT_HARM
	speak_emote = list("bzzes")
	bloodcrawl = BLOODCRAWL_EAT
	del_on_death = TRUE
	STAEND = 11
	faction = list("flies")
	footstep_type = null
	aggressive = 1

/mob/living/simple_animal/hostile/retaliate/rogue/panopticon/mutant
	icon = 'icons/panopticon/mob/bigdemon.dmi'
	name = "killer"
	icon_state = "killer"
	icon_living = "killer"
	icon_dead = "killer-dead"
	gender = MALE
	emote_hear = null
	emote_see = null
	speak_chance = 1
	turns_per_move = 2
	see_in_dark = 10
	move_to_delay = 3
	base_intents = list(/datum/intent/simple/slash)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/human = 10)
	faction = list("begotten")
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	health = 500
	maxHealth = 600
	melee_damage_lower = 45
	melee_damage_upper = 70
	vision_range = 3
	aggro_vision_range = 4
	environment_smash = ENVIRONMENT_SMASH_NONE
	d_intent = INTENT_PARRY
	retreat_distance = 0
	minimum_distance = 0
	food_type = list(/obj/item/reagent_containers/food/snacks/rogue/meat, /obj/item/bodypart, /obj/item/organ)
	footstep_type = FOOTSTEP_MOB_HEAVY
	pooptype = null
	STACON = 19
	STASTR = 16
	STASPD = 5
	defprob = 40
	defdrain = 10
	del_on_deaggro = 44 SECONDS
	retreat_health = 0
	food = 0
	attack_sound = list('sound/vo/mobs/begotten/attack_claw_hit01.ogg','sound/vo/mobs/begotten/attack_claw_hit02.ogg','sound/vo/mobs/begotten/attack_claw_hit03.ogg')
	dodgetime = 0
	aggressive = 1
//	stat_attack = UNCONSCIOUS

/mob/living/simple_animal/hostile/retaliate/rogue/panopticon/mutant/death(gibbed)
	..()
	update_icon()

/mob/living/simple_animal/hostile/retaliate/rogue/panopticon/mutant/taunted(mob/user)
	emote("aggro")
	Retaliate()
	GiveTarget(user)
	return

/mob/living/simple_animal/hostile/retaliate/rogue/panopticon/mutant/Life()
	..()
	if(pulledby)
		Retaliate()
		GiveTarget(pulledby)

/mob/living/simple_animal/hostile/retaliate/rogue/panopticon/mutant/simple_limb_hit(zone)
	if(!zone)
		return ""
	switch(zone)
		if(BODY_ZONE_PRECISE_R_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_L_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_NOSE)
			return "nose"
		if(BODY_ZONE_PRECISE_MOUTH)
			return "mouth"
		if(BODY_ZONE_PRECISE_HAIR)
			return "head"
		if(BODY_ZONE_PRECISE_EARS)
			return "head"
		if(BODY_ZONE_PRECISE_NECK)
			return "neck"
		if(BODY_ZONE_PRECISE_L_HAND)
			return "foreleg"
		if(BODY_ZONE_PRECISE_R_HAND)
			return "foreleg"
		if(BODY_ZONE_PRECISE_L_FOOT)
			return "leg"
		if(BODY_ZONE_PRECISE_R_FOOT)
			return "leg"
		if(BODY_ZONE_PRECISE_STOMACH)
			return "stomach"
		if(BODY_ZONE_PRECISE_GROIN)
			return "tail"
		if(BODY_ZONE_HEAD)
			return "head"
		if(BODY_ZONE_R_LEG)
			return "leg"
		if(BODY_ZONE_L_LEG)
			return "leg"
		if(BODY_ZONE_R_ARM)
			return "foreleg"
		if(BODY_ZONE_L_ARM)
			return "foreleg"
	return ..()

/mob/living/simple_animal/hostile/retaliate/rogue/panopticon/mutant/find_food()
	if(!.)
		return eat_bodies()

/mob/living/simple_animal/hostile/retaliate/rogue/panopticon/mutant/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/begotten/agro01_brut.ogg', 'sound/vo/mobs/begotten/agro02_brut.ogg', 'sound/vo/mobs/begotten/agro03_brut.ogg')
		if("pain")
			return pick('sound/vo/mobs/begotten/pain01_brut.ogg', 'sound/vo/mobs/begotten/pain02_brut.ogg')
		if("death")
			return pick('sound/vo/mobs/zombie/death (1).ogg')
		if("idle")
			return pick('sound/vo/mobs/begotten/idle01_brut.ogg','sound/vo/mobs/begotten/idle02_brut.ogg','sound/vo/mobs/begotten/idle03_brut.ogg')
