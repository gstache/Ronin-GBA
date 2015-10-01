#include "myLib.h"
#include "text.h"
#include "victory.h"
#include "far_bg.h"
#include "pause_screen.h"
#include "title.h"
#include "lose.h"
#include "far_bg_1.h"
#include "foreground.h"
#include "Taco_Sprites.h"
#include "Brocolli.h"
#include "victory_song.h"
#include "Swords_Clashing.h"
#include "Sword_Swing.h"
#include "super_slice.h"
#include "power_up.h"
#include "Kung_Fu.h"
#include "game_loop.h"
#include "RoundOne.h"
#include "RoundTwo.h"
#include "RoundThree.h"

unsigned int buttons;
unsigned int oldButtons;

int BG_hOff;
int BG_vOff;
int vOff;
int hOff;
enum {ARROWS, POWER, RUN};
tutState = ARROWS;
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
}SOUND;

SOUND soundA;
SOUND soundB;
int vbCountA;
int vbCountB;

typedef struct  
{
	int row;
	int col;
        int rdel;
        int cdel;
        int aniCounter;
        int aniState;
        int isAttack;
        int isCharge;
        int doneJump;
        int health;
        int lives;
} MOVOBJ;

MOVOBJ taco;
MOVOBJ brocolli;
OBJ_ATTR shadowOAM[128];

int bigRow, bigCol;
int collMapSize = 256;

#define ROWMASK 0xFF
#define COLMASK 0x1FF

enum {START, TUTORIAL, GAME, PAUSE, WIN, LOSE, POTATOH};
int state;
enum {ATTACK, CHARGE, PARRY};
int brocMode;
void DMANow(int channel, volatile const void* source, volatile void* destination, unsigned int control);
void hideSprites();
void start();
void initialize();
void mechanics(); void canMove(int attackCount); void charging(); void release(); void contactHandler (); void quickStrike();
void game(); void potatoh();
void tutorial();
void pause();
void win();
void lose();
void drawGameScreen();
void drawTutrorialScreen();
void drawPauseScreen();
void drawWinScreen(); void drawBlackScreen();
void drawLoseScreen();
void drawStartScreen(); void drawHealthBars();
void controlDrawTaco(); void drawBrocolli(); void BroclliAI(); void drawPotatoh();
void setupInterrupts();
void setupSounds(); void attack(); void parry();
void playSoundA( const unsigned char* sound, int length, int frequency, int isLooping);
void playSoundB( const unsigned char* sound, int length, int frequency, int isLooping);
void muteSound();
void unmuteSound();
void stopSound(); void drawPower(); void runTutorial(); void drawArrows();
void interruptHandler(); void drawRound(int round);
void setUpGameVar();
// states used for pikachuAniState
enum {CANMOVE, ISCHARGE, RELEASE, QUICKSTRIKE};
int strikeMode;
int main()
{
	
  	initialize();
  	drawStartScreen();
  	while(1) {
  		oldButtons = buttons;
		buttons = BUTTONS;

		switch(state) {
			case START:
				start();
				break;
			case TUTORIAL:
				tutorial();
				break;
			case GAME:
				game();
				break;
			case POTATOH:
			    potatoh();
                break;
			case PAUSE:
				pause();
				break;
			case WIN:
				win();
				break;
			case LOSE:
				lose();
				break;
		}
		waitForVblank();
		vbCountA++;
		vbCountB++;
	}
	return 0;
	
}

