/// Duck check to see if text looks like a ckey
/proc/valid_ckey(text)
	var/static/regex/matcher = new (@"^[a-z0-9]{1,30}$")
	return matcher.Find_char(text)

/// Get the client associated with ckey text if it is currently connected
/proc/ckey2client(text)
	RETURN_TYPE(/client)
	if (valid_ckey(text))
		for (var/client/C as anything in GLOB.clients)
			if (C.ckey == text)
				return C

/// Null, or a client if thing is a client, a mob with a client, a connected ckey, or null
/proc/resolve_client(client/thing)
	RETURN_TYPE(/client)
	if (istype(thing))
		return thing
	if (!thing)
		thing = usr
	if (ismob(thing))
		var/mob/M = thing
		return M.client
	return ckey2client(thing)
