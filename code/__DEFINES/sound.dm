//max channel is 1024. Only go lower from here, because byond tends to pick the first availiable channel to play sounds on
#define CHANNEL_LOBBYMUSIC 1024
#define CHANNEL_ADMIN 1023 //USED FOR MUSIC
#define CHANNEL_VOX 1022
#define CHANNEL_JUKEBOX 1021
#define CHANNEL_JUSTICAR_ARK 1020
#define CHANNEL_HEARTBEAT 1019 //sound channel for heartbeats
#define CHANNEL_AMBIENCE 1018
#define CHANNEL_BUZZ 1017
#define CHANNEL_BICYCLE 1016
#define CHANNEL_RAIN 1015
#define CHANNEL_MUSIC 1014
#define CHANNEL_CMUSIC 1013
#define CHANNEL_WEATHER 1012

//THIS SHOULD ALWAYS BE THE LOWEST ONE!
//KEEP IT UPDATED

#define CHANNEL_HIGHEST_AVAILABLE 1011

#define SOUND_MINIMUM_PRESSURE 10
#define FALLOFF_SOUNDS 1


//Ambience types

#define GENERIC list('sound/blank.ogg',\
								'sound/blank.ogg',\
								'sound/blank.ogg',\
								'sound/blank.ogg',\
								'sound/blank.ogg',\
								'sound/blank.ogg')

#define HOLY list('sound/blank.ogg',\
										'sound/blank.ogg',\
										'sound/blank.ogg')

#define HIGHSEC list('sound/blank.ogg')

#define RUINS list('sound/blank.ogg',\
									'sound/blank.ogg',\
									'sound/blank.ogg',\
									'sound/blank.ogg',\
									'sound/blank.ogg')

#define ENGINEERING list('sound/blank.ogg',\
										'sound/blank.ogg')

#define MINING list('sound/blank.ogg',\
											'sound/blank.ogg',\
											'sound/blank.ogg',\
											'sound/blank.ogg')

#define MEDICAL list('sound/blank.ogg')

#define SPOOKY list('sound/blank.ogg',\
										'sound/blank.ogg')

#define SPACE list('sound/blank.ogg')

#define MAINTENANCE list('sound/blank.ogg',\
											'sound/blank.ogg' )

#define AWAY_MISSION list('sound/blank.ogg',\
									'sound/blank.ogg',\
									'sound/blank.ogg',\
									'sound/blank.ogg',\
									'sound/blank.ogg')

#define REEBE list('sound/blank.ogg')



#define CREEPY_SOUNDS list('sound/blank.ogg',\
	'sound/blank.ogg',\
	'sound/blank.ogg',\
	'sound/blank.ogg',\
	'sound/blank.ogg')


#define RAIN_IN list('sound/ambience/rainin.ogg')

#define RAIN_SEWER list('sound/ambience/rainsewer.ogg')

#define RAIN_OUT list('sound/ambience/rainout.ogg')

#define AMB_GENCAVE list('sound/ambience/cave.ogg')

#define AMB_TOWNDAY list('sound/ambience/towngen.ogg')

#define AMB_MOUNTAIN list('sound/ambience/MOUNTAIN (1).ogg',\
						'sound/ambience/MOUNTAIN (2).ogg')

#define AMB_TOWNNIGHT list('sound/ambience/townnigh.ogg')

#define AMB_BOGDAY list('sound/ambience/bogday (1).ogg',\
						'sound/ambience/bogday (2).ogg',\
						'sound/ambience/bogday (3).ogg')

#define AMB_BOGNIGHT list('sound/ambience/bognight.ogg')

#define AMB_FORESTDAY list('sound/ambience/forestday.ogg')

#define AMB_FORESTNIGHT list('sound/ambience/forestnight.ogg')

#define AMB_INGEN list('sound/ambience/indoorgen.ogg')

#define AMB_BUNKER list('sound/ambience/bunker.ogg')

#define AMB_SEWERS list('sound/ambience/sewers.ogg')

#define AMB_BASEMENT list('sound/ambience/basement.ogg')

#define AMB_JUNGLENIGHT list('sound/ambience/jungleday.ogg')