void initialize() {
	taco.lives = 2;
	brocolli.lives = 2;
    setUpGameVar();
    setupInterrupts();
	setupSounds();
}
void setUpGameVar(){
		BG_hOff = 0;
	BG_vOff = 40;
	vOff = 0;
	hOff = 20;
	taco.row = 80;
	taco.col = 20;
	taco.cdel = 0;
	taco.rdel = 0;
	taco.aniCounter = 0;
    taco.isCharge = 0;
    taco.isAttack = 0;
    taco.aniState = 0;
    taco.doneJump = 0;
    taco.health = 100;
    brocolli.health = 100;
    brocolli.row = 80;
	brocolli.col = 130;
	brocolli.cdel = 0;
	brocolli.rdel = 0;
	brocolli.aniCounter = 0;
    brocolli.isCharge = 0;
    brocolli.isAttack = 0;
    brocolli.aniState = 0;
    brocolli.doneJump = 0;
    strikeMode = CANMOVE;
    brocMode = ATTACK;
}
void setupSounds()
{
        REG_SOUNDCNT_X = SND_ENABLED;

	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | 
                        DSA_OUTPUT_RATIO_100 | 
                        DSA_OUTPUT_TO_BOTH | 
                        DSA_TIMER0 | 
                        DSA_FIFO_RESET |
                        DSB_OUTPUT_RATIO_100 | 
                        DSB_OUTPUT_TO_BOTH | 
                        DSB_TIMER1 | 
                        DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;
}

void playSoundA( const unsigned char* sound, int length, int frequency, int isLooping) {

	
        dma[1].cnt = 0;
        vbCountA = 0;
	
        int interval = 16777216/frequency;
	
        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);
	
        REG_TM0CNT = 0;
	
        REG_TM0D = -interval;
        REG_TM0CNT = TIMER_ON;
	
        /**
         * MODIFY THIS FUNCTION
         * Store the necessary variables into your SOUND struct here so that we may recall them later.
         */
         soundA.data = sound;
         soundA.length = length;
         soundA.frequency = frequency;
         soundA.isPlaying = 1;
         soundA.loops = isLooping;
         soundA.duration = ((60*length)/frequency) - ((length/frequency)*3)-1;
         soundA.priority = 0;
}


void playSoundB( const unsigned char* sound, int length, int frequency, int isLooping) {
		dma[1].cnt = 0;
        dma[2].cnt = 0;
        vbCountB = 0;

        int interval = 16777216/frequency;

        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;
	
        REG_TM1D = -interval;
        REG_TM1CNT = TIMER_ON;
	
        /**
         * MODIFY THIS FUNCTION
         * Store the necessary variables into your SOUND struct here so that we may recall them later.
         */
         soundB.data = sound;
         soundB.length = length;
         soundB.frequency = frequency;
         soundB.isPlaying = 1;
         soundB.loops = isLooping;
         soundB.duration = ((60*length)/frequency) - ((length/frequency)*3)-1;
         soundB.priority = 1;

}

void interruptHandler()
{
	REG_IME = 0;
	if(REG_IF & INT_VBLANK)
	{
        if( vbCountA >= soundA.duration){
        	REG_TM0CNT = 0;
        	dma[1].cnt = 0;
        	vbCountA = 0;
        
        }
        if (vbCountB >= soundB.duration) {
        	REG_TM1CNT = 0;
        	dma[2].cnt = 0;
        	vbCountB = 0;
        	if (soundB.loops) {
        		playSoundB(soundB.data, soundB.length, soundB.frequency, soundB.loops);
        	}
        }

		REG_IF = INT_VBLANK; 
	}

	REG_IME = 1;
}

void muteSound()
{
    //ADD CODE HERE

    REG_SOUNDCNT_X = (~SND_ENABLED) & REG_SOUNDCNT_X;

}

void unmuteSound()
{
    //ADD CODE HERE
     REG_SOUNDCNT_X = SND_ENABLED | REG_SOUNDCNT_X;

}

void pauseSound()
{
	//ADD CODE HERE
	REG_TM1CNT = 0;
	REG_TM0CNT = 0;

}

void unpauseSound()
{
	//ADD CODE HERE
    REG_TM1CNT = TIMER_ON;
	REG_TM0CNT = TIMER_ON;
}

void stopSound()
{
    //ADD CODE HERE
    playSoundB(0,0,0,0);
    playSoundA(0,0,0,0);

    dma[1].cnt = 0;
    dma[2].cnt = 0;

}

void setupInterrupts()
{
	REG_IME = 0;
	REG_INTERRUPT = (unsigned int)interruptHandler;
	REG_IE |= INT_VBLANK;
	REG_DISPSTAT |= INT_VBLANK_ENABLE;
	REG_IME = 1;
}

