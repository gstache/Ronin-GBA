# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1



typedef unsigned short u16;
# 40 "myLib.h"
extern unsigned short *videoBuffer;

extern unsigned short *frontBuffer;
extern unsigned short *backBuffer;




void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, unsigned short color);
void fillScreen3(unsigned short color);
void drawImage3(const unsigned short* image, int row, int col, int height, int width);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, unsigned char colorIndex);
void fillScreen4(unsigned char color);

void drawBackgroundImage4(const unsigned short* image);
void drawImage4(const unsigned short* image, int row, int col, int height, int width);
void drawSubImage4(const unsigned short* sourceImage, int sourceRow, int sourceCol,
       int row, int col, int height, int width);

void loadPalette(const unsigned short* palette);
void initialize();

void waitForVblank();
void flipPage();
# 88 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 98 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile void* destination, unsigned int control);






typedef volatile struct
{
        volatile const void *src;
        volatile void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 137 "myLib.h"
enum {IDLE, CHASE, FLEE};
# 231 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 288 "myLib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
}OBJ_ATTR;

typedef struct {
    int row;
    int col;
} Sprite;
# 2 "main.c" 2
# 1 "text.h" 1
# 10 "text.h"
void drawChar3(int row, int col, char ch, volatile unsigned short color);
void drawString3(int row, int col, char *str,volatile unsigned short color);


void drawChar4(int row, int col, char ch,volatile unsigned char colorIndex);
void drawString4(int row, int col, char *str,volatile unsigned char colorIndex);

extern const unsigned char fontdata_6x8[12288];
# 3 "main.c" 2
# 1 "victory.h" 1
# 22 "victory.h"
extern const unsigned short victoryTiles[8992];


extern const unsigned short victoryMap[640];


extern const unsigned short victoryPal[256];
# 4 "main.c" 2
# 1 "far_bg.h" 1
# 22 "far_bg.h"
extern const unsigned short far_bgTiles[5728];


extern const unsigned short far_bgMap[1024];


extern const unsigned short far_bgPal[256];
# 5 "main.c" 2
# 1 "pause_screen.h" 1
# 22 "pause_screen.h"
extern const unsigned short pause_screenTiles[2656];


extern const unsigned short pause_screenMap[640];


extern const unsigned short pause_screenPal[256];
# 6 "main.c" 2
# 1 "title.h" 1
# 21 "title.h"
extern const unsigned short titleBitmap[19200];


extern const unsigned short titlePal[256];
# 7 "main.c" 2
# 1 "lose.h" 1
# 22 "lose.h"
extern const unsigned short loseTiles[5184];


extern const unsigned short loseMap[640];


extern const unsigned short losePal[256];
# 8 "main.c" 2
# 1 "far_bg_1.h" 1
# 22 "far_bg_1.h"
extern const unsigned short far_bg_1Tiles[5696];


extern const unsigned short far_bg_1Map[1024];


extern const unsigned short far_bg_1Pal[256];
# 9 "main.c" 2
# 1 "foreground.h" 1
# 22 "foreground.h"
extern const unsigned short foregroundTiles[288];


extern const unsigned short foregroundMap[1024];


extern const unsigned short foregroundPal[256];
# 10 "main.c" 2
# 1 "Taco_Sprites.h" 1
# 21 "Taco_Sprites.h"
extern const unsigned short Taco_SpritesTiles[16384];


extern const unsigned short Taco_SpritesPal[16];
# 11 "main.c" 2
# 1 "Brocolli.h" 1
# 21 "Brocolli.h"
extern const unsigned short BrocolliTiles[16384];


