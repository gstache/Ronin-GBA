#Ronin Supreme GBA

This project was part of a media-device architecture class

The objective was to build a game-boy advance(GBA) game in C, with at least three levels, a win state, a lose state, and a pause state. It had
to be designed to run on the GBA, using the architecture of that system.

The primary game logic is in main.c

The libraries necessary for direct memory access, sprite tiling, etc. are in  myLib.c

The libraries for text and characters are in text.c

the remaining .c, .h, .o, .s, and .i files are game assets, which were either .wav or .bmp files converted into C