/obj/item/panopticonmoney
	name = ""
	icon_state = ""
	icon = 'icons/panopticon/items/misc.dmi'
	desc = ""
	w_class = WEIGHT_CLASS_TINY
	var/list/held = list()
	dropshrink = 0.2
	sellprice = 0
	static_price = TRUE
	simpleton_price = TRUE
	var/flintcd
	var/base_type //used for compares
	grind_results = list(/datum/reagent/cellulose = 10)

/obj/item/panopticonmoney/getonmobprop(tag)
	. = ..()
	if(tag)
		if(held.len)
			if(tag == "gen")
				return list("shrink" = 0.10,"sx" = -6,"sy" = 6,"nx" = 6,"ny" = 7,"wx" = 0,"wy" = 5,"ex" = -1,"ey" = 7,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -50,"sturn" = 40,"wturn" = 50,"eturn" = -50,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
		else
			if(tag == "gen")
				return list("shrink" = 0.10,"sx" = -6,"sy" = 6,"nx" = 6,"ny" = 7,"wx" = 0,"wy" = 5,"ex" = -1,"ey" = 7,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -50,"sturn" = 40,"wturn" = 50,"eturn" = -50,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)


/obj/item/panopticonmoney/hundred
	name = "One-hundred Farkas banknote"
	icon_state = "hundred"
	sellprice = 100
	
/obj/item/panopticonmoney/ten
	name = "Ten Farkas banknote"
	icon_state = "ten"
	sellprice = 10

/obj/item/panopticonmoney/one
	name = "One Farkas banknote"
	icon_state = "one"
	sellprice = 1

/obj/item/storage/fancy/cigarettes/jeltomorkanal
	name = "Jeltomorkanal"
	desc = ""
	icon = 'icons/panopticon/items/misc.dmi'
	icon_state = "jeltomor"
	item_state = "jeltomor"
	icon_type = "cig"
	w_class = WEIGHT_CLASS_TINY