extern const unsigned short BrocolliPal[16];
# 12 "main.c" 2
# 1 "victory_song.h" 1
# 20 "victory_song.h"
extern const unsigned char victory_song[39212];
# 13 "main.c" 2
# 1 "Swords_Clashing.h" 1
# 20 "Swords_Clashing.h"
extern const unsigned char Swords_Clashing[6814];
# 14 "main.c" 2
# 1 "Sword_Swing.h" 1
# 20 "Sword_Swing.h"
extern const unsigned char Sword_Swing[1960];
# 15 "main.c" 2
# 1 "super_slice.h" 1
# 20 "super_slice.h"
extern const unsigned char super_slice[7768];
# 16 "main.c" 2
# 1 "power_up.h" 1
# 20 "power_up.h"
extern const unsigned char power_up[29376];
# 17 "main.c" 2
# 1 "Kung_Fu.h" 1
# 20 "Kung_Fu.h"
extern const unsigned char Kung_Fu[102431];
# 18 "main.c" 2
# 1 "game_loop.h" 1
# 20 "game_loop.h"
extern const unsigned char game_loop[46666];
# 19 "main.c" 2
# 1 "RoundOne.h" 1
# 21 "RoundOne.h"
extern const unsigned short RoundOneBitmap[19200];


extern const unsigned short RoundOnePal[256];
# 20 "main.c" 2
# 1 "RoundTwo.h" 1
# 21 "RoundTwo.h"
extern const unsigned short RoundTwoBitmap[19200];


extern const unsigned short RoundTwoPal[256];
# 21 "main.c" 2
# 1 "RoundThree.h" 1
# 21 "RoundThree.h"
extern const unsigned short RoundThreeBitmap[19200];


extern const unsigned short RoundThreePal[256];
# 22 "main.c" 2

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