void hideSprites()
{
 
    for (int i = 0; i < 128; ++i)
    {
    	shadowOAM[i].attr0 = ATTR0_HIDE;
    }
    DMANow(3, shadowOAM, OAM, 128 | DMA_SOURCE_INCREMENT);
}

void controlDrawTaco() {
    taco.row = taco.row - 4*taco.rdel;
    if (taco.row > 80) {
    	taco.row = 80;
    	taco.doneJump = 0;
    } if (taco.row < 40) {
    	taco.rdel = -1;
    	taco.doneJump = 1;
    } if (taco.col+30 >= brocolli.col) {
    	taco.col = brocolli.col - 30;
    } if (taco.col < 20) {
    	hOff -= 20 - taco.col;
    	brocolli.col += 20 -taco.col;
    	taco.col = 20;
    }
    
	shadowOAM[0].attr0 = ATTR0_REGULAR | ATTR0_SQUARE | ATTR0_4BPP | taco.row;
	shadowOAM[0].attr1 = ATTR1_SIZE64 | taco.col;
	shadowOAM[0].attr2 = SPRITEOFFSET16(taco.aniState*4, taco.isAttack*8);

}

void drawHealthBars() {
	for (int i = 2; i < 12; i++) {
		if (i <= taco.health / 10) {
			shadowOAM[i].attr0 = ((ATTR0_REGULAR | ATTR0_SQUARE) | (ATTR0_4BPP | 20));
			shadowOAM[i].attr1 = ATTR1_SIZE8 | 5 + (8*i);
			shadowOAM[i].attr2 = SPRITEOFFSET16(1*4, 24);
		} else {
			shadowOAM[i].attr0 = 0;
			shadowOAM[i].attr1 = 0;
			shadowOAM[i].attr2 = 0;
		}
		if (i <= brocolli.health / 10) {
			shadowOAM[i+10].attr0 = ((ATTR0_REGULAR | ATTR0_SQUARE) | (ATTR0_4BPP | 20));
			shadowOAM[i+10].attr1 = ATTR1_SIZE8 | 225 - (8*i);
			shadowOAM[i+10].attr2 = SPRITEOFFSET16(1*4, 24);
		} else {
			shadowOAM[i+10].attr0 = 0;
			shadowOAM[i+10].attr1 = 0;
			shadowOAM[i+10].attr2 = 0;
		}
	}
	for (int i = 0; i < 2; i++) {
        if (i < taco.lives) {
		    shadowOAM[i + 21].attr0 = ((ATTR0_REGULAR | ATTR0_SQUARE) | (ATTR0_4BPP | 30));
			shadowOAM[i + 21].attr1 = ATTR1_SIZE8 | 5 + (15*i);
			shadowOAM[i + 21].attr2 = SPRITEOFFSET16(1*4, 24);
	    } else {
	    	shadowOAM[i+21].attr0 = 0;
			shadowOAM[i+21].attr1 = 0;
			shadowOAM[i+21].attr2 = 0;
	    } 
	    if (i < brocolli.lives) {
	    	shadowOAM[i + 23].attr0 = ((ATTR0_REGULAR | ATTR0_SQUARE) | (ATTR0_4BPP | 30));
			shadowOAM[i + 23].attr1 = ATTR1_SIZE8 | 225 - (15*i);
			shadowOAM[i + 23].attr2 = SPRITEOFFSET16(1*4, 24);
	    } else {
	    	shadowOAM[i+23].attr0 = 0;
			shadowOAM[i+23].attr1 = 0;
			shadowOAM[i+23].attr2 = 0;
	    }
	}
}

void drawBrocolli() {
	if (brocolli.col < 30) {
		brocolli.cdel = 0;
	} if (taco.col+30 >= brocolli.col) {
    	brocolli.cdel = 0;
    }
    if (brocolli.col < 30) {
    	brocolli.col = 30;
    }
    if (brocolli.col > 200) {
    	brocolli.col = 200;
    }
    brocolli.col += brocolli.cdel;
	shadowOAM[1].attr0 = ATTR0_REGULAR | ATTR0_SQUARE | ATTR0_4BPP | brocolli.row;
	shadowOAM[1].attr1 = ATTR1_SIZE64 | brocolli.col;
	shadowOAM[1].attr2 = SPRITEOFFSET16(12, brocolli.aniState * 8);
}

