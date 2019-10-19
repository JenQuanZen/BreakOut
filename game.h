//bullet struct
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

// ball struct
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

//block struct
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

//paddle struct
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

// constants
#define BULLETCOUNT 10
#define BLOCKCOUNT 15

// variables
extern BALL ball;
extern PADDLE paddle;
extern BULLET bullets[BULLETCOUNT];
extern BLOCK blocks[BLOCKCOUNT];
extern int blocksRemaining;

//game prototypes
void initializeGame();
void updateGame();
void drawGame();
//paddle prototypes
void initializePaddle();
void updatePaddle();
void drawPaddle();
//bullet prototypes
void initializeBullets();
void fireBullet();
void updateBullet(BULLET *);
void drawBullet(BULLET *);
//block prototypes
void initializeBlocks();
void updateBlock(BLOCK *);
void drawBlock(BLOCK *);
//ball prototypes
void initializeBall();
void updateBall();
void drawBall();