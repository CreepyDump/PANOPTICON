//body damage zones
#define BODY_ZONE_HEAD		"head"
#define BODY_ZONE_CHEST		"chest"
#define BODY_ZONE_L_ARM		"l_arm"
#define BODY_ZONE_R_ARM		"r_arm"
#define BODY_ZONE_L_LEG		"l_leg"
#define BODY_ZONE_R_LEG		"r_leg"

#define BODY_ZONE_PRECISE_SKULL		"skull"
#define BODY_ZONE_PRECISE_EARS		"ears"
#define BODY_ZONE_PRECISE_R_EYE		"r_eye"
#define BODY_ZONE_PRECISE_L_EYE		"l_eye"
#define BODY_ZONE_PRECISE_NOSE		"nose"
#define BODY_ZONE_PRECISE_MOUTH		"mouth"
#define BODY_ZONE_PRECISE_NECK		"neck"
#define BODY_ZONE_PRECISE_STOMACH	"stomach"
#define BODY_ZONE_PRECISE_GROIN		"groin"
#define BODY_ZONE_PRECISE_L_HAND	"l_hand"
#define BODY_ZONE_PRECISE_L_INHAND	"l_inhand"
#define BODY_ZONE_PRECISE_R_HAND	"r_hand"
#define BODY_ZONE_PRECISE_R_INHAND	"r_inhand"
#define BODY_ZONE_PRECISE_L_FOOT	"l_foot"
#define BODY_ZONE_PRECISE_R_FOOT	"r_foot"

#define BODYPART_FEATURE_HAIR "hair"
#define BODYPART_FEATURE_FACIAL_HAIR "facehair"
#define BODYPART_FEATURE_ACCESSORY "accessory"
#define BODYPART_FEATURE_FACE_DETAIL "facedetail"



//flags for the organ_flags var on /obj/item/organ
/// Synthetic organs, or cybernetic organs. Reacts to EMPs and don't deteriorate or heal
#define ORGAN_SYNTHETIC			(1<<0)
/// Frozen organs, don't deteriorate
#define ORGAN_FROZEN			(1<<1)
/// Failing organs perform damaging effects until replaced or fixed
#define ORGAN_FAILING			(1<<2)
/// Was this organ implanted/inserted/etc, if true will not be removed during species change.
#define ORGAN_EXTERNAL			(1<<3)
/// Currently only the brain - Removal of this organ immediately kills you
#define ORGAN_VITAL				(1<<4)

//wound severities for /datum/wound
/// Wounds that are either surgically induced or too minor to matter
#define WOUND_SEVERITY_SUPERFICIAL 0
/// Wounds that are minor, such as bruises and minor cuts
#define WOUND_SEVERITY_LIGHT 1
/// Wounds that are moderate, such as dislocations
#define WOUND_SEVERITY_MODERATE 2
/// Wounds that are severe, such as broken bones
#define WOUND_SEVERITY_SEVERE 3
/// Wounds that are critical and will kill rather quickly, such as torn arteries
#define WOUND_SEVERITY_CRITICAL 4
/// Wounds that are almost immediately fatal, such as a dissected aorta
#define WOUND_SEVERITY_FATAL 5
/// This wound has a zombie or werewolf infection
#define WOUND_SEVERITY_BIOHAZARD 6