void drawPotatoh() {
    brocolli.col = 100;
	shadowOAM[1].attr0 = ATTR0_REGULAR | ATTR0_SQUARE | ATTR0_4BPP | brocolli.row;
	shadowOAM[1].attr1 = ATTR1_SIZE64 | brocolli.col;
	shadowOAM[1].attr2 = SPRITEOFFSET16(8, 24);
}

void dmaShadowOAM() {
	DMANow(3, shadowOAM, OAM, 128 * 4 | DMA_SOURCE_INCREMENT);
}

void start() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		flipPage();
		state = GAME;
		setUpGameVar();
		drawRound(4);
        drawGameScreen();
        drawBrocolli();
        
    	
	}
	if (BUTTON_PRESSED(BUTTON_SELECT)) {
		flipPage();
		 state = TUTORIAL;
		 drawArrows();

		 setUpGameVar();
        
	}
	if (BUTTON_PRESSED(BUTTON_A)) {
		flipPage();
		state = POTATOH;
		setUpGameVar();
		drawRound(4);
        drawGameScreen();
        drawBrocolli();

	}
}
void drawTutrorialScreen(){
	taco.health = 100;
	brocolli.health = 100;
	stopSound();
	BG_hOff = 20;
	BG_vOff = 30;
	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
	playSoundB(game_loop, GAME_LOOPLEN /2, GAME_LOOPFREQ, 1);
	    REG_BG0CNT = CBB(0) | SBB(31) | BG_SIZE0 | COLOR256 | 1;
	    REG_BG1CNT = CBB(1) | SBB(24) | BG_SIZE0 | COLOR256 | 0;
	    
        loadPalette(far_bgPal);
    	DMANow(3, far_bg_1Tiles, &CHARBLOCKBASE[0], far_bgTilesLen/2 | DMA_SOURCE_INCREMENT);
    	DMANow(3, far_bg_1Map, &SCREENBLOCKBASE[31], far_bgMapLen/2 | DMA_SOURCE_INCREMENT);
    	DMANow(3, foregroundTiles, &CHARBLOCKBASE[1], foregroundTilesLen/2 | DMA_SOURCE_INCREMENT);
    	DMANow(3, foregroundMap, &SCREENBLOCKBASE[24], foregroundMapLen/2 | DMA_SOURCE_INCREMENT);
    	DMANow(3, Taco_SpritesPal, SPRITE_PALETTE, Taco_SpritesPalLen | DMA_SOURCE_INCREMENT);
        DMANow(3, Taco_SpritesTiles, &CHARBLOCKBASE[4], Taco_SpritesTilesLen  | DMA_SOURCE_INCREMENT);
	    hideSprites();
	    controlDrawTaco();
	    
    	REG_BG0HOFS = BG_hOff;
        REG_BG0VOFS = BG_vOff;
        REG_BG1HOFS = hOff;
        REG_BG1VOFS = vOff;

}

void drawGameScreen() {
	taco.health = 100;
	brocolli.health = 100;
	stopSound();
	BG_hOff = 20;
	BG_vOff = 30;
	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
	playSoundB(game_loop, GAME_LOOPLEN /2, GAME_LOOPFREQ, 1);
	    REG_BG0CNT = CBB(0) | SBB(31) | BG_SIZE0 | COLOR256 | 1;
	    REG_BG1CNT = CBB(1) | SBB(24) | BG_SIZE0 | COLOR256 | 0;
	    
        loadPalette(far_bgPal);
    	DMANow(3, far_bgTiles, &CHARBLOCKBASE[0], far_bgTilesLen/2 | DMA_SOURCE_INCREMENT);
    	DMANow(3, far_bgMap, &SCREENBLOCKBASE[31], far_bgMapLen/2 | DMA_SOURCE_INCREMENT);
    	DMANow(3, foregroundTiles, &CHARBLOCKBASE[1], foregroundTilesLen/2 | DMA_SOURCE_INCREMENT);
    	DMANow(3, foregroundMap, &SCREENBLOCKBASE[24], foregroundMapLen/2 | DMA_SOURCE_INCREMENT);
    	DMANow(3, Taco_SpritesPal, SPRITE_PALETTE, Taco_SpritesPalLen | DMA_SOURCE_INCREMENT);
        DMANow(3, Taco_SpritesTiles, &CHARBLOCKBASE[4], Taco_SpritesTilesLen  | DMA_SOURCE_INCREMENT);
	    hideSprites();
	    controlDrawTaco();
	    
    	REG_BG0HOFS = BG_hOff;
        REG_BG0VOFS = BG_vOff;
        REG_BG1HOFS = hOff;
        REG_BG1VOFS = vOff;
}

