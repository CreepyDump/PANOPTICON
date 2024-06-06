/*
	To note this is a duplicate of rt.dm
	This comes in later, so it wins out against the first in the defines. Thus this file is unticked as I don't know which you people prefer using.
*/
#ifndef TESTING
//    #define FASTLOAD
//    #define DEPLOY_TEST
//    #define ROGUEWORLD
#endif

#ifdef FASTLOAD
    #define FORCE_MAP "_maps/panopticon.json"
#else
    #define FORCE_MAP "_maps/panopticon.json"
#endif

//#define WARTIME
