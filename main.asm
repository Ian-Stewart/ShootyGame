;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.7 #12016 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _rand
	.globl _initrand
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _set_interrupts
	.globl _disable_interrupts
	.globl _enable_interrupts
	.globl _joypad
	.globl _add_LCD
	.globl _temp2
	.globl _temp1
	.globl _i
	.globl _targetCount
	.globl _targets
	.globl _tActive
	.globl _shotActive
	.globl _spitballRotation
	.globl _spitballY
	.globl _spitballX
	.globl _playerY
	.globl _playerX
	.globl _health
	.globl _score
	.globl _gameOver
	.globl _paused
	.globl _gameRunning
	.globl _framesSinceLastShot
	.globl _frame
	.globl _scroll6
	.globl _scroll5
	.globl _scroll4
	.globl _scroll3
	.globl _scroll2
	.globl _scroll1
	.globl _ShootySprites
	.globl _BackgroundTileMap
	.globl _BackgroundTileSet
	.globl _LOWEST_Y
	.globl _HIGHEST_Y
	.globl _MAX_TARGETS
	.globl _MAX_SHOTS
	.globl _handleInput
	.globl _handleEndInput
	.globl _moveTargets
	.globl _drawScore
	.globl _drawHealth
	.globl _cleanup
	.globl _scrollGameWorld
	.globl _lcdInterruptHandler
	.globl _configureDisplay
	.globl _resetGame
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_BackgroundTileSet::
	.ds 576
_BackgroundTileMap::
	.ds 576
_ShootySprites::
	.ds 528
_scroll1::
	.ds 1
_scroll2::
	.ds 1
_scroll3::
	.ds 1
_scroll4::
	.ds 1
_scroll5::
	.ds 1
_scroll6::
	.ds 1
_frame::
	.ds 1
_framesSinceLastShot::
	.ds 1
_gameRunning::
	.ds 1
_paused::
	.ds 1
_gameOver::
	.ds 1
_score::
	.ds 1
_health::
	.ds 1
_playerX::
	.ds 1
_playerY::
	.ds 1
_spitballX::
	.ds 1
_spitballY::
	.ds 1
_spitballRotation::
	.ds 1
_shotActive::
	.ds 1
_tActive::
	.ds 5
_targets::
	.ds 10
_targetCount::
	.ds 1
_i::
	.ds 1
_temp1::
	.ds 1