void potatoh(){
	if (BUTTON_PRESSED(BUTTON_START)) {
		hideSprites();
		drawPauseScreen();
	}
    controlDrawTaco();
    drawPotatoh();
    mechanics();
    contactHandler();
    drawHealthBars();
    dmaShadowOAM();
}

void game(){
	if (BUTTON_PRESSED(BUTTON_START)) {
		hideSprites();
		drawPauseScreen();
	}
    controlDrawTaco();
    drawBrocolli();
    mechanics();
    BroclliAI();
    contactHandler();
    drawHealthBars();
    dmaShadowOAM();
}

void drawRound(int round) {
	DMANow(3, &PALETTE[0],&SCREENBLOCKBASE[31], far_bgMapLen/2 | DMA_SOURCE_FIXED);
	DMANow(3, &PALETTE[0], &SCREENBLOCKBASE[31], far_bgMapLen/2 | DMA_SOURCE_FIXED);
	REG_DISPCTL = MODE4 | BG2_ENABLE;
	buttons = BUTTONS;
	loadPalette(titlePal);
		
	if (round == 4) {
		drawBackgroundImage4(RoundOneBitmap);
	} if (round == 3) {
		drawBackgroundImage4(RoundTwoBitmap);
	} if (round == 2) {
		drawBackgroundImage4(RoundThreeBitmap);
	}
	int i = 0;
	while (i < 800) {
		waitForVblank();
		i++;
	} 
}

void contactHandler (){
	//initial condition:: they are in contact distance (short)
	if (taco.col+40 >= brocolli.col) {
        //case 1:: both are attacking (no damage)
        if (taco.isAttack == 1 && brocolli.isAttack) {
        	dma[1].cnt = 0;
        	playSoundA(Swords_Clashing, SWORDS_CLASHINGLEN, SWORDS_CLASHINGFREQ, 0);
    	   	brocolli.aniCounter = 0;
    	   	brocMode = PARRY;
    	   	taco.col -= 15;

        } 
        // case 2:: taco hits, brocolli doesnt
        else if (taco.isAttack == 1 && !brocolli.isAttack) {
    	   	brocolli.aniCounter = 0;
    	   	brocMode = PARRY;
    	   	brocolli.col += 10;
    	   	brocolli.health -= 1;
        }
        // case 3:: brocolli hits, taco doesnt
        else if (!taco.isAttack && brocolli.isAttack) {
        	taco.col -= 10;
        	taco.health -= 10;
        	brocolli.aniCounter = 0;
        	brocMode = PARRY;
        }
        // case 4:: broccoli hits charging taco
        else if (strikeMode == ISCHARGE && brocolli.isAttack) {
        	taco.col -= 15;
        	strikeMode = CANMOVE;
        	taco.health -= 20;
        	brocolli.aniCounter = 0;
        	brocMode = PARRY;
        }
        // case 5:: charged taco hits broccoli (short range)
        else if (strikeMode == RELEASE){
        	if (taco.aniCounter > 30) {
        		brocolli.health -= 30;
        	} else {
            	brocolli.health -= taco.aniCounter;
            }
            brocolli.col += 10;
            brocolli.aniCounter = 0;
            brocMode = PARRY;
        }   
    }
}

