/obj/item/reagent_containers/food/snacks/meatcube
	name = "meat cube"
	desc = "Mmmm, delicious!"
	bitesize = 5
	icon = 'icons/panopticon/items/consumable.dmi'
	icon_state = "myaso_jebanoe"
	list_reagents = list(/datum/reagent/consumable/nutriment = 20)
	filling_color = "#a13131"
	foodtype = MEAT | RAW

/obj/item/reagent_containers/food/snacks/seltshmack
	name = "seltshmack"
	desc = "A shroom!
	bitesize = 1
	icon = 'icons/panopticon/items/consumable.dmi'
	icon_state = "seltshmack"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 2)
	filling_color = "#a13131"
	foodtype = VEGETABLES | SUGAR

/obj/item/reagent_containers/food/snacks/seltshmack/fake
	name = "seltshmack"
	desc = "A shroom!"
	bitesize = 1
	icon = 'icons/panopticon/items/consumable.dmi'
	icon_state = "seltshmack"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/toxin/cyanide = 2)
	filling_color = "#a13131"
	foodtype = VEGETABLES | SUGAR

/obj/item/reagent_containers/food/snacks/throbber
	name = "throbbershroom"
	desc = "A shroom!"
	bitesize = 3
	icon = 'icons/panopticon/items/consumable.dmi'
	icon_state = "throbber"
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/toxin/polonium = 5)
	filling_color = "#a13131"
	foodtype = RAW | TOXIC