_temp2::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;BackgroundTileSet.c:26: unsigned char BackgroundTileSet[] =
	ld	hl, #_BackgroundTileSet
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0008)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0009)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x000a)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x000d)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x000f)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0010)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0011)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0012)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0013)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0014)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0015)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0016)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0017)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0018)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0019)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x001a)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x001b)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x001c)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x001d)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x001e)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x001f)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0020)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0021)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0022)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0023)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0024)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0025)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0026)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0027)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0028)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0029)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x002a)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x002b)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x002c)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x002d)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x002e)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x002f)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0030)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0031)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0032)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0033)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0034)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0035)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0036)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0037)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0038)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0039)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x003a)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x003b)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x003c)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x003d)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x003e)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x003f)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0040)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0042)
	ld	(hl), #0x80
	ld	hl, #(_BackgroundTileSet + 0x0043)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0044)
	ld	(hl), #0xaa
	ld	hl, #(_BackgroundTileSet + 0x0045)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0046)
	ld	(hl), #0x80
	ld	hl, #(_BackgroundTileSet + 0x0047)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0048)
	ld	(hl), #0xaa
	ld	hl, #(_BackgroundTileSet + 0x0049)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x004a)
	ld	(hl), #0x80
	ld	hl, #(_BackgroundTileSet + 0x004b)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x004c)
	ld	(hl), #0xaa
	ld	hl, #(_BackgroundTileSet + 0x004d)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x004e)
	ld	(hl), #0x80
	ld	hl, #(_BackgroundTileSet + 0x004f)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0050)
	ld	(hl), #0xfe
	ld	hl, #(_BackgroundTileSet + 0x0051)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0052)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileSet + 0x0053)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0054)
	ld	(hl), #0xaa
	ld	hl, #(_BackgroundTileSet + 0x0055)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0056)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileSet + 0x0057)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0058)
	ld	(hl), #0xaa
	ld	hl, #(_BackgroundTileSet + 0x0059)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x005a)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileSet + 0x005b)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x005c)
	ld	(hl), #0xaa
	ld	hl, #(_BackgroundTileSet + 0x005d)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x005e)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileSet + 0x005f)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0060)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0061)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0062)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0063)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0064)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0065)
	ld	(hl), #0x20
	ld	hl, #(_BackgroundTileSet + 0x0066)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0067)
	ld	(hl), #0x70
	ld	hl, #(_BackgroundTileSet + 0x0068)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0069)
	ld	(hl), #0x70
	ld	hl, #(_BackgroundTileSet + 0x006a)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x006b)
	ld	(hl), #0x70
	ld	hl, #(_BackgroundTileSet + 0x006c)
	ld	(hl), #0x54
	ld	hl, #(_BackgroundTileSet + 0x006d)
	ld	(hl), #0x04
	ld	hl, #(_BackgroundTileSet + 0x006e)
	ld	(hl), #0xfe
	ld	hl, #(_BackgroundTileSet + 0x006f)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0070)
	ld	(hl), #0xaa
	ld	hl, #(_BackgroundTileSet + 0x0071)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0072)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileSet + 0x0073)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0074)
	ld	(hl), #0xaa
	ld	hl, #(_BackgroundTileSet + 0x0075)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0076)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileSet + 0x0077)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0078)
	ld	(hl), #0xaa
	ld	hl, #(_BackgroundTileSet + 0x0079)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x007a)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileSet + 0x007b)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x007c)
	ld	(hl), #0xaa
	ld	hl, #(_BackgroundTileSet + 0x007d)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x007e)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileSet + 0x007f)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0080)
	ld	(hl), #0xaa
	ld	hl, #(_BackgroundTileSet + 0x0081)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0082)
	ld	(hl), #0x80
	ld	hl, #(_BackgroundTileSet + 0x0083)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0084)
	ld	(hl), #0xaa
	ld	hl, #(_BackgroundTileSet + 0x0085)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0086)
	ld	(hl), #0x80
	ld	hl, #(_BackgroundTileSet + 0x0087)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0088)
	ld	(hl), #0xaa
	ld	hl, #(_BackgroundTileSet + 0x0089)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x008a)
	ld	(hl), #0x80
	ld	hl, #(_BackgroundTileSet + 0x008b)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x008c)
	ld	(hl), #0xaa
	ld	hl, #(_BackgroundTileSet + 0x008d)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x008e)
	ld	(hl), #0x80
	ld	hl, #(_BackgroundTileSet + 0x008f)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0090)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0091)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0092)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0093)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0094)
	ld	(hl), #0x75
	ld	hl, #(_BackgroundTileSet + 0x0095)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0096)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0097)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0098)
	ld	(hl), #0xaa
	ld	hl, #(_BackgroundTileSet + 0x0099)
	ld	(hl), #0x55
	ld	hl, #(_BackgroundTileSet + 0x009a)
	ld	(hl), #0xdf
	ld	hl, #(_BackgroundTileSet + 0x009b)
	ld	(hl), #0x20
	ld	hl, #(_BackgroundTileSet + 0x009c)
	ld	(hl), #0x55
	ld	hl, #(_BackgroundTileSet + 0x009d)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x009e)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x009f)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00a0)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00a1)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00a2)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00a3)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00a4)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00a5)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00a6)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00a7)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00a8)
	ld	(hl), #0x9f
	ld	hl, #(_BackgroundTileSet + 0x00a9)
	ld	(hl), #0x60
	ld	hl, #(_BackgroundTileSet + 0x00aa)
	ld	(hl), #0x9f
	ld	hl, #(_BackgroundTileSet + 0x00ab)
	ld	(hl), #0x60
	ld	hl, #(_BackgroundTileSet + 0x00ac)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00ad)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00ae)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00af)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00b0)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00b1)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00b2)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00b3)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00b4)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00b5)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00b6)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00b7)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00b8)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00b9)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00ba)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00bb)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00bc)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00bd)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00be)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00bf)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00c0)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00c1)
	ld	(hl), #0x7c
	ld	hl, #(_BackgroundTileSet + 0x00c2)
	ld	(hl), #0xef
	ld	hl, #(_BackgroundTileSet + 0x00c3)
	ld	(hl), #0xaa
	ld	hl, #(_BackgroundTileSet + 0x00c4)
	ld	(hl), #0xef
	ld	hl, #(_BackgroundTileSet + 0x00c5)
	ld	(hl), #0x44
	ld	hl, #(_BackgroundTileSet + 0x00c6)
	ld	(hl), #0xef
	ld	hl, #(_BackgroundTileSet + 0x00c7)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00c8)
	ld	(hl), #0xef
	ld	hl, #(_BackgroundTileSet + 0x00c9)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00ca)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00cb)
	ld	(hl), #0x10
	ld	hl, #(_BackgroundTileSet + 0x00cc)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00cd)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00ce)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00cf)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00d0)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00d1)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileSet + 0x00d2)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00d3)
	ld	(hl), #0x0f
	ld	hl, #(_BackgroundTileSet + 0x00d4)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00d5)
	ld	(hl), #0x3f
	ld	hl, #(_BackgroundTileSet + 0x00d6)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00d7)
	ld	(hl), #0x3f
	ld	hl, #(_BackgroundTileSet + 0x00d8)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00d9)
	ld	(hl), #0x7f
	ld	hl, #(_BackgroundTileSet + 0x00da)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00db)
	ld	(hl), #0x7f
	ld	hl, #(_BackgroundTileSet + 0x00dc)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00dd)
	ld	(hl), #0x7f
	ld	hl, #(_BackgroundTileSet + 0x00de)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00df)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00e0)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00e1)
	ld	(hl), #0x80
	ld	hl, #(_BackgroundTileSet + 0x00e2)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00e3)
	ld	(hl), #0xf0
	ld	hl, #(_BackgroundTileSet + 0x00e4)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00e5)
	ld	(hl), #0xfc
	ld	hl, #(_BackgroundTileSet + 0x00e6)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00e7)
	ld	(hl), #0xfc
	ld	hl, #(_BackgroundTileSet + 0x00e8)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00e9)
	ld	(hl), #0xfe
	ld	hl, #(_BackgroundTileSet + 0x00ea)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00eb)
	ld	(hl), #0xfe
	ld	hl, #(_BackgroundTileSet + 0x00ec)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00ed)
	ld	(hl), #0xfe
	ld	hl, #(_BackgroundTileSet + 0x00ee)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00ef)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00f0)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00f1)
	ld	(hl), #0x81
	ld	hl, #(_BackgroundTileSet + 0x00f2)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00f3)
	ld	(hl), #0xe7
	ld	hl, #(_BackgroundTileSet + 0x00f4)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00f5)
	ld	(hl), #0xe7
	ld	hl, #(_BackgroundTileSet + 0x00f6)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00f7)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00f8)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00f9)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00fa)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00fb)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00fc)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00fd)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x00fe)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x00ff)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0100)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0101)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0102)
	ld	(hl), #0xfe
	ld	hl, #(_BackgroundTileSet + 0x0103)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0104)
	ld	(hl), #0xfe
	ld	hl, #(_BackgroundTileSet + 0x0105)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0106)
	ld	(hl), #0xfe
	ld	hl, #(_BackgroundTileSet + 0x0107)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0108)
	ld	(hl), #0xfc
	ld	hl, #(_BackgroundTileSet + 0x0109)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x010a)
	ld	(hl), #0xfc
	ld	hl, #(_BackgroundTileSet + 0x010b)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x010c)
	ld	(hl), #0xf0
	ld	hl, #(_BackgroundTileSet + 0x010d)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x010e)
	ld	(hl), #0x80
	ld	hl, #(_BackgroundTileSet + 0x010f)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0110)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0111)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0112)
	ld	(hl), #0x7f
	ld	hl, #(_BackgroundTileSet + 0x0113)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0114)
	ld	(hl), #0x7f
	ld	hl, #(_BackgroundTileSet + 0x0115)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0116)
	ld	(hl), #0x7f
	ld	hl, #(_BackgroundTileSet + 0x0117)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0118)
	ld	(hl), #0x3f
	ld	hl, #(_BackgroundTileSet + 0x0119)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x011a)
	ld	(hl), #0x3f
	ld	hl, #(_BackgroundTileSet + 0x011b)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x011c)
	ld	(hl), #0x0f
	ld	hl, #(_BackgroundTileSet + 0x011d)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x011e)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileSet + 0x011f)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0120)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0121)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0122)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileSet + 0x0123)
	ld	(hl), #0xfe
	ld	hl, #(_BackgroundTileSet + 0x0124)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileSet + 0x0125)
	ld	(hl), #0xfe
	ld	hl, #(_BackgroundTileSet + 0x0126)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileSet + 0x0127)
	ld	(hl), #0xfe
	ld	hl, #(_BackgroundTileSet + 0x0128)
	ld	(hl), #0x03
	ld	hl, #(_BackgroundTileSet + 0x0129)
	ld	(hl), #0xfc
	ld	hl, #(_BackgroundTileSet + 0x012a)
	ld	(hl), #0x03
	ld	hl, #(_BackgroundTileSet + 0x012b)
	ld	(hl), #0xfc
	ld	hl, #(_BackgroundTileSet + 0x012c)
	ld	(hl), #0x0f
	ld	hl, #(_BackgroundTileSet + 0x012d)
	ld	(hl), #0xf0
	ld	hl, #(_BackgroundTileSet + 0x012e)
	ld	(hl), #0x7f
	ld	hl, #(_BackgroundTileSet + 0x012f)
	ld	(hl), #0x80
	ld	hl, #(_BackgroundTileSet + 0x0130)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0131)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0132)
	ld	(hl), #0x80
	ld	hl, #(_BackgroundTileSet + 0x0133)
	ld	(hl), #0x7f
	ld	hl, #(_BackgroundTileSet + 0x0134)
	ld	(hl), #0x80
	ld	hl, #(_BackgroundTileSet + 0x0135)
	ld	(hl), #0x7f
	ld	hl, #(_BackgroundTileSet + 0x0136)
	ld	(hl), #0x80
	ld	hl, #(_BackgroundTileSet + 0x0137)
	ld	(hl), #0x7f
	ld	hl, #(_BackgroundTileSet + 0x0138)
	ld	(hl), #0xc0
	ld	hl, #(_BackgroundTileSet + 0x0139)
	ld	(hl), #0x3f
	ld	hl, #(_BackgroundTileSet + 0x013a)
	ld	(hl), #0xc0
	ld	hl, #(_BackgroundTileSet + 0x013b)
	ld	(hl), #0x3f
	ld	hl, #(_BackgroundTileSet + 0x013c)
	ld	(hl), #0xf0
	ld	hl, #(_BackgroundTileSet + 0x013d)
	ld	(hl), #0x0f
	ld	hl, #(_BackgroundTileSet + 0x013e)
	ld	(hl), #0xfe
	ld	hl, #(_BackgroundTileSet + 0x013f)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileSet + 0x0140)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0141)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0142)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0143)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0144)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0145)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0146)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0147)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0148)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0149)
	ld	(hl), #0x3c
	ld	hl, #(_BackgroundTileSet + 0x014a)
	ld	(hl), #0x3c
	ld	hl, #(_BackgroundTileSet + 0x014b)
	ld	(hl), #0x42
	ld	hl, #(_BackgroundTileSet + 0x014c)
	ld	(hl), #0x7e
	ld	hl, #(_BackgroundTileSet + 0x014d)
	ld	(hl), #0x81
	ld	hl, #(_BackgroundTileSet + 0x014e)
	ld	(hl), #0x5a
	ld	hl, #(_BackgroundTileSet + 0x014f)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0150)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0151)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0152)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0153)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0154)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0155)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0156)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0157)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0158)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0159)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x015a)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x015b)
	ld	(hl), #0x53
	ld	hl, #(_BackgroundTileSet + 0x015c)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x015d)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x015e)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x015f)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0160)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileSet + 0x0161)
	ld	(hl), #0xfe
	ld	hl, #(_BackgroundTileSet + 0x0162)
	ld	(hl), #0x0f
	ld	hl, #(_BackgroundTileSet + 0x0163)
	ld	(hl), #0xf0
	ld	hl, #(_BackgroundTileSet + 0x0164)
	ld	(hl), #0x3f
	ld	hl, #(_BackgroundTileSet + 0x0165)
	ld	(hl), #0xc0
	ld	hl, #(_BackgroundTileSet + 0x0166)
	ld	(hl), #0x3f
	ld	hl, #(_BackgroundTileSet + 0x0167)
	ld	(hl), #0xc0
	ld	hl, #(_BackgroundTileSet + 0x0168)
	ld	(hl), #0x7f
	ld	hl, #(_BackgroundTileSet + 0x0169)
	ld	(hl), #0x80
	ld	hl, #(_BackgroundTileSet + 0x016a)
	ld	(hl), #0x7f
	ld	hl, #(_BackgroundTileSet + 0x016b)
	ld	(hl), #0x80
	ld	hl, #(_BackgroundTileSet + 0x016c)
	ld	(hl), #0x7f
	ld	hl, #(_BackgroundTileSet + 0x016d)
	ld	(hl), #0x80
	ld	hl, #(_BackgroundTileSet + 0x016e)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x016f)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0170)
	ld	(hl), #0x80
	ld	hl, #(_BackgroundTileSet + 0x0171)
	ld	(hl), #0x7f
	ld	hl, #(_BackgroundTileSet + 0x0172)
	ld	(hl), #0xf0
	ld	hl, #(_BackgroundTileSet + 0x0173)
	ld	(hl), #0x0f
	ld	hl, #(_BackgroundTileSet + 0x0174)
	ld	(hl), #0xfc
	ld	hl, #(_BackgroundTileSet + 0x0175)
	ld	(hl), #0x03
	ld	hl, #(_BackgroundTileSet + 0x0176)
	ld	(hl), #0xfc
	ld	hl, #(_BackgroundTileSet + 0x0177)
	ld	(hl), #0x03
	ld	hl, #(_BackgroundTileSet + 0x0178)
	ld	(hl), #0xfe
	ld	hl, #(_BackgroundTileSet + 0x0179)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileSet + 0x017a)
	ld	(hl), #0xfe
	ld	hl, #(_BackgroundTileSet + 0x017b)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileSet + 0x017c)
	ld	(hl), #0xfe
	ld	hl, #(_BackgroundTileSet + 0x017d)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileSet + 0x017e)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x017f)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0180)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0181)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0182)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0183)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0184)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0185)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0186)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0187)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0188)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0189)
	ld	(hl), #0x08
	ld	hl, #(_BackgroundTileSet + 0x018a)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x018b)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x018c)
	ld	(hl), #0xb6
	ld	hl, #(_BackgroundTileSet + 0x018d)
	ld	(hl), #0x70
	ld	hl, #(_BackgroundTileSet + 0x018e)
	ld	(hl), #0x95
	ld	hl, #(_BackgroundTileSet + 0x018f)
	ld	(hl), #0x53
	ld	hl, #(_BackgroundTileSet + 0x0190)
	ld	(hl), #0x8d
	ld	hl, #(_BackgroundTileSet + 0x0191)
	ld	(hl), #0x4d
	ld	hl, #(_BackgroundTileSet + 0x0192)
	ld	(hl), #0x80
	ld	hl, #(_BackgroundTileSet + 0x0193)
	ld	(hl), #0x7f
	ld	hl, #(_BackgroundTileSet + 0x0194)
	ld	(hl), #0x87
	ld	hl, #(_BackgroundTileSet + 0x0195)
	ld	(hl), #0x78
	ld	hl, #(_BackgroundTileSet + 0x0196)
	ld	(hl), #0x84
	ld	hl, #(_BackgroundTileSet + 0x0197)
	ld	(hl), #0x40
	ld	hl, #(_BackgroundTileSet + 0x0198)
	ld	(hl), #0xb8
	ld	hl, #(_BackgroundTileSet + 0x0199)
	ld	(hl), #0x44
	ld	hl, #(_BackgroundTileSet + 0x019a)
	ld	(hl), #0xa9
	ld	hl, #(_BackgroundTileSet + 0x019b)
	ld	(hl), #0x44
	ld	hl, #(_BackgroundTileSet + 0x019c)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x019d)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x019e)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x019f)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01a0)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01a1)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x01a2)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01a3)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x01a4)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01a5)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x01a6)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01a7)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x01a8)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01a9)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x01aa)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x01ab)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01ac)
	ld	(hl), #0x79
	ld	hl, #(_BackgroundTileSet + 0x01ad)
	ld	(hl), #0x3a
	ld	hl, #(_BackgroundTileSet + 0x01ae)
	ld	(hl), #0xfd
	ld	hl, #(_BackgroundTileSet + 0x01af)
	ld	(hl), #0x7a
	ld	hl, #(_BackgroundTileSet + 0x01b0)
	ld	(hl), #0xd5
	ld	hl, #(_BackgroundTileSet + 0x01b1)
	ld	(hl), #0x92
	ld	hl, #(_BackgroundTileSet + 0x01b2)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileSet + 0x01b3)
	ld	(hl), #0xfe
	ld	hl, #(_BackgroundTileSet + 0x01b4)
	ld	(hl), #0xfd
	ld	hl, #(_BackgroundTileSet + 0x01b5)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileSet + 0x01b6)
	ld	(hl), #0x05
	ld	hl, #(_BackgroundTileSet + 0x01b7)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileSet + 0x01b8)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileSet + 0x01b9)
	ld	(hl), #0x06
	ld	hl, #(_BackgroundTileSet + 0x01ba)
	ld	(hl), #0x11
	ld	hl, #(_BackgroundTileSet + 0x01bb)
	ld	(hl), #0x16
	ld	hl, #(_BackgroundTileSet + 0x01bc)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01bd)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01be)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01bf)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01c0)
	ld	(hl), #0xfd
	ld	hl, #(_BackgroundTileSet + 0x01c1)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x01c2)
	ld	(hl), #0xfb
	ld	hl, #(_BackgroundTileSet + 0x01c3)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x01c4)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01c5)
	ld	(hl), #0x08
	ld	hl, #(_BackgroundTileSet + 0x01c6)
	ld	(hl), #0x83
	ld	hl, #(_BackgroundTileSet + 0x01c7)
	ld	(hl), #0x7c
	ld	hl, #(_BackgroundTileSet + 0x01c8)
	ld	(hl), #0x83
	ld	hl, #(_BackgroundTileSet + 0x01c9)
	ld	(hl), #0x54
	ld	hl, #(_BackgroundTileSet + 0x01ca)
	ld	(hl), #0x83
	ld	hl, #(_BackgroundTileSet + 0x01cb)
	ld	(hl), #0x7c
	ld	hl, #(_BackgroundTileSet + 0x01cc)
	ld	(hl), #0x83
	ld	hl, #(_BackgroundTileSet + 0x01cd)
	ld	(hl), #0x54
	ld	hl, #(_BackgroundTileSet + 0x01ce)
	ld	(hl), #0x83
	ld	hl, #(_BackgroundTileSet + 0x01cf)
	ld	(hl), #0x7c
	ld	hl, #(_BackgroundTileSet + 0x01d0)
	ld	(hl), #0x83
	ld	hl, #(_BackgroundTileSet + 0x01d1)
	ld	(hl), #0x54
	ld	hl, #(_BackgroundTileSet + 0x01d2)
	ld	(hl), #0x83
	ld	hl, #(_BackgroundTileSet + 0x01d3)
	ld	(hl), #0x7d
	ld	hl, #(_BackgroundTileSet + 0x01d4)
	ld	(hl), #0x83
	ld	hl, #(_BackgroundTileSet + 0x01d5)
	ld	(hl), #0x54
	ld	hl, #(_BackgroundTileSet + 0x01d6)
	ld	(hl), #0x83
	ld	hl, #(_BackgroundTileSet + 0x01d7)
	ld	(hl), #0x7c
	ld	hl, #(_BackgroundTileSet + 0x01d8)
	ld	(hl), #0x83
	ld	hl, #(_BackgroundTileSet + 0x01d9)
	ld	(hl), #0x54
	ld	hl, #(_BackgroundTileSet + 0x01da)
	ld	(hl), #0x83
	ld	hl, #(_BackgroundTileSet + 0x01db)
	ld	(hl), #0x5c
	ld	hl, #(_BackgroundTileSet + 0x01dc)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01dd)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01de)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01df)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01e0)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01e1)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x01e2)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01e3)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x01e4)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01e5)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x01e6)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01e7)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x01e8)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01e9)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x01ea)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01eb)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x01ec)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01ed)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x01ee)
	ld	(hl), #0xbb
	ld	hl, #(_BackgroundTileSet + 0x01ef)
	ld	(hl), #0x38
	ld	hl, #(_BackgroundTileSet + 0x01f0)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01f1)
	ld	(hl), #0xfe
	ld	hl, #(_BackgroundTileSet + 0x01f2)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01f3)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01f4)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileSet + 0x01f5)
	ld	(hl), #0xd6
	ld	hl, #(_BackgroundTileSet + 0x01f6)
	ld	(hl), #0x83
	ld	hl, #(_BackgroundTileSet + 0x01f7)
	ld	(hl), #0x7c
	ld	hl, #(_BackgroundTileSet + 0x01f8)
	ld	(hl), #0x83
	ld	hl, #(_BackgroundTileSet + 0x01f9)
	ld	(hl), #0x54
	ld	hl, #(_BackgroundTileSet + 0x01fa)
	ld	(hl), #0x83
	ld	hl, #(_BackgroundTileSet + 0x01fb)
	ld	(hl), #0x5c
	ld	hl, #(_BackgroundTileSet + 0x01fc)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01fd)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01fe)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x01ff)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0200)
	ld	(hl), #0xdf
	ld	hl, #(_BackgroundTileSet + 0x0201)
	ld	(hl), #0x20
	ld	hl, #(_BackgroundTileSet + 0x0202)
	ld	(hl), #0x8f
	ld	hl, #(_BackgroundTileSet + 0x0203)
	ld	(hl), #0x70
	ld	hl, #(_BackgroundTileSet + 0x0204)
	ld	(hl), #0x8f
	ld	hl, #(_BackgroundTileSet + 0x0205)
	ld	(hl), #0x70
	ld	hl, #(_BackgroundTileSet + 0x0206)
	ld	(hl), #0xaf
	ld	hl, #(_BackgroundTileSet + 0x0207)
	ld	(hl), #0x70
	ld	hl, #(_BackgroundTileSet + 0x0208)
	ld	(hl), #0xaf
	ld	hl, #(_BackgroundTileSet + 0x0209)
	ld	(hl), #0x70
	ld	hl, #(_BackgroundTileSet + 0x020a)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x020b)
	ld	(hl), #0x20
	ld	hl, #(_BackgroundTileSet + 0x020c)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x020d)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x020e)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x020f)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0210)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0211)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0212)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0213)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0214)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0215)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0216)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0217)
	ld	(hl), #0x8f
	ld	hl, #(_BackgroundTileSet + 0x0218)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0219)
	ld	(hl), #0x8d
	ld	hl, #(_BackgroundTileSet + 0x021a)
	ld	(hl), #0x70
	ld	hl, #(_BackgroundTileSet + 0x021b)
	ld	(hl), #0x8d
	ld	hl, #(_BackgroundTileSet + 0x021c)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x021d)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x021e)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x021f)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0220)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0221)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0222)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0223)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0224)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0225)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0226)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0227)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0228)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0229)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x022a)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x022b)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x022c)
	ld	(hl), #0x8f
	ld	hl, #(_BackgroundTileSet + 0x022d)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x022e)
	ld	(hl), #0xdf
	ld	hl, #(_BackgroundTileSet + 0x022f)
	ld	(hl), #0x20
	ld	hl, #(_BackgroundTileSet + 0x0230)
	ld	(hl), #0x03
	ld	hl, #(_BackgroundTileSet + 0x0231)
	ld	(hl), #0xfc
	ld	hl, #(_BackgroundTileSet + 0x0232)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x0233)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileSet + 0x0234)
	ld	(hl), #0x03
	ld	hl, #(_BackgroundTileSet + 0x0235)
	ld	(hl), #0xfc
	ld	hl, #(_BackgroundTileSet + 0x0236)
	ld	(hl), #0x03
	ld	hl, #(_BackgroundTileSet + 0x0237)
	ld	(hl), #0x1c
	ld	hl, #(_BackgroundTileSet + 0x0238)
	ld	(hl), #0x03
	ld	hl, #(_BackgroundTileSet + 0x0239)
	ld	(hl), #0x1c
	ld	hl, #(_BackgroundTileSet + 0x023a)
	ld	(hl), #0xe3
	ld	hl, #(_BackgroundTileSet + 0x023b)
	ld	(hl), #0x1c
	ld	hl, #(_BackgroundTileSet + 0x023c)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x023d)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x023e)
	ld	(hl), #0xff
	ld	hl, #(_BackgroundTileSet + 0x023f)
	ld	(hl), #0xff
