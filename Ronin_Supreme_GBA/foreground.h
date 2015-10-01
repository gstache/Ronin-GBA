
//{{BLOCK(foreground)

//======================================================================
//
//	foreground, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 9 tiles (t|f reduced) not compressed
//	+ regular map (flat), not compressed, 32x32 
//	Total size: 512 + 576 + 2048 = 3136
//
//	Time-stamp: 2014-10-22, 15:49:45
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_FOREGROUND_H
#define GRIT_FOREGROUND_H

#define foregroundTilesLen 576
extern const unsigned short foregroundTiles[288];

#define foregroundMapLen 2048
extern const unsigned short foregroundMap[1024];

#define foregroundPalLen 512
extern const unsigned short foregroundPal[256];

#endif // GRIT_FOREGROUND_H

//}}BLOCK(foreground)
