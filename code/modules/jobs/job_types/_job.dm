/datum/job
	//The name of the job , used for preferences, bans and more. Make sure you know what you're doing before changing this.
	var/title = "NOPE"

	//Job access. The use of minimal_access or access is determined by a config setting: config.jobs_have_minimal_access
	var/list/minimal_access = list()		//Useful for servers which prefer to only have access given to the places a job absolutely needs (Larger server population)
	var/list/access = list()				//Useful for servers which either have fewer players, so each person needs to fill more than one role, or servers which like to give more access, so players can't hide forever in their super secure departments (I'm looking at you, chemistry!)

	//Determines who can demote this position
	var/department_head = list()

	//Tells the given channels that the given mob is the new department head. See communications.dm for valid channels.
	var/list/head_announce = null

	//Bitflags for the job
	var/flag = NONE //Deprecated
	var/department_flag = NONE //Deprecated
	var/auto_deadmin_role_flags = NONE

	//Players will be allowed to spawn in as jobs that are set to "Station"
	var/faction = "None"

	//How many players can be this job
	var/total_positions = 0

	//How many players can spawn in as this job
	var/spawn_positions = 0

	//How many players have this job
	var/current_positions = 0

	//Supervisors, who this person answers to directly
	var/supervisors = ""

	//Sellection screen color
	var/selection_color = "#dbdce3"


	//If this is set to 1, a text is printed to the player when jobs are assigned, telling him that he should let admins know that he has to disconnect.
	var/req_admin_notify

	//If you have the use_age_restriction_for_jobs config option enabled and the database set up, this option will add a requirement for players to be at least minimal_player_age days old. (meaning they first signed in at least that many days before.)
	var/minimal_player_age = 0

	var/outfit = null
	var/outfit_female = null

	var/exp_requirements = 0

	var/exp_type = ""
	var/exp_type_department = ""

	//The amount of good boy points playing this role will earn you towards a higher chance to roll antagonist next round
	//can be overridden by antag_rep.txt config
	var/antag_rep = 10

	var/paycheck = PAYCHECK_MINIMAL
	var/paycheck_department = ACCOUNT_CIV

	var/list/mind_traits // Traits added to the mind of the mob assigned this job

	var/display_order = JOB_DISPLAY_ORDER_DEFAULT


	///Levels unlocked at roundstart in physiology
	var/list/roundstart_experience

	//allowed sex/race for picking
	var/list/allowed_sexes = list(MALE,FEMALE)
	var/list/allowed_races = ALL_RACES_LIST_NAMES
	var/list/allowed_patrons = ALL_PATRON_NAMES_LIST
	var/list/allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)

	/// Innate skill levels unlocked at roundstart. Format is list(/datum/skill/foo = SKILL_EXP_NOVICE) with exp as an integer or as per code/_DEFINES/skills.dm
	var/list/skills

	var/list/spells

	var/list/jobstats
	var/list/jobstats_f

	var/f_title = null

	var/tutorial = null

	var/whitelist_req = FALSE

	var/bypass_jobban = FALSE
	var/bypass_lastclass = TRUE

	var/list/peopleiknow = list()
	var/list/peopleknowme = list()

	var/plevel_req = 0
	var/min_pq = -999

	var/show_in_credits = TRUE

	var/give_bank_account = FALSE

	var/can_random = TRUE

	/// Some jobs have unique combat mode music, because why not?
	var/cmode_music

/datum/job/proc/special_job_check(mob/dead/new_player/player)
	return TRUE

