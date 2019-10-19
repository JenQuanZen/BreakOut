# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 25 "myLib.h"
extern unsigned short *videoBuffer;
# 41 "myLib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 66 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 76 "myLib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "myLib.c" 2
# 1 "game.h" 1

typedef struct bullet {
    int row;
    int col;
    int oldRow;
    int oldCol;
    int rDel;
    int size;
    unsigned short color;
    int active;
    int erased;
} BULLET;


typedef struct ball {
    int row;
    int col;
    int oldRow;
    int oldCol;
    int rDel;
    int cDel;
    int size;
    unsigned short color;
} BALL;


typedef struct block {
    int row;
    int col;
    int oldCol;
    int oldRow;
    int rDel;
    int width;
    int height;
    unsigned short color;
    int erased;
    int active;
} BLOCK;


typedef struct paddle {
    int row;
    int col;
    int oldRow;
    int oldCol;
    int cDel;
    int width;
    int height;
    unsigned short color;
    int bulletTimer;
} PADDLE;






extern BALL ball;
extern PADDLE paddle;
extern BULLET bullets[10];
extern BLOCK blocks[15];
extern int blocksRemaining;


void initializeGame();
void updateGame();
void drawGame();

void initializePaddle();
void updatePaddle();
void drawPaddle();

void initializeBullets();
void fireBullet();
void updateBullet(BULLET *);
void drawBullet(BULLET *);

void initializeBlocks();
void updateBlock(BLOCK *);
void drawBlock(BLOCK *);

void initializeBall();
void updateBall();
void drawBall();
# 3 "myLib.c" 2

unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
 videoBuffer[((row)*(240)+(col))] = color;
}

void drawRect(int col, int row, int width, int height, unsigned short color) {
 for(int r = 0; r < height; r++) {
        for (int c = 0; c < width; c++) {
            setPixel(col+c, row+r, color);
        }
 }
}

void fillScreen(unsigned short color) {
 for(int i = 0; i < 240 * 160; i++) {
        videoBuffer[i] = color;
    }
}

void waitForVBlank() {
 while((*(volatile unsigned short *)0x4000006) > 160);
 while((*(volatile unsigned short *)0x4000006) < 160);
}

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return colA < colB + widthB - 1 && colA + widthA - 1 > colB
        && rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB;
}
