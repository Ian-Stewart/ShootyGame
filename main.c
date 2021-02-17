#include <gb/gb.h>
#include <rand.h>
#include "BackgroundTileSet.c"
#include "BackgroundTileMap.c"
#include "ShootySprites.c"

void init();
void lcdInterruptHandler();
void configureDisplay();
void handleInput();
void movePlayer(UINT8);
void moveTargets();
void cleanup();
void scrollGameWorld();
void drawScore();
void drawHealth();
void handleEndInput();
void resetGame();

// =========
// Constants
// =========
const UINT8 MAX_SHOTS = 10;
const UINT8 MAX_TARGETS = 5;
// Represents highest/lowest alts for sprites allowed 
const UINT8 HIGHEST_Y = 32;
const UINT8 LOWEST_Y = 100;

// ==========================
// Game state and frame stuff
// ==========================
UINT8 scroll1, scroll2, scroll3, scroll4, scroll5, scroll6;
UINT8 frame = 0;
UINT8 framesSinceLastShot = 0;
BOOLEAN gameRunning = TRUE;
BOOLEAN paused = FALSE;
BOOLEAN gameOver = FALSE;
UINT8 score = 0;
UINT8 health = 4;

// ==========
// Player
// ==========
// Position
UINT8 playerX = 30;
UINT8 playerY = 72;
// Sprites 8-19
// Spitball
UINT8 spitballX, spitballY, spitballRotation;
BOOLEAN shotActive = FALSE;
// Sprites 4-7

// Targets
BOOLEAN tActive[5];
UINT8 targets[5][2];
UINT8 targetCount = 0;
// Sprites 0-3

// Utility
UINT8 i = 0;
UINT8 temp1 = 0;
UINT8 temp2 = 0;

// Movable Sprites/Tiles:
// 0 - bullet
// 1 - 8 - player
// 9 - heart
// 10-19 - targets

void main() {
    configureDisplay();
    resetGame();
	while(1) {
        if (gameOver) {
            drawScore();
            handleEndInput();
        } else {
            cleanup();
            handleInput();
            moveTargets();
            drawHealth();
        }
        if (health == 0) {
            gameOver = TRUE;
            gameRunning = FALSE;
        }
        scrollGameWorld();
        frame += 1;
        wait_vbl_done();
	}	
}

// Process inputs
void handleInput() {
    UINT8 frameMod4 = frame % 4;
    UINT8 input = joypad();
    if (input & J_START) {
        if (!gameOver) {
            paused = !paused;
            gameRunning = !gameRunning;
        }
    }
    if (!gameRunning) {
        return;
    }

    // Player stuff
    set_sprite_tile(0, 4 + frameMod4);
    BOOLEAN firing = FALSE;
    if (input & J_A && !shotActive) {
        firing = TRUE;
        shotActive = TRUE;
        spitballX = playerX + 8;
        spitballY = playerY + 8;
    }

    if (input & J_SELECT) {
        resetGame();
        return;
    }

    if (shotActive) {
        move_sprite(0, spitballX, spitballY);
    }

    spitballX += 4;

    if (input & J_UP && playerY > HIGHEST_Y) {
        playerY -= 1;
    } else if (input & J_DOWN && playerY < LOWEST_Y) {
        playerY += 1;
    }
    if (input & J_RIGHT && playerX < 80) {
        playerX += 1;
    } else if (input & J_LEFT && playerX > 16) {
        playerX -= 1;
    }
    // Configure sprite for player
    // Player occupies sprites 1-8
    set_sprite_tile(1, 12); // eyes
    set_sprite_tile(2, 10); // Hump
    set_sprite_tile(3, 8); // Tail
    set_sprite_tile(4, 9); // Bottom Tail
    set_sprite_tile(7, 14); // Forehead
    set_sprite_tile(8, 17); // Straw
    
    // Animate jet engine
    if (frameMod4 == 0) {
        set_sprite_tile(5, 15); // Fuselage w/exhaust
    } else {
        set_sprite_tile(5, 11); // Fuselage
    }

    // Put tile 6 (mouth) depending on if we're firing or not
    if (firing) {
        set_sprite_tile(6, 13); // Mouth (firing)
    } else {
        set_sprite_tile(6, 16); // Mouth (inactive)
    }

    move_sprite(1, playerX, playerY);
    move_sprite(2, playerX - 8, playerY);
    move_sprite(3, playerX - 16, playerY);
    move_sprite(4, playerX - 16, playerY + 8);
    move_sprite(5, playerX - 8, playerY + 8);
    move_sprite(6, playerX, playerY + 8);
    move_sprite(7, playerX + 8, playerY);
    move_sprite(8, playerX + 8, playerY + 8);
    // End player stuff
}

