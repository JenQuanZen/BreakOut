#include "myLib.h"
#include "game.h"
#include "text.h"

// function prototypes
void initialize();

// state function prototypes
void start();
void game();
void win();
void lose();

//goTo state function prototypes
void goToStart();
void goToGame();
void goToWin();
void goToLose();

//states enum
enum {START, GAME, WIN, LOSE};
int state;

//buttons variables
u16 buttons;
u16 oldButtons;

int main() {
    initialize();

    while(1) {

        //update buttons
        oldButtons = buttons;
        buttons = BUTTONS;

        // show states
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
        REG_DISPCTL = MODE3 | BG2_ENABLE;

        goToStart();
}

void goToStart() {
    fillScreen(CYAN);
    drawString(80, 100, "Press Enter to Start", BLACK);
    state = START;
}

void start() {
    if (BUTTON_PRESSED(BUTTON_START))  {
        initializeGame();
        goToGame();
    }
}

void goToGame() {
    fillScreen(WHITE);
    
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
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToWin() {
    fillScreen(GREEN);
    drawString(80, 60, "Congrats! You won!", BLACK);
    drawString(60, 80, "Press Enter to play again", BLACK);
    state = WIN;
}

void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToLose() {
    fillScreen(RED);
    drawString(80, 60, "Sorry, you lost :(", BLACK);
    drawString(60, 80, "Press Enter to try again", BLACK);
    state = LOSE;
}