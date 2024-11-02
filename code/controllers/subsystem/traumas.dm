SUBSYSTEM_DEF(traumas)
	name = "Traumas"
	flags = SS_NO_FIRE
	var/list/phobia_types
	var/list/phobia_words
	var/list/phobia_mobs
	var/list/phobia_objs
	var/list/phobia_turfs
	var/list/phobia_species

#define PHOBIA_FILE "phobia.json"

/datum/controller/subsystem/traumas/Initialize()
	//phobia types is to pull from randomly for brain traumas, e.g. conspiracies is for special assignment only
	phobia_types = sortList(list("Arachnophobia", "Hemophobia", "Coulrophobia", "Cartilogenophobia", "Theophobia", "Iatrophobia", "Hoplophobia"))

	phobia_words = list("Arachnophobia"   = strings(PHOBIA_FILE, "Arachnophobia"),
						"Hemophobia"     = strings(PHOBIA_FILE, "Hemophobia"),
						"Cartilogenophobia"  = strings(PHOBIA_FILE, "Cartilogenophobia"),
						"Theophobia"     = strings(PHOBIA_FILE, "Theophobia"),
						"Coulrophobia"  = strings(PHOBIA_FILE, "Coulrophobia"),
						"Iatrophobia"	= strings(PHOBIA_FILE, "Iatrophobia"),
						"Hoplophobia" = strings(PHOBIA_FILE, "Hoplophobia")
					   )

	phobia_mobs = list("Arachnophobia"  = typecacheof(list(/mob/living/simple_animal/hostile/poison/giant_spider)),
					   "Cartilogenophobia"  = typecacheof(list(/mob/living/carbon/human/species/skeleton)), 
					   "Coulrophobia"  = typecacheof(list(/mob/living/simple_animal/hostile/retaliate/clown)),
					   "Hemophobia"   = typecacheof(list(/mob/living/simple_animal/hostile/retaliate/rogue/panopticon/mutant/brut, /mob/living/simple_animal/hostile/retaliate/rogue/panopticon/mutant/madman))
					   )

	phobia_objs = list("Hemophobia" = typecacheof(list(/obj/effect/decal/cleanable/blood)),
						"Coulrophobia"  = typecacheof(list(/obj/item/clothing/mask/gas/clown_hat, /obj/item/clothing/under/rank/civilian/clown, /obj/item/bikehorn)),
						"Cartilogenophobia" = typecacheof(list(/obj/item/natural/bone, /obj/item/natural/bundle/bone, /obj/effect/decal/remains, /obj/structure/panopticon/skull, /obj/item/clothing/mask/rogue/skullmask, /obj/item/rogueweapon/stoneaxe/boneaxe, /obj/item/panopticonweapon/knife, /obj/item/panopticonweapon/bonespear)),
						"Arachnophobia"   = typecacheof(list(/obj/structure/spider)),
						"Iatrophobia"   = typecacheof(list(/obj/item/storage/pill_bottle/pervitin, /obj/item/storage/firstaid/panopticon, /obj/item/reagent_containers/glass/bottle/heroinium, /obj/structure/panopticon/onwall/medic, /obj/item/clothing/mask/infected, /obj/item/needle)),
						"Theophobia"   = typecacheof(list(/obj/item/clothing/cloak/panopticon/necroleninist, /obj/item/clothing/head/hooded/panopticon/necroleninist, /obj/item/clothing/cloak/panopticon/grandnecroleninist, /obj/item/clothing/head/panopticon/grandnecroleninist, /obj/structure/panopticon/onwall/commies, /obj/structure/panopticon/onwall/runes, /obj/structure/panopticon/onwall/runes/other/one, /obj/structure/panopticon/onwall/runes/other/two, /obj/structure/panopticon/onwall/runes/other/three, /obj/structure/panopticon/onwall/praybitch, /obj/structure/panopticon/onwall/necroleninism, /obj/structure/panopticon/onwall/panopticonn, /obj/structure/fluff/psycross)),
						"Hoplophobia" = typecacheof(list(/obj/item/gun/ballistic, /obj/item/gun/energy, /obj/item/gun/syringe, /obj/item/gun/chem,
						/obj/item/gun/blastcannon, /obj/item/gun/grenadelauncher, /obj/machinery/porta_turret, /obj/machinery/power/emitter,
						/obj/item/ammo_casing, /obj/item/storage/belt/bandolier, /obj/item/storage/belt/holster, /obj/item/ammo_box,
						/obj/item/mecha_ammo, /obj/item/mecha_parts/mecha_equipment/weapon/ballistic, /obj/item/mecha_parts/mecha_equipment/weapon/energy))
						)

	phobia_turfs = list("Hemophobia" = typecacheof(list(/turf/open/floor/panopticon/hell))
						)

/*	phobia_species = list("lizards" = typecacheof(list(/datum/species/lizard)),
						  "skeletons" = typecacheof(list(/datum/species/skeleton, /datum/species/plasmaman)),
						  "conspiracies" = typecacheof(list(/datum/species/abductor, /datum/species/lizard, /datum/species/synth)),
						  "robots" = typecacheof(list(/datum/species/android)),
						  "the supernatural" = typecacheof(list(/datum/species/golem/runic)),
						  "aliens" = typecacheof(list(/datum/species/abductor, /datum/species/jelly, /datum/species/pod,
						  /datum/species/shadow)),
						  "anime" = typecacheof(list(/datum/species/human/felinid))
						 )
*/
	return ..()

#undef PHOBIA_FILE