enum {CANMOVE, ISCHARGE, RELEASE, QUICKSTRIKE};
int strikeMode;
int main()
{

   initialize();
   drawStartScreen();
   while(1) {
    oldButtons = buttons;
  buttons = *(volatile unsigned int *)0x04000130;

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
        *(volatile u16 *)0x04000084 = (1<<7);

 *(volatile u16*)0x04000082 = (1<<1) |
                        (1<<2) |
                        (3<<8) |
                        0 |
                        (1<<11) |
                        (1<<3) |
                        (3<<12) |
                        (1<<14) |
                        (1<<15);

 *(u16*)0x04000080 = 0;
}

void playSoundA( const unsigned char* sound, int length, int frequency, int isLooping) {


        dma[1].cnt = 0;
        vbCountA = 0;

        int interval = 16777216/frequency;

        DMANow(1, sound, 0x040000A0, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000102 = 0;

        *(volatile unsigned short*)0x4000100 = -interval;
        *(volatile unsigned short*)0x4000102 = (1<<7);





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

        DMANow(2, sound, 0x040000A4, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000106 = 0;

        *(volatile unsigned short*)0x4000104 = -interval;
        *(volatile unsigned short*)0x4000106 = (1<<7);





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
 *(unsigned short*)0x4000208 = 0;
 if(*(volatile unsigned short*)0x4000202 & 1 << 0)
 {
        if( vbCountA >= soundA.duration){
         *(volatile unsigned short*)0x4000102 = 0;
         dma[1].cnt = 0;
         vbCountA = 0;

        }
        if (vbCountB >= soundB.duration) {
         *(volatile unsigned short*)0x4000106 = 0;
         dma[2].cnt = 0;
         vbCountB = 0;
         if (soundB.loops) {
          playSoundB(soundB.data, soundB.length, soundB.frequency, soundB.loops);
         }
        }

  *(volatile unsigned short*)0x4000202 = 1 << 0;
 }

 *(unsigned short*)0x4000208 = 1;
}

void muteSound()
{


    *(volatile u16 *)0x04000084 = (~(1<<7)) & *(volatile u16 *)0x04000084;

}

void unmuteSound()
{

     *(volatile u16 *)0x04000084 = (1<<7) | *(volatile u16 *)0x04000084;

}

void pauseSound()
{

 *(volatile unsigned short*)0x4000106 = 0;
 *(volatile unsigned short*)0x4000102 = 0;

}

void unpauseSound()
{

    *(volatile unsigned short*)0x4000106 = (1<<7);
 *(volatile unsigned short*)0x4000102 = (1<<7);
}

void stopSound()
{

    playSoundB(0,0,0,0);
    playSoundA(0,0,0,0);

    dma[1].cnt = 0;
    dma[2].cnt = 0;

}

void setupInterrupts()
{
 *(unsigned short*)0x4000208 = 0;
 *(unsigned int*)0x3007FFC = (unsigned int)interruptHandler;
 *(unsigned short*)0x4000200 |= 1 << 0;
 *(unsigned short*)0x4000004 |= 1 << 3;
 *(unsigned short*)0x4000208 = 1;
}

void hideSprites()
{

    for (int i = 0; i < 128; ++i)
    {
     shadowOAM[i].attr0 = (2 << 8);
    }
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 | (0 << 23));
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

 shadowOAM[0].attr0 = (0 << 8) | (0 << 14) | (0 << 13) | taco.row;
 shadowOAM[0].attr1 = (3 << 14) | taco.col;
 shadowOAM[0].attr2 = (taco.aniState*4)*64+(taco.isAttack*8);

}

void drawHealthBars() {
 for (int i = 2; i < 12; i++) {
  if (i <= taco.health / 10) {
   shadowOAM[i].attr0 = (((0 << 8) | (0 << 14)) | ((0 << 13) | 20));
   shadowOAM[i].attr1 = (0 << 14) | 5 + (8*i);
   shadowOAM[i].attr2 = (1*4)*64+(24);
  } else {
   shadowOAM[i].attr0 = 0;
   shadowOAM[i].attr1 = 0;
   shadowOAM[i].attr2 = 0;
  }
  if (i <= brocolli.health / 10) {
   shadowOAM[i+10].attr0 = (((0 << 8) | (0 << 14)) | ((0 << 13) | 20));
   shadowOAM[i+10].attr1 = (0 << 14) | 225 - (8*i);
   shadowOAM[i+10].attr2 = (1*4)*64+(24);
  } else {
   shadowOAM[i+10].attr0 = 0;
   shadowOAM[i+10].attr1 = 0;
   shadowOAM[i+10].attr2 = 0;
  }
 }
 for (int i = 0; i < 2; i++) {
        if (i < taco.lives) {
      shadowOAM[i + 21].attr0 = (((0 << 8) | (0 << 14)) | ((0 << 13) | 30));
   shadowOAM[i + 21].attr1 = (0 << 14) | 5 + (15*i);
   shadowOAM[i + 21].attr2 = (1*4)*64+(24);
     } else {
      shadowOAM[i+21].attr0 = 0;
   shadowOAM[i+21].attr1 = 0;
   shadowOAM[i+21].attr2 = 0;
     }
     if (i < brocolli.lives) {
      shadowOAM[i + 23].attr0 = (((0 << 8) | (0 << 14)) | ((0 << 13) | 30));
   shadowOAM[i + 23].attr1 = (0 << 14) | 225 - (15*i);
   shadowOAM[i + 23].attr2 = (1*4)*64+(24);
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
 shadowOAM[1].attr0 = (0 << 8) | (0 << 14) | (0 << 13) | brocolli.row;
 shadowOAM[1].attr1 = (3 << 14) | brocolli.col;
 shadowOAM[1].attr2 = (12)*64+(brocolli.aniState * 8);
}

void drawPotatoh() {
    brocolli.col = 100;
 shadowOAM[1].attr0 = (0 << 8) | (0 << 14) | (0 << 13) | brocolli.row;
 shadowOAM[1].attr1 = (3 << 14) | brocolli.col;
 shadowOAM[1].attr2 = (8)*64+(24);
}

void dmaShadowOAM() {
 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4 | (0 << 23));
}

void start() {
 if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  flipPage();
  state = GAME;
  setUpGameVar();
  drawRound(4);
        drawGameScreen();
        drawBrocolli();


 }
 if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
  flipPage();
   state = TUTORIAL;
   drawArrows();

   setUpGameVar();

 }
 if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
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
 *(unsigned short *)0x4000000 = 0 | (1<<8) | (1<<9) | (1 << 12);
 playSoundB(game_loop, 46666 /2, 8000, 1);
     *(volatile unsigned short*)0x4000008 = 0 << 2 | 31 << 8 | 0<<14 | 1 << 7 | 1;
     *(volatile unsigned short*)0x400000A = 1 << 2 | 24 << 8 | 0<<14 | 1 << 7 | 0;

        loadPalette(far_bgPal);
     DMANow(3, far_bg_1Tiles, &((charblock *)0x6000000)[0], 11456/2 | (0 << 23));
     DMANow(3, far_bg_1Map, &((screenblock *)0x6000000)[31], 2048/2 | (0 << 23));
     DMANow(3, foregroundTiles, &((charblock *)0x6000000)[1], 576/2 | (0 << 23));
     DMANow(3, foregroundMap, &((screenblock *)0x6000000)[24], 2048/2 | (0 << 23));
     DMANow(3, Taco_SpritesPal, ((unsigned short*)(0x5000200)), 32 | (0 << 23));
        DMANow(3, Taco_SpritesTiles, &((charblock *)0x6000000)[4], 32768 | (0 << 23));
     hideSprites();
     controlDrawTaco();

     *(volatile unsigned short *)0x04000010 = BG_hOff;
        *(volatile unsigned short *)0x04000012 = BG_vOff;
        *(volatile unsigned short *)0x04000014 = hOff;
        *(volatile unsigned short *)0x04000016 = vOff;

}

void drawGameScreen() {
 taco.health = 100;
 brocolli.health = 100;
 stopSound();
 BG_hOff = 20;
 BG_vOff = 30;
 *(unsigned short *)0x4000000 = 0 | (1<<8) | (1<<9) | (1 << 12);
 playSoundB(game_loop, 46666 /2, 8000, 1);
     *(volatile unsigned short*)0x4000008 = 0 << 2 | 31 << 8 | 0<<14 | 1 << 7 | 1;
     *(volatile unsigned short*)0x400000A = 1 << 2 | 24 << 8 | 0<<14 | 1 << 7 | 0;

        loadPalette(far_bgPal);
     DMANow(3, far_bgTiles, &((charblock *)0x6000000)[0], 11456/2 | (0 << 23));
     DMANow(3, far_bgMap, &((screenblock *)0x6000000)[31], 2048/2 | (0 << 23));
     DMANow(3, foregroundTiles, &((charblock *)0x6000000)[1], 576/2 | (0 << 23));
     DMANow(3, foregroundMap, &((screenblock *)0x6000000)[24], 2048/2 | (0 << 23));
     DMANow(3, Taco_SpritesPal, ((unsigned short*)(0x5000200)), 32 | (0 << 23));
        DMANow(3, Taco_SpritesTiles, &((charblock *)0x6000000)[4], 32768 | (0 << 23));
     hideSprites();
     controlDrawTaco();

     *(volatile unsigned short *)0x04000010 = BG_hOff;
        *(volatile unsigned short *)0x04000012 = BG_vOff;
        *(volatile unsigned short *)0x04000014 = hOff;
        *(volatile unsigned short *)0x04000016 = vOff;
}

void potatoh(){
 if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
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
 if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
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
 DMANow(3, &((u16 *)0x5000000)[0],&((screenblock *)0x6000000)[31], 2048/2 | (2 << 23));
 DMANow(3, &((u16 *)0x5000000)[0], &((screenblock *)0x6000000)[31], 2048/2 | (2 << 23));
 *(unsigned short *)0x4000000 = 4 | (1<<10);
 buttons = *(volatile unsigned int *)0x04000130;
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

 if (taco.col+40 >= brocolli.col) {

        if (taco.isAttack == 1 && brocolli.isAttack) {
         dma[1].cnt = 0;
         playSoundA(Swords_Clashing, 6814, 8000, 0);
         brocolli.aniCounter = 0;
         brocMode = PARRY;
         taco.col -= 15;

        }

        else if (taco.isAttack == 1 && !brocolli.isAttack) {
         brocolli.aniCounter = 0;
         brocMode = PARRY;
         brocolli.col += 10;
         brocolli.health -= 1;
        }

        else if (!taco.isAttack && brocolli.isAttack) {
         taco.col -= 10;
         taco.health -= 10;
         brocolli.aniCounter = 0;
         brocMode = PARRY;
        }

        else if (strikeMode == ISCHARGE && brocolli.isAttack) {
         taco.col -= 15;
         strikeMode = CANMOVE;
         taco.health -= 20;
         brocolli.aniCounter = 0;
         brocMode = PARRY;
        }

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
 *(unsigned short *)0x4000000 = *(unsigned short *)0x4000000 & (~(1 << 12));
 state = PAUSE;
 *(unsigned short *)0x4000000 = *(unsigned short *)0x4000000 & (~(1<<9));
  BG_vOff = 0;
  BG_hOff = 0;
  DMANow(3, &((u16 *)0x5000000)[0], &((screenblock *)0x6000000)[31], 2048 | (2 << 23));
  DMANow(3, pause_screenTiles, &((charblock *)0x6000000)[0], 5312/2 | (0 << 23));
     DMANow(3, pause_screenMap, &((screenblock *)0x6000000)[31], 1280/2 | (0 << 23));
     *(volatile unsigned short *)0x04000012 = 0;
}

void drawWinScreen() {
 state = WIN;
  *(unsigned short *)0x4000000 = *(unsigned short *)0x4000000 & (~(1<<9)) & (~(1 << 12));
  stopSound();
  dma[2].cnt = 0;
  playSoundA(victory_song, 39212 * 2, 8000, 0);
  *(volatile unsigned short *)0x04000012 = 0;
  BG_vOff = 0;
  DMANow(3, &((u16 *)0x5000000)[0], &((screenblock *)0x6000000)[31], 2048 | (2 << 23));
  DMANow(3, victoryTiles, &((charblock *)0x6000000)[0], 17984/2 | (0 << 23));
     DMANow(3, victoryMap, &((screenblock *)0x6000000)[31], 1280/2 | (0 << 23));
     *(volatile unsigned short *)0x04000012 = 0;
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

}

void release() {
 taco.aniCounter++;
 if (taco.aniCounter%11 ==0) {
         strikeMode = CANMOVE;

 }
}

void charging() {
 if ((~(*(volatile unsigned int *)0x04000130) & ((1<<1)))) {
  taco.aniCounter++;
  if (taco.aniCounter%7 ==0) {
   taco.aniState++;
   if(taco.aniState > 2) {
    taco.aniState = 0;
   }
  }
 } else {

  playSoundA(super_slice, 7768, 8000,0);
  strikeMode = RELEASE;
  taco.col += 15;
  taco.isAttack = 3;
  taco.aniState = 0;
 }
}

void quickStrike(){
 taco.aniCounter++;
    if((~(*(volatile unsigned int *)0x04000130) & ((1<<5)))) {
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
 } if ((~(*(volatile unsigned int *)0x04000130) & ((1<<4)))) {
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
 if((~(*(volatile unsigned int *)0x04000130) & ((1<<5)))) {
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
 } if ((~(*(volatile unsigned int *)0x04000130) & ((1<<4)))) {
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

 } if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6))))) {
  taco.rdel = 1;
  if (taco.doneJump) {
   taco.rdel = -1;
  }
 } if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
  taco.isAttack = 1;
  if (dma[1].cnt == 0) {
      playSoundA(Sword_Swing, 1960 / 2, 8000, 0);
  }
  taco.aniCounter = 0;
  strikeMode = QUICKSTRIKE;
 } if ((~(*(volatile unsigned int *)0x04000130) & ((1<<1)))) {
  taco.isAttack = 2;
  taco.aniCounter = 0;
        strikeMode = ISCHARGE;

    } else if (!((~(*(volatile unsigned int *)0x04000130) & ((1<<5)))||(~(*(volatile unsigned int *)0x04000130) & ((1<<4))))) {
     taco.aniState = 0;
    }
    *(volatile unsigned short *)0x04000014 = hOff;
    *(volatile unsigned short *)0x04000016 = vOff;
    *(volatile unsigned short *)0x04000010 = BG_hOff;
    *(volatile unsigned short *)0x04000012 = BG_vOff;
}

