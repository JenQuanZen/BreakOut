#include "myLib.h"
#include "game.h"
#include <stdio.h>

//variables for paddle, bullets, ball, and blocks
PADDLE paddle;
BALL ball;
BULLET bullets[BULLETCOUNT];
BLOCK blocks[BLOCKCOUNT];
int blocksRemaining;
int level;

//flag for if ball already collided with the paddle
int pCollided;
//flag for if ball already collided with a block
int bCollided;

void initializeGame() {

    //initialize structs
    initializePaddle();
    initializeBullets();
    initializeBlocks();
    initializeBall();
    blocksRemaining = BLOCKCOUNT;
    level = 1;
}

void updateGame() {
    updateBall();
    updatePaddle();

    //update all of the blocks
    for (int i = 0; i < BLOCKCOUNT; i++) {
        updateBlock(&blocks[i]);
    }

    //update all of the bullets
    for (int j = 0; j < BULLETCOUNT; j++) {
        updateBullet(&bullets[j]);
    }
}

void drawGame() {

    drawPaddle();
    drawBall();

    //draw all of the blocks
    for (int i = 0; i < BLOCKCOUNT; i++) {
        if (!blocks[i].erased) {
            drawBlock(&blocks[i]);
        }
    }

    //draw all the bullets
    for (int j = 0; j < BULLETCOUNT; j++) {
        drawBullet(&bullets[j]);
    }
    
}

void initializePaddle() {
    paddle.row = 150;
    paddle.col = 105;
    paddle.oldRow = paddle.row;
    paddle.oldCol = paddle.col;
    paddle.height = 5;
    paddle.width = 40;
    paddle.color = BLUE;
    paddle.cDel = 0;
    paddle.bulletTimer = 20;
}


void drawPaddle() {
   drawRect(paddle.oldCol, paddle.oldRow, paddle.width, paddle.height, WHITE);
   drawRect(paddle.col, paddle.row, paddle.width, paddle.height, paddle.color);

   paddle.oldCol = paddle.col;
}

void updatePaddle() {
    //move paddle right
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        if (paddle.col + paddle.width <= 239) {
            paddle.col += 1;
            paddle.cDel = 1;
        }
    }

    //move paddle left
    if (BUTTON_HELD(BUTTON_LEFT)) {
        if (paddle.col > 0) {
            paddle.col -= 1;
            paddle.cDel = -1;
        }
    }

    //fire bullets
    if (BUTTON_PRESSED(BUTTON_A) && paddle.bulletTimer >= 20) {
        fireBullet();
        paddle.bulletTimer = 0;
    }

    paddle.bulletTimer++;
}

void initializeBall() {
    ball.col = 115;
    ball.row = 80;
    ball.oldCol = ball.col;
    ball.oldRow = ball.row;
    ball.size = 5;
    ball.rDel = 1;
    ball.cDel = 0;
    ball.color = CYAN;

}

void updateBall() {
    //if ball collides into walls
    if (ball.row <= 0) {
        ball.rDel = - ball.rDel;
    }
    if (ball.col >= 239 || ball.col <= 0) {
        ball.cDel = - ball.cDel;
    }

    //if ball collides into paddle more than once
    if (pCollided) {
        ball.row -= 2;
        pCollided = 0;
    }

    //if ball collides into blocks more than once
    if (bCollided) {
        ball.row += 2;
        bCollided = 0;
    }

    //if ball collides into paddle
    if (collision(paddle.row, paddle.col, paddle.height, paddle.width, ball.row, ball.col, ball.size, ball.size)) {
        ball.rDel = -ball.rDel;
        ball.cDel += paddle.cDel;
        pCollided = 1;
    }

    //update ball position using speed
    ball.row += ball.rDel;
    ball.col += ball.cDel;

}

void drawBall() {
    drawRect(ball.oldCol, ball.oldRow, ball.size, ball.size, WHITE);
    drawRect(ball.col, ball.row, ball.size, ball.size, ball.color);

   ball.oldCol = ball.col;
   ball.oldRow = ball.row;
}



