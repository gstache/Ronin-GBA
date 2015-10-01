
//{{BLOCK(pause_screen)

//======================================================================
//
//	pause_screen, 256x160@8, 
//	+ palette 256 entries, not compressed
//	+ 83 tiles (t|f reduced) not compressed
//	+ regular map (flat), not compressed, 32x20 
//	Total size: 512 + 5312 + 1280 = 7104
//
//	Time-stamp: 2014-10-21, 11:20:41
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSE_SCREEN_H
#define GRIT_PAUSE_SCREEN_H

#define pause_screenTilesLen 5312
extern const unsigned short pause_screenTiles[2656];

#define pause_screenMapLen 1280
extern const unsigned short pause_screenMap[640];

#define pause_screenPalLen 512
extern const unsigned short pause_screenPal[256];

#endif // GRIT_PAUSE_SCREEN_H

//}}BLOCK(pause_screen)
