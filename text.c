#include "myLib.h"
#include "text.h"
#include "font.h"

// draws a char at a location
void drawChar(int col, int row, char ch, unsigned short color) {
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 8; j++) {
            if (fontdata_6x8[48*ch + i + 6 * j]) {
                setPixel(col + i, row + j, color);
            }
        }
    }
}

// draws a string at a location
void drawString(int col, int row, char *str, unsigned short color) {
    int i = 0;
    char curr = *str;
    while (curr != '\0') {
        drawChar(col + 7*i, row, curr, color);
        i++;
        curr = *(str + i);
    }
}