#define AMB_JUNGLEDAY list('sound/ambience/jungleday.ogg')

#define AMB_BEACH list('sound/ambience/lake (1).ogg',\
						'sound/ambience/lake (2).ogg',\
						'sound/ambience/lake (3).ogg')

#define AMB_BOAT list('sound/ambience/boat (1).ogg',\
						'sound/ambience/boat (2).ogg')

#define AMB_RIVERDAY list('sound/ambience/riverday (1).ogg',\
						'sound/ambience/riverday (2).ogg',\
						'sound/ambience/riverday (3).ogg')

#define AMB_RIVERNIGHT list('sound/ambience/rivernight (1).ogg',\
						'sound/ambience/rivernight (2).ogg',\
						'sound/ambience/rivernight (3).ogg')

#define AMB_CAVEWATER list('sound/ambience/cavewater (1).ogg',\
						'sound/ambience/cavewater (2).ogg',\
						'sound/ambience/cavewater (3).ogg')

#define AMB_CAVELAVA list('sound/ambience/cavelava (1).ogg',\
						'sound/ambience/cavelava (2).ogg',\
						'sound/ambience/cavelava (3).ogg')

//******* SPOOKED YA

#define SPOOKY_CAVE list('sound/ambience/noises/cave (1).ogg',\
						'sound/ambience/noises/cave (2).ogg',\
						'sound/ambience/noises/cave (3).ogg',\
						'sound/ambience/noises/cave (4).ogg',\
						'sound/ambience/noises/cave (5).ogg')

#define SPOOKY_NIGHT list('sound/ambience/noises/owl.ogg',\
						'sound/ambience/noises/cikada (1).ogg',\
						'sound/ambience/noises/cikada (2).ogg',\
						'sound/ambience/noises/cikada (3).ogg',\
						'sound/ambience/noises/wolf (1).ogg',\
						'sound/ambience/noises/wolf (2).ogg',\
						'sound/ambience/noises/wolf (3).ogg',\
						'sound/ambience/noises/wolf (4).ogg',\
						'sound/ambience/noises/tvar.ogg',\
						'sound/ambience/noises/growler.ogg',\
						'sound/ambience/noises/wheeze.ogg')

#define SPOOKY_BUNKER list('sound/ambience/noises/bunker (1).ogg',\
						'sound/ambience/noises/bunker (2).ogg',\
						'sound/ambience/noises/bunker (3).ogg',\
						'sound/ambience/noises/bunker (4).ogg',\
						'sound/ambience/noises/bunker (5).ogg',\
						'sound/ambience/noises/bunker (6).ogg',\
						'sound/ambience/noises/bunker (7).ogg',\
						'sound/ambience/noises/hull.ogg',\
						'sound/ambience/noises/bunker (8).ogg',\
						'sound/ambience/noises/genspooky (2).ogg',\
						'sound/ambience/noises/genspooky (3).ogg',\
						'sound/ambience/noises/genspooky (5).ogg',\
						'sound/ambience/noises/genspooky (6).ogg',\
						'sound/ambience/noises/genspooky (7).ogg',\
						'sound/ambience/noises/genspooky (8).ogg',\
						'sound/ambience/noises/genspooky (9).ogg',\
						'sound/ambience/noises/strange.ogg',\
						'sound/ambience/noises/thefuck.ogg',\
						'sound/ambience/noises/noise1.ogg',\
						'sound/ambience/noises/noise2.ogg',\
						'sound/ambience/noises/noise3.ogg',\
						'sound/ambience/noises/noise4.ogg',\
						'sound/ambience/noises/noise5.ogg',\
						'sound/ambience/noises/noise6.ogg',\
						'sound/ambience/noises/noise6.ogg')

#define SPOOKY_RATS list('sound/ambience/noises/RAT1.ogg',\
						'sound/ambience/noises/RAT2.ogg')

#define SPOOKY_FROG list('sound/ambience/noises/frog (1).ogg',\
						'sound/ambience/noises/frog (2).ogg')