void BroclliAI() {
    switch (brocMode) {
    	case ATTACK:
    	    attack();
    	    break;
    	case PARRY:
    	    parry();
    }
}

void parry() {
	brocolli.isAttack = 0;
     brocolli.aniCounter++;
    brocolli.cdel = 3;
    if (brocolli.aniCounter > 20) {
    	brocMode = ATTACK;
    	brocolli.aniCounter = 0;
    } if (brocolli.col > 150) {
    	brocolli.cdel = 0;
    }
    
}

void attack() {
	brocolli.isAttack = 0;
	brocolli.aniCounter++;
    brocolli.cdel = -1;
    if (brocolli.aniCounter % 7 == 0) {
        brocolli.aniState++;
    }
    if (brocolli.aniState > 1) {
    	brocolli.aniState = 0;
   
    } 
    if (taco.col + 40 >= brocolli.col) {
    	brocolli.cdel = 0;
    	brocolli.aniState = 3;
    	brocolli.isAttack = 1;
    	brocMode = PARRY;
    
    }
}

void drawPauseScreen() {
	REG_DISPCTL = REG_DISPCTL & (~SPRITE_ENABLE);
	state = PAUSE;
	REG_DISPCTL = REG_DISPCTL & (~BG1_ENABLE);
		BG_vOff = 0;
		BG_hOff = 0;
		DMANow(3, &PALETTE[0], &SCREENBLOCKBASE[31], far_bgMapLen | DMA_SOURCE_FIXED);
		DMANow(3, pause_screenTiles, &CHARBLOCKBASE[0], pause_screenTilesLen/2 | DMA_SOURCE_INCREMENT);
    	DMANow(3, pause_screenMap, &SCREENBLOCKBASE[31], pause_screenMapLen/2 | DMA_SOURCE_INCREMENT);
    	REG_BG0VOFS = 0;
}

void drawWinScreen() {
	state = WIN;
		REG_DISPCTL = REG_DISPCTL & (~BG1_ENABLE) & (~SPRITE_ENABLE);
		stopSound();
		dma[2].cnt = 0;
		playSoundA(victory_song, VICTORY_SONGLEN * 2, VICTORY_SONGFREQ, 0);
		REG_BG0VOFS = 0;
		BG_vOff = 0;
		DMANow(3, &PALETTE[0], &SCREENBLOCKBASE[31], far_bgMapLen | DMA_SOURCE_FIXED);
		DMANow(3, victoryTiles, &CHARBLOCKBASE[0], victoryTilesLen/2 | DMA_SOURCE_INCREMENT);
    	DMANow(3, victoryMap, &SCREENBLOCKBASE[31], victoryMapLen/2 | DMA_SOURCE_INCREMENT);
    	REG_BG0VOFS = 0;
}

void mechanics() {
	int attackCount = 0;
	if (taco.health <= 0) {
		taco.lives--;
		if (taco.lives == 0) {
			state = LOSE;
		    stopSound();
		    drawLoseScreen();
		}
		else {
			drawRound(taco.lives+brocolli.lives);
			setUpGameVar();
			drawGameScreen();
		}
	} if (brocolli.health <= 0) {
		brocolli.lives--;
		if (brocolli.lives == 0) {
			state = WIN;
		    stopSound();
		    drawWinScreen();
		}
		else {
			drawRound(taco.lives+brocolli.lives);
			setUpGameVar();
			drawGameScreen();
		}
	}
	switch(strikeMode) {
		case CANMOVE:
		    canMove(attackCount);
		    break;
		case ISCHARGE:
		    charging();
		    break;
		case RELEASE:
		    release();
		    break;
		case QUICKSTRIKE:
		    quickStrike();
		    break;
	}
    //REG_BG0HOFS = BG_hOff;
}

void release() {
	taco.aniCounter++;
	if (taco.aniCounter%11 ==0) {
         strikeMode = CANMOVE;

	}
}