;BackgroundTileMap.c:25: unsigned char BackgroundTileMap[] =
	ld	hl, #_BackgroundTileMap
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0001)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0002)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0003)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0004)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0005)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0006)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0007)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0008)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0009)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x000a)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x000b)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x000c)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x000d)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x000e)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x000f)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0010)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0011)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0012)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0013)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0014)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0015)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0016)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0017)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0018)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0019)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x001a)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x001b)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x001c)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x001d)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x001e)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x001f)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0020)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0021)
	ld	(hl), #0x12
	ld	hl, #(_BackgroundTileMap + 0x0022)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x0023)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x0024)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x0025)
	ld	(hl), #0x13
	ld	hl, #(_BackgroundTileMap + 0x0026)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0027)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0028)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0029)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x002a)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x002b)
	ld	(hl), #0x12
	ld	hl, #(_BackgroundTileMap + 0x002c)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x002d)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x002e)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x002f)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x0030)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x0031)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x0032)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x0033)
	ld	(hl), #0x13
	ld	hl, #(_BackgroundTileMap + 0x0034)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0035)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0036)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0037)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0038)
	ld	(hl), #0x12
	ld	hl, #(_BackgroundTileMap + 0x0039)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x003a)
	ld	(hl), #0x13
	ld	hl, #(_BackgroundTileMap + 0x003b)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x003c)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x003d)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x003e)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x003f)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0040)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x0041)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x0042)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x0043)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x0044)
	ld	(hl), #0x10
	ld	hl, #(_BackgroundTileMap + 0x0045)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0046)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0047)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0048)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0049)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x004a)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x004b)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x004c)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x004d)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x004e)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x004f)
	ld	(hl), #0x11
	ld	hl, #(_BackgroundTileMap + 0x0050)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x0051)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x0052)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x0053)
	ld	(hl), #0x10
	ld	hl, #(_BackgroundTileMap + 0x0054)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0055)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0056)
	ld	(hl), #0x11
	ld	hl, #(_BackgroundTileMap + 0x0057)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x0058)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x0059)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x005a)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x005b)
	ld	(hl), #0x10
	ld	hl, #(_BackgroundTileMap + 0x005c)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x005d)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x005e)
	ld	(hl), #0x11
	ld	hl, #(_BackgroundTileMap + 0x005f)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x0060)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0061)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0062)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0063)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0064)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0065)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0066)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0067)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0068)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0069)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x006a)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x006b)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x006c)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x006d)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x006e)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x006f)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0070)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0071)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0072)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0073)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0074)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0075)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0076)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0077)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0078)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0079)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x007a)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x007b)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x007c)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x007d)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x007e)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x007f)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0080)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0081)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0082)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0083)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0084)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0085)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0086)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0087)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0088)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0089)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x008a)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x008b)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x008c)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x008d)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x008e)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x008f)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0090)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0091)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0092)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0093)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0094)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0095)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0096)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0097)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0098)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0099)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x009a)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x009b)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x009c)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x009d)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x009e)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x009f)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00a0)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00a1)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00a2)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00a3)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00a4)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00a5)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00a6)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00a7)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00a8)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00a9)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00aa)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00ab)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00ac)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00ad)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00ae)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00af)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00b0)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00b1)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00b2)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00b3)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00b4)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00b5)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00b6)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00b7)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00b8)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00b9)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00ba)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00bb)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00bc)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00bd)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00be)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00bf)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00c0)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00c1)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00c2)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00c3)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00c4)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00c5)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00c6)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00c7)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00c8)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00c9)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00ca)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00cb)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00cc)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00cd)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00ce)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00cf)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00d0)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00d1)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00d2)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00d3)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00d4)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00d5)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00d6)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00d7)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00d8)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00d9)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00da)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00db)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00dc)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00dd)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00de)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00df)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00e0)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00e1)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00e2)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00e3)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00e4)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00e5)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00e6)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00e7)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00e8)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00e9)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00ea)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00eb)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00ec)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00ed)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00ee)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00ef)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00f0)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00f1)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00f2)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00f3)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00f4)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00f5)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00f6)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00f7)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00f8)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00f9)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00fa)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00fb)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00fc)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00fd)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00fe)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x00ff)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0100)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0101)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0102)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0103)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0104)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0105)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0106)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0107)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0108)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0109)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x010a)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x010b)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x010c)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x010d)
	ld	(hl), #0x04
	ld	hl, #(_BackgroundTileMap + 0x010e)
	ld	(hl), #0x05
	ld	hl, #(_BackgroundTileMap + 0x010f)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0110)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0111)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0112)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0113)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0114)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0115)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0116)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0117)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0118)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0119)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x011a)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x011b)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x011c)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x011d)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x011e)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x011f)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0120)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0121)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0122)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0123)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0124)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0125)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0126)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0127)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0128)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0129)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x012a)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x012b)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x012c)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x012d)
	ld	(hl), #0x08
	ld	hl, #(_BackgroundTileMap + 0x012e)
	ld	(hl), #0x07
	ld	hl, #(_BackgroundTileMap + 0x012f)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0130)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0131)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0132)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0133)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0134)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0135)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0136)
	ld	(hl), #0x04
	ld	hl, #(_BackgroundTileMap + 0x0137)
	ld	(hl), #0x05
	ld	hl, #(_BackgroundTileMap + 0x0138)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0139)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x013a)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x013b)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x013c)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x013d)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x013e)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x013f)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0140)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0141)
	ld	(hl), #0x06
	ld	hl, #(_BackgroundTileMap + 0x0142)
	ld	(hl), #0x04
	ld	hl, #(_BackgroundTileMap + 0x0143)
	ld	(hl), #0x05
	ld	hl, #(_BackgroundTileMap + 0x0144)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0145)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0146)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0147)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0148)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0149)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x014a)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x014b)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x014c)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x014d)
	ld	(hl), #0x08
	ld	hl, #(_BackgroundTileMap + 0x014e)
	ld	(hl), #0x07
	ld	hl, #(_BackgroundTileMap + 0x014f)
	ld	(hl), #0x05
	ld	hl, #(_BackgroundTileMap + 0x0150)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0151)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0152)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0153)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0154)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0155)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0156)
	ld	(hl), #0x08
	ld	hl, #(_BackgroundTileMap + 0x0157)
	ld	(hl), #0x07
	ld	hl, #(_BackgroundTileMap + 0x0158)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0159)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x015a)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x015b)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x015c)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x015d)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x015e)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x015f)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0160)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0161)
	ld	(hl), #0x04
	ld	hl, #(_BackgroundTileMap + 0x0162)
	ld	(hl), #0x08
	ld	hl, #(_BackgroundTileMap + 0x0163)
	ld	(hl), #0x07
	ld	hl, #(_BackgroundTileMap + 0x0164)
	ld	(hl), #0x05
	ld	hl, #(_BackgroundTileMap + 0x0165)
	ld	(hl), #0x14
	ld	hl, #(_BackgroundTileMap + 0x0166)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0167)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0168)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0169)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x016a)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x016b)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x016c)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x016d)
	ld	(hl), #0x08
	ld	hl, #(_BackgroundTileMap + 0x016e)
	ld	(hl), #0x07
	ld	hl, #(_BackgroundTileMap + 0x016f)
	ld	(hl), #0x07
	ld	hl, #(_BackgroundTileMap + 0x0170)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0171)
	ld	(hl), #0x14
	ld	hl, #(_BackgroundTileMap + 0x0172)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0173)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0174)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0175)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0176)
	ld	(hl), #0x08
	ld	hl, #(_BackgroundTileMap + 0x0177)
	ld	(hl), #0x07
	ld	hl, #(_BackgroundTileMap + 0x0178)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x0179)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x017a)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x017b)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x017c)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x017d)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x017e)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x017f)
	ld	(hl), #0x14
	ld	hl, #(_BackgroundTileMap + 0x0180)
	ld	(hl), #0x0f
	ld	hl, #(_BackgroundTileMap + 0x0181)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0182)
	ld	(hl), #0x0f
	ld	hl, #(_BackgroundTileMap + 0x0183)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0184)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0185)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0186)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0187)
	ld	(hl), #0x0e
	ld	hl, #(_BackgroundTileMap + 0x0188)
	ld	(hl), #0x14
	ld	hl, #(_BackgroundTileMap + 0x0189)
	ld	(hl), #0x00
	ld	hl, #(_BackgroundTileMap + 0x018a)
	ld	(hl), #0x0d
	ld	hl, #(_BackgroundTileMap + 0x018b)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x018c)
	ld	(hl), #0x0f
	ld	hl, #(_BackgroundTileMap + 0x018d)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x018e)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x018f)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0190)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0191)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0192)
	ld	(hl), #0x0e
	ld	hl, #(_BackgroundTileMap + 0x0193)
	ld	(hl), #0x0d
	ld	hl, #(_BackgroundTileMap + 0x0194)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0195)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0196)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0197)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0198)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x0199)
	ld	(hl), #0x0f
	ld	hl, #(_BackgroundTileMap + 0x019a)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x019b)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x019c)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x019d)
	ld	(hl), #0x0e
	ld	hl, #(_BackgroundTileMap + 0x019e)
	ld	(hl), #0x0d
	ld	hl, #(_BackgroundTileMap + 0x019f)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x01a0)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01a1)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01a2)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01a3)
	ld	(hl), #0x17
	ld	hl, #(_BackgroundTileMap + 0x01a4)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x01a5)
	ld	(hl), #0x16
	ld	hl, #(_BackgroundTileMap + 0x01a6)
	ld	(hl), #0x17
	ld	hl, #(_BackgroundTileMap + 0x01a7)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x01a8)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x01a9)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x01aa)
	ld	(hl), #0x16
	ld	hl, #(_BackgroundTileMap + 0x01ab)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01ac)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01ad)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01ae)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01af)
	ld	(hl), #0x17
	ld	hl, #(_BackgroundTileMap + 0x01b0)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x01b1)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x01b2)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x01b3)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x01b4)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x01b5)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x01b6)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x01b7)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x01b8)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x01b9)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x01ba)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x01bb)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x01bc)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x01bd)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x01be)
	ld	(hl), #0x02
	ld	hl, #(_BackgroundTileMap + 0x01bf)
	ld	(hl), #0x16
	ld	hl, #(_BackgroundTileMap + 0x01c0)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01c1)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01c2)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01c3)
	ld	(hl), #0x18
	ld	hl, #(_BackgroundTileMap + 0x01c4)
	ld	(hl), #0x1a
	ld	hl, #(_BackgroundTileMap + 0x01c5)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01c6)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01c7)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01c8)
	ld	(hl), #0x22
	ld	hl, #(_BackgroundTileMap + 0x01c9)
	ld	(hl), #0x1c
	ld	hl, #(_BackgroundTileMap + 0x01ca)
	ld	(hl), #0x1c
	ld	hl, #(_BackgroundTileMap + 0x01cb)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01cc)
	ld	(hl), #0x1e
	ld	hl, #(_BackgroundTileMap + 0x01cd)
	ld	(hl), #0x1e
	ld	hl, #(_BackgroundTileMap + 0x01ce)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01cf)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01d0)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01d1)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01d2)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01d3)
	ld	(hl), #0x1c
	ld	hl, #(_BackgroundTileMap + 0x01d4)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01d5)
	ld	(hl), #0x18
	ld	hl, #(_BackgroundTileMap + 0x01d6)
	ld	(hl), #0x1a
	ld	hl, #(_BackgroundTileMap + 0x01d7)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01d8)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01d9)
	ld	(hl), #0x22
	ld	hl, #(_BackgroundTileMap + 0x01da)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01db)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01dc)
	ld	(hl), #0x1e
	ld	hl, #(_BackgroundTileMap + 0x01dd)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01de)
	ld	(hl), #0x1c
	ld	hl, #(_BackgroundTileMap + 0x01df)
	ld	(hl), #0x01
	ld	hl, #(_BackgroundTileMap + 0x01e0)
	ld	(hl), #0x0b
	ld	hl, #(_BackgroundTileMap + 0x01e1)
	ld	(hl), #0x0a
	ld	hl, #(_BackgroundTileMap + 0x01e2)
	ld	(hl), #0x0c
	ld	hl, #(_BackgroundTileMap + 0x01e3)
	ld	(hl), #0x19
	ld	hl, #(_BackgroundTileMap + 0x01e4)
	ld	(hl), #0x1b
	ld	hl, #(_BackgroundTileMap + 0x01e5)
	ld	(hl), #0x0b
	ld	hl, #(_BackgroundTileMap + 0x01e6)
	ld	(hl), #0x0c
	ld	hl, #(_BackgroundTileMap + 0x01e7)
	ld	(hl), #0x21
	ld	hl, #(_BackgroundTileMap + 0x01e8)
	ld	(hl), #0x23
	ld	hl, #(_BackgroundTileMap + 0x01e9)
	ld	(hl), #0x1d
	ld	hl, #(_BackgroundTileMap + 0x01ea)
	ld	(hl), #0x1d
	ld	hl, #(_BackgroundTileMap + 0x01eb)
	ld	(hl), #0x0a
	ld	hl, #(_BackgroundTileMap + 0x01ec)
	ld	(hl), #0x1f
	ld	hl, #(_BackgroundTileMap + 0x01ed)
	ld	(hl), #0x1f
	ld	hl, #(_BackgroundTileMap + 0x01ee)
	ld	(hl), #0x0b
	ld	hl, #(_BackgroundTileMap + 0x01ef)
	ld	(hl), #0x0b
	ld	hl, #(_BackgroundTileMap + 0x01f0)
	ld	(hl), #0x0b
	ld	hl, #(_BackgroundTileMap + 0x01f1)
	ld	(hl), #0x0c
	ld	hl, #(_BackgroundTileMap + 0x01f2)
	ld	(hl), #0x0c
	ld	hl, #(_BackgroundTileMap + 0x01f3)
	ld	(hl), #0x1d
	ld	hl, #(_BackgroundTileMap + 0x01f4)
	ld	(hl), #0x20
	ld	hl, #(_BackgroundTileMap + 0x01f5)
	ld	(hl), #0x19
	ld	hl, #(_BackgroundTileMap + 0x01f6)
	ld	(hl), #0x1b
	ld	hl, #(_BackgroundTileMap + 0x01f7)
	ld	(hl), #0x0b
	ld	hl, #(_BackgroundTileMap + 0x01f8)
	ld	(hl), #0x21
	ld	hl, #(_BackgroundTileMap + 0x01f9)
	ld	(hl), #0x23
	ld	hl, #(_BackgroundTileMap + 0x01fa)
	ld	(hl), #0x0b
	ld	hl, #(_BackgroundTileMap + 0x01fb)
	ld	(hl), #0x0a
	ld	hl, #(_BackgroundTileMap + 0x01fc)
	ld	(hl), #0x1f
	ld	hl, #(_BackgroundTileMap + 0x01fd)
	ld	(hl), #0x0c
	ld	hl, #(_BackgroundTileMap + 0x01fe)
	ld	(hl), #0x1d
	ld	hl, #(_BackgroundTileMap + 0x01ff)
	ld	(hl), #0x0b
	ld	hl, #(_BackgroundTileMap + 0x0200)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x0201)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x0202)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x0203)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x0204)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x0205)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x0206)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x0207)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x0208)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x0209)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x020a)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x020b)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x020c)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x020d)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x020e)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x020f)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x0210)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x0211)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x0212)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x0213)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x0214)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x0215)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x0216)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x0217)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x0218)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x0219)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x021a)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x021b)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x021c)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x021d)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x021e)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x021f)
	ld	(hl), #0x15
	ld	hl, #(_BackgroundTileMap + 0x0220)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x0221)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x0222)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x0223)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x0224)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x0225)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x0226)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x0227)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x0228)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x0229)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x022a)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x022b)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x022c)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x022d)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x022e)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x022f)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x0230)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x0231)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x0232)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x0233)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x0234)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x0235)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x0236)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x0237)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x0238)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x0239)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x023a)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x023b)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x023c)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x023d)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x023e)
	ld	(hl), #0x09
	ld	hl, #(_BackgroundTileMap + 0x023f)
	ld	(hl), #0x09