void handleEndInput() {
    if (joypad() & J_SELECT) {
        resetGame();
        return;
    }
}

// Move targets towards left edge of screen
void moveTargets() {
    if (!gameRunning) {
        return;
    }
    UINT8 maxTargets = score % 4 + 1;
    if (maxTargets > MAX_TARGETS) {
        maxTargets = MAX_TARGETS;
    }

    // Potentially spawn a new target
    UINT8 activeTargets = 0;
    UINT8 highestX = 0;
    for (i = 0; i < 5; i++) {
        if (tActive[i]) {
            activeTargets++;
            if (targets[i][0] > highestX) {
                highestX = targets[i][0];
            }
        } else {
            temp2 = i;
        }
    }
    temp1 = rand();
    if (activeTargets < maxTargets &&  (temp1 == 0 || temp1 == 1) && highestX < 140) {
        tActive[temp2] = TRUE;
        targets[temp2][0] = 160;
        targets[temp2][1] = (rand() % (LOWEST_Y - HIGHEST_Y)) + HIGHEST_Y;;
    }

    for (i = 0; i < 5; i++) {
        if (tActive[i]) {
            if (targets[i][0] < 8) {
                tActive[i] = FALSE;
                move_sprite(10 + (i * 2), 0, -20);
                move_sprite(11 + (i * 2), 0, -20);
                health--;
            } else {
                // Check collision with spitball
                if (shotActive) {
                    if (targets[i][0] < (spitballX - 8) && targets[i][0] > (spitballX - 16)) {
                        if (spitballY >= (targets[i][1] -2) && spitballY <= (targets[i][1] + 18)) {
                            tActive[i] = FALSE;
                            move_sprite(10 + (i * 2), 0, -20);
                            move_sprite(11 + (i * 2), 0, -20);
                            move_sprite(0, 0, -20);
                            score++;
                            spitballY = -20;
                            shotActive = FALSE;
                            goto dontDraw; // yeet
                            // Skips drawing the sprite if we just blew it up
                        }
                    }
                }
                // Targets move faster as score goes up
                targets[i][0] -= 1 + (score / 20);
                move_sprite(10 + (i * 2), targets[i][0], targets[i][1]);
                move_sprite(11 + (i * 2), targets[i][0], targets[i][1] + 8);
                dontDraw:
            }
        }
    }

}

void drawScore() {
    // Do whatever with sprites, who gives a shit
    UINT8 fMod4 = frame % 4;
    set_sprite_tile(0, 4 + fMod4);
    set_sprite_tile(1, 4 + fMod4);
    set_sprite_tile(4, (20 + ((score) % 10)));
    set_sprite_tile(3, (20 + ((score / 10) % 10)));
    set_sprite_tile(2, (20 + ((score / 100) % 10)));

    move_sprite(0, 64, 72);
    move_sprite(1, 96, 72);
    move_sprite(2, 72, 72);
    move_sprite(3, 80, 72);
    move_sprite(4, 88, 72);

    // Hide everything else
    move_sprite(5, 170, 160);
    move_sprite(6, 170, 160);
    move_sprite(7, 170, 160);
    move_sprite(8, 170, 160);
    move_sprite(9, 170, 160);
    move_sprite(10, 170, 160);
    move_sprite(11, 170, 160);
    move_sprite(12, 170, 160);
    move_sprite(13, 170, 160);
    move_sprite(14, 170, 160);
    move_sprite(15, 170, 160);
    move_sprite(16, 170, 160);
    move_sprite(17, 170, 160);
    move_sprite(18, 170, 160);
    move_sprite(19, 170, 160);
}

