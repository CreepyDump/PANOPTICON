/datum/round_event_control/bloodmadness
	name = "bloodmadness"
	typepath = /datum/round_event/bloodmadness
	weight = 12
	max_occurrences = 999
	todreq = list("dusk", "night")
	earliest_start = 2 MINUTES
	var/last_siege

/datum/round_event_control/bloodmadness/preRunEvent()
	. = ..()
	if(. == EVENT_READY)
		priority_announce("Sun flickers!", "", 'sound/panopticon/10_Weep_1.wav')

/datum/round_event/bloodmadness
	announceWhen = 1

/datum/round_event/bloodmadness/setup()
	return TRUE

/datum/round_event/bloodmadness/start()
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
    var/mob/living/targeted
	var/mob/living/carbon/human/H = owner
	if(prob(5))
		for(targeted in view(1, H))
			H.UnarmedAttack(targeted)
		to_chat(H, "<span class='warning'>THE SUN WHISPERS... KILL THEM ALL ...</span>")
