/obj/item/reagent_containers/food/snacks/grown/psychickgrib
	name = "Psychickshroom"
	desc = "A shroom!"
	icon = 'icons/panopticon/items/consumable.dmi'
	icon_state = "psychick"
	filling_color = "#a32d8f"
	foodtype = VEGETABLES | GROSS
	list_reagents = list(/datum/reagent/psychick = 15)
	sellprice = 5

/obj/item/reagent_containers/glass/bottle/heroinium
	name = "Heroin"
	desc = "Heroin makes me happy."
	icon = 'icons/panopticon/items/consumable.dmi'
	icon_state = "heroin"
	list_reagents = list(/datum/reagent/heroin = 30)
	sellprice = 35

/obj/item/reagent_containers/glass/bottle/psychicksamogonka
	name = "Moonshine"
	list_reagents = list(/datum/reagent/psychicksamogon = 30)
	sellprice = 30

/obj/item/reagent_containers/glass/bottle/corpsewine
	name = "Corpse-Wine"
	desc = "A dark, pungent wine brewed from fermented fungus. It smells like death."
	icon_state = "corpsewine"
	icon = 'icons/panopticon/items/consumable.dmi'
	list_reagents = list(/datum/reagent/consumable/ethanol = 10)
	sellprice = 30
