/datum/disease/anthrax
	name = "Necronox"
	max_stages = 5
	stage_prob = 3
	spread_text = "Airborne"
	cure_text = "Regret"
	cures = list(/datum/reagent/consumable/ethanol)
	cure_chance = 45
	agent = "Siberian Plaque"
	disease_flags = CURABLE
	viable_mobtypes = list(/mob/living/carbon/human)
	permeability_mod = 1
	desc = ""
	severity = DISEASE_SEVERITY_DANGEROUS
	var/sound = FALSE

/datum/disease/anthrax/stage_act()
	..()
	var/mob/living/carbon/H = affected_mob
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
			if(prob(10))
				affected_mob.emote("drool")
			if(prob(15))
				affected_mob.emote("cough")
			if(prob(5))
				to_chat(affected_mob, "<span class='danger'>I AM ROTTING INSIDE!</span>")
				affected_mob.adjustOrganLoss(ORGAN_SLOT_HEART, 4, 170)
				affected_mob.updatehealth()
				affected_mob.take_bodypart_damage(0,5)
			if(prob(3))
				affected_mob.vomit(95)
				affected_mob.adjustOrganLoss(ORGAN_SLOT_HEART, 15)
			if(prob(5))
				to_chat(affected_mob, "<span class='danger'>[pick("You feel uncomfortably hot...", "You feel so sick!", "You feel like taking off some clothes...")]</span>")
				affected_mob.adjust_bodytemperature(40)
			if(prob(2))
				to_chat(affected_mob, "<span class='danger'>I see four of everything!</span>")
				affected_mob.Dizzy(5)
			
		if(4)
			if(!sound)
				H.playsound_local(H, 'sound/health/fastbeat.ogg',40,0, channel = CHANNEL_HEARTBEAT)
				sound = TRUE
			if(prob(18))
				affected_mob.emote("drool")
			if(prob(10))
				affected_mob.emote("cough")
			if(prob(10))
				affected_mob.vomit(95)
				affected_mob.adjustOrganLoss(ORGAN_SLOT_HEART, 15)
			if(prob(18))
				to_chat(affected_mob, "<span class='danger'>I AM ROTTING INSIDE!</span>")
				affected_mob.adjustOrganLoss(ORGAN_SLOT_HEART, 4, 170)
				affected_mob.updatehealth()
				affected_mob.take_bodypart_damage(0,9)
			if(prob(3))
				to_chat(affected_mob, "<span class='warning'><i>[pick("Your stomach silently rumbles...", "Your stomach seizes up and falls limp, muscles dead and lifeless.", "My chest hurts!")]</i></span>")
				affected_mob.overeatduration = max(affected_mob.overeatduration - 100, 0)
				affected_mob.adjust_nutrition(-100)		
			if(prob(10))
				to_chat(affected_mob, "<span class='danger'>I feel air escape from my lungs painfully.</span>")
				affected_mob.adjustOxyLoss(25)
				affected_mob.emote("breathgasp")
			if(prob(15))
				to_chat(affected_mob, "<span class='danger'>[pick("You feel uncomfortably hot...", "You feel so sick!", "You feel like taking off some clothes...")]</span>")
				affected_mob.adjust_bodytemperature(40)
		if(5)
			if(prob(18))
				affected_mob.emote("drool")
			if(prob(10))
				affected_mob.emote("cough")
			if(prob(20))
				to_chat(affected_mob, "<span class='danger'>[pick("You feel uncomfortably hot...", "You feel so sick!", "You feel like taking off some clothes...")]</span>")
				affected_mob.adjust_bodytemperature(40)