void tutorial(){
 switch(tutState) {
  case ARROWS:
      waitForVblank();
            if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
             tutState = POWER;
             drawPower();
             break;
            }
        case POWER:
             waitForVblank();
             if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
             tutState = RUN;
             drawTutrorialScreen();
             BG_vOff = 0;
             BG_hOff = 0;
             break;
            }
        case RUN:
            runTutorial();
             if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
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
 DMANow(3, &((u16 *)0x5000000)[0],&((screenblock *)0x6000000)[31], 2048/2 | (2 << 23));
 *(unsigned short *)0x4000000 = 4 | (1<<10);
 buttons = *(volatile unsigned int *)0x04000130;
 loadPalette(titlePal);
 DMANow(3, &((u16 *)0x5000000)[0], videoBuffer, ((240 * 160)/2) | (2 << 23));

}

void drawStartScreen() {
 state = START;
        taco.lives = 2;
        brocolli.lives = 2;
  DMANow(3, &((u16 *)0x5000000)[0],&((screenblock *)0x6000000)[31], 2048/2 | (2 << 23));
  DMANow(3, &((u16 *)0x5000000)[0], &((screenblock *)0x6000000)[31], 2048/2 | (2 << 23));
  *(unsigned short *)0x4000000 = 4 | (1<<10);
  buttons = *(volatile unsigned int *)0x04000130;
  loadPalette(titlePal);
  drawBackgroundImage4(titleBitmap);
    drawString4(100,60, "Press START for GAME", 0);
    drawString4(120,50, "Press SELECT for TUTORIAL", 0);
    drawString4(140,50, "Press A for POH-TAAAH-TOH", 0);
    playSoundB(Kung_Fu, 102431*2, 8000, 1);
}

