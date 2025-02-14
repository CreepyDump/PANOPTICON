/obj/item/reagent_containers/food/snacks/meatcube
	name = "meat cube"
	desc = "Mmmm, delicious!"
	bitesize = 5
	icon = 'icons/panopticon/items/consumable.dmi'
	icon_state = "myaso_jebanoe"
	list_reagents = list(/datum/reagent/consumable/nutriment = 20)
	filling_color = "#a13131"
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/meat/steak/fried
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/meat/steak/fried
	foodtype = MEAT | RAW | GROSS
	rotprocess = 15 MINUTES
	slices_num = 1
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/meat/mince/beef
	sellprice = 1

/obj/item/reagent_containers/food/snacks/seltshmack
	name = "seltshmack"
	desc = "A shroom!"
	bitesize = 1
	icon = 'icons/panopticon/items/consumable.dmi'
	icon_state = "seltshmack"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 2)
	filling_color = "#a13131"
	foodtype = VEGETABLES | SUGAR
	fried_type = /obj/item/reagent_containers/food/snacks/seltshmack/fried
	cooked_type = /obj/item/reagent_containers/food/snacks/seltshmack/fried
	sellprice = 5

/obj/item/reagent_containers/food/snacks/seltshmack/fake
	name = "seltshmack"
	desc = "A shroom!"
	bitesize = 1
	icon = 'icons/panopticon/items/consumable.dmi'
	icon_state = "seltshmack"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/toxin/cyanide = 2)
	filling_color = "#4b2968"
	foodtype = VEGETABLES | TOXIC
	fried_type = /obj/item/reagent_containers/food/snacks/seltshmack/fried
	cooked_type = /obj/item/reagent_containers/food/snacks/seltshmack/fried
	sellprice = 5

/obj/item/reagent_containers/food/snacks/seltshmack/fake/examine(mob/user)
	. = ..()
	if(prob(1))
		. += "<span class='danger'>Wait.. THIS ONE IS FAKE!.</span>"

/obj/item/reagent_containers/food/snacks/seltshmack/fried
	name = "fried seltshmack"
	desc = "A shroom!"
	bitesize = 1
	icon = 'icons/panopticon/items/consumable.dmi'
	icon_state = "grib_fried"
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/sugar = 2)
	filling_color = "#705f10"
	foodtype = VEGETABLES | SUGAR
	sellprice = 5

/obj/item/reagent_containers/food/snacks/throbber
	name = "throbbershroom"
	desc = "A shroom!"
	bitesize = 3
	icon = 'icons/panopticon/items/consumable.dmi'
	icon_state = "throbber"
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/toxin/polonium = 5)
	filling_color = "#a13131"
	foodtype = RAW | TOXIC
	fried_type = /obj/item/organ/heart
	cooked_type = /obj/item/organ/heart
	sellprice = 5

/obj/item/reagent_containers/food/snacks/penisvkusno
	name = "Dingaling"
	desc = "So that's what 'peccatum originale' was..."
	bitesize = 5
	icon = 'icons/panopticon/items/consumable.dmi'
	icon_state = "penis"
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/liquidgibs = 10, /datum/reagent/toxin/bad_food = 5)
	filling_color = "#6d3737"
	foodtype = MEAT | GROSS
	rotprocess = 15 MINUTES
	sellprice = 100

/obj/item/reagent_containers/food/snacks/piztec
	name = "Meatballs"
	desc = "That's definetely not real tasty..."
	bitesize = 5
	icon = 'icons/panopticon/items/consumable.dmi'
	icon_state = "piztec"
	list_reagents = list(/datum/reagent/consumable/nutriment = 10, /datum/reagent/liquidgibs = 5, /datum/reagent/toxin/bad_food = 5)
	filling_color = "#851414"
	foodtype = MEAT | GROSS
	rotprocess = 15 MINUTES
	sellprice = 100

/obj/item/reagent_containers/food/snacks/fungaljerky
	name = "Fungal Jerky"
	desc = "Dried strips of carnivorous fungus. It is chewy and slighty toxic."
	bitesize = 2
	icon = 'icons/panopticon/items/consumable.dmi'
	icon_state = "fungal-jerky"


	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/toxin = 1)
	filling_color = "#a13131"
	foodtype = GROSS | VEGETABLES
	sellprice = 8

/obj/item/reagent_containers/food/snacks/canned/panopticon
	name = "Asswipes"
	icon = 'icons/panopticon/items/misc.dmi'
	desc = "Preserved leftovers of unspecified nature. The label shows a smiley face and the inscription: 'Eat me if you dare!'"
	icon_state = "can"
	bitesize = 5
	trash = /obj/item/trash/can/food/panopticon
	tastes = list("Shit" = 1, "Hopeless" = 1)
	foodtype = GROSS | MEAT
	list_reagents = list(/datum/reagent/consumable/nutriment = 10, /datum/reagent/toxin = 5)

/obj/item/trash/can/food/panopticon
	name = "Can"
	icon = 'icons/panopticon/items/misc.dmi'
	icon_state = "can_empty"

/obj/item/reagent_containers/food/snacks/canned/panopticon/On_Consume(mob/living/carbon/human/M)
	if(prob(50))
		to_chat(M, "<span class='notice'>You kinda starting to like this taste. Maybe this shit is not that bad?</span>")
		M.reagents.add_reagent(/datum/reagent/medicine/ephedrine, 5)
	else
		M.reagents.add_reagent(/datum/reagent/toxin/bad_food, 10)
	. = ..()
