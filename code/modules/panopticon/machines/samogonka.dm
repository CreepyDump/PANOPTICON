//////////////ETHANOL REFINERY/////////////////

/obj/structure/distillery
	name = "hooch distiller"
	desc = "An moonshine apparat. Turns any shrooms into alcohol."
	density = FALSE
	anchored = TRUE
	icon = 'icons/panopticon/obj/samogon.dmi'
	icon_state = "samogon"
	var/active = FALSE
	var/obj/item/reagent_containers/glass/beaker/jar/collector = null

/obj/structure/distillery/update_icon()
	..()
	if (active)
		icon_state = "distillery1"
	else
		icon_state = "distillery"

/obj/structure/distillery/attack_hand(var/mob/living/human/H)
	if (!collector && !active)
		H << "You cannot turn the distiller active without a collector."
		return
	if (collector && !active)
		H << "You turn the distiller active."
		active = TRUE
		update_icon()
		process_machine()
	..()
/obj/structure/distillery/attackby(var/obj/item/reagent_containers/B as obj, var/mob/living/human/H as mob)
	if (B.reagents)
		if (B.reagents.total_volume > 0 && collector && collector.reagents.get_free_space() > 0)
			var/amt_transf = collector.reagents.get_free_space()
			var/tamt = B.reagents.trans_to_holder(src.reagents, min(10, amt_transf), TRUE, FALSE)
			H << "You pour [tamt] units from \the [B] into the distiller."
			update_icon()
			return
	if (istype(B, /obj/item/reagent_containers/glass) && !collector)
		if (B.reagents.total_volume > 0)
			H << "The collector must be empty!"
			return
		else
			H << "You place [B] as the collector for the distiller."
			collector =  B
			H.drop_item()
			B.loc = src
			update_icon()
			return
	..()

/obj/structure/distillery/verb/empty()
	set category = null
	set name = "Remove Collector"
	set src in range(1, usr)

	if (!collector)
		usr << "There is nothing to remove from \the [src]."
		return

	if (active)
		usr << "<span class = 'danger'>You cannot remove the [collector] while the distiller is running!</span>"
		return

	if (collector && !active)
		visible_message("You remove \the [collector].","[usr] removes \the [collector] from \the [src].")
		collector.loc = get_turf(src)
		collector = null
		return

	return

/obj/structure/distillery/proc/process_machine()
	if (!active)
		return
	else
		spawn(150)
			var/ethanol_sum = 0
			for (var/datum/reagent/r in reagents.reagent_list)
				if (istype(r, /datum/reagent/ethanol))
					ethanol_sum += reagents.get_reagent_amount(r.id)*(1-(r.strength/100))
					reagents.remove_reagent(r.id,reagents.get_reagent_amount(r.id))
				else
					reagents.remove_reagent(r.id,reagents.get_reagent_amount(r.id))

			var/voltotransf = min(collector.reagents.get_free_space(),ethanol_sum)
			collector.reagents.add_reagent("ethanol",voltotransf)


			active = FALSE
			update_icon()
			visible_message("\The [src] finishes distilling.")
