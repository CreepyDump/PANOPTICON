/mob/living/carbon/human/species/human/odongh
	race = /datum/species/human/odongh

/datum/species/human/odongh
	name = "Odongh"
	id = "odongh"
	desc = "<b>Odongh</b><br>\
	The Children of the Steppes, rumors say they're born of the soil itself. \
	Their kind were nomadic, which makes them mostly not remain at one spot."

	skin_tone_wording = "Appearance"
	default_color = "FFFFFF"
	liked_food = GROSS | GRAIN
	species_traits = list(LIPS,NO_UNDERWEAR, EYECOLOR)
	inherent_traits = list(TRAIT_NOMOBSWAP, TRAIT_VIRUSIMMUNE,TRAIT_NOHUNGER)
	default_features = list("mcolor" = "FFF", "wings" = "None")
	use_skintones = 1
	possible_ages = list(AGE_ADULT, AGE_OLD)
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = NONE
	liked_food = NONE
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/odongh.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/m/odongh.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
	hairyness = null
	soundpack_m = null
	soundpack_f = null
	offset_features = list(OFFSET_ID = list(0,1), OFFSET_GLOVES = list(0,1), OFFSET_WRISTS = list(0,1),\
	OFFSET_CLOAK = list(0,1), OFFSET_FACEMASK = list(0,-1), OFFSET_HEAD = list(0,1), \
	OFFSET_FACE = list(0,-1), OFFSET_BELT = list(0,1), OFFSET_BACK = list(0,1), \
	OFFSET_NECK = list(0,1), OFFSET_MOUTH = list(0,-1), OFFSET_PANTS = list(0,1), \
	OFFSET_SHIRT = list(0,1), OFFSET_ARMOR = list(0,1), OFFSET_HANDS = list(0,1), OFFSET_UNDIES = list(0,1), \
	OFFSET_ID_F = list(0,-1), OFFSET_GLOVES_F = list(0,0), OFFSET_WRISTS_F = list(0,0), OFFSET_HANDS_F = list(0,0), \
	OFFSET_CLOAK_F = list(0,0), OFFSET_FACEMASK_F = list(0,-1), OFFSET_HEAD_F = list(0,-1), \
	OFFSET_FACE_F = list(0,-1), OFFSET_BELT_F = list(0,0), OFFSET_BACK_F = list(0,-1), \
	OFFSET_NECK_F = list(0,-1), OFFSET_MOUTH_F = list(0,-1), OFFSET_PANTS_F = list(0,0), \
	OFFSET_SHIRT_F = list(0,0), OFFSET_ARMOR_F = list(0,0), OFFSET_UNDIES_F = list(0,0))
	specstats = list("strength" = 1, "perception" = 0, "intelligence" = 0, "constitution" = -1, "endurance" = -1, "speed" = -2, "fortune" = 1)
	specstats_f = list("strength" = 0, "perception" = 0, "intelligence" = 1, "constitution" = -2, "endurance" = 0, "speed" = -1, "fortune" = 1)
	enflamed_icon = "widefire"

	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/accessory,
	)
	body_markings = list(
		/datum/body_marking/tonage,
	)

/datum/species/human/odongh/send_voice(mob/living/carbon/human/H)
	playsound(get_turf(H), pick('sound/misc/odonghtalk.ogg'), 100, TRUE, -1)


/datum/species/human/odongh/check_roundstart_eligible()
	return TRUE

/datum/species/human/odongh/get_skin_list()
	return list(
	"Uymen" = "ffffff",
	"Ubshe" = "A09C8B")

/datum/species/human/odongh/get_hairc_list()
	return sortList(list(
	"MAN, I AM BALD!!!" = "000000"
	))

/datum/species/human/odongh/random_name(gender,unique,lastname)
	var/randname
	if(unique)
		if(gender == MALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/dwarf/odongs.txt") )
				if(!findname(randname))
					break
		if(gender == FEMALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/dwarf/odongs.txt") )
				if(!findname(randname))
					break
	else
		if(gender == MALE)
			randname = pick( world.file2list("strings/rt/names/dwarf/odongs.txt") )
		if(gender == FEMALE)
			randname = pick( world.file2list("strings/rt/names/dwarf/odongs.txt") )
	return randname

/datum/species/human/odongh/random_surname()
	return ""
