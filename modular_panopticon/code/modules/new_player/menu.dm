/atom/movable/screen/new_player
	icon = 'icons/misc/hudmenu.dmi'
	plane = ABOVE_HUD_PLANE
	layer = ABOVE_HUD_LAYER

/atom/movable/screen/new_player/selection/join_game
	name = "Join Game"
	icon_state = "unready"
	screen_loc = "LEFT+2.1,CENTER-5"

/atom/movable/screen/new_player/selection/settings
	name = "Setup"
	icon_state = "setup"
	screen_loc = "LEFT+11,CENTER-5"

/atom/movable/screen/new_player/selection/observe
	name = "Observe"
	icon_state = "observe"
	screen_loc = "LEFT+6.8,CENTER-5"


//SELECTION
/*
/atom/movable/screen/new_player/selection/New(var/desired_loc)
	color = null
	return ..()

/atom/movable/screen/new_player/selection/join_game/New()
	var/mob/new_player/player = usr
	if(GAME_STATE <= RUNLEVEL_LOBBY)
		if(player.ready)
			icon_state = "ready"
		else
			icon_state = "unready"
	else
		icon_state = "joingame"

/atom/movable/screen/new_player/selection/join_game/Click()
	var/mob/new_player/player = usr
	if(GAME_STATE <= RUNLEVEL_LOBBY)
		if(!player.ready)
			player.ready = 1
			usr.updatePig()
			to_chat(player, "<span class='info'>You are now ready.</span>")
			icon_state = "ready"
		else
			player.ready = 0
			usr.updatePig()
			to_chat(player, "<span class='info'>You are no longer ready. Coward.</span>")
			icon_state = "unready"
	else
		icon_state = "joingame"
		usr.updatePig()
		player.join_game()

/atom/movable/screen/new_player/selection/manifest/Click()
	var/mob/new_player/player = usr
	player.ViewManifest()

/atom/movable/screen/new_player/selection/observe/Click()
	var/mob/new_player/player = usr
	player.observe()

/atom/movable/screen/new_player/selection/settings/Click()
	var/mob/new_player/player = usr
	player.setupcharacter()

/atom/movable/screen/new_player/selection/changelog/Click()
	var/mob/new_player/player = usr
	player.client.changes()

/atom/movable/screen/new_player/selection/poll/Click()
	var/mob/new_player/player = usr
	player.handle_player_polling()
*/