void pause(){
 if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  state = GAME;
  drawGameScreen();
 } if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
  drawStartScreen();
 }
}
void win(){
 if(hOff > 18) {

 } else {
  hOff++;
  hOff = hOff%20;
 }
 *(volatile unsigned short *)0x04000010 = hOff;
  if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  drawStartScreen();

 } if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
  drawLoseScreen();
 }

}

void drawLoseScreen() {
 state = LOSE;
 *(unsigned short *)0x4000000 = *(unsigned short *)0x4000000 & (~(1<<9)) & (~(1 << 12));
  DMANow(3, &((u16 *)0x5000000)[0],&((screenblock *)0x6000000)[31], 2048/2 | (2 << 23));
  DMANow(3, &((u16 *)0x5000000)[0], &((screenblock *)0x6000000)[31], 2048/2 | (2 << 23));
  DMANow(3, loseTiles, &((charblock *)0x6000000)[0], 10368/2 | (0 << 23));
     DMANow(3, loseMap, &((screenblock *)0x6000000)[31], 1280/2 | (0 << 23));
  hOff = 0;
  *(volatile unsigned short *)0x04000012 = 0;

}

void lose(){
 if(hOff > 18) {

 } else {
  hOff++;
  hOff = hOff%20;
 }
 *(volatile unsigned short *)0x04000010 = hOff;
  if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  drawStartScreen();
 }
}
