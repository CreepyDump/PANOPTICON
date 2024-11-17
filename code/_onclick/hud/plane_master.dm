/atom/movable/screen/plane_master
	screen_loc = "CENTER"
	icon_state = "blank"
	appearance_flags = PLANE_MASTER|NO_CLIENT_COLOR
	blend_mode = BLEND_OVERLAY
	var/show_alpha = 255
	var/hide_alpha = 0

	//--rendering relay vars--
	///integer: what plane we will relay this planes render to
	var/render_relay_plane = RENDER_PLANE_MASTER
	///bool: Whether this plane should get a render target automatically generated
	var/generate_render_target = TRUE
	///integer: blend mode to apply to the render relay in case you dont want to use the plane_masters blend_mode
	var/blend_mode_override
	///reference: current relay this plane is utilizing to render
	var/atom/movable/render_plane_relay/relay

/atom/movable/screen/plane_master/proc/Show(override)
	alpha = override || show_alpha

/atom/movable/screen/plane_master/proc/Hide(override)
	alpha = override || hide_alpha

//Why do plane masters need a backdrop sometimes? Read https://secure.byond.com/forum/?post=2141928
//Trust me, you need one. Period. If you don't think you do, you're doing something extremely wrong.
/atom/movable/screen/plane_master/proc/backdrop(mob/mymob)

/atom/movable/screen/plane_master/openspace
	name = "open space plane master"
	plane = OPENSPACE_BACKDROP_PLANE
	appearance_flags = PLANE_MASTER
	blend_mode = BLEND_MULTIPLY
	alpha = 255

/atom/movable/screen/plane_master/openspace/backdrop(mob/mymob)
	filters = list()
	add_filter("first_stage_openspace", 1, drop_shadow_filter(color = "#04080FAA", size = -10))
	add_filter("second_stage_openspace", 2, drop_shadow_filter(color = "#04080FAA", size = -15))
	add_filter("third_stage_openspace", 3, drop_shadow_filter(color = "#04080FAA", size = -20))
	add_filter("fourth_stage_openspace", 4, gauss_blur_filter(size = 1))

/atom/movable/screen/plane_master/osreal
	name = "open space plane master real"
	plane = OPENSPACE_PLANE
	appearance_flags = PLANE_MASTER

/atom/movable/screen/plane_master/osreal/backdrop(mob/mymob)
	filters = list()
	filters += GAUSSIAN_BLUR(1)

/atom/movable/screen/plane_master/proc/outline(_size, _color)
	filters += filter(type = "outline", size = _size, color = _color)

/atom/movable/screen/plane_master/proc/shadow(_size, _border, _offset = 0, _x = 0, _y = 0, _color = "#04080FAA")
	filters += filter(type = "drop_shadow", x = _x, y = _y, color = _color, size = _size, offset = _offset)

/atom/movable/screen/plane_master/proc/clear_filters()
	filters = list()

/atom/movable/screen/plane_master/floor
	name = "floor plane master"
//	screen_loc = "CENTER-2"
	plane = FLOOR_PLANE
	appearance_flags = PLANE_MASTER
	blend_mode = BLEND_OVERLAY

/atom/movable/screen/plane_master/floor/backdrop(mob/mymob)
	filters = list()
	if(istype(mymob) && mymob.eye_blurry)
		filters += GAUSSIAN_BLUR(CLAMP(mymob.eye_blurry*0.1,0.6,3))

/atom/movable/screen/plane_master/game_world
	name = "game world plane master"
//	screen_loc = "CENTER-2"
	plane = GAME_PLANE
	appearance_flags = PLANE_MASTER //should use client color
	blend_mode = BLEND_OVERLAY

/atom/movable/screen/plane_master/game_world/backdrop(mob/mymob)
	filters = list()
	if(!istype(src, /obj/structure/panopticon/noshadow/road))
		if(!istype(src, /obj/effect/turf_decal))
			add_filter("AO", 1, GENERAL_AMBIENT_OCCLUSION1)
			add_filter("AO2", 2, GENERAL_AMBIENT_OCCLUSION2)
			add_filter("AO3", 3, GENERAL_AMBIENT_OCCLUSION3)
			add_filter("AO4", 4, GENERAL_AMBIENT_OCCLUSION4)
	if(istype(mymob) && mymob.eye_blurry)
		filters += GAUSSIAN_BLUR(CLAMP(mymob.eye_blurry*0.1,0.6,3))
	if(istype(mymob))
		if(isliving(mymob))
			var/mob/living/L = mymob
			if(L.has_status_effect(/datum/status_effect/buff/druqks))
				filters += filter(type="ripple",x=80,size=50,radius=0,falloff = 1)
				var/F1 = filters[filters.len]
				animate(F1, size=50, radius=480, time=4, loop=-1, flags=ANIMATION_PARALLEL)
				filters += filter(type="color", color = list(0,0,1,0, 0,1,0,0, 1,0,0,0, 0,0,0,1, 0,0,0,0))
				F1 = filters[filters.len-1]
				animate(F1, size=50, radius=480, time=10, loop=-1, flags=ANIMATION_PARALLEL)
//			if(L.has_status_effect(/datum/status_effect/buff/weed))
//				filters += filter(type="bloom",threshold=rgb(255, 128, 255),size=5,offset=5)

/atom/movable/screen/plane_master/byondlight
	name = "byond lighting master"
//	screen_loc = "CENTER-2"
	plane = BYOND_LIGHTING_PLANE
	appearance_flags = PLANE_MASTER

