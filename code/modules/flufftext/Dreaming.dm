var/static/list/dream_begin = list(
    "In the depths of slumber, you find yourself",
    "The dream begins as you",
    "Your consciousness drifts into",
    "Through the veil of sleep, you perceive",
    "The darkness behind your eyes transforms as"
)

var/static/list/dream_set = list(
    "in a cathedral where the walls breathe",
    "walking through endless corridors that shift and change",
    "standing in a forest of glass trees that sing",
    "floating in a void filled with whispering lights",
    "in a city where buildings twist like serpents"
)

var/static/list/dream_event = list(
    "Shadows peel themselves from the walls, dancing to an unheard rhythm",
    "Faces emerge from every surface, watching with knowing smiles",
    "Time flows backwards and forwards like a tide of broken glass",
    "Reality fractures into a thousand mirror-sharp fragments",
    "Colors bleed into sounds, and sounds take physical form"
)

var/static/list/dream_climax = list(
    "The world dissolves into a cascade of whispered secrets",
    "Everything suddenly makes perfect, terrible sense",
    "The boundaries between you and the dream begin to blur",
    "Ancient truths scratch at the edges of your understanding",
    "The fabric of the dream unravels into cosmic horror"
)

var/static/list/dream_end = list(
    "You try to scream, but your voice turns to moths",
    "The dream folds in on itself like origami made of night",
    "Reality reasserts itself, but something feels different",
    "The dream lingers like frost on a window pane"
)

/mob/living/carbon/proc/handle_dreams()
	if(prob(50) && !dreaming)
		dream()
/mob/living/carbon/proc/dream()
	set waitfor = FALSE
	var/dream = ""
	dream += pick(dream_begin) + " "
	dream += pick(dream_set) + ". "
	dream += pick(dream_event) + ". "
	dream += pick(dream_climax) + ". "
	dream += pick(dream_end) + ". "
	to_chat(src, "<span class='notice'><i>... You're dreaming about ...</i></span>")
	dreaming = TRUE
	sleep(3 SECONDS)
	to_chat(src, "<span class='notice'><i>[dream]</i></span>")