// sets the appropriate health indicator sprite
void drawHealth() {
    if (health == 4) {
        set_sprite_tile(9, 19);
    } else if (health == 3) {
        set_sprite_tile(9, 18);
    } else if (health == 2) {
        set_sprite_tile(9, 2);
    } else if (health == 1) {
        set_sprite_tile(9, 3);
    }
}

// Delete any objects off-screen
void cleanup() {
    if (shotActive && spitballX > 170) {
        shotActive = FALSE;
        move_sprite(0, -16, -16);
    }

}

// Do the parallax stuff
void scrollGameWorld() {
    if (gameRunning) {
        scroll1 += 2;
        scroll2 += 1;
        scroll3 += 2;
        scroll4 += 3;
        scroll5 += 4;
        scroll6 += 5;
    }
}

// Fun parallax stuff
void lcdInterruptHandler() {
    if (LYC_REG == 0x00) {
        move_bkg(0, 0);
        LYC_REG = 0x7;
    } else if (LYC_REG == 0x7) {
        move_bkg(scroll1, 0);
        LYC_REG = 0xF;
    } else if (LYC_REG == 0xF) {
        move_bkg(scroll2, 0);
        LYC_REG = 0x1A;
    } else if (LYC_REG == 0x1A) {
        move_bkg(scroll3, 0);
        LYC_REG = 0x67;
    } else if (LYC_REG == 0x67) {
        move_bkg(scroll4, 0);
        LYC_REG = 0x6F;
    } else if (LYC_REG == 0x6F) {
        move_bkg(scroll5, 0);
        LYC_REG = 0x8C;
    }else if (LYC_REG == 0x8C) {
        move_bkg(scroll6, 0);
        LYC_REG = 0x00;
    }
}

void configureDisplay() {
    STAT_REG = 0x45;
    LYC_REG = 0x00;

    disable_interrupts();
    add_LCD(lcdInterruptHandler);
    enable_interrupts();

    set_bkg_data(0, 36, BackgroundTileSet);
    set_bkg_tiles(0, 0, BackgroundTileMapWidth, BackgroundTileMapHeight, BackgroundTileMap);
    set_sprite_data(0, 32, ShootySprites);

    set_interrupts(VBL_IFLAG | LCD_IFLAG);
    
	SHOW_BKG;
    SHOW_SPRITES;
	DISPLAY_ON;

    initrand(221);
}

void resetGame() {
    health = 4;
    score = 0;
    for (i = 0; i < 5; i++) {
        tActive[i] = FALSE;
    }
    shotActive = FALSE;
    // Reset game state
    paused = FALSE;
    gameOver = FALSE;
    gameRunning = TRUE;

    // Move spitball offscreen
    move_sprite(0, 140, 180);

    // Health
    set_sprite_tile(9, 19);
    move_sprite(9, 12, 16);

    // Setup target sprites
    set_sprite_tile(10, 0);
    set_sprite_tile(11, 1);
    set_sprite_tile(12, 0);
    set_sprite_tile(13, 1);    
    set_sprite_tile(14, 0);
    set_sprite_tile(15, 1);    
    set_sprite_tile(16, 0);
    set_sprite_tile(17, 1);
    set_sprite_tile(18, 0);
    set_sprite_tile(19, 1);
    move_sprite(10, 0,  -20);
    move_sprite(11, 0,  -20);
    move_sprite(12, 0,  -20);
    move_sprite(13, 0,  -20);
    move_sprite(14, 0,  -20);
    move_sprite(15, 0,  -20);
    move_sprite(16, 0,  -20);
    move_sprite(17, 0,  -20);
    move_sprite(18, 0,  -20);
    move_sprite(19, 0,  -20);
}