;#link "CMINES.s"
;#resource "CHR_00.chr"
;#resource "CHR_01.chr"
;#resource "LEVELS.INC"
;#resource "PULSES.ASM"
;#resource "Crystal.cfg"
;#resource "CMDEF.h"
;#define CFGFILE Crystal.cfg
;#define LIBARGS ,

;
; iNES header
;

.segment "HEADER"

INES_MAPPER = 11 ; 11 = Color Dreams
INES_MIRROR = 1 ; 0 = horizontal mirroring, 1 = vertical mirroring
INES_SRAM   = 0 ; 1 = battery backed SRAM at $6000-7FFF

.byte 'N', 'E', 'S', $1A ; ID
.byte $04 ; 16k PRG chunk count
.byte $02
.byte INES_MIRROR | (INES_SRAM << 1) | ((INES_MAPPER & $f) << 4)
.byte (INES_MAPPER & %11110000)
.byte $0, $0, $0, $0, $0, $0, $0, $0 ; padding

.segment "TILES_00"
	.incbin "CHR_00.chr"        
.segment "TILES_01"
	.incbin "CHR_01.chr"        
