/obj/item/reagent_containers/food/snacks/bluebaby
	name = "Blue baby"
	desc = "What the FUCK is that, and why armies using that as an grenade?!"
	icon_state = "bluebaby"
	icon = 'icons/panopticon/items/consumable.dmi'
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	foodtype = RAW | MEAT | TOXIC
	verb_say = "cries"
	verb_yell = "cries"
	obj_flags = CAN_BE_HIT
	eat_effect = /datum/status_effect/debuff/uncookedfood
	max_integrity = 25
	sellprice = 35
	rotprocess = null
	fried_type = /obj/item/ashbaby
	smeltresult = /obj/item/ashbaby
	var/active = 0
	var/det_time = 50
/obj/item/reagent_containers/food/snacks/bluebaby/process()
	if(HAS_BLOOD_DNA(src))
		playsound(src.loc, 'sound/panopticon/klara_heal.ogg', 100)
		qdel(src)

/obj/item/reagent_containers/food/snacks/bluebaby/attack_self(mob/user)
	if(!active)
		preprime(user)

/obj/item/reagent_containers/food/snacks/bluebaby/waitiamred
	name = "Red baby"
	desc = "Fucking lord, we're doomed."
	icon_state = "redbaby"
	icon = 'icons/panopticon/items/consumable.dmi'
	list_reagents = list(/datum/reagent/consumable/nutriment = 50)
	verb_say = "ༀ༓༓ཧཧཕཧཧཚ"
	verb_yell = "卐卐卐卐卐"
	obj_flags = CAN_BE_HIT
	eat_effect = null
	max_integrity = 99999
	sellprice = 70
	fried_type = null

/obj/item/reagent_containers/food/snacks/bluebaby/waitiamred/fire_act(added, maxstacks)
	return

/obj/item/ashbaby
	name = "Ash baby"
	desc = ""
	icon_state = "ashbaby"
	icon = 'icons/panopticon/items/consumable.dmi'
	w_class = WEIGHT_CLASS_SMALL
	item_flags = NOBLUDGEON
	resistance_flags = FIRE_PROOF

/obj/item/reagent_containers/food/snacks/bluebaby/proc/preprime(mob/user, delayoverride, msg = TRUE, volume = 60)
	if(user)
		add_fingerprint(user)
		if(msg)
			to_chat(user, "<span class='warning'>I prime [src]! [capitalize(DisplayTimeText(det_time))]!</span>")
	playsound(src, 'sound/panopticon/babydeath.ogg', volume, TRUE)
	active = TRUE
	addtimer(CALLBACK(src, .proc/prime), isnull(delayoverride)? det_time : delayoverride)

/obj/item/reagent_containers/food/snacks/bluebaby/proc/prime()
	var/turf/T = get_turf(src)
	set waitfor = 0
	if(prob(50))
		explosion(T,1,2,3,0, TRUE, FALSE, 0, FALSE, FALSE, 'sound/misc/FragGrenade.ogg')
	else
		visible_message("<span class='warning'>[src] refused to detonate!</span>")
	qdel(src)

/obj/item/reagent_containers/food/snacks/bluebaby/waitiamred/prime()
	var/turf/T = get_turf(src)
	set waitfor = 0
	if(prob(100))
		explosion(T,2,3,4,0, TRUE, FALSE, 4, FALSE, FALSE, 'sound/misc/FragGrenade.ogg')

/obj/structure/panopticon/zalupa
	name = "Degeneration"
	desc = "卐 卐 卐 卐 卐"
	icon = 'icons/panopticon/obj/indoorsen.dmi'
	icon_state = "matka"
	density = FALSE
	anchored = TRUE
	var/getready = FALSE
	var/datum/looping_sound/tinnitus/soundloop
	var/datum/looping_sound/matka/soundloopdva
	max_integrity = 0

/obj/structure/panopticon/zalupa/Initialize()
	soundloop = new(list(src), FALSE)
	soundloop.start()
	. = ..()

/obj/structure/panopticon/zalupa/Destroy()
	if(soundloop)
		soundloop.stop()
		soundloopdva.stop()
	..()

/obj/structure/panopticon/zalupa/obj_break(damage_flag)
	if(soundloop)
		soundloop.stop()
		soundloopdva.stop()
	..()

/obj/structure/panopticon/zalupa/attack_hand(mob/living/user)
	if(!getready)
		soundloop.stop()
		playsound(src, 'sound/panopticon/morda_open_short_01.ogg', 85, TRUE)
		icon_state = "matka_opening"
		if(do_after(user, 4 SECONDS, target = src))
			activatedzalupa()
			update_icon_state()
		else
			icon_state = "matka"
			update_icon_state()
	else
		if(alert("Reincarnate..", "", "Yes", "No") == "Yes")
			user.returntolobby()
			qdel(src)
		return
/obj/structure/panopticon/zalupa/proc/activatedzalupa()
	getready = TRUE
	soundloopdva.start()
	icon_state = "matka_open"
