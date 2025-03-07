/datum/status_effect/lobotomized
	id = "denom_hud"
	duration = -1
	tick_interval = 2
	alert_type = null

/datum/status_effect/lobotomized/on_apply()
	. = ..()
	applyeffect()

/datum/status_effect/lobotomized/on_remove()
	. = ..()
	remove_all()

/datum/status_effect/lobotomized/proc/applyeffect()
	owner.overlay_fullscreen("hell", /atom/movable/screen/fullscreen/proitvogaz)
	owner.overlay_fullscreen("with_helek", /atom/movable/screen/fullscreen/color_vision/red)

/datum/status_effect/lobotomized/proc/remove_all()
	owner.clear_fullscreen("hell")
	owner.clear_fullscreen("with_helek")
