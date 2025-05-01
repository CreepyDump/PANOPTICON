SUBSYSTEM_DEF(assets)
	name = "Assets"
	init_order = INIT_ORDER_ASSETS
	flags = SS_NO_FIRE
	var/list/cache = list()
	var/list/preload = list()

/datum/controller/subsystem/assets/Initialize(timeofday)
	for(var/type in typesof(/datum/asset))
		var/datum/asset/A = type
		if (type != initial(A._abstract))
			get_asset_datum(type)

	preload = cache.Copy() //don't preload assets generated during the round

	for(var/client/C in GLOB.clients)
		addtimer(CALLBACK(GLOBAL_PROC, .proc/getFilesSlow, C, preload, FALSE), 10)
	..()

/datum/asset/pig
	var/list/common = list()
	var/list/common_dirs = list(
		"code/statpanel/html/"
	)

/datum/asset/pig/register()
	// Crawl the directories to find files.
	for(var/path in common_dirs)
		var/list/filenames = flist(path)
		for(var/filename in filenames)
			if(copytext(filename, length(filename)) != "/") // Ignore directories.
				if(fexists(path + filename))
					common[filename] = fcopy_rsc(path + filename)
					register_asset(filename, common[filename])

/datum/asset/pig/send(client)
	send_asset_list(client, common, TRUE)
