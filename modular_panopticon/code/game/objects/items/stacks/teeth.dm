/// Teeth stack object, used by the jaw limb to do teeth stuff
/obj/item/stack/teeth
	name = "teeth"
	singular_name = "tooth"
	desc = "Something that british people don't have."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "tooth_4"
	base_icon_state = "tooth"
	max_amount = HUMAN_TEETH_AMOUNT
	throwforce = 0
	force = 0
	var/icon_state_variation = 4

/obj/item/stack/teeth/Initialize(mapload, new_amount, merge)
	. = ..()
	if(icon_state_variation >= 1)
		icon_state = "[base_icon_state]_[rand(1, icon_state_variation)]"

/obj/item/stack/teeth/proc/do_knock_out_animation(shrink_time = 5)
	var/old_transform = matrix(transform)
	transform = transform.Scale(2, 2)
	transform = transform.Turn(rand(0, 360))
	animate(src, transform = old_transform, time = shrink_time)

//many teethe
/obj/item/stack/teeth/full
	amount = HUMAN_TEETH_AMOUNT