void charging() {
	if (BUTTON_HELD(BUTTON_B)) {
		taco.aniCounter++;
		if (taco.aniCounter%7 ==0) {
			taco.aniState++;
			if(taco.aniState > 2) {
				taco.aniState = 0;
			}
		}
	} else {

		playSoundA(super_slice, SUPER_SLICELEN, SUPER_SLICEFREQ,0);
		strikeMode = RELEASE;
		taco.col += 15;
		taco.isAttack = 3;
		taco.aniState = 0;
	}
}

void quickStrike(){
	taco.aniCounter++;
    if(BUTTON_HELD(BUTTON_LEFT)) {
		taco.col--;
		taco.aniCounter++;
		if (taco.col < 20) {
			taco.col++;
			hOff--;
			if ((hOff - 1) % 20 == 0) {
			    BG_hOff--;
		    }
		}
		 if (taco.aniCounter % 10 == 0) {
			taco.aniState++;
			if (taco.aniState > 2) {
				taco.aniState = 0;
			}
		}
	} if (BUTTON_HELD(BUTTON_RIGHT)) {
		taco.col++;
		taco.aniCounter++;
		if (taco.col > 100) {
			taco.col--;
			hOff++;
			if ((hOff + 1) % 20 == 0) {
			    BG_hOff++;
		    }
		}
        if (taco.aniCounter % 10 == 0) {
			taco.aniState++;
			if (taco.aniState > 2) {
				taco.aniState = 0;
			}
		}
		
	} if (taco.aniCounter > 10) {
		strikeMode = CANMOVE;
		taco.isAttack = 0;
	}

}

void canMove(int attackCount) {
	taco.isAttack = 0;
	if (taco.isAttack) {
		attackCount++;
		if (attackCount > 20) {
			taco.isAttack = 0;
		}
	}
	if(BUTTON_HELD(BUTTON_LEFT)) {
		taco.col--;
		taco.aniCounter++;
		if (taco.col < 20) {
			taco.col++;
			hOff--;
			if ((hOff - 1) % 20 == 0) {
			    BG_hOff--;
		    }
		}
		 if (taco.aniCounter % 10 == 0) {
			taco.aniState++;
			if (taco.aniState > 2) {
				taco.aniState = 0;
			}
		}
	} if (BUTTON_HELD(BUTTON_RIGHT)) {
		taco.col++;
		taco.aniCounter++;
		if (taco.col > 100) {
			taco.col--;
			hOff++;
			if ((hOff + 1) % 20 == 0) {
			    BG_hOff++;
		    }
		}
        if (taco.aniCounter % 10 == 0) {
			taco.aniState++;
			if (taco.aniState > 2) {
				taco.aniState = 0;
			}
		}
		
	} if (BUTTON_PRESSED(BUTTON_UP)) {
		taco.rdel = 1;
		if (taco.doneJump) {
			taco.rdel = -1;
		}
	} if (BUTTON_PRESSED(BUTTON_A)) {
		taco.isAttack = 1;
		if (dma[1].cnt == 0) {
		    playSoundA(Sword_Swing, SWORD_SWINGLEN / 2, SWORD_SWINGFREQ, 0);
		}
		taco.aniCounter = 0;
		strikeMode = QUICKSTRIKE;
	} if (BUTTON_HELD(BUTTON_B)) {
		taco.isAttack = 2;
		taco.aniCounter = 0;
        strikeMode = ISCHARGE;
        //playSoundB(power_up, POWER_UPLEN / 20, POWER_UPFREQ, 0);
    } else if (!(BUTTON_HELD(BUTTON_LEFT)||BUTTON_HELD(BUTTON_RIGHT))) {
    	taco.aniState = 0;
    }
    REG_BG1HOFS = hOff;
    REG_BG1VOFS = vOff;
    REG_BG0HOFS = BG_hOff;
    REG_BG0VOFS = BG_vOff;
}

