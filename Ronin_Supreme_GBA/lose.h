
//{{BLOCK(lose)

//======================================================================
//
//	lose, 256x160@8, 
//	+ palette 256 entries, not compressed
//	+ 162 tiles (t|f reduced) not compressed
//	+ regular map (flat), not compressed, 32x20 
//	Total size: 512 + 10368 + 1280 = 12160
//
//	Time-stamp: 2014-10-21, 11:52:02
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSE_H
#define GRIT_LOSE_H

#define loseTilesLen 10368
extern const unsigned short loseTiles[5184];

#define loseMapLen 1280
extern const unsigned short loseMap[640];

#define losePalLen 512
extern const unsigned short losePal[256];

#endif // GRIT_LOSE_H

//}}BLOCK(lose)