;ShootySprites.c:26: unsigned char ShootySprites[] =
	ld	hl, #_ShootySprites
	ld	(hl), #0x1c
	ld	hl, #(_ShootySprites + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0002)
	ld	(hl), #0x3e
	ld	hl, #(_ShootySprites + 0x0003)
	ld	(hl), #0x1c
	ld	hl, #(_ShootySprites + 0x0004)
	ld	(hl), #0x7e
	ld	hl, #(_ShootySprites + 0x0005)
	ld	(hl), #0x14
	ld	hl, #(_ShootySprites + 0x0006)
	ld	(hl), #0x7f
	ld	hl, #(_ShootySprites + 0x0007)
	ld	(hl), #0x22
	ld	hl, #(_ShootySprites + 0x0008)
	ld	(hl), #0x7f
	ld	hl, #(_ShootySprites + 0x0009)
	ld	(hl), #0x22
	ld	hl, #(_ShootySprites + 0x000a)
	ld	(hl), #0x7f
	ld	hl, #(_ShootySprites + 0x000b)
	ld	(hl), #0x49
	ld	hl, #(_ShootySprites + 0x000c)
	ld	(hl), #0x7f
	ld	hl, #(_ShootySprites + 0x000d)
	ld	(hl), #0x55
	ld	hl, #(_ShootySprites + 0x000e)
	ld	(hl), #0x7f
	ld	hl, #(_ShootySprites + 0x000f)
	ld	(hl), #0x55
	ld	hl, #(_ShootySprites + 0x0010)
	ld	(hl), #0x7f
	ld	hl, #(_ShootySprites + 0x0011)
	ld	(hl), #0x55
	ld	hl, #(_ShootySprites + 0x0012)
	ld	(hl), #0x7f
	ld	hl, #(_ShootySprites + 0x0013)
	ld	(hl), #0x55
	ld	hl, #(_ShootySprites + 0x0014)
	ld	(hl), #0x7f
	ld	hl, #(_ShootySprites + 0x0015)
	ld	(hl), #0x49
	ld	hl, #(_ShootySprites + 0x0016)
	ld	(hl), #0x7f
	ld	hl, #(_ShootySprites + 0x0017)
	ld	(hl), #0x22
	ld	hl, #(_ShootySprites + 0x0018)
	ld	(hl), #0x7f
	ld	hl, #(_ShootySprites + 0x0019)
	ld	(hl), #0x22
	ld	hl, #(_ShootySprites + 0x001a)
	ld	(hl), #0x7e
	ld	hl, #(_ShootySprites + 0x001b)
	ld	(hl), #0x14
	ld	hl, #(_ShootySprites + 0x001c)
	ld	(hl), #0x3e
	ld	hl, #(_ShootySprites + 0x001d)
	ld	(hl), #0x1c
	ld	hl, #(_ShootySprites + 0x001e)
	ld	(hl), #0x1c
	ld	hl, #(_ShootySprites + 0x001f)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0020)
	ld	(hl), #0x7e
	ld	hl, #(_ShootySprites + 0x0021)
	ld	(hl), #0xa1
	ld	hl, #(_ShootySprites + 0x0022)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x0023)
	ld	(hl), #0x70
	ld	hl, #(_ShootySprites + 0x0024)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x0025)
	ld	(hl), #0xf0
	ld	hl, #(_ShootySprites + 0x0026)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x0027)
	ld	(hl), #0xf0
	ld	hl, #(_ShootySprites + 0x0028)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x0029)
	ld	(hl), #0x70
	ld	hl, #(_ShootySprites + 0x002a)
	ld	(hl), #0x7e
	ld	hl, #(_ShootySprites + 0x002b)
	ld	(hl), #0xb1
	ld	hl, #(_ShootySprites + 0x002c)
	ld	(hl), #0x3c
	ld	hl, #(_ShootySprites + 0x002d)
	ld	(hl), #0xd3
	ld	hl, #(_ShootySprites + 0x002e)
	ld	(hl), #0x18
	ld	hl, #(_ShootySprites + 0x002f)
	ld	(hl), #0xe7
	ld	hl, #(_ShootySprites + 0x0030)
	ld	(hl), #0x7e
	ld	hl, #(_ShootySprites + 0x0031)
	ld	(hl), #0xa1
	ld	hl, #(_ShootySprites + 0x0032)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x0033)
	ld	(hl), #0x70
	ld	hl, #(_ShootySprites + 0x0034)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x0035)
	ld	(hl), #0xf0
	ld	hl, #(_ShootySprites + 0x0036)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x0037)
	ld	(hl), #0xf0
	ld	hl, #(_ShootySprites + 0x0038)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x0039)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x003a)
	ld	(hl), #0x7e
	ld	hl, #(_ShootySprites + 0x003b)
	ld	(hl), #0x81
	ld	hl, #(_ShootySprites + 0x003c)
	ld	(hl), #0x3c
	ld	hl, #(_ShootySprites + 0x003d)
	ld	(hl), #0xc3
	ld	hl, #(_ShootySprites + 0x003e)
	ld	(hl), #0x18
	ld	hl, #(_ShootySprites + 0x003f)
	ld	(hl), #0xe7
	ld	hl, #(_ShootySprites + 0x0040)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0042)
	ld	(hl), #0x1c
	ld	hl, #(_ShootySprites + 0x0043)
	ld	(hl), #0x20
	ld	hl, #(_ShootySprites + 0x0044)
	ld	(hl), #0x5c
	ld	hl, #(_ShootySprites + 0x0045)
	ld	(hl), #0x22
	ld	hl, #(_ShootySprites + 0x0046)
	ld	(hl), #0x62
	ld	hl, #(_ShootySprites + 0x0047)
	ld	(hl), #0x1c
	ld	hl, #(_ShootySprites + 0x0048)
	ld	(hl), #0x7e
	ld	hl, #(_ShootySprites + 0x0049)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x004a)
	ld	(hl), #0x1e
	ld	hl, #(_ShootySprites + 0x004b)
	ld	(hl), #0x60
	ld	hl, #(_ShootySprites + 0x004c)
	ld	(hl), #0x2c
	ld	hl, #(_ShootySprites + 0x004d)
	ld	(hl), #0x10
	ld	hl, #(_ShootySprites + 0x004e)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x004f)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0050)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0051)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0052)
	ld	(hl), #0x1c
	ld	hl, #(_ShootySprites + 0x0053)
	ld	(hl), #0x20
	ld	hl, #(_ShootySprites + 0x0054)
	ld	(hl), #0x58
	ld	hl, #(_ShootySprites + 0x0055)
	ld	(hl), #0x26
	ld	hl, #(_ShootySprites + 0x0056)
	ld	(hl), #0x36
	ld	hl, #(_ShootySprites + 0x0057)
	ld	(hl), #0x48
	ld	hl, #(_ShootySprites + 0x0058)
	ld	(hl), #0x76
	ld	hl, #(_ShootySprites + 0x0059)
	ld	(hl), #0x08
	ld	hl, #(_ShootySprites + 0x005a)
	ld	(hl), #0x76
	ld	hl, #(_ShootySprites + 0x005b)
	ld	(hl), #0x08
	ld	hl, #(_ShootySprites + 0x005c)
	ld	(hl), #0x38
	ld	hl, #(_ShootySprites + 0x005d)
	ld	(hl), #0x04
	ld	hl, #(_ShootySprites + 0x005e)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x005f)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0060)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0061)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0062)
	ld	(hl), #0x34
	ld	hl, #(_ShootySprites + 0x0063)
	ld	(hl), #0x08
	ld	hl, #(_ShootySprites + 0x0064)
	ld	(hl), #0x78
	ld	hl, #(_ShootySprites + 0x0065)
	ld	(hl), #0x06
	ld	hl, #(_ShootySprites + 0x0066)
	ld	(hl), #0x7e
	ld	hl, #(_ShootySprites + 0x0067)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0068)
	ld	(hl), #0x46
	ld	hl, #(_ShootySprites + 0x0069)
	ld	(hl), #0x38
	ld	hl, #(_ShootySprites + 0x006a)
	ld	(hl), #0x3a
	ld	hl, #(_ShootySprites + 0x006b)
	ld	(hl), #0x44
	ld	hl, #(_ShootySprites + 0x006c)
	ld	(hl), #0x38
	ld	hl, #(_ShootySprites + 0x006d)
	ld	(hl), #0x04
	ld	hl, #(_ShootySprites + 0x006e)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x006f)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0070)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0071)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0072)
	ld	(hl), #0x1c
	ld	hl, #(_ShootySprites + 0x0073)
	ld	(hl), #0x20
	ld	hl, #(_ShootySprites + 0x0074)
	ld	(hl), #0x6e
	ld	hl, #(_ShootySprites + 0x0075)
	ld	(hl), #0x10
	ld	hl, #(_ShootySprites + 0x0076)
	ld	(hl), #0x6e
	ld	hl, #(_ShootySprites + 0x0077)
	ld	(hl), #0x10
	ld	hl, #(_ShootySprites + 0x0078)
	ld	(hl), #0x6c
	ld	hl, #(_ShootySprites + 0x0079)
	ld	(hl), #0x12
	ld	hl, #(_ShootySprites + 0x007a)
	ld	(hl), #0x1a
	ld	hl, #(_ShootySprites + 0x007b)
	ld	(hl), #0x64
	ld	hl, #(_ShootySprites + 0x007c)
	ld	(hl), #0x38
	ld	hl, #(_ShootySprites + 0x007d)
	ld	(hl), #0x04
	ld	hl, #(_ShootySprites + 0x007e)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x007f)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0080)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0081)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0082)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0083)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0084)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0085)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0086)
	ld	(hl), #0xa0
	ld	hl, #(_ShootySprites + 0x0087)
	ld	(hl), #0x40
	ld	hl, #(_ShootySprites + 0x0088)
	ld	(hl), #0xb0
	ld	hl, #(_ShootySprites + 0x0089)
	ld	(hl), #0x40
	ld	hl, #(_ShootySprites + 0x008a)
	ld	(hl), #0xbc
	ld	hl, #(_ShootySprites + 0x008b)
	ld	(hl), #0x40
	ld	hl, #(_ShootySprites + 0x008c)
	ld	(hl), #0x3f
	ld	hl, #(_ShootySprites + 0x008d)
	ld	(hl), #0xc0
	ld	hl, #(_ShootySprites + 0x008e)
	ld	(hl), #0xcf
	ld	hl, #(_ShootySprites + 0x008f)
	ld	(hl), #0x30
	ld	hl, #(_ShootySprites + 0x0090)
	ld	(hl), #0x0a
	ld	hl, #(_ShootySprites + 0x0091)
	ld	(hl), #0xf0
	ld	hl, #(_ShootySprites + 0x0092)
	ld	(hl), #0x7f
	ld	hl, #(_ShootySprites + 0x0093)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0094)
	ld	(hl), #0x3f
	ld	hl, #(_ShootySprites + 0x0095)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0096)
	ld	(hl), #0x1f
	ld	hl, #(_ShootySprites + 0x0097)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0098)
	ld	(hl), #0x0c
	ld	hl, #(_ShootySprites + 0x0099)
	ld	(hl), #0x03
	ld	hl, #(_ShootySprites + 0x009a)
	ld	(hl), #0x03
	ld	hl, #(_ShootySprites + 0x009b)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x009c)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x009d)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x009e)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x009f)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00a0)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00a1)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00a2)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00a3)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00a4)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00a5)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00a6)
	ld	(hl), #0x01
	ld	hl, #(_ShootySprites + 0x00a7)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00a8)
	ld	(hl), #0x07
	ld	hl, #(_ShootySprites + 0x00a9)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00aa)
	ld	(hl), #0x0d
	ld	hl, #(_ShootySprites + 0x00ab)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00ac)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x00ad)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00ae)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x00af)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00b0)
	ld	(hl), #0xaa
	ld	hl, #(_ShootySprites + 0x00b1)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00b2)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x00b3)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00b4)
	ld	(hl), #0xfe
	ld	hl, #(_ShootySprites + 0x00b5)
	ld	(hl), #0x01
	ld	hl, #(_ShootySprites + 0x00b6)
	ld	(hl), #0xe0
	ld	hl, #(_ShootySprites + 0x00b7)
	ld	(hl), #0x1f
	ld	hl, #(_ShootySprites + 0x00b8)
	ld	(hl), #0x01
	ld	hl, #(_ShootySprites + 0x00b9)
	ld	(hl), #0xf9
	ld	hl, #(_ShootySprites + 0x00ba)
	ld	(hl), #0xfb
	ld	hl, #(_ShootySprites + 0x00bb)
	ld	(hl), #0x03
	ld	hl, #(_ShootySprites + 0x00bc)
	ld	(hl), #0x03
	ld	hl, #(_ShootySprites + 0x00bd)
	ld	(hl), #0x0b
	ld	hl, #(_ShootySprites + 0x00be)
	ld	(hl), #0x01
	ld	hl, #(_ShootySprites + 0x00bf)
	ld	(hl), #0x05
	ld	hl, #(_ShootySprites + 0x00c0)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00c1)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00c2)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00c3)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00c4)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00c5)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00c6)
	ld	(hl), #0xfc
	ld	hl, #(_ShootySprites + 0x00c7)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00c8)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x00c9)
	ld	(hl), #0x36
	ld	hl, #(_ShootySprites + 0x00ca)
	ld	(hl), #0x7f
	ld	hl, #(_ShootySprites + 0x00cb)
	ld	(hl), #0x7f
	ld	hl, #(_ShootySprites + 0x00cc)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x00cd)
	ld	(hl), #0x36
	ld	hl, #(_ShootySprites + 0x00ce)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x00cf)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00d0)
	ld	(hl), #0xaa
	ld	hl, #(_ShootySprites + 0x00d1)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00d2)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x00d3)
	ld	(hl), #0x05
	ld	hl, #(_ShootySprites + 0x00d4)
	ld	(hl), #0x3e
	ld	hl, #(_ShootySprites + 0x00d5)
	ld	(hl), #0xcb
	ld	hl, #(_ShootySprites + 0x00d6)
	ld	(hl), #0x1e
	ld	hl, #(_ShootySprites + 0x00d7)
	ld	(hl), #0xfb
	ld	hl, #(_ShootySprites + 0x00d8)
	ld	(hl), #0x9f
	ld	hl, #(_ShootySprites + 0x00d9)
	ld	(hl), #0xe9
	ld	hl, #(_ShootySprites + 0x00da)
	ld	(hl), #0xdf
	ld	hl, #(_ShootySprites + 0x00db)
	ld	(hl), #0xe4
	ld	hl, #(_ShootySprites + 0x00dc)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x00dd)
	ld	(hl), #0xc0
	ld	hl, #(_ShootySprites + 0x00de)
	ld	(hl), #0x80
	ld	hl, #(_ShootySprites + 0x00df)
	ld	(hl), #0x80
	ld	hl, #(_ShootySprites + 0x00e0)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00e1)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00e2)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00e3)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00e4)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00e5)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00e6)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00e7)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00e8)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00e9)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00ea)
	ld	(hl), #0x80
	ld	hl, #(_ShootySprites + 0x00eb)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00ec)
	ld	(hl), #0xc0
	ld	hl, #(_ShootySprites + 0x00ed)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00ee)
	ld	(hl), #0xa0
	ld	hl, #(_ShootySprites + 0x00ef)
	ld	(hl), #0x40
	ld	hl, #(_ShootySprites + 0x00f0)
	ld	(hl), #0xaa
	ld	hl, #(_ShootySprites + 0x00f1)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00f2)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x00f3)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x00f4)
	ld	(hl), #0xfe
	ld	hl, #(_ShootySprites + 0x00f5)
	ld	(hl), #0x01
	ld	hl, #(_ShootySprites + 0x00f6)
	ld	(hl), #0xe0
	ld	hl, #(_ShootySprites + 0x00f7)
	ld	(hl), #0x1f
	ld	hl, #(_ShootySprites + 0x00f8)
	ld	(hl), #0x01
	ld	hl, #(_ShootySprites + 0x00f9)
	ld	(hl), #0xf9
	ld	hl, #(_ShootySprites + 0x00fa)
	ld	(hl), #0xfb
	ld	hl, #(_ShootySprites + 0x00fb)
	ld	(hl), #0x03
	ld	hl, #(_ShootySprites + 0x00fc)
	ld	(hl), #0xb3
	ld	hl, #(_ShootySprites + 0x00fd)
	ld	(hl), #0xbb
	ld	hl, #(_ShootySprites + 0x00fe)
	ld	(hl), #0x01
	ld	hl, #(_ShootySprites + 0x00ff)
	ld	(hl), #0x05
	ld	hl, #(_ShootySprites + 0x0100)
	ld	(hl), #0xaa
	ld	hl, #(_ShootySprites + 0x0101)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0102)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x0103)
	ld	(hl), #0x01
	ld	hl, #(_ShootySprites + 0x0104)
	ld	(hl), #0x3e
	ld	hl, #(_ShootySprites + 0x0105)
	ld	(hl), #0xc3
	ld	hl, #(_ShootySprites + 0x0106)
	ld	(hl), #0x1e
	ld	hl, #(_ShootySprites + 0x0107)
	ld	(hl), #0xe3
	ld	hl, #(_ShootySprites + 0x0108)
	ld	(hl), #0x9f
	ld	hl, #(_ShootySprites + 0x0109)
	ld	(hl), #0xe1
	ld	hl, #(_ShootySprites + 0x010a)
	ld	(hl), #0xdf
	ld	hl, #(_ShootySprites + 0x010b)
	ld	(hl), #0xe0
	ld	hl, #(_ShootySprites + 0x010c)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x010d)
	ld	(hl), #0xc0
	ld	hl, #(_ShootySprites + 0x010e)
	ld	(hl), #0x80
	ld	hl, #(_ShootySprites + 0x010f)
	ld	(hl), #0x80
	ld	hl, #(_ShootySprites + 0x0110)
	ld	(hl), #0xe0
	ld	hl, #(_ShootySprites + 0x0111)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0112)
	ld	(hl), #0xe0
	ld	hl, #(_ShootySprites + 0x0113)
	ld	(hl), #0x80
	ld	hl, #(_ShootySprites + 0x0114)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0115)
	ld	(hl), #0xbb
	ld	hl, #(_ShootySprites + 0x0116)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0117)
	ld	(hl), #0x76
	ld	hl, #(_ShootySprites + 0x0118)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0119)
	ld	(hl), #0xed
	ld	hl, #(_ShootySprites + 0x011a)
	ld	(hl), #0xc0
	ld	hl, #(_ShootySprites + 0x011b)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x011c)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x011d)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x011e)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x011f)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0120)
	ld	(hl), #0x7e
	ld	hl, #(_ShootySprites + 0x0121)
	ld	(hl), #0xa1
	ld	hl, #(_ShootySprites + 0x0122)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x0123)
	ld	(hl), #0x70
	ld	hl, #(_ShootySprites + 0x0124)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x0125)
	ld	(hl), #0xf0
	ld	hl, #(_ShootySprites + 0x0126)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x0127)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x0128)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x0129)
	ld	(hl), #0x7e
	ld	hl, #(_ShootySprites + 0x012a)
	ld	(hl), #0x7e
	ld	hl, #(_ShootySprites + 0x012b)
	ld	(hl), #0xbd
	ld	hl, #(_ShootySprites + 0x012c)
	ld	(hl), #0x3c
	ld	hl, #(_ShootySprites + 0x012d)
	ld	(hl), #0xdb
	ld	hl, #(_ShootySprites + 0x012e)
	ld	(hl), #0x18
	ld	hl, #(_ShootySprites + 0x012f)
	ld	(hl), #0xe7
	ld	hl, #(_ShootySprites + 0x0130)
	ld	(hl), #0x7e
	ld	hl, #(_ShootySprites + 0x0131)
	ld	(hl), #0xa5
	ld	hl, #(_ShootySprites + 0x0132)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x0133)
	ld	(hl), #0x7e
	ld	hl, #(_ShootySprites + 0x0134)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x0135)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x0136)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x0137)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x0138)
	ld	(hl), #0xff
	ld	hl, #(_ShootySprites + 0x0139)
	ld	(hl), #0x7e
	ld	hl, #(_ShootySprites + 0x013a)
	ld	(hl), #0x7e
	ld	hl, #(_ShootySprites + 0x013b)
	ld	(hl), #0xbd
	ld	hl, #(_ShootySprites + 0x013c)
	ld	(hl), #0x3c
	ld	hl, #(_ShootySprites + 0x013d)
	ld	(hl), #0xdb
	ld	hl, #(_ShootySprites + 0x013e)
	ld	(hl), #0x18
	ld	hl, #(_ShootySprites + 0x013f)
	ld	(hl), #0xe7
	ld	hl, #(_ShootySprites + 0x0140)
	ld	(hl), #0x3c
	ld	hl, #(_ShootySprites + 0x0141)
	ld	(hl), #0xc3
	ld	hl, #(_ShootySprites + 0x0142)
	ld	(hl), #0x66
	ld	hl, #(_ShootySprites + 0x0143)
	ld	(hl), #0x99
	ld	hl, #(_ShootySprites + 0x0144)
	ld	(hl), #0x46
	ld	hl, #(_ShootySprites + 0x0145)
	ld	(hl), #0xb9
	ld	hl, #(_ShootySprites + 0x0146)
	ld	(hl), #0x4a
	ld	hl, #(_ShootySprites + 0x0147)
	ld	(hl), #0xb5
	ld	hl, #(_ShootySprites + 0x0148)
	ld	(hl), #0x52
	ld	hl, #(_ShootySprites + 0x0149)
	ld	(hl), #0xad
	ld	hl, #(_ShootySprites + 0x014a)
	ld	(hl), #0x62
	ld	hl, #(_ShootySprites + 0x014b)
	ld	(hl), #0x9d
	ld	hl, #(_ShootySprites + 0x014c)
	ld	(hl), #0x66
	ld	hl, #(_ShootySprites + 0x014d)
	ld	(hl), #0x99
	ld	hl, #(_ShootySprites + 0x014e)
	ld	(hl), #0x3c
	ld	hl, #(_ShootySprites + 0x014f)
	ld	(hl), #0xc3
	ld	hl, #(_ShootySprites + 0x0150)
	ld	(hl), #0x38
	ld	hl, #(_ShootySprites + 0x0151)
	ld	(hl), #0xc7
	ld	hl, #(_ShootySprites + 0x0152)
	ld	(hl), #0x38
	ld	hl, #(_ShootySprites + 0x0153)
	ld	(hl), #0xc7
	ld	hl, #(_ShootySprites + 0x0154)
	ld	(hl), #0x18
	ld	hl, #(_ShootySprites + 0x0155)
	ld	(hl), #0xe7
	ld	hl, #(_ShootySprites + 0x0156)
	ld	(hl), #0x18
	ld	hl, #(_ShootySprites + 0x0157)
	ld	(hl), #0xe7
	ld	hl, #(_ShootySprites + 0x0158)
	ld	(hl), #0x18
	ld	hl, #(_ShootySprites + 0x0159)
	ld	(hl), #0xe7
	ld	hl, #(_ShootySprites + 0x015a)
	ld	(hl), #0x18
	ld	hl, #(_ShootySprites + 0x015b)
	ld	(hl), #0xe7
	ld	hl, #(_ShootySprites + 0x015c)
	ld	(hl), #0x3c
	ld	hl, #(_ShootySprites + 0x015d)
	ld	(hl), #0xc3
	ld	hl, #(_ShootySprites + 0x015e)
	ld	(hl), #0x3c
	ld	hl, #(_ShootySprites + 0x015f)
	ld	(hl), #0xc3
	ld	hl, #(_ShootySprites + 0x0160)
	ld	(hl), #0x3c
	ld	hl, #(_ShootySprites + 0x0161)
	ld	(hl), #0xc3
	ld	hl, #(_ShootySprites + 0x0162)
	ld	(hl), #0x66
	ld	hl, #(_ShootySprites + 0x0163)
	ld	(hl), #0x99
	ld	hl, #(_ShootySprites + 0x0164)
	ld	(hl), #0x66
	ld	hl, #(_ShootySprites + 0x0165)
	ld	(hl), #0x99
	ld	hl, #(_ShootySprites + 0x0166)
	ld	(hl), #0x0c
	ld	hl, #(_ShootySprites + 0x0167)
	ld	(hl), #0xf3
	ld	hl, #(_ShootySprites + 0x0168)
	ld	(hl), #0x18
	ld	hl, #(_ShootySprites + 0x0169)
	ld	(hl), #0xe7
	ld	hl, #(_ShootySprites + 0x016a)
	ld	(hl), #0x30
	ld	hl, #(_ShootySprites + 0x016b)
	ld	(hl), #0xcf
	ld	hl, #(_ShootySprites + 0x016c)
	ld	(hl), #0x7e
	ld	hl, #(_ShootySprites + 0x016d)
	ld	(hl), #0x81
	ld	hl, #(_ShootySprites + 0x016e)
	ld	(hl), #0x7e
	ld	hl, #(_ShootySprites + 0x016f)
	ld	(hl), #0x81
	ld	hl, #(_ShootySprites + 0x0170)
	ld	(hl), #0x3c
	ld	hl, #(_ShootySprites + 0x0171)
	ld	(hl), #0xc3
	ld	hl, #(_ShootySprites + 0x0172)
	ld	(hl), #0x66
	ld	hl, #(_ShootySprites + 0x0173)
	ld	(hl), #0x99
	ld	hl, #(_ShootySprites + 0x0174)
	ld	(hl), #0x66
	ld	hl, #(_ShootySprites + 0x0175)
	ld	(hl), #0x99
	ld	hl, #(_ShootySprites + 0x0176)
	ld	(hl), #0x0c
	ld	hl, #(_ShootySprites + 0x0177)
	ld	(hl), #0xf3
	ld	hl, #(_ShootySprites + 0x0178)
	ld	(hl), #0x0c
	ld	hl, #(_ShootySprites + 0x0179)
	ld	(hl), #0xf3
	ld	hl, #(_ShootySprites + 0x017a)
	ld	(hl), #0x66
	ld	hl, #(_ShootySprites + 0x017b)
	ld	(hl), #0x99
	ld	hl, #(_ShootySprites + 0x017c)
	ld	(hl), #0x66
	ld	hl, #(_ShootySprites + 0x017d)
	ld	(hl), #0x99
	ld	hl, #(_ShootySprites + 0x017e)
	ld	(hl), #0x3c
	ld	hl, #(_ShootySprites + 0x017f)
	ld	(hl), #0xc3
	ld	hl, #(_ShootySprites + 0x0180)
	ld	(hl), #0x66
	ld	hl, #(_ShootySprites + 0x0181)
	ld	(hl), #0x99
	ld	hl, #(_ShootySprites + 0x0182)
	ld	(hl), #0x66
	ld	hl, #(_ShootySprites + 0x0183)
	ld	(hl), #0x99
	ld	hl, #(_ShootySprites + 0x0184)
	ld	(hl), #0x66
	ld	hl, #(_ShootySprites + 0x0185)
	ld	(hl), #0x99
	ld	hl, #(_ShootySprites + 0x0186)
	ld	(hl), #0x7e
	ld	hl, #(_ShootySprites + 0x0187)
	ld	(hl), #0x81
	ld	hl, #(_ShootySprites + 0x0188)
	ld	(hl), #0x7e
	ld	hl, #(_ShootySprites + 0x0189)
	ld	(hl), #0x81
	ld	hl, #(_ShootySprites + 0x018a)
	ld	(hl), #0x06
	ld	hl, #(_ShootySprites + 0x018b)
	ld	(hl), #0xf9
	ld	hl, #(_ShootySprites + 0x018c)
	ld	(hl), #0x06
	ld	hl, #(_ShootySprites + 0x018d)
	ld	(hl), #0xf9
	ld	hl, #(_ShootySprites + 0x018e)
	ld	(hl), #0x06
	ld	hl, #(_ShootySprites + 0x018f)
	ld	(hl), #0xf9
	ld	hl, #(_ShootySprites + 0x0190)
	ld	(hl), #0x7e
	ld	hl, #(_ShootySprites + 0x0191)
	ld	(hl), #0x81
	ld	hl, #(_ShootySprites + 0x0192)
	ld	(hl), #0x7e
	ld	hl, #(_ShootySprites + 0x0193)
	ld	(hl), #0x81
	ld	hl, #(_ShootySprites + 0x0194)
	ld	(hl), #0x60
	ld	hl, #(_ShootySprites + 0x0195)
	ld	(hl), #0x9f
	ld	hl, #(_ShootySprites + 0x0196)
	ld	(hl), #0x7c
	ld	hl, #(_ShootySprites + 0x0197)
	ld	(hl), #0x83
	ld	hl, #(_ShootySprites + 0x0198)
	ld	(hl), #0x06
	ld	hl, #(_ShootySprites + 0x0199)
	ld	(hl), #0xf9
	ld	hl, #(_ShootySprites + 0x019a)
	ld	(hl), #0x66
	ld	hl, #(_ShootySprites + 0x019b)
	ld	(hl), #0x99
	ld	hl, #(_ShootySprites + 0x019c)
	ld	(hl), #0x66
	ld	hl, #(_ShootySprites + 0x019d)
	ld	(hl), #0x99
	ld	hl, #(_ShootySprites + 0x019e)
	ld	(hl), #0x3c
	ld	hl, #(_ShootySprites + 0x019f)
	ld	(hl), #0xc3
	ld	hl, #(_ShootySprites + 0x01a0)
	ld	(hl), #0x38
	ld	hl, #(_ShootySprites + 0x01a1)
	ld	(hl), #0xc7
	ld	hl, #(_ShootySprites + 0x01a2)
	ld	(hl), #0x40
	ld	hl, #(_ShootySprites + 0x01a3)
	ld	(hl), #0xbf
	ld	hl, #(_ShootySprites + 0x01a4)
	ld	(hl), #0x40
	ld	hl, #(_ShootySprites + 0x01a5)
	ld	(hl), #0xbf
	ld	hl, #(_ShootySprites + 0x01a6)
	ld	(hl), #0x78
	ld	hl, #(_ShootySprites + 0x01a7)
	ld	(hl), #0x87
	ld	hl, #(_ShootySprites + 0x01a8)
	ld	(hl), #0x6c
	ld	hl, #(_ShootySprites + 0x01a9)
	ld	(hl), #0x93
	ld	hl, #(_ShootySprites + 0x01aa)
	ld	(hl), #0x44
	ld	hl, #(_ShootySprites + 0x01ab)
	ld	(hl), #0xbb
	ld	hl, #(_ShootySprites + 0x01ac)
	ld	(hl), #0x6c
	ld	hl, #(_ShootySprites + 0x01ad)
	ld	(hl), #0x93
	ld	hl, #(_ShootySprites + 0x01ae)
	ld	(hl), #0x38
	ld	hl, #(_ShootySprites + 0x01af)
	ld	(hl), #0xc7
	ld	hl, #(_ShootySprites + 0x01b0)
	ld	(hl), #0x7e
	ld	hl, #(_ShootySprites + 0x01b1)
	ld	(hl), #0x81
	ld	hl, #(_ShootySprites + 0x01b2)
	ld	(hl), #0x7e
	ld	hl, #(_ShootySprites + 0x01b3)
	ld	(hl), #0x81
	ld	hl, #(_ShootySprites + 0x01b4)
	ld	(hl), #0x0c
	ld	hl, #(_ShootySprites + 0x01b5)
	ld	(hl), #0xf3
	ld	hl, #(_ShootySprites + 0x01b6)
	ld	(hl), #0x0c
	ld	hl, #(_ShootySprites + 0x01b7)
	ld	(hl), #0xf3
	ld	hl, #(_ShootySprites + 0x01b8)
	ld	(hl), #0x18
	ld	hl, #(_ShootySprites + 0x01b9)
	ld	(hl), #0xe7
	ld	hl, #(_ShootySprites + 0x01ba)
	ld	(hl), #0x18
	ld	hl, #(_ShootySprites + 0x01bb)
	ld	(hl), #0xe7
	ld	hl, #(_ShootySprites + 0x01bc)
	ld	(hl), #0x30
	ld	hl, #(_ShootySprites + 0x01bd)
	ld	(hl), #0xcf
	ld	hl, #(_ShootySprites + 0x01be)
	ld	(hl), #0x30
	ld	hl, #(_ShootySprites + 0x01bf)
	ld	(hl), #0xcf
	ld	hl, #(_ShootySprites + 0x01c0)
	ld	(hl), #0x3c
	ld	hl, #(_ShootySprites + 0x01c1)
	ld	(hl), #0xc3
	ld	hl, #(_ShootySprites + 0x01c2)
	ld	(hl), #0x42
	ld	hl, #(_ShootySprites + 0x01c3)
	ld	(hl), #0xbd
	ld	hl, #(_ShootySprites + 0x01c4)
	ld	(hl), #0x42
	ld	hl, #(_ShootySprites + 0x01c5)
	ld	(hl), #0xbd
	ld	hl, #(_ShootySprites + 0x01c6)
	ld	(hl), #0x2c
	ld	hl, #(_ShootySprites + 0x01c7)
	ld	(hl), #0xd3
	ld	hl, #(_ShootySprites + 0x01c8)
	ld	(hl), #0x34
	ld	hl, #(_ShootySprites + 0x01c9)
	ld	(hl), #0xcb
	ld	hl, #(_ShootySprites + 0x01ca)
	ld	(hl), #0x42
	ld	hl, #(_ShootySprites + 0x01cb)
	ld	(hl), #0xbd
	ld	hl, #(_ShootySprites + 0x01cc)
	ld	(hl), #0x42
	ld	hl, #(_ShootySprites + 0x01cd)
	ld	(hl), #0xbd
	ld	hl, #(_ShootySprites + 0x01ce)
	ld	(hl), #0x3c
	ld	hl, #(_ShootySprites + 0x01cf)
	ld	(hl), #0xc3
	ld	hl, #(_ShootySprites + 0x01d0)
	ld	(hl), #0x3c
	ld	hl, #(_ShootySprites + 0x01d1)
	ld	(hl), #0xc3
	ld	hl, #(_ShootySprites + 0x01d2)
	ld	(hl), #0x66
	ld	hl, #(_ShootySprites + 0x01d3)
	ld	(hl), #0x99
	ld	hl, #(_ShootySprites + 0x01d4)
	ld	(hl), #0x66
	ld	hl, #(_ShootySprites + 0x01d5)
	ld	(hl), #0x99
	ld	hl, #(_ShootySprites + 0x01d6)
	ld	(hl), #0x3c
	ld	hl, #(_ShootySprites + 0x01d7)
	ld	(hl), #0xc3
	ld	hl, #(_ShootySprites + 0x01d8)
	ld	(hl), #0x0c
	ld	hl, #(_ShootySprites + 0x01d9)
	ld	(hl), #0xf3
	ld	hl, #(_ShootySprites + 0x01da)
	ld	(hl), #0x18
	ld	hl, #(_ShootySprites + 0x01db)
	ld	(hl), #0xe7
	ld	hl, #(_ShootySprites + 0x01dc)
	ld	(hl), #0x18
	ld	hl, #(_ShootySprites + 0x01dd)
	ld	(hl), #0xe7
	ld	hl, #(_ShootySprites + 0x01de)
	ld	(hl), #0x30
	ld	hl, #(_ShootySprites + 0x01df)
	ld	(hl), #0xcf
	ld	hl, #(_ShootySprites + 0x01e0)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01e1)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01e2)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01e3)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01e4)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01e5)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01e6)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01e7)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01e8)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01e9)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01ea)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01eb)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01ec)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01ed)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01ee)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01ef)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01f0)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01f1)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01f2)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01f3)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01f4)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01f5)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01f6)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01f7)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01f8)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01f9)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01fa)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01fb)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01fc)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01fd)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01fe)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x01ff)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0200)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0201)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0202)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0203)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0204)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0205)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0206)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0207)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0208)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x0209)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x020a)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x020b)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x020c)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x020d)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x020e)
	ld	(hl), #0x00
	ld	hl, #(_ShootySprites + 0x020f)
	ld	(hl), #0x00
