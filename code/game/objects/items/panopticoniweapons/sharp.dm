/obj/item/panopticonweapon/knife
	force = 12
	possible_item_intents = list(/datum/intent/dagger/cut,/datum/intent/dagger/chop)
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_MOUTH
	name = "bone knife"
	desc = ""
	icon_state = "oldbone_knife"
	icon = 'icons/panopticon/items/melee.dmi'
	item_state = "oldbone"
	lefthand_file = 'icons/mob/inhands/weapons/pnmelee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/pnmelee_righthand.dmi'
	gripsprite = FALSE
	wlength = WLENGTH_SHORT
	w_class = WEIGHT_CLASS_SMALL
	parrysound = list('sound/combat/parry/bladed/bladedsmall (1).ogg','sound/combat/parry/bladed/bladedsmall (2).ogg','sound/combat/parry/bladed/bladedsmall (3).ogg')
	max_blade_int = 100
	swingsound = list('sound/combat/wooshes/bladed/wooshsmall (1).ogg','sound/combat/wooshes/bladed/wooshsmall (2).ogg','sound/combat/wooshes/bladed/wooshsmall (3).ogg')
	associated_skill = /datum/skill/combat/knives
	pickup_sound = 'sound/foley/equip/swordsmall2.ogg'
	throwforce = 12
	wdefense = 3
	thrown_bclass = BCLASS_CUT
	smeltresult = null
	max_integrity = 50
	max_blade_int = 50
	wdefense = 1

/obj/item/panopticonweapon/knife/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.4,"sx" = -10,"sy" = 0,"nx" = 11,"ny" = 0,"wx" = -4,"wy" = 0,"ex" = 2,"ey" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/panopticonweapon/bonespear
	force = 10
	force_wielded = 15
	possible_item_intents = list(/datum/intent/spear/bash,/datum/intent/spear/cut)
	gripped_intents = list(/datum/intent/spear/bash,/datum/intent/spear/cut,/datum/intent/spear/thrust)
	name = "bone spear"
	desc = ""
	icon_state = "bone_spear"
	icon = 'icons/panopticon/items/melee.dmi'
	wlength = WLENGTH_LONG
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	blade_dulling = DULLING_BASHCHOP
	walking_stick = TRUE
	wdefense = 2
	associated_skill = /datum/skill/combat/polearms

/obj/item/panopticonweapon/bonespear/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -3,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0,)
			if("wielded")
				return list("shrink" = 1,"sx" = 0,"sy" = -4,"nx" = 0,"ny" = -4,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 40,"sturn" = -40,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0,)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/panopticonweapon/rebar
	force = 11
	possible_item_intents = list(/datum/intent/spear/bash, /datum/intent/spear/thrust)
	slot_flags = ITEM_SLOT_HIP
	name = "rebar"
	desc = ""
	icon_state = "rebar"
	icon = 'icons/panopticon/items/misc.dmi'
	item_state = "rebar1"
	lefthand_file = 'icons/mob/inhands/weapons/pnmelee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/pnmelee_righthand.dmi'
	gripsprite = FALSE
	wlength = WLENGTH_NORMAL
	w_class = WEIGHT_CLASS_NORMAL
	parrysound = list('sound/combat/parry/bladed/bladedsmall (1).ogg','sound/combat/parry/bladed/bladedsmall (2).ogg','sound/combat/parry/bladed/bladedsmall (3).ogg')
	max_blade_int = 45
	swingsound = list('sound/combat/wooshes/blunt/wooshmed (1).ogg','sound/combat/wooshes/blunt/wooshmed (2).ogg','sound/combat/wooshes/blunt/wooshmed (3).ogg')
	associated_skill = /datum/skill/combat/polearms
	throwforce = 6
	thrown_bclass = BCLASS_STAB
	max_integrity = 50
	max_blade_int = 50
	wdefense = 1

/obj/item/panopticonweapon/rebar/Initialize(mapload)
	. = ..()
	icon_state = "[icon_state][pick(1, 2, 3)]"

/obj/item/panopticonweapon/rebar/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -8,"sy" = -7,"nx" = 10,"ny" = -7,"wx" = -1,"wy" = -8,"ex" = 1,"ey" = -7,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 91,"sturn" = -90,"wturn" = -90,"eturn" = 90,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.4,"sx" = -3,"sy" = -4,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 70,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 1,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)
