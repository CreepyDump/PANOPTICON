GLOBAL_LIST_INIT(shizo_rights, world.file2list('strings/shizo.txt'))

/datum/status_effect/shizophrenia
	id = "DID"
	duration = -1
	tick_interval = 2
	alert_type = null

/datum/status_effect/shizophrenia/on_apply()
	. = ..()
	ADD_TRAIT(owner, TRAIT_SCHIZO_AMBIENCE, TRAIT_GENERIC)
	owner.playsound_local(owner, 'sound/misc/scary_fon4.wav', 60)
	to_chat(owner, span_warning("I am fucking going INSANE"))

/datum/status_effect/shizophrenia/on_remove()
	owner.playsound_local(owner, 'sound/misc/scary_fon4.wav', 60)
	to_chat(owner, span_warning("I am okay now."))
	REMOVE_TRAIT(owner, TRAIT_SCHIZO_AMBIENCE, TRAIT_GENERIC)

/datum/status_effect/shizophrenia/process()
	tick()

/datum/status_effect/shizophrenia/tick(delta_time, times_fired)
	INVOKE_ASYNC(src, .proc/handle_talk)

/datum/status_effect/shizophrenia/proc/handle_talk()
	var/list/objects = list()
	if(prob(0.20))
		for(var/obj/object in view(owner))
			objects += object
		if(!length(objects))
			return
		var/message
		if(prob(66))
			var/list/ligma = GLOB.shizo_rights.Copy()
			ligma |= "[rand(0,9)][rand(0,9)][rand(0,9)][rand(0,9)]"
			message = pick(ligma)
		message = replacetext_char(message, "SRC", "[owner.real_name]")
		message = replacetext_char(message, "CAPITALIZEME", "[uppertext(owner.real_name)]")
		var/obj/speaker = pick(objects)
		if(speaker && message)
			var/speak_sound = pick(
							'sound/misc/comic1.ogg',
							'sound/misc/comic2.ogg',
							'sound/misc/comic3.ogg',
							'sound/misc/comic4.ogg',
							)
			owner.playsound_local(get_turf(owner), speak_sound, 100, 0)
			owner.Hear(message, speaker, /datum/language/common, message)