;main.c:33: UINT8 frame = 0;
	ld	hl, #_frame
	ld	(hl), #0x00
;main.c:34: UINT8 framesSinceLastShot = 0;
	ld	hl, #_framesSinceLastShot
	ld	(hl), #0x00
;main.c:35: BOOLEAN gameRunning = TRUE;
	ld	hl, #_gameRunning
	ld	(hl), #0x01
;main.c:36: BOOLEAN paused = FALSE;
	ld	hl, #_paused
	ld	(hl), #0x00
;main.c:37: BOOLEAN gameOver = FALSE;
	ld	hl, #_gameOver
	ld	(hl), #0x00
;main.c:38: UINT8 score = 0;
	ld	hl, #_score
	ld	(hl), #0x00
;main.c:39: UINT8 health = 4;
	ld	hl, #_health
	ld	(hl), #0x04
;main.c:45: UINT8 playerX = 30;
	ld	hl, #_playerX
	ld	(hl), #0x1e
;main.c:46: UINT8 playerY = 72;
	ld	hl, #_playerY
	ld	(hl), #0x48
;main.c:50: BOOLEAN shotActive = FALSE;
	ld	hl, #_shotActive
	ld	(hl), #0x00
;main.c:56: UINT8 targetCount = 0;
	ld	hl, #_targetCount
	ld	(hl), #0x00
