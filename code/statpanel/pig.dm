/client/proc/loadDataPig()
	var/datum/asset/stuff = get_asset_datum(/datum/asset/pig)
	stuff.register()
	stuff.send(src)

/client/verb/ready()
	set hidden = 1
	set name = "doneRsc"

	pigReady = 1

/proc/generateVerbHtml(var/verbname = "", var/displayname = "", var/number = 1)
	if(number % 2)
		return {"<a href='#' class='verb dim' onclick='window.location = "byond://winset?command=[verbname]"'>[displayname]</a>"}
	return {"<a href='#' class='verb' onclick='window.location = "byond://winset?command=[verbname]"'>[displayname]</a>"}

/proc/generateVerbList(var/list/verbs = list(), var/count = 1)
	var/html = ""
	var/counter = count
	for(var/list/L in verbs)
		counter++
		html += generateVerbHtml(L[1], L[2], counter) + "$"

	return html

/client/proc/changebuttoncontent(var/idcontent = "", var/newcontent = "")
	src << output(list2params(list("[newcontent]", "[idcontent]")), "outputwindow.browser:changel")

/mob/proc/updatePig()
	set waitfor = 0
	if(!client)
		return
	if(!client.pigReady)
		return
	updateButtons()

/mob/proc/updateButtons()
	set waitfor = 0
	if(!client)
		return
	if(!client.pigReady)
		return
	client.changebuttoncontent("#status", UpdateStatus())
	client.changebuttoncontent("#emotes", UpdateEmotes())
	client.changebuttoncontent("#notes", UpdateNotes())
	client.changebuttoncontent("#prefs", UpdatePrefs())

/client/proc/lobbyPig()
	src << browse('code/statpanel/html/pig.html', "window=outputwindow.browser; size=470x250;")

/mob/verb/soundbutton()
	set hidden = 1
	set name = "button"
	client << 'sound/panopticon/uibutton.ogg'

/mob/verb/heartporcao()
	set hidden = 1
	set name = "heartpig"
	soundbutton()

/mob/proc/pigHandler()
	updatePig()
	if(!ismob(src))
		return
	var/mob/H = src
	H.UpdateStatus()

/mob/proc/startPig()
	spawn while(client)
		sleep(85)
		pigHandler()
		UpdateStatus()

/mob/proc/UpdateStatus()
	var/newOption = ""
	var/list/verbs = list()
//	verbs += list(list("ExecuteLife", "Execute Life"))
	newOption = generateVerbList(verbs)
	return {"<span class='segment1'>[newOption]</span>"}

/mob/proc/UpdateEmotes()
	var/newHTML = ""
	newHTML += "<span class='smallstat'>Emotes text</span>$"
	return newHTML

/mob/proc/UpdateNotes()
	var/newHTML = ""
	newHTML += "<span class='smallstat'>Notes Text</span>$"
	return newHTML

/mob/proc/UpdatePrefs()
	var/newHTML = ""
	newHTML += "<span class='smallstat'>Prefs Text</span>$"
	return newHTML

/mob/verb/ExecuteLife()
	for(var/client/C in clients)
		to_chat(C, "HELL YEAH!")
	to_chat(src.client, "THANKS COMICAO!")
