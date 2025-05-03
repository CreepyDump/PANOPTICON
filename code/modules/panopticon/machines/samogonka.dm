//////////////ETHANOL REFINERY/////////////////

/obj/structure/distillery
	name = "hooch distiller"
	desc = "An moonshine apparat. Turns any shrooms into alcohol."
	density = FALSE
	layer = WALL_OBJ_LAYER+0.1
	plane = AREA_PLANE
	anchored = TRUE
	icon = 'icons/panopticon/obj/samogon.dmi'
	icon_state = "samogon"

/datum/crafting_recipe/roguetown/hooch
	structurecraft = /obj/structure/distillery
	skillcraft = /datum/skill/misc/hooch
	name = "Psychick samogon"
	result = list(/obj/item/reagent_containers/glass/bottle/psychicksamogonka)
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/psychickgrib = 3,
				/obj/item/reagent_containers/glass/bottle = 1)
	craftdiff = 0

// Moonshine Distiller Object
/obj/machinery/moonshine_distiller
    name = "moonshine distiller"
    desc = "A rustic device for brewing potent moonshine. Insert ingredients, wait, and hope it doesn't explode."
    icon = 'icons/obj/kitchen.dmi' // Use an appropriate icon file
    icon_state = "distiller_off"
    density = TRUE
    anchored = TRUE
    use_power = IDLE_POWER_USE
    idle_power_usage = 10
    active_power_usage = 100
    var/list/stored_ingredients = list() // Tracks reagents added to the distiller
    var/list/recipe_list = list() // List of valid recipes
    var/is_processing = FALSE // Whether the distiller is currently working
    var/process_time = 30 SECONDS // Time it takes to process (adjustable)
    var/obj/item/reagent_containers/result_container // Holds the resulting reagents

// Initialize the distiller and define recipes
/obj/machinery/moonshine_distiller/New()
    ..()
    // Define recipes here (you can change these later)
    // Each recipe is a list with "ingredients" (reagent IDs and amounts) and "result" (reagent ID and amount)
    recipe_list = list(
        list(
            "ingredients" = list(/datum/reagent/consumable/ethanol = 10, /datum/reagent/consumable/sugar = 5, /datum/reagent/water = 10),
            "result" = list(/datum/reagent/consumable/ethanol/moonshine = 20)
        ),
        list(
            "ingredients" = list(/datum/reagent/consumable/ethanol/beer = 15, /datum/reagent/consumable/sugar = 10),
            "result" = list(/datum/reagent/consumable/ethanol/whiskey = 15)
        ),
        list(
            "ingredients" = list(/datum/reagent/consumable/ethanol = 5, /datum/reagent/fuel = 5, /datum/reagent/water = 10),
            "result" = list(/datum/reagent/consumable/ethanol/homemade_vodka = 15)
        )
    )

// Handle interaction with the distiller
/obj/machinery/moonshine_distiller/attackby(obj/item/I, mob/user, params)
    // If the user is holding a reagent container, try to add its contents to the distiller
    if(istype(I, /obj/item/reagent_containers))
        var/obj/item/reagent_containers/container = I
        if(container.reagents && container.reagents.total_volume > 0)
            // Transfer reagents from the container to the distiller
            for(var/datum/reagent/R in container.reagents.reagent_list)
                var/amount = container.reagents.get_reagent_amount(R.type)
                if(stored_ingredients[R.type])
                    stored_ingredients[R.type] += amount
                else
                    stored_ingredients[R.type] = amount
            container.reagents.clear_reagents()
            to_chat(user, "<span class='notice'>You pour the contents of [container] into [src].</span>")
            update_icon()
            return

    // If the user is holding an empty bottle, try to collect the result
    if(istype(I, /obj/item/reagent_containers/glass/bottle) && result_container)
        var/obj/item/reagent_containers/glass/bottle/B = I
        if(B.reagents.total_volume == 0) // Ensure the bottle is empty
            result_container.reagents.trans_to(B, result_container.reagents.total_volume)
            to_chat(user, "<span class='notice'>You collect the moonshine from [src] into [B].</span>")
            QDEL_NULL(result_container)
            update_icon()
            return

    return ..()

// Handle clicking the distiller to start processing
/obj/machinery/moonshine_distiller/attack_hand(mob/user)
    if(is_processing)
        to_chat(user, "<span class='warning'>[src] is already processing!</span>")
        return
    if(result_container)
        to_chat(user, "<span class='warning'>[src] already contains a finished product. Collect it first!</span>")
        return
    if(stored_ingredients.len == 0)
        to_chat(user, "<span class='warning'>[src] is empty. Add ingredients first!</span>")
        return

    to_chat(user, "<span class='notice'>You start the distilling process...</span>")
    is_processing = TRUE
    update_icon()
    use_power = ACTIVE_POWER_USE
    addtimer(CALLBACK(src, .proc/finish_processing), process_time)

// Process the ingredients and determine the result
/obj/machinery/moonshine_distiller/proc/finish_processing()
    is_processing = FALSE
    use_power = IDLE_POWER_USE
    var/success = FALSE

    // Check if the stored ingredients match any recipe
    for(var/recipe in recipe_list)
        var/list/required_ingredients = recipe["ingredients"]
        var/list/result = recipe["result"]
        if(check_recipe(required_ingredients))
            // Recipe matched! Create the result
            result_container = new /obj/item/reagent_containers/glass/bottle(src)
            for(var/R in result)
                result_container.reagents.add_reagent(R, result[R])
            success = TRUE
            break

    // If no recipe was matched, produce smoke
    if(!success)
        to_chat(world, "<span class='warning'>[src] emits a cloud of foul-smelling smoke!</span>")
        var/datum/effect_system/smoke_spread/bad/smoke = new
        smoke.set_up(5, src)
        smoke.start()

    // Clear the stored ingredients
    stored_ingredients = list()
    update_icon()

// Check if the stored ingredients match a recipe exactly
/obj/machinery/moonshine_distiller/proc/check_recipe(list/required_ingredients)
    if(stored_ingredients.len != required_ingredients.len)
        return FALSE

    for(var/R in required_ingredients)
        if(!stored_ingredients[R] || stored_ingredients[R] != required_ingredients[R])
            return FALSE

    return TRUE

// Update the distiller's icon based on its state
/obj/machinery/moonshine_distiller/update_icon()
    if(is_processing)
        icon_state = "distiller_on"
    else if(result_container)
        icon_state = "distiller_ready"
    else
        icon_state = "distiller_off"

// Define a custom reagent for moonshine (example)
/datum/reagent/consumable/ethanol/moonshine
    name = "Moonshine"
    description = "A potent homemade brew that burns going down."
    color = "#A8A8A8"
    boozepwr = 70
    taste_description = "fire and regret"

// Define another custom reagent (example)
/datum/reagent/consumable/ethanol/homemade_vodka
    name = "Homemade Vodka"
    description = "A rough, home-distilled vodka. Not for the faint of heart."
    color = "#C0C0C0"
    boozepwr = 60
    taste_description = "potatoes and pain"
