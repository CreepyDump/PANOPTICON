/obj/item/reagent_containers/glass/beaker/banka
	name = "Banka"
	icon = 'icons/panopticon/obj/samogon.dmi'
	icon_state = "banka"
	fill_icon_thresholds = list(0, 10, 25, 50, 75, 80, 90)

/obj/item/reagent_containers/glass/beaker/banka/update_icon()
	overlays.Cut()

	if (!is_open_container())
		var/image/lid = image(icon, src, "lid_[initial(icon_state)]")
		overlays += lid

/obj/item/weapon/cooper_pipe
	name = "Cooper pipe"
	icon = 'icons/panopticon/obj/samogon.dmi'
	icon_state = "truba"

/obj/item/reagent_containers/canister
	name = "Canister"
	icon = 'icons/panopticon/obj/samogon.dmi'
	icon_state = "canister00"
	density = 0
	anchored = 0
	volume = 300
	var/obj/item/reagent_containers/beaker = null
	var/obj/item/weapon/cooper_pipe/cooper_pipe = null


/obj/item/reagent_containers/canister/update_icon()
	icon_state = "canister"+num2text(!isnull(cooper_pipe))+num2text(!isnull(beaker))

/obj/item/reagent_containers/canister/attack_hand()
	return

/obj/item/reagent_containers/canister/verb_pickup()
	return


/obj/item/reagent_containers/canister/attackby(var/obj/item/O as obj, var/mob/user as mob)
	..()

	if (istype(O,/obj/item/reagent_containers))
		if (beaker || !cooper_pipe)
			var/obj/item/reagent_containers/RC = O
			if (!RC.reagents.total_volume)
				reagents.trans_to(RC, min(reagents.total_volume, RC.reagents.maximum_volume))
			return
		else if (istype(O,/obj/item/reagent_containers/glass/beaker/banka))
			src.beaker =  O
			user.dropItemToGround()
			O.loc = src
			update_icon()
			src.updateUsrDialog()
			return

	if (istype(O,/obj/item/weapon/cooper_pipe))
		src.cooper_pipe =  O
		user.dropItemToGround()
		O.loc = src
		update_icon()
		src.updateUsrDialog()
		return

/obj/item/reagent_containers/canister/proc/disassemble()

	if (usr.stat != 0)
		return

	if (beaker)
		beaker.loc = src.loc
		beaker = null

	if(cooper_pipe)
		cooper_pipe.loc = src.loc
		cooper_pipe = null

/obj/item/reagent_containers/canister/verb/verb_toggle_brew()
	set src in oview(1) // One square distance
	set category = "MOONSHINE"
	set name = "Toggle Brewing"

/obj/item/reagent_containers/canister/verb/verb_disassemble()
	set src in oview(1) // One square distance
	set category = "MOONSHINE"
	set name = "Disassemble"

	disassemble()
