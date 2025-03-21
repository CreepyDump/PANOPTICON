#define MUSIC_TAV list("Мясокомбинат" = 'sound/music/jukeboxes/myasokombinat.ogg', "Заговор" = 'sound/music/jukeboxes/zagovor.ogg', "Солдатами не рождаются" = 'sound/music/jukeboxes/soldat.ogg', "Эй брат любер!" = 'sound/music/jukeboxes/bratluber.ogg', "Не смешно" = 'sound/music/jukeboxes/nesmeshno.ogg', "Панк и Рок-н-ролл" = 'sound/music/jukeboxes/punknrocknroll.ogg', "Свобода" = 'sound/music/jukeboxes/svoboda.ogg', "Зоопарк" = 'sound/music/jukeboxes/zoopark.ogg', "Мы из Кронштадта" = 'sound/music/jukeboxes/kronshtadt.ogg')
#define MUSIC_BAR list("BAR TRACK 1" = 'sound/music/jukeboxes/bar1.ogg', "BAR TRACK 2" = 'sound/music/jukeboxes/bar2.ogg', "BAR TRACK 3" = 'sound/music/jukeboxes/bar3.ogg', "BAR TRACK 4" = 'sound/music/jukeboxes/bar4.ogg', "BAR TRACK 5" = 'sound/music/jukeboxes/bar5.ogg', "BAR TRACK 6" = 'sound/music/jukeboxes/bar6.ogg', "BAR TRACK 7" = 'sound/music/jukeboxes/bar7.ogg', "BAR TRACK 8" = 'sound/music/jukeboxes/bar8.ogg', "BAR TRACK 9" = 'sound/music/jukeboxes/bar9.ogg', "BAR TRACK 10" = 'sound/music/jukeboxes/bar10.ogg', "BAR TRACK 11" = 'sound/music/jukeboxes/bar11.ogg')

/datum/looping_sound/musloop
	mid_sounds = list()
	mid_length = 99999
	volume = 50
	extra_range = 5
	persistent_loop = TRUE
	var/stress2give = /datum/stressevent/music

/datum/looping_sound/musloop/on_hear_sound(mob/M)
	. = ..()
	if(stress2give)
		if(isliving(M))
			var/mob/living/L = M
			L.add_stress(stress2give)

/client/AllowUpload(filename, filelength)
	if(filelength >= 6485760)
		src << "[filename] TOO BIG. 6 MEGS OR LESS!"
		return 0
	return 1

/obj/structure/roguemachine/musicbox
	name = "wax music device"
	desc = "A marvelous device invented to record sermons. By feeding it the right kind of insects, it now brings us strange music from another realm."
	icon = 'icons/roguetown/misc/machines.dmi'
	icon_state = "music0"
	density = FALSE
	max_integrity = 0
	anchored = TRUE
	var/datum/looping_sound/musloop/soundloop
	var/curfile
	var/playing = FALSE
	var/curvol = 70
	var/list/music_tracks

/obj/structure/roguemachine/musicbox/Initialize()
	soundloop = new(list(src), FALSE)
	music_tracks = MUSIC_TAV
	. = ..()

/obj/structure/roguemachine/musicbox/attack_right(mob/user)
	. = ..()
	if(.)
		return
	if(!user.ckey)
		return
	if(playing)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	var/selection = input(user, "Select a song.", "Wax Device") as null|anything in music_tracks
	if(!selection)
		return
	if(!Adjacent(user))
		return
	playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
	playing = FALSE
	soundloop.stop()
	curfile = music_tracks[selection]


/obj/structure/roguemachine/musicbox/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
	if(!playing)
		if(curfile)
			playing = TRUE
			soundloop.mid_sounds = list(curfile)
			soundloop.cursound = null
			soundloop.volume = curvol
			soundloop.start()
	else
		playing = FALSE
		soundloop.stop()
