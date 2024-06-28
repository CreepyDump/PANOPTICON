/datum/disease/anthrax
	name = "Necronox"
	max_stages = 3
	spread_text = "Airborne"
	cure_text = "Regret"
	cures = list(/datum/reagent/consumable/ethanol)
	cure_chance = 10
	agent = "Siberian Plaque"
	viable_mobtypes = list(/mob/living/carbon/human)
	permeability_mod = 0.75
	desc = ""
	severity = DISEASE_SEVERITY_DANGEROUS

/datum/disease/anthrax/stage_act()
	..()
	switch(stage)
		if(2)
			affected_mob.adjust_bodytemperature(10)
			if(prob(6))
				affected_mob.emote("cough")
			if(prob(3))
				affected_mob.emote("sneeze")
			if(prob(3))
				to_chat(affected_mob, "<span class='danger'>My skin is itching.</span>")
				affected_mob.take_bodypart_damage(0,5)
		if(3)
			affected_mob.adjust_bodytemperature(20)
			if(prob(5))
				affected_mob.emote("drool")
			if(prob(10))
				affected_mob.emote("cough")
			if(prob(5))
				to_chat(affected_mob, "<span class='danger'>I AM ROTTING INSIDE!</span>")
				affected_mob.adjustOrganLoss(ORGAN_SLOT_HEART, 4, 170)
				affected_mob.updatehealth()
				affected_mob.take_bodypart_damage(0,5)
	return