void tutorial(){
	switch(tutState) {
		case ARROWS:
		    waitForVblank();
            if(BUTTON_PRESSED(BUTTON_START)) {
            	tutState = POWER;
            	drawPower();
            	break;
            }
        case POWER:
             waitForVblank();
             if(BUTTON_PRESSED(BUTTON_START)) {
            	tutState = RUN;
            	drawTutrorialScreen();
            	BG_vOff = 0;
            	BG_hOff = 0;
            	break;
            }
        case RUN:
            runTutorial();
             if(BUTTON_PRESSED(BUTTON_START)) {
            	state = START;
            	drawStartScreen();
            	break;
            }
	}
    
}
void runTutorial(){
    mechanics();
    controlDrawTaco();
    dmaShadowOAM();
}
void drawPower(){
	drawBlackScreen();
		    drawString4(40,20, "Press and hold B for a POWER STRIKE", 3);
		    drawString4(60, 10, "You are vulnerable while charging", 3);
		    drawString4(100, 40, "Press Enter to Continue", 3);
}

void drawArrows(){
	drawBlackScreen();
		    drawString4(40,20, "Press Left and Right Arrows to move", 3);
		    drawString4(60, 10, "Press A for quick strike, and to block", 3);
		    drawString4(100, 40, "Press Enter to Continue", 3);
}
void drawBlackScreen(){
	DMANow(3, &PALETTE[0],&SCREENBLOCKBASE[31], far_bgMapLen/2 | DMA_SOURCE_FIXED);
	REG_DISPCTL = MODE4 | BG2_ENABLE;
	buttons = BUTTONS;
	loadPalette(titlePal);
	DMANow(3, &PALETTE[0],  videoBuffer, ((240 * 160)/2) | DMA_SOURCE_FIXED);
    
}

void drawStartScreen() {
	state = START;
        taco.lives = 2;
        brocolli.lives = 2;
		DMANow(3, &PALETTE[0],&SCREENBLOCKBASE[31], far_bgMapLen/2 | DMA_SOURCE_FIXED);
		DMANow(3, &PALETTE[0], &SCREENBLOCKBASE[31], far_bgMapLen/2 | DMA_SOURCE_FIXED);
		REG_DISPCTL = MODE4 | BG2_ENABLE;
		buttons = BUTTONS;
		loadPalette(titlePal);
		drawBackgroundImage4(titleBitmap);
  		drawString4(100,60, "Press START for GAME", 0);
  		drawString4(120,50, "Press SELECT for TUTORIAL", 0);
  		drawString4(140,50, "Press A for POH-TAAAH-TOH", 0);
  		playSoundB(Kung_Fu, KUNG_FULEN*2, KUNG_FUFREQ, 1);
}

void pause(){
	if (BUTTON_PRESSED(BUTTON_START)) {
		state = GAME;
		drawGameScreen();
	} if (BUTTON_PRESSED(BUTTON_SELECT)) {
		drawStartScreen();
	}
}
void win(){
	if(hOff > 18) {

	} else {
		hOff++;
		hOff = hOff%20;
	}
	REG_BG0HOFS = hOff;
	 if (BUTTON_PRESSED(BUTTON_START)) {
		drawStartScreen();
	
	} if (BUTTON_PRESSED(BUTTON_SELECT)) {
		drawLoseScreen();
	}

}

void drawLoseScreen() {
	state = LOSE;
	REG_DISPCTL = REG_DISPCTL & (~BG1_ENABLE) & (~SPRITE_ENABLE);
		DMANow(3, &PALETTE[0],&SCREENBLOCKBASE[31], far_bgMapLen/2 | DMA_SOURCE_FIXED);
		DMANow(3, &PALETTE[0], &SCREENBLOCKBASE[31], far_bgMapLen/2 | DMA_SOURCE_FIXED);
		DMANow(3, loseTiles, &CHARBLOCKBASE[0], loseTilesLen/2 | DMA_SOURCE_INCREMENT);
    	DMANow(3, loseMap, &SCREENBLOCKBASE[31], loseMapLen/2 | DMA_SOURCE_INCREMENT);
		hOff = 0;
		REG_BG0VOFS = 0;

}

void lose(){
	if(hOff > 18) {

	} else {
		hOff++;
		hOff = hOff%20;
	}
	REG_BG0HOFS = hOff;
	 if (BUTTON_PRESSED(BUTTON_START)) {
		drawStartScreen();
	}
}