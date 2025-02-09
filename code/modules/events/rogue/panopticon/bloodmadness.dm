/datum/round_event_control/rogue/bloodmadness
	name = "bloodmadness"
	typepath = /datum/round_event/rogue/bloodmadness
	weight = 99
	max_occurrences = 999
	min_players = 4
	req_omen = FALSE
	todreq = list("dusk", "night")
	earliest_start = 35 MINUTES
	var/last_siege

/datum/round_event_control/rogue/bloodmadness/canSpawnEvent(players_amt, gamemode)
	if(earliest_start >= world.time-SSticker.round_start_time)
		return FALSE
	if(players_amt < min_players)
		return FALSE
	var/datum/game_mode/chaosmode/C = SSticker.mode
	if(istype(C))
		if(C.allmig)
			if(world.time > last_siege + 18 MINUTES)
				last_siege = world.time
				return TRUE

/datum/round_event_control/rogue/bloodmadness/preRunEvent()
	. = ..()
	if(. == EVENT_READY)
		priority_announce("Sun flickers!", "", 'sound/misc/bell.ogg')

/datum/round_event/rogue/bloodmadness
	announceWhen	= 1

/datum/round_event/rogue/bloodmadness/setup()
	return TRUE

/datum/round_event/rogue/bloodmadness/start()
	if(SSticker.mode)
		var/datum/game_mode/chaosmode/C = SSticker.mode
		if(istype(C))
			C.skeletons = TRUE
			addtimer(CALLBACK(C, /datum/game_mode/chaosmode/.proc/reset_skeletons), rand(4 MINUTES, 8 MINUTES))
			for(var/mob/dead/observer/O in GLOB.player_list)
				addtimer(CALLBACK(O, /mob/dead/observer/.proc/horde_respawn), 1)
	return

/datum/status_effect/blood_madness  
  id = "blood_madness"  
  duration = 300
  tick_interval = 10
  alert_type = /atom/movable/screen/alert/status_effect/blood_madness  

/datum/status_effect/blood_madness/tick()  
	var/mob/living/carbon/human/H = owner
    var/mob/living/targeted
	if(prob(5))
    	for(targeted in view(1, H))
    		H.UnarmedAttack(targeted)  
		to_chat(H, "<span class='warning'>THE SUN WHISPERS... KILL THEM ALL.</span>")  
