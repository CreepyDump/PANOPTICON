/obj/item/organ/penis
	name = "penis"
	desc = ""
	icon_state = "severedtail"
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_TAIL
	var/tail_type = "None"
    var/potenzia = 10

/obj/item/organ/penis/New()
	desc = "It's [potenzia] cm long."
	..()

/obj/item/organ/penis/proc/set_potenzia(var/P_size)
	potenzia = P_size
	desc = "It's [potenzia] cm long."
