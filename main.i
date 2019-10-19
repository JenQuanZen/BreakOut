# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
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
# 3 "main.c" 2
# 1 "text.h" 1

void drawChar(int, int, char, unsigned short);
void drawString(int, int, char *, unsigned short);
# 4 "main.c" 2


void initialize();


void start();
void game();
void win();
void lose();


void goToStart();
void goToGame();
void goToWin();
void goToLose();


enum {START, GAME, WIN, LOSE};
int state;


u16 buttons;
u16 oldButtons;

int main() {
    initialize();

    while(1) {


        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


        switch (state){
            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
    }
}

void initialize() {
        (*(unsigned short *)0x4000000) = 3 | (1<<10);

        goToStart();
}

void goToStart() {
    fillScreen(((0) | (31)<<5 | (31)<<10));
    drawString(80, 100, "Press Enter to Start", 0);
    state = START;
}

void start() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        initializeGame();
        goToGame();
    }
}

void goToGame() {
    fillScreen(((31) | (31)<<5 | (31)<<10));

    state = GAME;
}

void game() {
    updateGame();
    waitForVBlank();
    drawGame();
    if (blocksRemaining == 0) {
        goToWin();
    }
    if (ball.row >= 159) {
        goToLose();
    }
}



void win() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }
}

void goToWin() {
    fillScreen(((0) | (31)<<5 | (0)<<10));
    drawString(80, 60, "Congrats! You won!", 0);
    drawString(60, 80, "Press Enter to play again", 0);
    state = WIN;
}

void lose() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }
}

void goToLose() {
    fillScreen(((31) | (0)<<5 | (0)<<10));
    drawString(80, 60, "Sorry, you lost :(", 0);
    drawString(60, 80, "Press Enter to try again", 0);
    state = LOSE;
}