;main.c:60: UINT8 i = 0;
	ld	hl, #_i
	ld	(hl), #0x00
;main.c:61: UINT8 temp1 = 0;
	ld	hl, #_temp1
	ld	(hl), #0x00
;main.c:62: UINT8 temp2 = 0;
	ld	hl, #_temp2
	ld	(hl), #0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:70: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:71: configureDisplay();
	call	_configureDisplay
;main.c:72: resetGame();
	call	_resetGame
;main.c:73: while(1) {
00107$:
;main.c:74: if (gameOver) {
	ld	a, (#_gameOver)
	or	a, a
	jr	Z, 00102$
;main.c:75: drawScore();
	call	_drawScore
;main.c:76: handleEndInput();
	call	_handleEndInput
	jr	00103$
00102$:
;main.c:78: cleanup();
	call	_cleanup
;main.c:79: handleInput();
	call	_handleInput
;main.c:80: moveTargets();
	call	_moveTargets
;main.c:81: drawHealth();
	call	_drawHealth
00103$:
;main.c:83: if (health == 0) {
	ld	a, (#_health)
	or	a, a
	jr	NZ, 00105$
;main.c:84: gameOver = TRUE;
	ld	hl, #_gameOver
	ld	(hl), #0x01
;main.c:85: gameRunning = FALSE;
	ld	hl, #_gameRunning
	ld	(hl), #0x00
00105$:
;main.c:87: scrollGameWorld();
	call	_scrollGameWorld
;main.c:88: frame += 1;
	ld	hl, #_frame
	inc	(hl)
;main.c:89: wait_vbl_done();
	call	_wait_vbl_done
;main.c:91: }
	jr	00107$
_MAX_SHOTS:
	.db #0x0a	; 10
_MAX_TARGETS:
	.db #0x05	; 5
_HIGHEST_Y:
	.db #0x20	; 32
_LOWEST_Y:
	.db #0x64	; 100	'd'
;main.c:94: void handleInput() {
;	---------------------------------
; Function handleInput
; ---------------------------------
_handleInput::
	add	sp, #-3
;main.c:95: UINT8 frameMod4 = frame % 4;
	ld	a, (#_frame)
	and	a, #0x03
	ldhl	sp,	#0
	ld	(hl), a
;main.c:96: UINT8 input = joypad();
	call	_joypad
	ldhl	sp,	#1
	ld	(hl), e
;main.c:97: if (input & J_START) {
	bit	7, (hl)
	jr	Z, 00104$
;main.c:98: if (!gameOver) {
	ld	a, (#_gameOver)
	or	a, a
	jr	NZ, 00104$
;main.c:99: paused = !paused;
	ld	hl, #_paused
	ld	a, (hl)
	sub	a,#0x01
	ld	a, #0x00
	rla
	ld	(hl), a
;main.c:100: gameRunning = !gameRunning;
	ld	hl, #_gameRunning
	ld	a, (hl)
	sub	a,#0x01
	ld	a, #0x00
	rla
	ld	(hl), a
00104$:
;main.c:103: if (!gameRunning) {
	ld	a, (#_gameRunning)
	or	a, a
;main.c:104: return;
	jp	Z,00154$
;main.c:108: set_sprite_tile(0, 4 + frameMod4);
	ldhl	sp,	#0
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	inc	(hl)
	inc	(hl)
	inc	(hl)
	inc	(hl)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	de, #(_shadow_OAM + 0x0002)
	ld	a, (hl)
	ld	(de), a
;main.c:109: BOOLEAN firing = FALSE;
	ld	c, #0x00
;main.c:110: if (input & J_A && !shotActive) {
	dec	hl
	bit	4, (hl)
	jr	Z, 00108$
	ld	hl, #_shotActive
	ld	a, (hl)
	or	a, a
	jr	NZ, 00108$
;main.c:111: firing = TRUE;
	ld	c, #0x01
;main.c:112: shotActive = TRUE;
	ld	(hl), #0x01
;main.c:113: spitballX = playerX + 8;
	ld	a, (#_playerX)
	add	a, #0x08
	ld	(#_spitballX),a
;main.c:114: spitballY = playerY + 8;
	ld	a, (#_playerY)
	add	a, #0x08
	ld	(#_spitballY),a
00108$:
;main.c:117: if (input & J_SELECT) {
	ldhl	sp,	#1
	bit	6, (hl)
	jr	Z, 00111$
;main.c:118: resetGame();
	call	_resetGame
;main.c:119: return;
	jp	00154$
00111$:
;main.c:122: if (shotActive) {
	ld	a, (#_shotActive)
	or	a, a
	jr	Z, 00113$
;main.c:123: move_sprite(0, spitballX, spitballY);
	ld	hl, #_spitballY
	ld	b, (hl)
	ld	hl, #_spitballX
	ld	e, (hl)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), e
;main.c:123: move_sprite(0, spitballX, spitballY);
00113$:
;main.c:126: spitballX += 4;
	ld	hl, #_spitballX
	ld	a, (hl)
	add	a, #0x04
	ld	(hl), a
;main.c:114: spitballY = playerY + 8;
	ld	hl, #_playerY
	ld	b, (hl)
;main.c:128: if (input & J_UP && playerY > HIGHEST_Y) {
	ldhl	sp,	#1
	bit	2, (hl)
	jr	Z, 00118$
	ld	hl, #_HIGHEST_Y
	ld	e, (hl)
	ld	a, e
	ld	hl, #_playerY
	sub	a, (hl)
	jr	NC, 00118$
;main.c:129: playerY -= 1;
	ld	a, b
	add	a, #0xff
	ld	(hl), a
	jr	00119$
00118$:
;main.c:130: } else if (input & J_DOWN && playerY < LOWEST_Y) {
	ldhl	sp,	#1
	bit	3, (hl)
	jr	Z, 00119$
	ld	hl, #_LOWEST_Y
	ld	e, (hl)
	ld	hl, #_playerY
	ld	a, (hl)
	sub	a, e
	jr	NC, 00119$
;main.c:131: playerY += 1;
	ld	a, b
	inc	a
	ld	(hl), a
00119$:
;main.c:113: spitballX = playerX + 8;
	ld	hl, #_playerX
	ld	b, (hl)
;main.c:133: if (input & J_RIGHT && playerX < 80) {
	ldhl	sp,	#1
	bit	0, (hl)
	jr	Z, 00125$
	ld	hl, #_playerX
	ld	a, (hl)
	sub	a, #0x50
	jr	NC, 00125$
;main.c:134: playerX += 1;
	ld	a, b
	inc	a
	ld	(hl), a
	jr	00126$
00125$:
;main.c:135: } else if (input & J_LEFT && playerX > 16) {
	ldhl	sp,	#1
	bit	1, (hl)
	jr	Z, 00126$
	ld	a, #0x10
	ld	hl, #_playerX
	sub	a, (hl)
	jr	NC, 00126$
;main.c:136: playerX -= 1;
	ld	a, b
	add	a, #0xff
	ld	(hl), a
00126$:
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0006)
	ld	(hl), #0x0c
	ld	hl, #(_shadow_OAM + 0x000a)
	ld	(hl), #0x0a
	ld	hl, #(_shadow_OAM + 0x000e)
	ld	(hl), #0x08
	ld	hl, #(_shadow_OAM + 0x0012)
	ld	(hl), #0x09
	ld	hl, #(_shadow_OAM + 0x001e)
	ld	(hl), #0x0e
	ld	hl, #(_shadow_OAM + 0x0022)
	ld	(hl), #0x11
;main.c:148: if (frameMod4 == 0) {
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	NZ, 00129$
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0016)
	ld	(hl), #0x0f
;main.c:149: set_sprite_tile(5, 15); // Fuselage w/exhaust
	jr	00130$
00129$:
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0016)
	ld	(hl), #0x0b
;main.c:151: set_sprite_tile(5, 11); // Fuselage
00130$:
;main.c:155: if (firing) {
	ld	a, c
	or	a, a
	jr	Z, 00132$
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x001a)
	ld	(hl), #0x0d
;main.c:156: set_sprite_tile(6, 13); // Mouth (firing)
	jr	00133$
00132$:
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x001a)
	ld	(hl), #0x10
;main.c:158: set_sprite_tile(6, 16); // Mouth (inactive)
00133$:
;main.c:161: move_sprite(1, playerX, playerY);
	ld	hl, #_playerY
	ld	c, (hl)
	ld	hl, #_playerX
	ld	b, (hl)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0004)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:162: move_sprite(2, playerX - 8, playerY);
	ld	hl, #_playerY
	ld	c, (hl)
	ld	a, (#_playerX)
	add	a, #0xf8
	ld	b, a
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0008)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:163: move_sprite(3, playerX - 16, playerY);
	ld	hl, #_playerY
	ld	c, (hl)
	ld	a, (#_playerX)
	add	a, #0xf0
	ld	b, a
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x000c)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:164: move_sprite(4, playerX - 16, playerY + 8);
	ld	a, (#_playerY)
	add	a, #0x08
	ld	c, a
	ld	a, (#_playerX)
	add	a, #0xf0
	ld	b, a
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0010)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:165: move_sprite(5, playerX - 8, playerY + 8);
	ld	a, (#_playerY)
	add	a, #0x08
	ld	c, a
	ld	a, (#_playerX)
	add	a, #0xf8
	ld	b, a
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0014)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:166: move_sprite(6, playerX, playerY + 8);
	ld	a, (#_playerY)
	add	a, #0x08
	ld	c, a
	ld	hl, #_playerX
	ld	b, (hl)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0018)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:167: move_sprite(7, playerX + 8, playerY);
	ld	hl, #_playerY
	ld	c, (hl)
	ld	a, (#_playerX)
	add	a, #0x08
	ld	b, a
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x001c)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:168: move_sprite(8, playerX + 8, playerY + 8);
	ld	a, (#_playerY)
	add	a, #0x08
	ld	c, a
	ld	a, (#_playerX)
	add	a, #0x08
	ld	b, a
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0020)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:168: move_sprite(8, playerX + 8, playerY + 8);
00154$:
;main.c:170: }
	add	sp, #3
	ret
;main.c:172: void handleEndInput() {
;	---------------------------------
; Function handleEndInput
; ---------------------------------
_handleEndInput::
;main.c:173: if (joypad() & J_SELECT) {
	call	_joypad
	bit	6, e
	ret	Z
;main.c:174: resetGame();
;main.c:175: return;
;main.c:177: }
	jp  _resetGame
;main.c:180: void moveTargets() {
;	---------------------------------
; Function moveTargets
; ---------------------------------
_moveTargets::
	add	sp, #-8
;main.c:181: if (!gameRunning) {
	ld	a, (#_gameRunning)
	or	a, a
;main.c:182: return;
	jp	Z,00142$
;main.c:184: UINT8 maxTargets = score % 4 + 1;
	ld	a, (#_score)
	and	a, #0x03
	ld	c, a
	inc	c
;main.c:185: if (maxTargets > MAX_TARGETS) {
	ld	hl, #_MAX_TARGETS
	ld	b, (hl)
	ld	a, b
	sub	a, c
	jr	NC, 00104$
;main.c:186: maxTargets = MAX_TARGETS;
	ld	c, b
00104$:
;main.c:191: UINT8 highestX = 0;
	xor	a, a
	ldhl	sp,	#7
	ld	(hl), a
;main.c:192: for (i = 0; i < 5; i++) {
	ld	hl, #_i
	ld	(hl), #0x00
	ld	b, #0x00
00138$:
;main.c:193: if (tActive[i]) {
	ld	a, #<(_tActive)
	ld	hl, #_i
	add	a, (hl)
	ld	e, a
	ld	a, #>(_tActive)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	or	a, a
	jr	Z, 00108$
;main.c:194: activeTargets++;
	inc	b
;main.c:195: if (targets[i][0] > highestX) {
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_targets
	add	hl, de
	ld	e, (hl)
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, e
	jr	NC, 00139$
;main.c:196: highestX = targets[i][0];
	ld	(hl), e
	jr	00139$
00108$:
;main.c:199: temp2 = i;
	ld	a, (#_i)
	ld	(#_temp2),a
00139$:
;main.c:192: for (i = 0; i < 5; i++) {
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x05
	jr	C, 00138$
;main.c:202: temp1 = rand();
	push	bc
	call	_rand
	pop	bc
	ld	hl, #_temp1
	ld	(hl), e
;main.c:203: if (activeTargets < maxTargets &&  (temp1 == 0 || temp1 == 1) && highestX < 140) {
	ld	a, b
	sub	a, c
	jr	NC, 00112$
	ld	a, (hl)
	or	a, a
	jr	Z, 00115$
	ld	a, (hl)
	dec	a
	jr	NZ, 00112$
00115$:
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x8c
	jr	NC, 00112$
;main.c:204: tActive[temp2] = TRUE;
	ld	a, #<(_tActive)
	ld	hl, #_temp2
	add	a, (hl)
	ld	c, a
	ld	a, #>(_tActive)
	adc	a, #0x00
	ld	b, a
	ld	a, #0x01
	ld	(bc), a
;main.c:205: targets[temp2][0] = 160;
	ld	a, (hl)
	ld	c, #0x00
	ld	l, a
	ld	h, c
	add	hl, hl
	ld	de, #_targets
	add	hl, de
	ld	(hl), #0xa0
;main.c:206: targets[temp2][1] = (rand() % (LOWEST_Y - HIGHEST_Y)) + HIGHEST_Y;;
	ld	a, (#_temp2)
	ld	b, #0x00
	add	a, a
	rl	b
	add	a, #<(_targets)
	ld	c, a
	ld	a, b
	adc	a, #>(_targets)
	ld	b, a
	inc	bc
	ldhl	sp,	#6
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	call	_rand
	ld	b, e
	ld	hl, #_LOWEST_Y
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #_HIGHEST_Y
	ld	c, (hl)
	ld	l, c
	ld	h, #0x00
	ld	a, e
	sub	a, l
	ld	l, a
	ld	a, d
	sbc	a, h
	ld	h, a
	ld	a, b
	rla
	sbc	a, a
	ld	d, a
	push	bc
	push	hl
	ld	e, b
	push	de
	call	__modsint
	add	sp, #4
	pop	bc
	ld	a, e
	add	a, c
	ld	c, a
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
00112$:
;main.c:209: for (i = 0; i < 5; i++) {
	ld	hl, #_i
	ld	(hl), #0x00
00140$:
;main.c:210: if (tActive[i]) {
;c
	ld	de, #_tActive
	ld	hl, #_i
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jp	Z, 00141$
;main.c:195: if (targets[i][0] > highestX) {
	ld	hl, #_i
	ld	c, (hl)
	ld	b, #0x00
;main.c:211: if (targets[i][0] < 8) {
	sla	c
	rl	b
	ld	hl, #_targets
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x08
	jr	NC, 00126$
;main.c:212: tActive[i] = FALSE;
	pop	hl
	push	hl
	ld	(hl), #0x00
;main.c:213: move_sprite(10 + (i * 2), 0, -20);
	ld	a, (#_i)
	add	a, a
	add	a, #0x0a
	ld	c, a
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, #0xec
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:214: move_sprite(11 + (i * 2), 0, -20);
	ld	a, (#_i)
	add	a, a
	add	a, #0x0b
	ld	c, a
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, #0xec
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:215: health--;
	ld	hl, #_health
	dec	(hl)
	jp	00141$
00126$:
;main.c:220: if (spitballY >= (targets[i][1] -2) && spitballY <= (targets[i][1] + 18)) {
	ld	hl, #_targets
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
;main.c:218: if (shotActive) {
	ld	a, (#_shotActive)
	or	a, a
	jp	Z, 00123$
;main.c:219: if (targets[i][0] < (spitballX - 8) && targets[i][0] > (spitballX - 16)) {
	ld	hl, #_spitballX
	ld	c, (hl)
	ld	b, #0x00
	ld	de, #0x0008
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#5
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#7
	ld	a, (hl-)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
	ldhl	sp,	#6
	ld	e, l
	ld	d, h
	ldhl	sp,	#4
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00251$
	bit	7, d
	jr	NZ, 00252$
	cp	a, a
	jr	00252$
00251$:
	bit	7, d
	jr	Z, 00252$
	scf
00252$:
	jp	NC, 00123$
	ld	a, c
	add	a, #0xf0
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ldhl	sp,	#6
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00253$
	bit	7, d
	jr	NZ, 00254$
	cp	a, a
	jr	00254$
00253$:
	bit	7, d
	jr	Z, 00254$
	scf
00254$:
	jp	NC, 00123$
;main.c:220: if (spitballY >= (targets[i][1] -2) && spitballY <= (targets[i][1] + 18)) {
	pop	bc
	pop	hl
	push	hl
	push	bc
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	dec	bc
	dec	bc
	ld	a, (#_spitballY)
	ldhl	sp,	#6
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00255$
	bit	7, d
	jr	NZ, 00256$
	cp	a, a
	jr	00256$
00255$:
	bit	7, d
	jr	Z, 00256$
	scf
00256$:
	jp	C, 00123$
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0012
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#6
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00257$
	bit	7, d
	jr	NZ, 00258$
	cp	a, a
	jr	00258$
00257$:
	bit	7, d
	jr	Z, 00258$
	scf
00258$:
	jp	C, 00123$
;main.c:221: tActive[i] = FALSE;
	pop	hl
	push	hl
	ld	(hl), #0x00
;main.c:222: move_sprite(10 + (i * 2), 0, -20);
	ld	a, (#_i)
	add	a, a
	add	a, #0x0a
	ld	c, a
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ldhl	sp,	#6
	ld	(hl), c
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ld	a, #0x02
00259$:
	ldhl	sp,	#4
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00259$
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#4
	ld	(hl+), a
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0xec
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:223: move_sprite(11 + (i * 2), 0, -20);
	ld	a, (#_i)
	add	a, a
	add	a, #0x0b
	ld	c, a
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ldhl	sp,	#6
	ld	(hl), c
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ld	a, #0x02
00260$:
	ldhl	sp,	#4
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00260$
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, (hl)
	ldhl	sp,	#4
	ld	(hl+), a
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0xec
;c
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	hl, #_shadow_OAM
	ld	(hl), #0xec
	ld	hl, #(_shadow_OAM + 0x0001)
	ld	(hl), #0x00
;main.c:225: score++;
	ld	hl, #_score
	inc	(hl)
;main.c:226: spitballY = -20;
	ld	hl, #_spitballY
	ld	(hl), #0xec
;main.c:227: shotActive = FALSE;
	ld	hl, #_shotActive
	ld	(hl), #0x00
;main.c:228: goto dontDraw; // yeet
	jp	00141$
00123$:
;main.c:234: targets[i][0] -= 1 + (score / 20);
	ld	hl, #_score
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #0x0014
	push	hl
	push	bc
	call	__divsint
	add	sp, #4
	push	hl
	ldhl	sp,	#8
	ld	(hl), e
	ldhl	sp,	#9
	ld	(hl), d
	pop	hl
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	(hl), a
	ld	a, (hl)
	inc	a
	dec	hl
	dec	hl
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl), a
	ld	a, (hl-)
	dec	hl
	sub	a, (hl)
	inc	hl
	inc	hl
	ld	(hl), a
	pop	bc
	pop	de
	push	de
	push	bc
	ld	a, (hl)
	ld	(de), a
;main.c:235: move_sprite(10 + (i * 2), targets[i][0], targets[i][1]);
	ld	a, (#_i)
	ldhl	sp,	#6
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl-)
	dec	hl
	ld	(hl-), a
	sla	(hl)
	inc	hl
	rl	(hl)
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_targets
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	hl
	inc	hl
	ld	(hl), a
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	hl
	dec	hl
	ld	(hl), a
	ld	a, (#_i)
	add	a, a
	add	a, #0x0a
	ld	c, a
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ldhl	sp,	#6
	ld	(hl), c
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, #0x02
00262$:
	ldhl	sp,	#2
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00262$
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
;c
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;main.c:236: move_sprite(11 + (i * 2), targets[i][0], targets[i][1] + 8);
	ld	a, (#_i)
	ldhl	sp,	#6
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl-)
	dec	hl
	ld	(hl-), a
	sla	(hl)
	inc	hl
	rl	(hl)
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_targets
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
;c
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x08
	dec	hl
	ld	(hl), a
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	hl
	dec	hl
	ld	(hl), a
	ld	a, (#_i)
	add	a, a
	add	a, #0x0b
	ld	c, a
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ldhl	sp,	#6
	ld	(hl), c
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, #0x02
00264$:
	ldhl	sp,	#2
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00264$
;c
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
;c
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;main.c:237: dontDraw:
00141$:
;main.c:209: for (i = 0; i < 5; i++) {
	ld	hl, #_i
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x05
	jp	C, 00140$
00142$:
;main.c:242: }
	add	sp, #8
	ret
;main.c:244: void drawScore() {
;	---------------------------------
; Function drawScore
; ---------------------------------
_drawScore::
;main.c:246: UINT8 fMod4 = frame % 4;
	ld	a, (#_frame)
	and	a, #0x03
;main.c:247: set_sprite_tile(0, 4 + fMod4);
	ld	c, a
	add	a, #0x04
	ld	b, a
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0002)
	ld	(hl), b
;main.c:248: set_sprite_tile(1, 4 + fMod4);
	ld	a, c
	add	a, #0x04
	ld	c, a
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0006)
	ld	(hl), c
;main.c:249: set_sprite_tile(4, (20 + ((score) % 10)));
	ld	hl, #_score
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #0x000a
	push	hl
	push	bc
	call	__modsint
	add	sp, #4
	ld	a, e
	add	a, #0x14
	ld	c, a
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0012)
	ld	(hl), c
;main.c:250: set_sprite_tile(3, (20 + ((score / 10) % 10)));
	ld	hl, #_score
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #0x000a
	push	hl
	push	bc
	call	__divsint
	add	sp, #4
	ld	hl, #0x000a
	push	hl
	push	de
	call	__modsint
	add	sp, #4
	ld	a, e
	add	a, #0x14
	ld	c, a
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x000e)
	ld	(hl), c
;main.c:251: set_sprite_tile(2, (20 + ((score / 100) % 10)));
	ld	hl, #_score
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #0x0064
	push	hl
	push	bc
	call	__divsint
	add	sp, #4
	ld	hl, #0x000a
	push	hl
	push	de
	call	__modsint
	add	sp, #4
	ld	a, e
	add	a, #0x14
	ld	c, a
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x000a)
	ld	(hl), c
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	(hl), #0x48
	inc	hl
	ld	(hl), #0x40
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0004)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	(hl), #0x48
	inc	hl
	ld	(hl), #0x60
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0008)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	(hl), #0x48
	inc	hl
	ld	(hl), #0x48
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x000c)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	(hl), #0x48
	inc	hl
	ld	(hl), #0x50
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0010)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	(hl), #0x48
	inc	hl
	ld	(hl), #0x58
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0014)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	(hl), #0xa0
	inc	hl
	ld	(hl), #0xaa
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0018)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	(hl), #0xa0
	inc	hl
	ld	(hl), #0xaa
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x001c)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	(hl), #0xa0
	inc	hl
	ld	(hl), #0xaa
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0020)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	(hl), #0xa0
	inc	hl
	ld	(hl), #0xaa
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0024)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	(hl), #0xa0
	inc	hl
	ld	(hl), #0xaa
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0028)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	(hl), #0xa0
	inc	hl
	ld	(hl), #0xaa
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x002c)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	(hl), #0xa0
	inc	hl
	ld	(hl), #0xaa
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0030)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	(hl), #0xa0
	inc	hl
	ld	(hl), #0xaa
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0034)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	(hl), #0xa0
	inc	hl
	ld	(hl), #0xaa
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0038)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	(hl), #0xa0
	inc	hl
	ld	(hl), #0xaa
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x003c)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	(hl), #0xa0
	inc	hl
	ld	(hl), #0xaa
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0040)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	(hl), #0xa0
	inc	hl
	ld	(hl), #0xaa
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0044)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	(hl), #0xa0
	inc	hl
	ld	(hl), #0xaa
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0048)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	(hl), #0xa0
	inc	hl
	ld	(hl), #0xaa
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x004c)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	(hl), #0xa0
	inc	hl
	ld	(hl), #0xaa
;main.c:274: move_sprite(19, 170, 160);
;main.c:275: }
	ret
;main.c:278: void drawHealth() {
;	---------------------------------
; Function drawHealth
; ---------------------------------
_drawHealth::
;main.c:279: if (health == 4) {
	ld	a, (#_health)
	sub	a, #0x04
	jr	NZ, 00110$
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0026)
	ld	(hl), #0x13
;main.c:280: set_sprite_tile(9, 19);
	ret
00110$:
;main.c:281: } else if (health == 3) {
	ld	a, (#_health)
	sub	a, #0x03
	jr	NZ, 00107$
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0026)
	ld	(hl), #0x12
;main.c:282: set_sprite_tile(9, 18);
	ret
00107$:
;main.c:283: } else if (health == 2) {
	ld	a, (#_health)
	sub	a, #0x02
	jr	NZ, 00104$
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0026)
	ld	(hl), #0x02
;main.c:284: set_sprite_tile(9, 2);
	ret
00104$:
;main.c:285: } else if (health == 1) {
	ld	a, (#_health)
	dec	a
	ret	NZ
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0026)
	ld	(hl), #0x03
;main.c:286: set_sprite_tile(9, 3);
;main.c:288: }
	ret
;main.c:291: void cleanup() {
;	---------------------------------
; Function cleanup
; ---------------------------------
_cleanup::
;main.c:292: if (shotActive && spitballX > 170) {
	ld	a, (#_shotActive)
	or	a, a
	ret	Z
	ld	a, #0xaa
	ld	hl, #_spitballX
	sub	a, (hl)
	ret	NC
;main.c:293: shotActive = FALSE;
	ld	hl, #_shotActive
	ld	(hl), #0x00
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, #0xf0
	ld	(hl+), a
	ld	(hl), #0xf0
;main.c:294: move_sprite(0, -16, -16);
;main.c:297: }
	ret
;main.c:300: void scrollGameWorld() {
;	---------------------------------
; Function scrollGameWorld
; ---------------------------------
_scrollGameWorld::
;main.c:301: if (gameRunning) {
	ld	a, (#_gameRunning)
	or	a, a
	ret	Z
;main.c:302: scroll1 += 2;
	ld	hl, #_scroll1
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
;main.c:303: scroll2 += 1;
	ld	hl, #_scroll2
	inc	(hl)
;main.c:304: scroll3 += 2;
	ld	hl, #_scroll3
	ld	a, (hl)
	add	a, #0x02
	ld	(hl), a
;main.c:305: scroll4 += 3;
	ld	hl, #_scroll4
	ld	a, (hl)
	add	a, #0x03
	ld	(hl), a
;main.c:306: scroll5 += 4;
	ld	hl, #_scroll5
	ld	a, (hl)
	add	a, #0x04
	ld	(hl), a
;main.c:307: scroll6 += 5;
	ld	hl, #_scroll6
	ld	a, (hl)
	add	a, #0x05
	ld	(hl), a
;main.c:309: }
	ret
;main.c:312: void lcdInterruptHandler() {
;	---------------------------------
; Function lcdInterruptHandler
; ---------------------------------
_lcdInterruptHandler::
;main.c:313: if (LYC_REG == 0x00) {
	ld	a, (#_LYC_REG)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:761: SCX_REG=x, SCY_REG=y;
	or	a,a
	jr	NZ, 00119$
	ldh	(_SCX_REG+0),a
	ld	a, #0x00
	ldh	(_SCY_REG+0),a
;main.c:315: LYC_REG = 0x7;
	ld	a, #0x07
	ldh	(_LYC_REG+0),a
	ret
00119$:
;main.c:316: } else if (LYC_REG == 0x7) {
	ldh	a, (_LYC_REG+0)
	sub	a, #0x07
	jr	NZ, 00116$
;main.c:317: move_bkg(scroll1, 0);
	ld	a, (#_scroll1)
	ldh	(_SCX_REG+0),a
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:761: SCX_REG=x, SCY_REG=y;
	ld	a, #0x00
	ldh	(_SCY_REG+0),a
;main.c:318: LYC_REG = 0xF;
	ld	a, #0x0f
	ldh	(_LYC_REG+0),a
	ret
00116$:
;main.c:319: } else if (LYC_REG == 0xF) {
	ldh	a, (_LYC_REG+0)
	sub	a, #0x0f
	jr	NZ, 00113$
;main.c:320: move_bkg(scroll2, 0);
	ld	a, (#_scroll2)
	ldh	(_SCX_REG+0),a
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:761: SCX_REG=x, SCY_REG=y;
	ld	a, #0x00
	ldh	(_SCY_REG+0),a
;main.c:321: LYC_REG = 0x1A;
	ld	a, #0x1a
	ldh	(_LYC_REG+0),a
	ret
00113$:
;main.c:322: } else if (LYC_REG == 0x1A) {
	ldh	a, (_LYC_REG+0)
	sub	a, #0x1a
	jr	NZ, 00110$
;main.c:323: move_bkg(scroll3, 0);
	ld	a, (#_scroll3)
	ldh	(_SCX_REG+0),a
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:761: SCX_REG=x, SCY_REG=y;
	ld	a, #0x00
	ldh	(_SCY_REG+0),a
;main.c:324: LYC_REG = 0x67;
	ld	a, #0x67
	ldh	(_LYC_REG+0),a
	ret
00110$:
;main.c:325: } else if (LYC_REG == 0x67) {
	ldh	a, (_LYC_REG+0)
	sub	a, #0x67
	jr	NZ, 00107$
;main.c:326: move_bkg(scroll4, 0);
	ld	a, (#_scroll4)
	ldh	(_SCX_REG+0),a
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:761: SCX_REG=x, SCY_REG=y;
	ld	a, #0x00
	ldh	(_SCY_REG+0),a
;main.c:327: LYC_REG = 0x6F;
	ld	a, #0x6f
	ldh	(_LYC_REG+0),a
	ret
00107$:
;main.c:328: } else if (LYC_REG == 0x6F) {
	ldh	a, (_LYC_REG+0)
	sub	a, #0x6f
	jr	NZ, 00104$
;main.c:329: move_bkg(scroll5, 0);
	ld	a, (#_scroll5)
	ldh	(_SCX_REG+0),a
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:761: SCX_REG=x, SCY_REG=y;
	ld	a, #0x00
	ldh	(_SCY_REG+0),a
;main.c:330: LYC_REG = 0x8C;
	ld	a, #0x8c
	ldh	(_LYC_REG+0),a
	ret
00104$:
;main.c:331: }else if (LYC_REG == 0x8C) {
	ldh	a, (_LYC_REG+0)
	sub	a, #0x8c
	ret	NZ
;main.c:332: move_bkg(scroll6, 0);
	ld	a, (#_scroll6)
	ldh	(_SCX_REG+0),a
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:761: SCX_REG=x, SCY_REG=y;
	ld	a, #0x00
	ldh	(_SCY_REG+0),a
;main.c:333: LYC_REG = 0x00;
	ld	a, #0x00
	ldh	(_LYC_REG+0),a
;main.c:335: }
	ret
;main.c:337: void configureDisplay() {
;	---------------------------------
; Function configureDisplay
; ---------------------------------
_configureDisplay::
;main.c:338: STAT_REG = 0x45;
	ld	a, #0x45
	ldh	(_STAT_REG+0),a
;main.c:339: LYC_REG = 0x00;
	ld	a, #0x00
	ldh	(_LYC_REG+0),a
;main.c:341: disable_interrupts();
	call	_disable_interrupts
;main.c:342: add_LCD(lcdInterruptHandler);
	ld	hl, #_lcdInterruptHandler
	push	hl
	call	_add_LCD
	add	sp, #2
;main.c:343: enable_interrupts();
	call	_enable_interrupts
;main.c:345: set_bkg_data(0, 36, BackgroundTileSet);
	ld	hl, #_BackgroundTileSet
	push	hl
	ld	a, #0x24
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_data
	add	sp, #4
;main.c:346: set_bkg_tiles(0, 0, BackgroundTileMapWidth, BackgroundTileMapHeight, BackgroundTileMap);
	ld	hl, #_BackgroundTileMap
	push	hl
	ld	de, #0x1220
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;main.c:347: set_sprite_data(0, 32, ShootySprites);
	ld	hl, #_ShootySprites
	push	hl
	ld	a, #0x20
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;main.c:349: set_interrupts(VBL_IFLAG | LCD_IFLAG);
	ld	a, #0x03
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
;main.c:351: SHOW_BKG;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x01
	ldh	(_LCDC_REG+0),a
;main.c:352: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;main.c:353: DISPLAY_ON;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x80
	ldh	(_LCDC_REG+0),a
;main.c:355: initrand(221);
	ld	hl, #0x00dd
	push	hl
	call	_initrand
	add	sp, #2
;main.c:356: }
	ret
;main.c:358: void resetGame() {
;	---------------------------------
; Function resetGame
; ---------------------------------
_resetGame::
;main.c:359: health = 4;
	ld	hl, #_health
	ld	(hl), #0x04
;main.c:360: score = 0;
	ld	hl, #_score
	ld	(hl), #0x00
;main.c:361: for (i = 0; i < 5; i++) {
	ld	hl, #_i
	ld	(hl), #0x00
00125$:
;main.c:362: tActive[i] = FALSE;
	ld	a, #<(_tActive)
	ld	hl, #_i
	add	a, (hl)
	ld	c, a
	ld	a, #>(_tActive)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
;main.c:361: for (i = 0; i < 5; i++) {
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x05
	jr	C, 00125$
;main.c:364: shotActive = FALSE;
	ld	hl, #_shotActive
	ld	(hl), #0x00
;main.c:366: paused = FALSE;
	ld	hl, #_paused
	ld	(hl), #0x00
;main.c:367: gameOver = FALSE;
	ld	hl, #_gameOver
	ld	(hl), #0x00
;main.c:368: gameRunning = TRUE;
	ld	hl, #_gameRunning
	ld	(hl), #0x01
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, #0xb4
	ld	(hl+), a
	ld	(hl), #0x8c
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0026)
	ld	(hl), #0x13
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0024)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, #0x10
	ld	(hl+), a
	ld	(hl), #0x0c
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1004: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x002a)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 0x002e)
	ld	(hl), #0x01
	ld	hl, #(_shadow_OAM + 0x0032)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 0x0036)
	ld	(hl), #0x01
	ld	hl, #(_shadow_OAM + 0x003a)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 0x003e)
	ld	(hl), #0x01
	ld	hl, #(_shadow_OAM + 0x0042)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 0x0046)
	ld	(hl), #0x01
	ld	hl, #(_shadow_OAM + 0x004a)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 0x004e)
	ld	(hl), #0x01
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0028)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, #0xec
	ld	(hl+), a
	ld	(hl), #0x00
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x002c)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, #0xec
	ld	(hl+), a
	ld	(hl), #0x00
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0030)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, #0xec
	ld	(hl+), a
	ld	(hl), #0x00
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0034)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, #0xec
	ld	(hl+), a
	ld	(hl), #0x00
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0038)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, #0xec
	ld	(hl+), a
	ld	(hl), #0x00
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x003c)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, #0xec
	ld	(hl+), a
	ld	(hl), #0x00
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0040)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, #0xec
	ld	(hl+), a
	ld	(hl), #0x00
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0044)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, #0xec
	ld	(hl+), a
	ld	(hl), #0x00
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x0048)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, #0xec
	ld	(hl+), a
	ld	(hl), #0x00
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1077: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 0x004c)
;C:/Users/ianaj/Desktop/gameboy/gbdk/include/gb/gb.h:1078: itm->y=y, itm->x=x;
	ld	a, #0xec
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:397: move_sprite(19, 0,  -20);
;main.c:398: }
	ret
	.area _CODE
	.area _CABS (ABS)