#define SPOOKY_MYSTICAL list('sound/ambience/noises/mystical (1).ogg',\
						'sound/ambience/noises/mystical (2).ogg',\
						'sound/ambience/noises/mystical (3).ogg',\
						'sound/ambience/noises/mystical (4).ogg',\
						'sound/ambience/noises/mystical (5).ogg',\
						'sound/ambience/noises/mystical (6).ogg')

#define HORROR_FOREST list('sound/ambience/noises/crow.ogg',\
						'sound/ambience/noises/koshka.ogg',\
						'sound/ambience/noises/tvar.ogg',\
						'sound/ambience/noises/tvardeath.ogg',\
						'sound/ambience/noises/growler.ogg',\
						'sound/ambience/noises/birds (1).ogg',\
						'sound/ambience/noises/birds (2).ogg',\
						'sound/ambience/noises/birds (3).ogg',\
						'sound/ambience/noises/birds (4).ogg',\
						'sound/ambience/noises/birds (5).ogg',\
						'sound/ambience/noises/birds (6).ogg',\
						'sound/ambience/noises/genspooky (7).ogg',\
						'sound/ambience/noises/wheeze.ogg',\
						'sound/ambience/noises/dogs (1).ogg',\
						'sound/ambience/noises/dogs (2).ogg',\
						'sound/ambience/noises/birds (7).ogg',\
						'sound/ambience/noises/tree (1).ogg',\
						'sound/ambience/noises/tree (2).ogg',\
						'sound/ambience/noises/tree (3).ogg')

#define TOWN_AMBIENT list('sound/ambience/noises/kolokol.ogg',\
						'sound/ambience/noises/kolokol01.ogg',\
						'sound/ambience/noises/tvar.ogg',\
						'sound/ambience/noises/kolokol03.ogg',\
						'sound/ambience/noises/tvardeath.ogg',\
						'sound/ambience/noises/kolokol02.ogg',\
						'sound/ambience/noises/birds (3).ogg',\
						'sound/ambience/noises/birds (4).ogg',\
						'sound/ambience/noises/birds (5).ogg',\
						'sound/ambience/noises/birds (6).ogg',\
						'sound/ambience/noises/genspooky (5).ogg',\
						'sound/ambience/noises/genspooky (6).ogg',\
						'sound/ambience/noises/genspooky (7).ogg',\
						'sound/ambience/noises/genspooky (8).ogg',\
						'sound/ambience/noises/genspooky (9).ogg',\
						'sound/ambience/noises/wheeze.ogg',\
						'sound/ambience/noises/dogs (1).ogg',\
						'sound/ambience/noises/dogs (2).ogg',\
						'sound/ambience/noises/birds (7).ogg',\
						'sound/ambience/noises/dist_growl.ogg',\
						'sound/ambience/noises/town_moan.ogg')

#define SPOOKY_SEWER list('sound/ambience/noises/RAT1.ogg',\
						'sound/ambience/noises/RAT2.ogg',\
						'sound/ambience/noises/hole_hit (2).ogg',\
						'sound/ambience/noises/hole_hit (1).ogg',\
						'sound/ambience/noises/town_moan.ogg',\
						'sound/ambience/noises/veterok.ogg',\
						'sound/ambience/noises/scary_breath (1).ogg',\
						'sound/ambience/noises/scary_breath (2).ogg',\
						'sound/ambience/noises/scary_breath (3).ogg',\
						'sound/ambience/noises/scary_breath (4).ogg',\
						'sound/ambience/noises/genspooky (2).ogg',\
						'sound/ambience/noises/genspooky (3).ogg',\
						'sound/ambience/noises/genspooky (4).ogg',\
						'sound/ambience/noises/genspooky (5).ogg',\
						'sound/ambience/noises/genspooky (6).ogg',\
						'sound/ambience/noises/genspooky (7).ogg',\
						'sound/ambience/noises/genspooky (8).ogg',\
						'sound/ambience/noises/genspooky (9).ogg')

#define INTERACTION_SOUND_RANGE_MODIFIER 0
#define EQUIP_SOUND_VOLUME 100
#define PICKUP_SOUND_VOLUME 100
#define DROP_SOUND_VOLUME 100
#define YEET_SOUND_VOLUME 100