/mob/living/proc/announceshit()
	var/text_to_show
	if(!mind)
		return
	switch(pick(1,2,3))
		if(1)
			text_to_show = "The people who have really\nmade history are the martyrs."
		if(2)
			text_to_show = "I feel like my head is a great cliff.\nAnd every, every day quietly\nthe soil is shattering."
		if(3)
			text_to_show = "Our mankind\nwas a mistake."
	if(!text_to_show)
		return
	if(text_to_show in mind.areas_entered)
		return
	mind.areas_entered += text_to_show
	var/obj/screen/area_text/T = new()
	client.screen += T
	T.maptext = {"<span style='vertical-align:top; text-align:center;
				color: #CE1C1C; font-size: 150%;
				text-shadow: 1px 1px 2px black, 0 0 1em black, 0 0 0.2em black;
				font-family:"Crimson Text";'>[text_to_show]</span>"}
	T.maptext_width = 205
	T.maptext_height = 209
	T.maptext_x = 12
	T.maptext_y = -120
	playsound_local(src, 'sound/misc/hello.ogg', 90, FALSE)
	animate(T, alpha = 255, time = 10, easing = EASE_IN)
	addtimer(CALLBACK(src, PROC_REF(clear_area_text), T), 35)

//Only override this proc
//H is usually a human unless an /equip override transformed it
/datum/job/proc/after_spawn(mob/living/H, mob/M, latejoin = FALSE)
	if(ishuman(H))
		H.announceshit()
		var/list/in_range = range(2, H)
		var/obj/structure/bed/a_mimir
		if(a_mimir in range (in_range))
			H.forceMove(get_turf(a_mimir))
			a_mimir.buckle_mob(H)
			H.AdjustSleeping(4 SECONDS)
		if(H?.ckey == "lolkekxdbruh")
			new /obj/item/clothing/head/panopticon/keptyouwaitinghuh(H.drop_location(), FALSE)
		if(H?.ckey == "crazyduster")
			if(H.gender == MALE)
				H.put_in_hands(new /obj/item/clothing/mask/carnaval(H.drop_location()), FALSE)
			else
				H.put_in_hands(new /obj/item/clothing/mask/carnaval/female(H.drop_location()), FALSE)
		if(H?.ckey == "akayenthefake")
			if(H.gender == MALE)
				H.put_in_hands(new /obj/item/clothing/mask/carnaval(H.drop_location()), FALSE)
			else
				H.put_in_hands(new /obj/item/clothing/mask/carnaval/female(H.drop_location()), FALSE)
		if(H?.ckey == "vseslav 2008")
			if(H.gender == MALE)
				H.put_in_hands(new /obj/item/clothing/mask/carnaval(H.drop_location()), FALSE)
			else
				H.put_in_hands(new /obj/item/clothing/mask/carnaval/female(H.drop_location()), FALSE)
		if(H?.ckey == "uhboer")
			if(H.gender == MALE)
				H.put_in_hands(new /obj/item/clothing/mask/carnaval(H.drop_location()), FALSE)
			else
				H.put_in_hands(new /obj/item/clothing/mask/carnaval/female(H.drop_location()), FALSE)
		if(H?.ckey == "moonMagick")
			if(H.gender == MALE)
				H.put_in_hands(new /obj/item/clothing/mask/carnaval(H.drop_location()), FALSE)
			else
				H.put_in_hands(new /obj/item/clothing/mask/carnaval/female(H.drop_location()), FALSE)
		if(H?.ckey == "user21466654")
			if(H.gender == MALE)
				H.put_in_hands(new /obj/item/clothing/mask/carnaval(H.drop_location()), FALSE)
			else
				H.put_in_hands(new /obj/item/clothing/mask/carnaval/female(H.drop_location()), FALSE)
		if(H?.ckey == "carl3134")
			if(H.gender == MALE)
				H.put_in_hands(new /obj/item/clothing/mask/carnaval(H.drop_location()), FALSE)
			else
				H.put_in_hands(new /obj/item/clothing/mask/carnaval/female(H.drop_location()), FALSE)
		if(H?.ckey == "i_am_not_eating_clowns")
			if(H.gender == MALE)
				H.put_in_hands(new /obj/item/clothing/mask/carnaval(H.drop_location()), FALSE)
			else
				H.put_in_hands(new /obj/item/clothing/mask/carnaval/female(H.drop_location()), FALSE)
		if(H?.ckey == "chaoticagent")
			if(H.gender == MALE)
				H.put_in_hands(new /obj/item/clothing/mask/carnaval(H.drop_location()), FALSE)
			else
				H.put_in_hands(new /obj/item/clothing/mask/carnaval/female(H.drop_location()), FALSE)
		if(H?.ckey == "globalorganizer")
			if(H.gender == MALE)
				H.put_in_hands(new /obj/item/clothing/mask/carnaval(H.drop_location()), FALSE)
			else
				H.put_in_hands(new /obj/item/clothing/mask/carnaval/female(H.drop_location()), FALSE)
	if(mind_traits)
		for(var/t in mind_traits)
			ADD_TRAIT(H.mind, t, JOB_TRAIT)
	var/list/roundstart_experience

	roundstart_experience = skills

	if(roundstart_experience)
		var/mob/living/carbon/human/experiencer = H
		for(var/i in roundstart_experience)
			experiencer.mind.adjust_experience(i, roundstart_experience[i], TRUE)

	if(spells)
		for(var/S in spells)
			if(H.mind)
				H.mind.AddSpell(new S)

	if(H.gender == FEMALE)
		if(jobstats_f)
			for(var/S in jobstats_f)
				H.change_stat(S, jobstats_f[S])
		else
			for(var/S in jobstats)
				H.change_stat(S, jobstats[S])
	else
		for(var/S in jobstats)
			H.change_stat(S, jobstats[S])

	for(var/X in peopleknowme)
		for(var/datum/mind/MF in get_minds(X))
			H.mind.person_knows_me(MF)
	for(var/X in peopleiknow)
		for(var/datum/mind/MF in get_minds(X))
			H.mind.i_know_person(MF)

	if(H.islatejoin && show_in_credits)
		var/used_title = title
		if((H.gender == FEMALE) && f_title)
			used_title = f_title
		scom_announce("[H.real_name] the [used_title] arrives from outside.")

	if(give_bank_account)
		if(give_bank_account > 1)
			SStreasury.create_bank_account(H.real_name, give_bank_account)
		else
			SStreasury.create_bank_account(H.real_name)

	if(show_in_credits)
		SScrediticons.processing += H

	if(cmode_music)
		H.cmode_music = cmode_music

	if(!H.mind.special_role)
		GLOB.actors_list[H.mobid] = "[H.real_name] as [H.mind.assigned_role]<BR>"

/mob/living/carbon/human/proc/add_credit()
	if(!mind || !client)
		return
	var/thename = "[real_name]"
	var/datum/job/J = SSjob.GetJob(mind.assigned_role)
	var/used_title = J.title
	if(gender == FEMALE && J.f_title)
		used_title = J.f_title
	if(used_title)
		thename = "[real_name] the [used_title]"
	GLOB.credits_icons[thename] = list()
	var/client/C = client
	var/datum/preferences/P = C.prefs
	if(!P)
		return
	var/icon/I = get_flat_human_icon(null, J, P, DUMMY_HUMAN_SLOT_MANIFEST, list(SOUTH))
	if(I)
		var/icon/female_s = icon("icon"='icons/mob/clothing/under/masking_helpers.dmi', "icon_state"="credits")
		I.Blend(female_s, ICON_MULTIPLY)
		I.Scale(96,96)
		GLOB.credits_icons[thename]["icon"] = I
		GLOB.credits_icons[thename]["vc"] = voice_color

/datum/job/proc/announce(mob/living/carbon/human/H)
	if(head_announce)
		announce_head(H, head_announce)

/datum/job/proc/override_latejoin_spawn(mob/living/carbon/human/H)		//Return TRUE to force latejoining to not automatically place the person in latejoin shuttle/whatever.
	return FALSE

//Used for a special check of whether to allow a client to latejoin as this job.
/datum/job/proc/special_check_latejoin(client/C)
	return TRUE

/datum/job/proc/GetAntagRep()
	. = CONFIG_GET(keyed_list/antag_rep)[lowertext(title)]
	if(. == null)
		return antag_rep

//Don't override this unless the job transforms into a non-human (Silicons do this for example)
/datum/job/proc/equip(mob/living/carbon/human/H, visualsOnly = FALSE, announce = TRUE, latejoin = FALSE, datum/outfit/outfit_override = null, client/preference_source)
	if(!H)
		return FALSE
	if(CONFIG_GET(flag/enforce_human_authority) && (title in GLOB.command_positions))
		if(H.dna.species.id != "human")
			H.set_species(/datum/species/human)
			H.apply_pref_name("human", preference_source)
	if(!visualsOnly)
		var/datum/bank_account/bank_account = new(H.real_name, src)
		bank_account.payday(STARTING_PAYCHECKS, TRUE)
		H.account_id = bank_account.account_id

	//Equip the rest of the gear
	H.dna.species.before_equip_job(src, H, visualsOnly)
	if(H.gender == FEMALE)
		if(outfit_override || outfit_female)
			H.equipOutfit(outfit_override ? outfit_override : outfit_female, visualsOnly)
		else if(outfit)
			H.equipOutfit(outfit, visualsOnly)
	else
		if(outfit_override || outfit)
			H.equipOutfit(outfit_override ? outfit_override : outfit, visualsOnly)

	H.dna.species.after_equip_job(src, H, visualsOnly)

	if(!visualsOnly && announce)
		announce(H)

/datum/job/proc/get_access()
	if(!config)	//Needed for robots.
		return src.minimal_access.Copy()

	. = list()

	if(CONFIG_GET(flag/jobs_have_minimal_access))
		. = src.minimal_access.Copy()
	else
		. = src.access.Copy()

	if(CONFIG_GET(flag/everyone_has_maint_access)) //Config has global maint access set
		. |= list(ACCESS_MAINT_TUNNELS)

/datum/job/proc/announce_head(mob/living/carbon/human/H, channels) //tells the given channel that the given mob is the new department head. See communications.dm for valid channels.
	if(H && GLOB.announcement_systems.len)
		//timer because these should come after the captain announcement
		SSticker.OnRoundstart(CALLBACK(GLOBAL_PROC, .proc/addtimer, CALLBACK(pick(GLOB.announcement_systems), /obj/machinery/announcement_system/proc/announce, "NEWHEAD", H.real_name, H.job, channels), 1))

//If the configuration option is set to require players to be logged as old enough to play certain jobs, then this proc checks that they are, otherwise it just returns 1
/datum/job/proc/player_old_enough(client/C)
	if(available_in_days(C) == 0)
		return TRUE	//Available in 0 days = available right now = player is old enough to play.
	return FALSE


/datum/job/proc/available_in_days(client/C)
	if(!C)
		return 0
	if(!CONFIG_GET(flag/use_age_restriction_for_jobs))
		return 0
	if(!SSdbcore.Connect())
		return 0 //Without a database connection we can't get a player's age so we'll assume they're old enough for all jobs
	if(!isnum(minimal_player_age))
		return 0

	return max(0, minimal_player_age - C.player_age)

/datum/job/proc/config_check()
	return TRUE

/datum/job/proc/map_check()
	return TRUE

/datum/job/proc/radio_help_message(mob/M)
	to_chat(M, "<b>Prefix your message with :h to speak on your department's radio. To see other prefixes, look closely at your headset.</b>")

/datum/outfit/job
	name = "Standard Gear"

	var/jobtype = null

	uniform = /obj/item/clothing/under/color/grey
	id = /obj/item/card/id
	ears = /obj/item/radio/headset
	belt = /obj/item/pda
	back = /obj/item/storage/backpack
	shoes = /obj/item/clothing/shoes/sneakers/black
	box = /obj/item/storage/box/survival

	var/backpack = /obj/item/storage/backpack
	var/satchel  = /obj/item/storage/backpack/satchel
	var/duffelbag = /obj/item/storage/backpack/duffelbag

	var/pda_slot = SLOT_BELT

/datum/outfit/job/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
/*	switch(H.backpack)
		if(GBACKPACK)
			back = /obj/item/storage/backpack //Grey backpack
		if(GSATCHEL)
			back = /obj/item/storage/backpack/satchel //Grey satchel
		if(GDUFFELBAG)
			back = /obj/item/storage/backpack/duffelbag //Grey Duffel bag
		if(LSATCHEL)
			back = /obj/item/storage/backpack/satchel/leather //Leather Satchel
		if(DSATCHEL)
			back = satchel //Department satchel
		if(DDUFFELBAG)
			back = duffelbag //Department duffel bag
		else
			back = backpack //Department backpack

	//converts the uniform string into the path we'll wear, whether it's the skirt or regular variant
	var/holder
	if(H.jumpsuit_style == PREF_SKIRT)
		holder = "[uniform]"
	else
		holder = "[uniform]"
	uniform = text2path(holder)*/

/datum/outfit/job/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/datum/job/J = SSjob.GetJobType(jobtype)
	if(!J)
		J = SSjob.GetJob(H.job)

	var/obj/item/card/id/C = H.wear_ring
	if(istype(C))
		C.access = J.get_access()
		shuffle_inplace(C.access) // Shuffle access list to make NTNet passkeys less predictable
		C.registered_name = H.real_name
		C.assignment = J.title
		C.update_label()
		for(var/A in SSeconomy.bank_accounts)
			var/datum/bank_account/B = A
			if(B.account_id == H.account_id)
				C.registered_account = B
				B.bank_cards += C
				break
		H.sec_hud_set_ID()

	var/obj/item/pda/PDA = H.get_item_by_slot(pda_slot)
	if(istype(PDA))
		PDA.owner = H.real_name
		PDA.ownjob = J.title
		PDA.update_label()

/datum/outfit/job/get_chameleon_disguise_info()
	var/list/types = ..()
	types -= /obj/item/storage/backpack //otherwise this will override the actual backpacks
	types += backpack
	types += satchel
	types += duffelbag
	return types

//Warden and regular officers add this result to their get_access()
/datum/job/proc/check_config_for_sec_maint()
	if(CONFIG_GET(flag/security_has_maint_access))
		return list(ACCESS_MAINT_TUNNELS)
	return list()