void initializeBullets() {
    for (int i = 0; i < BULLETCOUNT; i++) {
        bullets[i].size = 3;
        bullets[i].row = 0;
        bullets[i].col = 0;
        bullets[i].oldRow = paddle.oldRow;
        bullets[i].oldCol = paddle.oldCol;
        bullets[i].rDel = -2;
        bullets[i].color = GREEN;
        bullets[i].active = 0;
        bullets[i].erased = 1;
    }
}

void fireBullet() {
    //find the first inactive bullet
    for (int i = 0; i < BULLETCOUNT; i++) {
        if (!bullets[i].active) {

            //position the new bullet
            bullets[i].col = paddle.col + paddle.width/2 - bullets[i].size/2;
            bullets[i].row = paddle.row;

            //take the bullet out of the pool
            bullets[i].active = 1;
            bullets[i].erased = 0;

            break;
        }
    }
}

void drawBullet(BULLET * b) {
    if (b->active) {
        drawRect(b->oldCol, b->oldRow, b->size, b->size, WHITE);
        drawRect(b->col, b->row, b->size, b->size, b->color);
    } else if (!b->erased) {
        drawRect(b->oldCol, b->oldRow, b->size, b->size, WHITE);
        b->erased = 1;
    }
    b->oldRow = b->row;
    b->oldCol = b->col;
}

void updateBullet(BULLET * b) {
    //if active, update
    if (b->active) {
        if (b->size + b->size - 1 >= 0) {
            b->row += b->rDel;
        } else {
            b->active = 0;
        }
    }
}

void initializeBlocks() {
        for (int i = 0; i < (BLOCKCOUNT / 3); i++) {
            blocks[i].height = 10;
            blocks[i].width = 30;
            blocks[i].row = 5;
            blocks[i].col = 5 + 50 * i;
            blocks[i].oldRow = blocks[i].row;
            blocks[i].oldCol = blocks[i].col;
            blocks[i].rDel = 0;
            blocks[i].color = BRICK;
            blocks[i].erased = 0;
            blocks[i].active = 1;
        }
        for (int i = (BLOCKCOUNT/3); i < (2 * BLOCKCOUNT / 3); i++) {
            blocks[i].height = 10;
            blocks[i].width = 30;
            blocks[i].row = 20;
            blocks[i].col = 5 + 50 * (i-BLOCKCOUNT/3);
            blocks[i].oldRow = blocks[i].row;
            blocks[i].oldCol = blocks[i].col;
            blocks[i].rDel = 0;
            blocks[i].color = BRICK;
            blocks[i].erased = 0;
            blocks[i].active = 1;
        }
        for (int i = (2 * BLOCKCOUNT/3); i < BLOCKCOUNT; i++) {
            blocks[i].height = 10;
            blocks[i].width = 30;
            blocks[i].row = 35;
            blocks[i].col = 5 + 50 * (i - (2*BLOCKCOUNT/3));
            blocks[i].oldRow = blocks[i].row;
            blocks[i].oldCol = blocks[i].col;
            blocks[i].rDel = 0;
            blocks[i].color = BRICK;
            blocks[i].erased = 0;
            blocks[i].active = 1;
        }
}

void drawBlock(BLOCK * b) {
    if (b->active) {
        drawRect(b->col, b->row, b->width, b->height, b->color);
    } else if (!b->erased) {
        drawRect(b->oldCol, b->oldRow, b->width, b->height, WHITE);
        b->erased = 1;
    }
}

void updateBlock(BLOCK * b) {
    //if ball hits block
    if (b->active && collision(ball.row, ball.col, ball.size, ball.size, b->row, b->col, b->height, b->width)) {
        ball.rDel = -ball.rDel;
        blocksRemaining--;
        b->active = 0;
        bCollided = 1;
        b->row = -10;
    }

    //if bullet hits block
    for (int i = 0; i < BULLETCOUNT; i++) {
        if (b->active && collision(bullets[i].row, bullets[i].col, bullets[i].size, bullets[i].size, b->row, b->col, b->height, b->width)) {
            bullets[i].active = 0;
            blocksRemaining--;
            b->active = 0;
            b->row = -10;
        }
    }
}