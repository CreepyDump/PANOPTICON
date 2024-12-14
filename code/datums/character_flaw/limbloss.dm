

/datum/charflaw/limbloss
	var/lost_zone

/datum/charflaw/limbloss/on_mob_creation(mob/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/bodypart/O = H.get_bodypart(lost_zone)
	if(O)
		O.drop_limb()
		qdel(O)
	return

/datum/charflaw/limbloss/arm_r
	name = "No Arm (R)"
	desc = "I lost my right arm long ago, but the wooden arm doesn't bleed as much."
	lost_zone = BODY_ZONE_R_ARM

/datum/charflaw/limbloss/arm_r/on_mob_creation(mob/user)
	..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/bodypart/r_arm/rproesthetic/L = new()
	L.attach_limb(H)

/datum/charflaw/limbloss/arm_l
	name = "No Arm (L)"
	desc = "I lost my left arm long ago, but the wooden arm doesn't bleed as much."
	lost_zone = BODY_ZONE_L_ARM

/datum/charflaw/limbloss/arm_l/on_mob_creation(mob/user)
	..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/bodypart/l_arm/rproesthetic/L = new()
	L.attach_limb(H)

/datum/charflaw/limbloss/nolegs
	name = "Disabled"
	desc = "I lost my legs at war. But i still have wheelchair."
	lost_zone = BODY_ZONE_R_LEG

/datum/charflaw/limbloss/nolegs/on_mob_creation(mob/user)
	..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/bodypart/l_leg = user.get_bodypart(BODY_ZONE_L_LEG)
	var/obj/item/bodypart/r_leg = user.get_bodypart(BODY_ZONE_R_LEG)
	if(l_leg)
		l_leg.dismember()
	if(r_leg)
		r_leg.dismember()