/atom/movable/screen/plane_master/byondlight/proc/shadowblack()
	filters = list()
	filters += filter(type = "drop_shadow", x = 2, y = 2, color = "#04080FAA", size = 5, offset = 5)


/atom/movable/screen/plane_master/lighting
	name = "lighting plane master"
	plane = LIGHTING_PLANE
	blend_mode = BLEND_MULTIPLY
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/atom/movable/screen/plane_master/lighting/Initialize()
	. = ..()
	filters += filter(type="alpha", render_source = EMISSIVE_RENDER_TARGET, flags = MASK_INVERSE)
	filters += filter(type="alpha", render_source = EMISSIVE_UNBLOCKABLE_RENDER_TARGET, flags = MASK_INVERSE)
	filters += filter(type="alpha", render_source = O_LIGHTING_VISUAL_RENDER_TARGET, flags = MASK_INVERSE)

/atom/movable/screen/plane_master/parallax
	name = "parallax plane master"
//	screen_loc = "CENTER-2"
	plane = PLANE_SPACE_PARALLAX
	blend_mode = BLEND_MULTIPLY
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/atom/movable/screen/plane_master/parallax_white
	name = "parallax whitifier plane master"
//	screen_loc = "CENTER-2"
	plane = PLANE_SPACE

/atom/movable/screen/plane_master/lighting/backdrop(mob/mymob)
	mymob.overlay_fullscreen("lighting_backdrop_lit", /atom/movable/screen/fullscreen/lighting_backdrop/lit)
	mymob.overlay_fullscreen("lighting_backdrop_unlit", /atom/movable/screen/fullscreen/lighting_backdrop/unlit)

/atom/movable/screen/plane_master/camera_static
	name = "camera static plane master"
	plane = CAMERA_STATIC_PLANE
	appearance_flags = PLANE_MASTER
	blend_mode = BLEND_OVERLAY

/atom/movable/screen/plane_master/indoor_mask
	plane = INDOOR_PLANE
	mouse_opacity = 0
	render_target = "*rainzone"
	appearance_flags = PLANE_MASTER

/atom/movable/screen/plane_master/weather
	plane = WEATHER_PLANE
	mouse_opacity = 0
	appearance_flags = PLANE_MASTER

/atom/movable/screen/plane_master/game_world_fov_hidden
	name = "game world fov hidden plane master"
	plane = GAME_PLANE_FOV_HIDDEN
	appearance_flags = PLANE_MASTER
	blend_mode = BLEND_OVERLAY

/atom/movable/screen/plane_master/game_world_fov_hidden/backdrop(mob/mymob)
	filters = list()
	if(istype(mymob) && mymob.client && mymob.client.prefs && mymob.client.prefs.ambientocclusion)
		filters += AMBIENT_OCCLUSION
	if(istype(mymob) && mymob.eye_blurry)
		filters += GAUSSIAN_BLUR(CLAMP(mymob.eye_blurry*0.1,0.6,3))
	if(istype(mymob))
		if(isliving(mymob))
			var/mob/living/L = mymob
			if(L.has_status_effect(/datum/status_effect/buff/druqks))
				filters += filter(type="ripple",x=80,size=50,radius=0,falloff = 1)
				var/F1 = filters[filters.len]
				filters += filter(type="color", color = list(0,0,1,0, 0,1,0,0, 1,0,0,0, 0,0,0,1, 0,0,0,0))
				F1 = filters[filters.len-1]
				animate(F1, size=50, radius=480, time=10, loop=-1, flags=ANIMATION_PARALLEL)
	filters += filter(type = "alpha", render_source = FIELD_OF_VISION_BLOCKER_RENDER_TARGET, flags = MASK_INVERSE)

/atom/movable/screen/plane_master/game_world_above
	name = "above game world plane master"
	plane = GAME_PLANE_UPPER
	appearance_flags = PLANE_MASTER
	blend_mode = BLEND_OVERLAY

/atom/movable/screen/plane_master/game_world_above/backdrop(mob/mymob)
	filters = list()
	if(istype(mymob) && mymob.client && mymob.client.prefs && mymob.client.prefs.ambientocclusion)
		filters += AMBIENT_OCCLUSION
	if(istype(mymob) && mymob.eye_blurry)
		filters += GAUSSIAN_BLUR(CLAMP(mymob.eye_blurry*0.1,0.6,3))
	if(istype(mymob))
		if(isliving(mymob))
			var/mob/living/L = mymob
			if(L.has_status_effect(/datum/status_effect/buff/druqks))
				filters += filter(type="ripple",x=80,size=50,radius=0,falloff = 1)
				var/F1 = filters[filters.len]
				filters += filter(type="color", color = list(0,0,1,0, 0,1,0,0, 1,0,0,0, 0,0,0,1, 0,0,0,0))
				F1 = filters[filters.len-1]
				animate(F1, size=50, radius=480, time=10, loop=-1, flags=ANIMATION_PARALLEL)

/atom/movable/screen/plane_master/field_of_vision_blocker
	name = "field of vision blocker plane master"
	plane = FIELD_OF_VISION_BLOCKER_PLANE
	render_target = FIELD_OF_VISION_BLOCKER_RENDER_TARGET
	mouse_opacity = 0
	appearance_flags = PLANE_MASTER

/atom/movable/screen/plane_master/o_light_visual
	name = "overlight light visual plane master"
	layer = O_LIGHTING_VISUAL_LAYER
	plane = O_LIGHTING_VISUAL_PLANE
	render_target = O_LIGHTING_VISUAL_RENDER_TARGET
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	blend_mode = BLEND_MULTIPLY
