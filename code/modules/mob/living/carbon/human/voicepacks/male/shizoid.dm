/datum/voicepack/male/shizoid/get_sound(soundin, modifiers)
	var/used
	switch(soundin)
		if("agony")
			used = list('sound/vo/male/shizoid/agony (1).ogg')
		if("gasp")
			used = 'sound/vo/male/shizoid/gasp.ogg'
		if("scream")
			used = 'sound/vo/male/gen/scream (4).ogg'
		if("painmoan")
			used = list('sound/vo/male/shizoid/painmoan (1).ogg', 'sound/vo/male/shizoid/painmoan (2).ogg', 'sound/vo/male/shizoid/painmoan (3).ogg')
		if("painscream")
			used = list('sound/vo/male/shizoid/painmoan (1).ogg', 'sound/vo/male/shizoid/painmoan (2).ogg', 'sound/vo/male/shizoid/painmoan (3).ogg', 'sound/vo/male/shizoid/painscream (1).ogg')
		if("rage")
			used = list('sound/vo/male/shizoid/psychoscream1.ogg','sound/vo/male/shizoid/psychoscream2.ogg')
	if(!used)
		used = ..(soundin, modifiers)
	return used
