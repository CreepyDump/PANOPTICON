/obj/item/organ/butt
	name = "butt"
	desc = "A pair of buttocks. Essential for sitting and... other activities."
	icon_state = "butt"
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_BUTT
	var/butt_size = 1

/obj/item/organ/butt/Initialize(mapload)
	. = ..()
	butt_size = rand(5, 20) / 10
	update_desc()

/obj/item/organ/butt/proc/update_desc()
	desc = "A pair of buttocks. They look [butt_size < 1 ? "small" : butt_size > 1.5 ? "large" : "average"]."

// Penis organ
/obj/item/organ/penis
	name = "penis"
	desc = "A male reproductive organ."
	icon_state = "penis"
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_PENIS
	var/penis_length = 10
	var/penis_girth = 4

/obj/item/organ/penis/Initialize(mapload)
	. = ..()
	penis_length = rand(50, 200) / 10
	penis_girth = rand(20, 60) / 10
	update_desc()

/obj/item/organ/penis/proc/update_desc()
    desc = "A male reproductive organ. It measures [penis_length] cm in length and [penis_girth] cm in girth."

/obj/item/organ/boobs
    name = "breasts"
    desc = "A pair of breasts."
    zone = BODY_ZONE_CHEST
    slot = ORGAN_SLOT_BOOBS
    var/boob_size = 1

/obj/item/organ/boobs/Initialize(mapload)
    . = ..()
    boob_size = rand(5, 20) / 10
    update_desc()

/obj/item/organ/boobs/proc/update_desc()
    desc = "A pair of breasts. They look [boob_size < 1 ? "small" : boob_size > 1.5 ? "large" : "average"]."
