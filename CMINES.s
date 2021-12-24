;=============================================================================
;==  Crystal Mines  -  a video game by Ken Beckett, April 1989              ==
;==-------------------------------------------------------------------------==
;==  Copyright (C) 1989 by Ken Beckett                                      ==
;=============================================================================
;
.include "CMDEF.h"
;DEFINE(ROMVER,-1)		;REMOVE COMMENT TO MAKE ROM VERSION.
ROMVER = -1
.feature force_range


;=============================================================================
; LEVEL DATA START (DATA SEGMENT - SECOND 32K PAGE):
;
;.COMMAND -O		;ENABLE MULTIPLE OUTPUT FILES
;.SEGMENT .DATA,$0000	;DEFINE SEGMENT .DATA, LOAD AT 8000H
;.DATA			;ACTIVATE SEGMENT .DATA

;.ORG	$8000		;ORIGIN FOR ROUTINES IN SECOND PAGE.
.segment "BANK_01"	;Because it says second page right below
;------------------------------------------------------------------SECOND PAGE
; Setup level structures in RAM.
;
; Changes: A, X, Y
;
SETULEV2:
		lda	#0
		sta	DIFFLEV		;Reset difficulty level counter.

		ldx	PLAYERUP	;Get current player number.
		lda	LEVEL_P1,x	;Get level number.
		sec
		sbc	#1		;Make base 0.

sladdrlp:	cmp	#LAST_LEV
		bcc	sladdr		;Go if level number OK.
		sec
		sbc	#LAST_LEV	;Adjust level number.
		inc	DIFFLEV		;Increment difficulty level.
		jmp	sladdrlp	;Loop.

sladdr:		asl	a		;Make index.
		tay			;Put in Y.
		lda	lev_list,y	;Get LSB of data address.
		sta	T1		;Save it.
		lda	lev_list+1,y	;Get MSB of data address.
		sta	T2		;Save it.

		lda	DIFFLEV		;Get difficulty level.
		asl	a
		asl	a
		asl	a
		tay			;Y = DIFFLEV * 8.

		lda	(T1),y		;Get LSB time for level.
		sta	TIMELEFT	;Store it.
		iny
		lda	(T1),y		;Get MSB time for level.
		sta	TIMLEFT2	;Store it.
		iny

		lda	(T1),y		;Get gem quota for level.
		sta	QUOTA		;Store it.
		iny

		lda	DIFFLEV		;Check difficulty level.
		beq	suldiff1	;Go if level 1.
		jmp	XSETULEV	;Go use mirror-image routine.
suldiff1:

		lda	(T1),y		;Get robot starting X position.
		asl	a		;Adjust & store it.
		asl	a
		asl	a
		asl	a
		sta	ROBOT_X
		lda	#0
		rol	a
		sta	ROBOT_X+1
		iny

		lda	(T1),y		;Get robot starting Y position.
		asl	a		;Adjust & store it.
		asl	a
		asl	a
		asl	a
		sta	ROBOT_Y
		iny

		ldx	#0
		stx	ROBOT_C		;Clear animation counter.
		stx	ROBOT_A		;Clear death animation pointer.

		lda	(T1),y		;Get direction byte.
		cmp	#LEFT		;Check for left.
		bne	slcont		;Continue if not.
		ldx	#%01000000	;Set flip bit (face left).
		lda	#RIGHT
slcont:		clc
		adc	#R_SIDE		;Get starting sprite object #.
		sta	ROBOT_N		;Save it.
		stx	ROBOT_F		;Save flag byte.
		iny
		
		lda	(T1),y		;Get exit square X position.
		sta	EXIT_X
		iny

		lda	(T1),y		;Get exit square Y position.
		sta	EXIT_Y

		lda	#2*8		;Update T2:T1 to point to start
		clc			;   of level grid data.
		adc	T1
		sta	T1
		bcc	sulc1
		inc	T2
sulc1:
		lda	#CUR_LEV & $ff
		sta	T3		;Set T4:T3 to point to RAM area.
		lda	#CUR_LEV >> 8
		sta	T4

		ldy	#0
		lda	#IROCK
sullp1:		sta	(T3),y		;Store border block.
		iny
		cpy	#32
		bcc	sullp1		;Draw entire line.

		lda	T3		;Add 32 to T4:T3.
		clc
		adc	#32
		sta	T3
		bcc	sulc2
		inc	T4
sulc2:
		ldx	#11		;Transfer 11 lines.

sullp2:		ldy	#0
		lda	#IROCK
		sta	(T3),y		;Store border block.

sullp3:		lda	(T1),y		;Move level grid data to RAM.
		iny
		sta	(T3),y
		cpy	#30
		bcc	sullp3		;Move a line of data.

		lda	#IROCK
		iny
		sta	(T3),y		;Store border block.

		lda	T1		;Add 30 to T2:T1.
		clc
		adc	#30
		sta	T1
		bcc	sulc3
		inc	T2
sulc3:		lda	T3		;Add 32 to T4:T3.
		clc
		adc	#32
		sta	T3
		bcc	sulc4
		inc	T4
sulc4:
		dex
		bne	sullp2		;Loop for all lines.

		ldy	#0
		lda	#IROCK
sullp4:		sta	(T3),y		;Store border block.
		iny
		cpy	#32
		bcc	sullp4		;Draw entire line.

		;Initialize level variables and lists.
		lda	#2
		sta	EXIT_ANC	;Reset exit square animation counter.
		lda	#$ff
		sta	MRR_LAST	;Set hit radioactive rock dir. flag.
		lda	#0
		sta	MRR_CNT		;Reset hit radioactive rock counter.
		sta	TIME_LOW	;Clear low-time flag.
		sta	EB_DELAY	;Clear inter-shot delay.
		sta	NUM_GEMS	;Set gems collected to 0.
		sta	NUM_BOMB	;Set # of bombs to 0.
		sta	EXIT_ON		;Clear exit on flag.
		sta	EXITED		;Clear exited level flag.
		sta	DIED		;Clear robot died flag.
		sta	ROBRADIO	;Clear robot radioactive flag.
		sta	PAUSED		;Clear game paused flag.
		sta	LP_FLAG		;Clear liquid-proof flag.
		sta	CP_FLAG		;Clear creature-proof flag.
		sta	FT_FLAG		;Clear freeze-timer flag.
		sta	EP_FLAG		;Clear explosion-proof flag.
		sta	RP_FLAG		;Clear radioactive-proof flag.
		sta	FR_FLAG		;Clear frozen-robot flag.
		sta	TL_CHG		;Clear time change flag.
		sta	PSHL_CNT
		sta	PSHR_CNT

		lda	#0
		sta	CUR_EB		;Set # of active energy balls to 0.

		ldx	#MAX_EB*6
sullp5:		dex
		sta	EB_LIST,x	;Clear energy ball list.
		bne	sullp5

		ldx	#MAX_BM*3
sullp6:		dex
		sta	BM_LIST,x	;Clear bomb list.
		bne	sullp6

		ldx	#MAX_AN*4
sullp7:		dex
		sta	AN_LIST,x	;Clear animation list.
		bne	sullp7

		ldx	#MAX_HO*3
sullp8:		dex
		sta	HO_LIST,x	;Clear hidden object list.
		bne	sullp8
		sta	LASTHOBJ	;Clear end of hidden object list ptr.

		ldx	#MAX_MV*8
sullp82:	dex
		sta	MV_LIST,x	;Clear moving object list.
		bne	sullp82

		ldx	#MAX_MM*8
sullp83:	dex
		sta	MM_LIST,x	;Clear monster list.
		bne	sullp83

		;Scan through all blocks on level.
		ldy	#3		;Start Y at first row.
sullp9:		ldx	#1		;Start X at first column.
sullp10:	jsr	P2getbgblk	;Get object at X,Y.

		cmp	#BOMB
		bne	sulchk		;Continue if not a bomb.

		lda	#BOMB_CNT
		jsr	P2addexpl	;Add explosion to bomb list.
		jmp	sulnblk		;Continue.

sulchk:		cmp	#EXTRA+1
		bcs	sulnblk		;Go if not <= EXTRA.
		cmp	#PBOMB1
		bcc	sulnblk		;Go if not >= PBOMB1.

		cmp	#EXTRA		;Check for EXTRA robot prize.
		bne	sulchk2		;Continue if not.

		pha			;Save A.
		txa
		pha			;Save X.
		ldx	PLAYERUP	;Get current player number.
		lda	GOTXR_P1,x	;Get got-EXTRA-robot flag.
		beq	sulexok		;Continue if didn't get it yet.

		tya
		pha			;Save Y.
		ldy	#0
		lda	#EMPTY
		sta	(T5),y		;Change to EMPTY block.
		pla
		tay			;Restore Y.

sulexok:	pla
		tax			;Restore X.
		pla			;Restore A.

sulchk2:	jsr	P2addhobj	;Add to hidden object list.

sulnblk:	inx
		cpx	#31		;Check X coordinate.
		bcc	sullp10		;Loop if X < 31.
		iny
		cpy	#14		;Check Y coordinate.
		bcc	sullp9		;Loop if Y < 14.

		ldy	#0
sullp11:	lda	(T1),y		;Read hidden object data.
		cmp	#ENDLIST
		beq	sulhodn		;Go if end of list.

		cmp	#CONTLIST
		bne	sulhocnt	;Go if not continue list.

sulhoskp:	iny
		lda	(T1),y
		cmp	#ENDLIST
		bne	sulhoskp	;Loop until end of list.
		jmp	sulhodn		;Continue.

sulhocnt:	cmp	#NEWLIST
		beq	sulhoskp	;Go if new list.

		sta	T7		;Save A.
		iny
		lda	(T1),y		;Get X coordinate.
		tax
		iny
		tya
		pha			;Save Y.
		lda	(T1),y		;Get Y coordinate.
		tay
		lda	T7		;Restore A.
		jsr	P2addhobj	;Add to hidden object list.
		pla
		tay
sulhoct2:	iny
		jmp	sullp11		;Loop.

sulhodn:
		iny			;Make Y point to creature data.
		tya			;Update T2:T1 to point to start
		clc			;   of creature data.
		adc	T1
		sta	T1
		bcc	suladyc1
		inc	T2
suladyc1:	ldy	#0

		ldx	#0
sullp12:	lda	(T1),y		;Read monster list.
		cmp	#ENDLIST
		beq	sulmndn		;Go if end of list.

		cmp	#CONTLIST
		bne	sulmncnt	;Go if not continue list.

sulmnskp:	iny
		lda	(T1),y
		cmp	#ENDLIST
		bne	sulmnskp	;Loop until end of list.
		jmp	sulmndn		;Continue.

sulmncnt:	cmp	#NEWLIST
		beq	sulmnskp	;Go if new list.

		cpx	#MAX_MM
		bcs	sulmndn		;Go if read maximum number.

		sta	MM_LIST,x	;Store monster number.
		iny
		lda	(T1),y		;Get X coordinate.
		asl	a		;Adjust & store it.
		asl	a
		asl	a
		asl	a
		sta	MM_LIST1,x	;Store LSB X coordinate.
		lda	#0
		rol	a
		sta	MM_LIST2,x	;Store MSB X coordinate.
		iny
		lda	(T1),y		;Get Y coordinate.
		asl	a		;Adjust & store it.
		asl	a
		asl	a
		asl	a
		sta	MM_LIST3,x	;Store Y coordinate.
		iny
		lda	(T1),y		;Get starting direction.
		sta	MM_LIST4,x	;Store direction.
		sta	MM_LIST7,x	;Set direction last moved.
		lda	#0
		sta	MM_LIST5,x	;Clear animation counter.
		sta	MM_LIST6,x	;Clear pause counter/anim. pointer.
		inx
		iny
		jmp	sullp12		;Loop.

sulmndn:
		stx	NUM_MON		;Save monster count.
		lda	#MAX_MV
		sec
		sbc	NUM_MON		;Calculate MAX_MV - monster count.
		sta	LMAX_MV		;Set max. moving rocks.

		lda	#0
sullp13:	cpx	NUM_MON
		bcs	sulmndn2	;Go if past end of list.
		sta	MM_LIST,x	;Clear list entry.
		inx
		jmp	sullp13		;Loop.
sulmndn2:
		ldx	LMAX_MV
sullp14:	dex
		sta	MV_LIST,x	;Clear moving object list.
		bne	sullp14

		sta	SCANNING	;Reset scanning flag.

		lda	#TICKS
		sta	TL_SUBT		;Initialize sub-timer.

		rts


;-----------------------------------------------------------------------------
; Setup level structures in RAM (mirror image routine!).
;
XSETULEV:
		lda	(T1),y		;Get robot starting X position.
		eor	#$ff		;Make mirror image.
		asl	a		;Adjust & store it.
		asl	a
		asl	a
		asl	a
		sta	ROBOT_X
		lda	#0
		rol	a
		sta	ROBOT_X+1
		iny

		lda	(T1),y		;Get robot starting Y position.
		asl	a		;Adjust & store it.
		asl	a
		asl	a
		asl	a
		sta	ROBOT_Y
		iny

		ldx	#0
		stx	ROBOT_C		;Clear animation counter.
		stx	ROBOT_A		;Clear death animation pointer.

		lda	(T1),y		;Get direction byte.
		cmp	#LEFT		;Check for LEFT.
		bne	xulrbtdr	;Go if not.
		lda	#RIGHT		;Change to RIGHT.
		jmp	xulrbtdc	;Continue.
xulrbtdr:	cmp	#RIGHT		;Check for RIGHT.
		bne	xulrbtdc	;Go if not.
		lda	#LEFT		;Change to LEFT.

xulrbtdc:	cmp	#LEFT		;Check for left.
		bne	xulcont		;Continue if not.
		ldx	#%01000000	;Set flip bit (face left).
		lda	#RIGHT
xulcont:	clc
		adc	#R_SIDE		;Get starting sprite object #.
		sta	ROBOT_N		;Save it.
		stx	ROBOT_F		;Save flag byte.
		iny
		
		lda	(T1),y		;Get exit square X position.
		eor	#$ff		;Make mirror image.
		and	#$1f		;Mask off high 3 bits.
		sta	EXIT_X
		iny

		lda	(T1),y		;Get exit square Y position.
		sta	EXIT_Y

		lda	#2*8		;Update T2:T1 to point to start
		clc			;   of level grid data.
		adc	T1
		sta	T1
		bcc	xulc1
		inc	T2
xulc1:
		lda	#CUR_LEV & $ff
		sta	T3		;Set T4:T3 to point to RAM area.
		lda	#CUR_LEV >> 8
		sta	T4

		ldy	#0
		lda	#IROCK
xullp1:		sta	(T3),y		;Store border block.
		iny
		cpy	#32
		bcc	xullp1		;Draw entire line.

		lda	T3		;Add 32 to T4:T3.
		clc
		adc	#32
		sta	T3
		bcc	xulc2
		inc	T4
xulc2:
		ldx	#11		;Transfer 11 lines.

xullp2:		ldy	#0
		lda	#IROCK
		sta	(T3),y		;Store border block.

xullp3:		tya
		sta	T7		;Save Y.
		eor	#$ff
		and	#$1f		;Make mirror image!
		sec
		sbc	#2
		tay
		lda	(T1),y		;Move level grid data to RAM.
		ldy	T7		;Restore Y.

		iny
		sta	(T3),y
		cpy	#30
		bcc	xullp3		;Move a line of data.

		lda	#IROCK
		iny
		sta	(T3),y		;Store border block.

		lda	T1		;Add 30 to T2:T1.
		clc
		adc	#30
		sta	T1
		bcc	xulc3
		inc	T2
xulc3:		lda	T3		;Add 32 to T4:T3.
		clc
		adc	#32
		sta	T3
		bcc	xulc4
		inc	T4
xulc4:
		dex
		bne	xullp2		;Loop for all lines.

		ldy	#0
		lda	#IROCK
xullp4:		sta	(T3),y		;Store border block.
		iny
		cpy	#32
		bcc	xullp4		;Draw entire line.


		;Initialize level variables and lists.
		lda	#2
		sta	EXIT_ANC	;Reset exit square animation counter.
		lda	#$ff
		sta	MRR_LAST	;Set hit radioactive rock dir. flag.
		lda	#0
		sta	MRR_CNT		;Reset hit radioactive rock counter.
		sta	TIME_LOW	;Clear low-time flag.
		sta	EB_DELAY	;Clear inter-shot delay.
		sta	NUM_GEMS	;Set gems collected to 0.
		sta	NUM_BOMB	;Set # of bombs to 0.
		sta	EXIT_ON		;Clear exit on flag.
		sta	EXITED		;Clear exited level flag.
		sta	DIED		;Clear robot died flag.
		sta	ROBRADIO	;Clear robot radioactive flag.
		sta	PAUSED		;Clear game paused flag.
		sta	LP_FLAG		;Clear liquid-proof flag.
		sta	CP_FLAG		;Clear creature-proof flag.
		sta	FT_FLAG		;Clear freeze-timer flag.
		sta	EP_FLAG		;Clear explosion-proof flag.
		sta	RP_FLAG		;Clear radioactive-proof flag.
		sta	FR_FLAG		;Clear frozen-robot flag.
		sta	TL_CHG		;Clear time change flag.
		sta	PSHL_CNT
		sta	PSHR_CNT

		lda	#0
		sta	CUR_EB		;Set # of active energy balls to 0.

		ldx	#MAX_EB*6
xullp5:		dex
		sta	EB_LIST,x	;Clear energy ball list.
		bne	xullp5

		ldx	#MAX_BM*3
xullp6:		dex
		sta	BM_LIST,x	;Clear bomb list.
		bne	xullp6

		ldx	#MAX_AN*4
xullp7:		dex
		sta	AN_LIST,x	;Clear animation list.
		bne	xullp7

		ldx	#MAX_HO*3
xullp8:		dex
		sta	HO_LIST,x	;Clear hidden object list.
		bne	xullp8
		sta	LASTHOBJ	;Clear end of hidden object list ptr.

		ldx	#MAX_MV*8
xullp82:	dex
		sta	MV_LIST,x	;Clear moving object list.
		bne	xullp82

		ldx	#MAX_MM*8
xullp83:	dex
		sta	MM_LIST,x	;Clear monster list.
		bne	xullp83


		;Scan through all blocks on level.
		ldy	#3		;Start Y at first row.
xullp9:		ldx	#30		;Start X at LAST column.
xullp10:	jsr	P2getbgblk	;Get object at X,Y.

		cmp	#BOMB
		bne	xulchk		;Continue if not a bomb.

		lda	#BOMB_CNT
		jsr	P2addexpl	;Add explosion to bomb list.
		jmp	xulnblk		;Continue.

xulchk:		cmp	#EXTRA+1
		bcs	xulnblk		;Go if not <= EXTRA.
		cmp	#PBOMB1
		bcc	xulnblk		;Go if not >= PBOMB1.

		cmp	#EXTRA		;Check for EXTRA robot prize.
		bne	xulchk2		;Continue if not.

		pha			;Save A.
		txa
		pha			;Save X.
		ldx	PLAYERUP	;Get current player number.
		lda	GOTXR_P1,x	;Get got-EXTRA-robot flag.
		beq	xulexok		;Continue if didn't get it yet.

		tya
		pha			;Save Y.
		ldy	#0
		lda	#EMPTY
		sta	(T5),y		;Change to EMPTY block.
		pla
		tay			;Restore Y.

xulexok:	pla
		tax			;Restore X.
		pla			;Restore A.

xulchk2:	jsr	P2addhobj	;Add to hidden object list.

xulnblk:	dex
		bne	xullp10		;Loop if X > 0.
		iny
		cpy	#14		;Check Y coordinate.
		bcc	xullp9		;Loop if Y < 14.


		lda	LASTHOBJ	;Get end of hidden object list.
		sta	T8		;Save for later use.

		ldy	#0
xullp11:	lda	(T1),y		;Read hidden object data.
		cmp	#ENDLIST
		beq	xulhodn		;Go if end of list.

		cmp	#CONTLIST
		beq	xulhoct2	;Go if continue list.

		cmp	#NEWLIST
		bne	xulhoct3	;Go if not new list.

		lda	#0
		ldx	#MAX_HO		;Start at end of list.
xulhocls:	cpx	T8		;Check if reached visible objects.
		beq	xulhoct2	;Abort if so.
		dex
		sta	HO_LIST,x	;Clear hidden object list.
		sta	HO_LIST1,x
		sta	HO_LIST2,x
		bne	xulhocls
		jmp	xulhoct2	;Continue.

xulhoct3:	sta	T7		;Save A.
		iny
		lda	(T1),y		;Get X coordinate.
		eor	#$ff		;Make mirror image.
		and	#$1f		;Mask off high 3 bits.
		tax
		iny
		tya
		pha			;Save Y.
		lda	(T1),y		;Get Y coordinate.
		tay
		lda	T7		;Restore A.
		jsr	P2addhobj	;Add to hidden object list.
		pla
		tay
xulhoct2:	iny
		jmp	xullp11		;Loop.

xulhodn:
		iny			;Make Y point to creature data.
		tya			;Update T2:T1 to point to start
		clc			;   of creature data.
		adc	T1
		sta	T1
		bcc	xuladyc1
		inc	T2
xuladyc1:	ldy	#0

		ldx	#0
xullp12:	lda	(T1),y		;Read monster list.
		cmp	#ENDLIST
		beq	xulmndn		;Go if end of list.

		cmp	#CONTLIST
		beq	xulmnct2	;Go if continue list.

		cmp	#NEWLIST
		bne	xulmnct3	;Go if not new list.

		lda	#0
		ldx	#MAX_MM*8
xulmncls:	dex
		sta	MM_LIST,x	;Clear monster list.
		bne	xulmncls
		jmp	xulmnct2	;Continue if level 2.

xulmnct3:	cpx	#MAX_MM
		bcs	xulmndn		;Go if read maximum number.

		sta	MM_LIST,x	;Store monster number.
		iny
		lda	(T1),y		;Get X coordinate.
		eor	#$ff		;Make mirror image.
		asl	a		;Adjust & store it.
		asl	a
		asl	a
		asl	a
		sta	MM_LIST1,x	;Store LSB X coordinate.
		lda	#0
		rol	a
		sta	MM_LIST2,x	;Store MSB X coordinate.
		iny
		lda	(T1),y		;Get Y coordinate.
		asl	a		;Adjust & store it.
		asl	a
		asl	a
		asl	a
		sta	MM_LIST3,x	;Store Y coordinate.
		iny
		lda	(T1),y		;Get starting direction.

		and	#CCW^$ff	;Clear CCW bit.
		sta	T7
		lda	(T1),y
		eor	#$ff		;Toggle bits (toggle CCW).
		and	#CCW
		ora	T7		;CCW is now toggled.

		sta	T7		;Save A.
		and	#$0f		;Mask off high nibble.
		cmp	#LEFT		;Check for LEFT.
		bne	xulmondr	;Go if not.
		lda	T7		;Get original value.
		and	#$f0		;Mask off low nibble.
		ora	#RIGHT		;Change to RIGHT.
		jmp	xulmondc	;Continue.
xulmondr:	cmp	#RIGHT		;Check for RIGHT.
		bne	xulmondn	;Go if not.
		lda	T7		;Get original value.
		and	#$f0		;Mask off low nibble.
		ora	#LEFT		;Change to LEFT.
		jmp	xulmondc	;Continue.
xulmondn:	lda	T7		;Get original value.
xulmondc:
		sta	MM_LIST4,x	;Store direction.
		sta	MM_LIST7,x	;Set direction last moved.
		lda	#0
		sta	MM_LIST5,x	;Clear animation counter.
		sta	MM_LIST6,x	;Clear pause counter/anim. pointer.
		inx
xulmnct2:	iny
		jmp	xullp12		;Loop.

xulmndn:
		stx	NUM_MON		;Save monster count.
		lda	#MAX_MV
		sec
		sbc	NUM_MON		;Calculate MAX_MV - monster count.
		sta	LMAX_MV		;Set max. moving rocks.

		lda	#0
xullp13:	cpx	NUM_MON
		bcs	xulmndn2	;Go if past end of list.
		sta	MM_LIST,x	;Clear list entry.
		inx
		jmp	xullp13		;Loop.
xulmndn2:
		ldx	LMAX_MV
xullp14:	dex
		sta	MV_LIST,x	;Clear moving object list.
		bne	xullp14

		sta	SCANNING	;Reset scanning flag.

		lda	#TICKS
		sta	TL_SUBT		;Initialize sub-timer.

		rts


;-----------------------------------------------------------------------------
P2getbgblk:
		sty	T7		;Save Y value.
		stx	T5		;Save X in T5 for later.
		lda	#0
		sta	T6		;Clear T6 for later.
		dey			;Adjust for missing first 2 lines.
		dey
		tya
		asl	a		;Multiply by 32.
		asl	a
		asl	a
		asl	a
		asl	a
		rol	T6		;T6 = carry from multiply.
		ora	T5		;Add in X grid position.
		clc
		adc	#CUR_LEV & $ff
		sta	T5		;T5 = LSB of address.
		lda	#CUR_LEV >> 8
		clc
		adc	T6
		sta	T6		;T6 = MSB of address.
		ldy	#0
		lda	(T5),y		;Get block object number in A.
		sta	LAST_BLK	;Save unmasked value.
		and	#%01111111	;Mask off high bit.
		ldy	T7		;Restore Y value.
		rts


;-----------------------------------------------------------------------------
P2addexpl:
		pha			;Save A.
		stx	T7		;Save X.
P2aerstrt:	ldx	#0
P2aesrch:	lda	BM_LIST,x	;Get countdown byte.
		beq	P2aefnd		;Go if not used.
		inx
		cpx	#MAX_BM
		bcc	P2aesrch	;Loop until empty one found.

		pla			;Restore A.
		ldx	T7		;Restore X.
		rts

P2aefnd:	pla			;Get countdown value.
		sta	BM_LIST,x	;Set countdown.
		lda	T7		;Get X position.
		sta	BM_LIST1,x	;Save X position of bomb.
		tya
		sta	BM_LIST2,x	;Save Y position of bomb.
		ldx	T7		;Restore X.
		rts


;-----------------------------------------------------------------------------
P2addhobj:
		pha			;Save A.
		stx	T7		;Save X.

		cmp	#EXTRA		;Check for EXTRA robot prize.
		bne	P2ahcont	;Continue if not.
		ldx	PLAYERUP	;Get current player number.
		lda	GOTXR_P1,x	;Get got-EXTRA-robot flag.
		beq	P2ahcont	;Continue if didn't get it yet.
		pla			;Restore A.
		ldx	T7		;Restore X.
		rts

P2ahcont:	ldx	#0
P2ahsrch:	lda	HO_LIST,x	;Get object number byte.
		beq	P2ahfnd		;Go if not used.
		inx
		cpx	#MAX_HO
		bcc	P2ahsrch	;Loop.

		lda	#255
		sta	QUOTA		;Signal too many hidden objects.
		pla
		jmp	P2ahdone	;Go if couldn't add object (ERROR).

P2ahfnd:	pla			;Get object number.
		sta	HO_LIST,x	;Set object number.
		lda	T7		;Get X position.
		sta	HO_LIST1,x	;Save X position of object.
		tya
		sta	HO_LIST2,x	;Save Y position of object.
		inx
		stx	LASTHOBJ	;Save next entry in list.
P2ahdone:	ldx	T7		;Restore X.
		rts


;-----------------------------------------------------------------------------
; Level data:
;
		.define	LEV_LEN 30*11		;Length of level grid data.

;include(levels.inc)				;Include levels file.
.include "LEVELS.INC"

;=============================================================================
; Data shared by first ROM page:
;
;.ORG	$FF80 		;WORST CASE ORIGIN (FOR ROM VERSION).
;This is still Bank 01 stuff - evenball
.segment "COMMONCODE2"
;call_sul:	;Call the setup level routine in second page of the ROM.
		lda	#1
		jsr	selpage		;Swap to second ROM page.
		jsr	SETULEV2	;Call routine to setup level.
		lda	#0
		jsr	selpage		;Swap back to first ROM page.
		rts


;IFDEF( `ROMVER',`		;THIS CODE USED WHEN ROM VERSION.
.ifdef	ROMVER
;ENTER HERE WITH THE DESIRED PAGE COMBO IN A.  HIGH NIBBLE HAS VIDEO
;PAGE AND LOW BIT HAS ROM PAGE.  A IS CHANGED, DONT COUNT ON ITS VALUE.
;THE BITS USED BY THE PAGE CIRCUIT MUST NOT BE ON.  AT THE CURRENT TIME
;THEY ARE BITS 08 AND 04.  THIS ROUTINE ASSUMES A 512 x 512 MAX CARTRIDGE.

;THE TABLE IS NEEDED BECAUSE OUR ROM CARTRIDGE DOES NOT DECODE THE ROM AREA.
;ANY WRITE TO ROM TRIGGERS THE LS377 PAGING PORT.  SINCE A WRITE ALSO 
;TRIGGERS A ROM READ (WR DOES NOT QUALIFY ROM) WE NEED TO WRITE TO AN AREA
;OF ROM THAT RETURNS THE SAME VALUE WE ARE WRITING.

;THIS ROUTINE MUST SAVE THE X AND Y REGISTERS.

;SELPAGE:
		sta	ROMPAGE		;Set current page setting.
		STX	PAGETEMP	;SAVE USERS VALUE FOR X
		PHA			;SAVE VALUE TO WRITE OUT
		AND	#3		;SAVE ROM PAGE BITS
		STA	WORKINGPAGE	
		PLA
		PHA			;MAKE ANOTHER COPY, GET ONE BACK
		LSR	A
		LSR	A
		LSR	A		;MOVE HIGH BITS DOWN TO ADD IN LOWEST.
		ORA	WORKINGPAGE
		TAX			;MAKE IT INTO AN INDEX
		PLA			;GET ORIGINAL VALUE
		ORA	#12		;PUT IN THE KEY CIRCUIT BITS
		STA	PAGETAB,X	;AND SET OUT WITH THE USERS BITS
		LDX	PAGETEMP
		RTS

;PAGETAB:
		.byte 	12,13
		.byte 	28,29
		.byte  	44,45
		.byte 	60,61
		.byte 	76,77
		.byte 	92,93
		.byte 	108,109
		.byte 	124,125
.endif
.ifndef	ROMVER;',`			;THIS CODE USED WHEN NOT ROM VERSION.

;ENTER HERE WITH THE DESIRED PAGE COMBO IN A.  HIGH NIBBLE HAS VIDEO
;PAGE AND LOW HAS ROM PAGE.

;SELPAGE:	
		sta	ROMPAGE		;Set current page setting.
		STA	253	;-2
		RTS
.endif;	')


;THIS BOOT VECTOR IS NEEDED TO INSURE THAT WE DON'T CRASH IF WE 
;HAVE A PAGED VERSION.

;PBOOT: 	
		sei			;Disable IRQ interrupts.
		cld			;Clear decimal mode flag.
		clv			;Clear overflow flag.
		clc			;Clear carry flag.
		ldx	#$ff
		txs			;Initialize stack pointer.

		lda	#0
		jsr	selpage		;Select first ROM page.
		jmp	boot_cod	;Continue boot process.

;Null interrupt vector - NMI & IRQ come here while in second ROM page.
NULLINT:
		rti


;=============================================================================
; CPU interrupt vectors:
;
;.ORG	$FFFA
.segment "VECTORS2"
		.word  	NULLINT		;NMI interrupt vector.
		.word  	PBOOT		;CPU reset vector.
		.word  	NULLINT		;IRQ interrupt vector.


;=============================================================================
; PROGRAM START (CODE SEGMENT - FIRST 32K PAGE):
;
;.CODE			;SPECIFY CODE SEGMENT
;.ORG	$8000		;32K.
.segment "BANK_00"

;-----------------------------------------------------------------------------
; Boot code (comes here after PBOOT routine):
;
.define		BPALTIME 6		;# 1/60s blink frequency.
.define		VAL_2000 %10100000	;Default reg 2000 setting.
.define		VAL_2001 %00011110	;Default reg 2001 setting.
boot_cod:
		jsr	waitvert	;Wait to allow for reset.
		jsr	waitvert

;include(pulses.asm)			;Include key chip foiling code.
.include "PULSES.ASM"
		lda	#0
		ldx	#0
bcloop:		sta	0,x		;Clear page 0 of memory.
		inx
		bne	bcloop

		;Initialize page 0 variables.
		lda	#VAL_2000 & %01111111
		sta	REG_2000	;Initial register 2000 value.
		lda	#VAL_2001 & %11100111	;Initial register 2001 value.
		sta	REG_2001	;Disable background & sprites.
		lda	a:BPALTIME
		sta	BPALCNT		;Set blinking palette counter.

		lda	#7
		sta	T2
		lda	#0
bcloopn2:	tay
bcloopn:	sta	(T1),y		;Clear page of memory.
		iny
		bne	bcloopn
		dec	T2
		bne	bcloopn2	;Clear all pages (except 0).

		jsr	waitvert	;Wait to allow for reset.

		lda	REG_2000
		ora	#%10000000	;Enable vertical retrace interrupts.
		sta	REG_2000
		sta	$2000

		jsr	disprobt	;Display robot screen for 5 seconds.

		lda	#MAXDEMOS-1
		sta	DEMONUM		;Initialize demo number.

		jmp	titlescr	;Go display title screen.


;=============================================================================
; DATA SECTION (ROM DATA):
;







;-----------------------------------------------------------------------------
; Miscellaneous data:
;

hsmsg:		.word  	$2000+16*32+6
		.byte 	'H'-55,'I'-55,'G'-55,'H'-55, SPACE
		.byte 	'S'-55,'C'-55,'O'-55,'R'-55,'E'-55,$ff
sel1msg:	.word  	$2000+19*32+12
		.byte 	1,SPACE,'P'-55,'L'-55,'A'-55,'Y'-55,'E'-55,'R'-55,$ff
sel2msg:	.word  	$2000+20*32+12
		.byte 	2,SPACE,'P'-55,'L'-55,'A'-55,'Y'-55,'E'-55,'R'-55,'S'-55,$ff
cpymsg:		.word  	$2000+24*32+1
		.byte 	'C'-55,'O'-55,'P'-55,'Y'-55,'R'-55,'I'-55,'G'-55
		.byte 	'H'-55,'T'-55,SPACE,1,9,8,9,SPACE,'B'-55,'Y'-55,SPACE
		.byte 	'K'-55,'E'-55,'N'-55,SPACE,'B'-55,'E'-55,'C'-55
		.byte 	'K'-55,'E'-55,'T'-55,'T'-55,$ff
lcnmsg:		.word  	$2000+26*32+4
		.byte 	'L'-55,'I'-55,'C'-55,'E'-55,'N'-55,'S'-55,'E'-55
		.byte 	'D'-55,SPACE,'B'-55,'Y'-55,SPACE,'C'-55,'O'-55
		.byte 	'L'-55,'O'-55,'R'-55,SPACE,'D'-55,'R'-55,'E'-55
		.byte 	'A'-55,'M'-55,'S'-55,$ff

playmsg:	.word  	$2000+12*32+11
		.byte 	'P'-55,'L'-55,'A'-55,'Y'-55,'E'-55,'R'-55,SPACE,SPACE,$ff
levmsg:		.word  	$2000+15*32+11
		.byte 	'L'-55,'E'-55,'V'-55,'E'-55,'L'-55,SPACE,$ff

scrmsg:		.word  	$2000+2*32+2
		.byte 	'S'-55,'C'-55,'O'-55,'R'-55,'E'-55,$ff
nrmsg:		.word  	$2000+2*32+18
		.byte 	$42,$ff
nbmsg:		.word  	$2000+3*32+13
		.byte 	$41,$ff
lnmsg:		.word  	$2000+2*32+13
		.byte 	$40,$ff
csmsg:		.word  	$2000+3*32+18
		.byte 	$43,$ff
timemsg:	.word  	$2000+2*32+26
		.byte 	'T'-55,'I'-55,'M'-55,'E'-55,$ff

overmsg:	.word  	$2000+12*32+11
		.byte 	'G'-55,'A'-55,'M'-55,'E'-55,SPACE
		.byte 	'O'-55,'V'-55,'E'-55,'R'-55,$ff
over2msg:	.word  	$2000+15*32+11
		.byte 	'P'-55,'L'-55,'A'-55,'Y'-55,'E'-55,'R'-55,$ff

contmsg:	.word  	$2000+12*32+12
		.byte 	'C'-55,'O'-55,'N'-55,'T'-55
		.byte 	'I'-55,'N'-55,'U'-55,'E'-55,$ff
endmsg:		.word  	$2000+14*32+12
		.byte 	'E'-55,'N'-55,'D'-55,$ff

stable:		;Score table.
		.define	SC1 0
		.byte 	0,0,0,1
		.define	SC10 4
		.byte 	0,0,1,0
		.define	SC100 8
		.byte 	0,1,0,0
		.define	SC200 12
		.byte 	0,2,0,0
		.define	SC400 16
		.byte 	0,4,0,0
		.define	SC500 20
		.byte 	0,5,0,0
		.define	SC800 24
		.byte 	0,8,0,0
		.define	SC1000 28
		.byte 	1,0,0,0
		.define	SC1500 32
		.byte 	1,5,0,0
		.define	SC2000 36
		.byte 	2,0,0,0
		.define	SC3000 40
		.byte 	3,0,0,0
		.define	SC5000 44
		.byte 	5,0,0,0

anitab:		;Animation table.
		.byte 	0			;Dummy byte for no animation.
		.define	AN_FLASH 1		;"Flash" animation.
		.byte 	FLASH,4+1
		.byte 	UPDATE,0
		.define	AN_DEST 5		;"Destroy" animation.
		.byte 	WHITEOUT,4+1
		.byte 	SMOKE1,4
		.byte 	SMOKE2,4
		.byte 	SMOKE3,4
		.byte 	SMOKE4,4
		.byte 	EMPTY,0
		.define	AN_DEST2 17		;"Destroy" animation #2.
		.byte 	SMOKE1,4+1
		.byte 	SMOKE2,4
		.byte 	SMOKE3,4
		.byte 	SMOKE4,4
		.byte 	EMPTY,0

		.define	RDEATH 27		;"Robot death" animation.
		.byte 	WHITEOUT,6
		.byte 	RDEATH1,6
		.byte 	RDEATH2,6
		.byte 	RDEATH3,6
		.byte 	RDEATH4,6
		.byte 	RDEATH5,6
		.byte 	RDEATH6,6
		.byte 	RDEATH7,6
		.byte 	RDEATH8,6
		.byte 	EMPTY,120
		.byte 	EMPTY,0

		.define	ANMUDL 49		;"Mud left" animation.
		.byte 	MUDL1,8+1
		.byte 	MUDL2,8
		.byte 	MUD,0
		.define	ANMUDR 55		;"Mud right" animation.
		.byte 	MUDR1,8+1
		.byte 	MUDR2,8
		.byte 	MUD,0
		.define	ANMUDU 61		;"Mud up" animation.
		.byte 	MUDU1,8+1
		.byte 	MUDU2,8
		.byte 	MUD,0
		.define	ANMUDD 67		;"Mud down" animation.
		.byte 	MUDD1,8+1
		.byte 	MUDD2,8
		.byte 	MUD,0
		.define	ANLAVAL 73		;"Lava left" animation.
		.byte 	LAVAL1,8+1
		.byte 	LAVAL2,8
		.byte 	LAVA,0
		.define	ANLAVAR 79		;"Lava right" animation.
		.byte 	LAVAR1,8+1
		.byte 	LAVAR2,8
		.byte 	LAVA,0
		.define	ANLAVAU 85		;"Lava up" animation.
		.byte 	LAVAU1,8+1
		.byte 	LAVAU2,8
		.byte 	LAVA,0
		.define	ANLAVAD 91		;"Lava down" animation.
		.byte 	LAVAD1,8+1
		.byte 	LAVAD2,8
		.byte 	LAVA,0

		.define	ANRMUDL 97		;"Mud-rock left" animation.
		.byte 	MUDL1,8+1
		.byte 	MUDL2,8
		.byte 	HROCK,0
		.define	ANRMUDR 105		;"Mud-rock right" animation.
		.byte 	MUDR1,8+1
		.byte 	MUDR2,8
		.byte 	HROCK,0
		.define	ANRMUDU 109		;"Mud-rock up" animation.
		.byte 	MUDU1,8+1
		.byte 	MUDU2,8
		.byte 	HROCK,0
		.define	ANRMUDD 115		;"Mud-rock down" animation.
		.byte 	MUDD1,8+1
		.byte 	MUDD2,8
		.byte 	HROCK,0
		.define	ANRLAVAL 121		;"Lava-rock left" animation.
		.byte 	LAVAL1,8+1
		.byte 	LAVAL2,8
		.byte 	HROCK,0
		.define	ANRLAVAR 127		;"Lava-rock right" animation.
		.byte 	LAVAR1,8+1
		.byte 	LAVAR2,8
		.byte 	HROCK,0
		.define	ANRLAVAU 133		;"Lava-rock up" animation.
		.byte 	LAVAU1,8+1
		.byte 	LAVAU2,8
		.byte 	HROCK,0
		.define	ANRLAVAD 139		;"Lava-rock down" animation.
		.byte 	LAVAD1,8+1
		.byte 	LAVAD2,8
		.byte 	HROCK,0

		.define	AN_CRYS 145		;"Pickup Crystal" animation.
		.byte 	ACRYS1,5+1
		.byte 	ACRYS2,4
		.byte 	ACRYS3,3
		.byte 	EMPTY,0
		.define	AN_DESTH 153		;Special "Destroy" animation.
		.byte 	WHITEOUT,4+1
		.byte 	SPEHO,26
		.byte 	EMPTY,0
		.define	AN_CRYSH 159		;Special "Pickup Crystal".
		.byte 	ACRYS1,5+1
		.byte 	ACRYS2,4
		.byte 	ACRYS3,3
		.byte 	SPEHO,14
		.byte 	EMPTY,0

		;Special table for sound effect routines.
sregtab:	.byte 	$01,$02,$04,$08

eb_jtab:	;Energy ball hit object jump table.
		.word  	ebh_pass,ebh_pass,ebh_pass,ebh_pass,ebh_pass,ebh_pass
		.word  	ebh_pass,ebh_pass,ebh_pass,ebh_pass,ebh_pass,ebh_pass
		.word  	ebh_pass,ebh_pass,ebh_pass,ebh_pass,ebh_pass,ebh_pass
		.word  	ebh_pass,ebh_pass,ebh_pass,ebh_pass,ebh_pass,ebh_pass
		.word  	ebh_crys,ebh_sr1,ebh_sr2,ebh_dest,ebh_noef,ebh_noef
		.word  	ebh_expl,ebh_noef,ebh_bnce,ebh_bnce,ebh_bnce,ebh_bnce
		.word  	ebh_bnce,ebh_bnce,ebh_noef
		.word  	ebh_bomb,ebh_dest,ebh_hdrt,ebh_dest,ebh_noef
		.word  	ebh_pass,ebh_pass,ebh_pass,ebh_pass,ebh_pass,ebh_pass
		.word  	ebh_pass,ebh_pass,ebh_mud
		.word  	ebh_pass,ebh_pass,ebh_pass,ebh_pass,ebh_pass,ebh_pass
		.word  	ebh_pass,ebh_pass,ebh_noef

ebo_jtab:	;Energy ball hit moving object jump table.
		.word  	ebo_crys,ebo_sr1,ebo_sr2,ebo_dest,ebo_noef,ebo_noef
		.word  	ebo_expl,ebo_noef,ebo_bnce,ebo_bnce,ebo_bnce

ex_jtab:	;Explosion hit object jump table.
		.word  	exh_dest,exh_flsh,exh_flsh,exh_priz,exh_priz,exh_priz
		.word  	exh_priz,exh_priz,exh_priz,exh_priz,exh_priz,exh_priz
		.word  	exh_dest,exh_priz,exh_priz,exh_priz,exh_dest,exh_dest
		.word  	exh_dest,exh_dest,exh_dest,exh_dest,exh_dest,exh_dest
		.word  	exh_noef,exh_dest,exh_dest,exh_dest,exh_hrck,exh_dest
		.word  	exh_expl,exh_noef,exh_mrk,exh_mrk2,exh_dest,exh_rrk
		.word  	exh_rrk2,exh_dest,exh_noef
		.word  	exh_bomb,exh_dest,exh_dest,exh_dest,exh_hmud
		.word  	exh_dest,exh_dest,exh_dest,exh_dest,exh_dest,exh_dest
		.word  	exh_dest,exh_dest,exh_dest
		.word  	exh_dest,exh_dest,exh_dest,exh_dest,exh_dest,exh_dest
		.word  	exh_dest,exh_dest,exh_dest

exo_jtab:	.word  	exo_noef,exo_dest,exo_dest,exo_dest,exo_hrck,exo_dest
		.word  	exo_expl,exo_noef,exo_mrk,exo_mrk2,exo_dest,exo_rrk
		.word  	exo_rrk2,exo_dest,exo_noef

pu_jtab:	;Pickup object jump table.
		.word  	puo_noef,puo_exit,puo_exit,puo_pb1,puo_pb3,puo_pb10
		.word  	puo_mny,puo_ebn,puo_ebr,puo_lpr,puo_cpr,puo_ftmr
		.word  	puo_frbt,puo_epr,puo_rpr,puo_extr,puo_noef,puo_noef
		.word  	puo_noef,puo_noef,puo_noef,puo_noef,puo_noef,puo_noef
		.word  	puo_crys


;-----------------------------------------------------------------------------
; Title graphics data:
;
titldat:	;Graphics data for "CRYSTAL".

.byte  $FA,$FA,$FA,$FA,$FA,$3B,$3B,$32,$3B,$E1	;NEW ROW
.byte  $32,$E3,$3A,$E5,$34,$3B,$32,$3B,$3B,$32
.byte  $3B,$E7,$E8,$3B,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$2F,$FA,$FA,$2F,$2F	;NEW ROW
.byte  $E0,$E4,$2F,$E6,$35,$35,$36,$FA,$2F,$FA
.byte  $2F,$2F,$38,$2F,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$30,$30,$31,$30,$FA	;NEW ROW
.byte  $E2,$FA,$30,$FA,$30,$30,$37,$FA,$30,$FA
.byte  $30,$FA,$31,$30,$30,$31,$FA,$FA,$FA,$FA
.byte  $FA,$FA

titldat2:	;Graphics data for "MINES".
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$3B,$EA,$32	;NEW ROW
.byte  $FA,$3B,$FA,$3B,$39,$32,$FA,$3B,$3B,$32
.byte  $FA,$34,$3B,$32,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$2F,$E9,$38	;NEW ROW
.byte  $FA,$2F,$FA,$2F,$33,$38,$FA,$3C,$3C,$3D
.byte  $FA,$35,$35,$36,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$30,$FA,$31	;NEW ROW
.byte  $FA,$30,$FA,$30,$FA,$31,$FA,$30,$EB,$EC
.byte  $FA,$30,$30,$37,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA


;-----------------------------------------------------------------------------
; Object structures for background objects & sprites:
;
objchr1:	;First character of object.
		.byte 	$fa,$3e,$3f,$a0,$a4,$a8,$ac,$b0	    ;0-7
		.byte 	$b4,$b8,$bc,$c0,$c4,$c8,$cc,$d0	    ;8-15
		.byte 	$90,$94,$98,$9c,$d4,$d8,$dc,$f4	    ;16-23
		.byte 	$44,$50,$50,$50,$54,$54,$68,$60     ;24-31
		.byte 	$50,$50,$50,$64,$64,$64,$5c,$48     ;32-39
		.byte 	$4c,$4c,$4c,$58,$88,$8c,$78,$7c     ;40-47
		.byte 	$70,$74,$80,$84,$6c,$88,$8c,$78     ;48-55
		.byte 	$7c,$70,$74,$80,$84,$6c,$00,$00     ;56-63

		;First character of sprite.
		.byte 	$01,$05,$09,$0d,$11,$15,$19,$1d	    ;64-71
		.byte 	$21,$b5,$b9,$bd,$c1,$c5,$c9,$cd	    ;72-79
		.byte 	$d1,$41,$3d,$45,$35,$31,$39,$29     ;80-87
		.byte 	$25,$2d,$41,$3d,$45,$35,$31,$39     ;88-95
		.byte 	$29,$25,$2d,$41,$3d,$45,$35,$31     ;96-103
		.byte 	$39,$29,$25,$2d,$65,$61,$69,$59     ;104-111
		.byte 	$55,$5d,$4d,$49,$51,$65,$61,$69     ;112-119
		.byte 	$59,$55,$5d,$4d,$49,$51,$89,$85     ;120-127
		.byte 	$8d,$7d,$79,$81,$71,$6d,$75,$41     ;128-135
		.byte 	$3d,$45,$35,$31,$39,$29,$25,$2d     ;136-143
		.byte 	$41,$3d,$45,$35,$31,$39,$29,$25     ;144-151
		.byte 	$2d,$41,$3d,$45,$35,$31,$39,$29     ;152-159
		.byte 	$25,$2d,$91,$95,$99,$9d,$a1,$a5	    ;160-167
		.byte 	$a9,$ad,$b1				    ;168-

objchr2:	;Second character of object ($00-$ff).
		.byte 	$fa,$3e,$3f,$a1,$a5,$a9,$ad,$b1	    ;0-7
		.byte 	$b5,$b9,$bd,$c1,$c5,$c9,$cd,$d1	    ;8-15
		.byte 	$91,$95,$99,$9d,$d5,$d9,$dd,$f5	    ;16-23
		.byte 	$45,$51,$51,$51,$55,$55,$69,$61     ;24-31
		.byte 	$51,$51,$51,$65,$65,$65,$5d,$49     ;32-39
		.byte 	$4d,$4d,$4d,$59,$89,$8d,$79,$7d     ;40-47
		.byte 	$71,$75,$81,$85,$6d,$89,$8d,$79     ;48-55
		.byte 	$7d,$71,$75,$81,$85,$6d	            ;56-63

objchr3:	;Third character of object ($00-$ff).
		.byte 	$fa,$3e,$3f,$a2,$a6,$aa,$ae,$b2	    ;0-7
		.byte 	$b6,$ba,$be,$c2,$c6,$ca,$ce,$d2	    ;8-15
		.byte 	$92,$96,$9a,$9e,$d6,$da,$de,$f6	    ;16-23
		.byte 	$46,$52,$52,$52,$56,$56,$6a,$62     ;24-31
		.byte 	$52,$52,$52,$66,$66,$66,$5e,$4a     ;32-39
		.byte 	$4e,$4e,$4e,$5a,$8a,$8e,$7a,$7e     ;40-47
		.byte 	$72,$76,$82,$86,$6e,$8a,$8e,$7a     ;48-55
		.byte 	$7e,$72,$76,$82,$86,$6e	            ;56-63

objchr4:	;Fourth character of object ($00-$ff).
		.byte 	$fa,$3e,$3f,$a3,$a7,$ab,$af,$b3	    ;0-7
		.byte 	$b7,$bb,$bf,$c3,$c7,$cb,$cf,$d3	    ;8-15
		.byte 	$93,$97,$9b,$9f,$d7,$db,$df,$f7	    ;16-23
		.byte 	$47,$53,$53,$53,$57,$57,$6b,$63     ;24-31
		.byte 	$53,$53,$53,$67,$67,$67,$5f,$4b     ;32-39
		.byte 	$4f,$4f,$4f,$5b,$8b,$8f,$7b,$7f     ;40-47
		.byte 	$73,$77,$83,$87,$6f,$8b,$8f,$7b     ;48-55
		.byte 	$7f,$73,$77,$83,$87,$6f	            ;56-63

objpal:		;Palette number of object (0-3).
		.byte 	0,3,3,3,3,3,1,3,3,0,0,0,0,0,0,0		;0-15
		.byte 	3,3,3,3,0,0,0,0,0,1,1,1,2,2,1,1		;16-31
		.byte 	3,3,3,3,3,3,1,3,1,2,2,2,2,2,2,2		;32-47
		.byte 	2,2,2,2,2,3,3,3,3,3,3,3,3,3,0,0		;48-63

		;Palette number of sprite (0-3).
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0		;64-79
		.byte 	0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1		;80-95
		.byte 	1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2		;96-111
		.byte 	2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1		;112-127
		.byte 	1,1,1,1,1,1,1,3,3,3,3,3,3,3,3,3		;128-143
		.byte 	3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3		;144-159
		.byte 	3,3,3,3,3,2,2,2,0,0,0	       		;160-


;-----------------------------------------------------------------------------
; Palette data:
;
palnorm:	.byte 	$0e,$11,$2c,$20	;Background palettes.
		.byte 	$0e,$17,$27,$00
		.byte 	$0e,$07,$17,$1a
		.byte 	$0e,$10,$05,$30

		.byte 	$0e,$11,$2c,$20	;Sprite palettes.
		.byte 	$0e,$17,$27,$00
		.byte 	$0e,$07,$17,$1a
		.byte 	$0e,$10,$05,$30

palrobot:	.byte 	$0e,$20,$21,$11	;Background palettes.
		.byte 	$0e,$20,$3b,$11
		.byte 	$0e,$17,$31,$11
		.byte 	$0e,$11,$2c,$03

		.byte 	$0e,$20,$21,$11	;Sprite palettes.
		.byte 	$0e,$20,$3b,$11
		.byte 	$0e,$17,$31,$11
		.byte 	$0e,$11,$2c,$03

palmoon:	.byte 	$0e,$20,$12,$3c	;Background palettes.
		.byte 	$0e,$01,$03,$31
		.byte 	$0e,$1a,$2c,$03
		.byte 	$0e,$20,$3d,$25

		.byte 	$0e,$20,$12,$3c	;Sprite palettes.
		.byte 	$0e,$01,$03,$31
		.byte 	$0e,$1a,$2c,$03
		.byte 	$0e,$20,$3d,$25

palspam:	.byte 	$0e,$20,$3d,$3c	;Background palettes.
		.byte 	$0e,$20,$38,$10
		.byte 	$0e,$20,$3d,$14
		.byte 	$0e,$20,$3d,$01

		.byte 	$0e,$20,$3d,$3c	;Sprite palettes.
		.byte 	$0e,$20,$38,$10
		.byte 	$0e,$20,$3d,$14
		.byte 	$0e,$20,$3d,$01

palblink:	.byte 	$30,$31,$32,$34,$36,$38,$3a,$3d

		.define	BG_FLASH $20		;Flash background color.
		.define	BG_NORM $0e		;Normal background color.


;-----------------------------------------------------------------------------
; Demo sequence data.
;
		;.define	MAXDEMOS 8		;Number of demo sequences.

demolev:	.byte 	7,42,26,16,21,38,36,25		;Demo level numbers.
demotab:	.word  	demo1,demo2,demo3,demo4,demo5,demo6,demo7,demo8

.ifdef RECDEMO	;IFDEF(`RECDEMO',`
demobuf:	;TEMPORARY demo mode recording buffer.
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.byte 	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
.endif;	',)	;ENDIF

demo1:		;Data for demo sequence #1.
		.byte 	$10,$07,$11,$0F,$91,$07,$11,$05,$91,$05,$11,$18,$09,$18,$09,$19
		.byte 	$01,$11,$07,$91,$05,$11,$02,$10,$03,$90,$03,$10,$05,$90,$04,$10
		.byte 	$03,$11,$1E,$10,$02,$1A,$01,$12,$06,$1A,$01,$18,$06,$1A,$01,$12
		.byte 	$07,$16,$05,$14,$09,$16,$02,$12,$12,$10,$14,$11,$0E,$10,$12,$11
		.byte 	$09,$10,$0F,$11,$13,$10,$01,$18,$06,$10,$01,$18,$04,$10,$0E,$90
		.byte 	$06,$10,$05,$90,$05,$10,$04,$90,$09,$10,$08,$14,$0C,$15,$01,$11
		.byte 	$3A,$10,$09,$12,$0C,$1A,$03,$18,$29,$19,$02,$11,$22,$50,$06,$42
		.byte 	$12,$0C,$10,$05,$50,$05,$42,$12,$0E,$10,$03,$50,$05,$10,$03,$12
		.byte 	$1F,$92,$06,$12,$05,$92,$05,$12,$05,$92,$01,$12,$41,$10,$1B,$11
		.byte 	$20,$10,$06,$12,$22,$42,$50,$01,$51,$02,$11,$07,$51,$06,$11,$18
		.byte 	$00,$08,$0A,$12,$07,$92,$01,$90,$03,$10,$e0,$FF

demo2:		;Data for demo sequence #2.
		.byte 	$10,$1B,$12,$19,$10,$01,$11,$15,$15,$0B,$11,$1B,$10,$12,$11,$05
		.byte 	$10,$0C,$14,$0A,$15,$04,$11,$05,$15,$01,$14,$08,$05,$11,$10,$18
		.byte 	$0A,$19,$01,$11,$20,$15,$01,$14,$07,$16,$07,$14,$02,$05,$51,$06
		.byte 	$11,$05,$51,$06,$11,$06,$51,$05,$11,$07,$15,$02,$14,$0A,$05,$11
		.byte 	$10,$19,$0D,$11,$05,$10,$02,$12,$0A,$00,$90,$07,$10,$10,$12,$0A
		.byte 	$10,$05,$12,$2E,$1A,$08,$12,$16,$0A,$18,$21,$19,$0E,$18,$2A,$09
		.byte 	$59,$06,$19,$08,$18,$01,$19,$01,$59,$05,$19,$07,$08,$58,$05,$08
		.byte 	$0A,$12,$0A,$92,$01,$90,$03,$10,$02,$12,$08,$16,$14,$12,$1F,$1A
		.byte 	$06,$18,$07,$1A,$04,$12,$0A,$16,$02,$14,$36,$15,$0D,$11,$21,$15
		.byte 	$10,$14,$13,$05,$11,$01,$10,$01,$18,$2C,$19,$16,$18,$28,$12,$15
		.byte 	$16,$13,$14,$03,$11,$3F,$10,$01,$18,$04,$1A,$0F,$12,$02,$16,$06
		.byte 	$12,$0C,$16,$0F,$12,$06,$1A,$0B,$18,$1B,$58,$04,$59,$01,$19,$0D
		.byte 	$18,$03,$58,$05,$18,$0B,$12,$01,$06,$14,$08,$10,$07,$11,$0B,$10
		.byte 	$E0,$FF

demo3:		;Data for demo sequence #3.
		.byte 	$10,$1D,$12,$1B,$10,$02,$11,$2E,$10,$01,$12,$04,$10,$0F,$90,$09
		.byte 	$10,$15,$12,$05,$10,$08,$12,$06,$10,$05,$14,$05,$94,$04,$14,$0E
		.byte 	$10,$04,$14,$0C,$10,$0A,$11,$01,$51,$03,$11,$1A,$10,$0B,$90,$05
		.byte 	$10,$06,$90,$03,$10,$06,$90,$03,$10,$08,$18,$0A,$98,$04,$18,$15
		.byte 	$10,$04,$11,$02,$10,$13,$90,$04,$10,$07,$90,$03,$10,$06,$90,$03
		.byte 	$10,$26,$90,$05,$10,$04,$90,$04,$10,$05,$90,$04,$10,$1D,$90,$05
		.byte 	$10,$04,$90,$03,$10,$04,$90,$05,$10,$27,$90,$05,$10,$05,$90,$02
		.byte 	$10,$05,$90,$04,$10,$31,$50,$02,$54,$04,$14,$0A,$16,$02,$12,$21
		.byte 	$10,$0E,$90,$03,$10,$08,$11,$01,$10,$0B,$90,$04,$10,$36,$11,$18
		.byte 	$19,$01,$18,$0B,$19,$05,$11,$07,$19,$05,$18,$49,$09,$11,$5E,$18
		.byte 	$1E,$10,$01,$14,$07,$90,$06,$10,$13,$11,$0E,$09,$18,$01,$19,$06
		.byte 	$11,$18,$10,$06,$90,$06,$10,$06,$90,$04,$10,$06,$90,$05,$10,$0C
		.byte 	$11,$0E,$10,$10,$12,$08,$10,$02,$11,$04,$10,$03,$90,$05,$10,$06
		.byte 	$90,$04,$10,$06,$90,$04,$10,$12,$11,$01,$10,$09,$12,$0F,$52,$05
		.byte 	$12,$05,$52,$05,$12,$1E,$10,$02,$11,$03,$10,$0F,$90,$05,$10,$1A
		.byte 	$11,$2D,$14,$03,$10,$07,$90,$03,$10,$04,$90,$04,$10,$03,$90,$04
		.byte 	$10,$04,$18,$0B,$1A,$02,$18,$1D,$11,$0C,$05,$14,$03,$16,$06,$14
		.byte 	$06,$05,$11,$03,$10,$0C,$90,$05,$10,$04,$90,$04,$10,$04,$90,$04
		.byte 	$10,$14,$18,$08,$1A,$09,$18,$03,$19,$03,$11,$30,$05,$14,$07,$90
		.byte 	$04,$10,$04,$90,$03,$10,$04,$90,$05,$10,$08,$14,$0B,$16,$01,$12
		.byte 	$41,$10,$01,$04,$15,$03,$10,$39,$11,$05,$10,$0B,$14,$03,$16,$03
		.byte 	$02,$10,$0F,$15,$02,$10,$10,$14,$19,$84,$14,$01,$84,$14,$01,$84
		.byte 	$14,$01,$94,$01,$14,$01,$84,$14,$01,$84,$14,$01,$84,$14,$01,$94
		.byte 	$01,$04,$94,$01,$04,$94,$01,$14,$01,$84,$14,$01,$94,$01,$04,$84
		.byte 	$14,$01,$94,$01,$14,$01,$84,$14,$01,$84,$14,$01,$84,$14,$01,$94
		.byte 	$01,$14,$01,$84,$04,$94,$01,$14,$01,$84,$14,$01,$94,$01,$04,$84
		.byte 	$14,$01,$94,$01,$14,$01,$84,$14,$01,$84,$14,$01,$84,$14,$01,$94
		.byte 	$01,$14,$01,$84,$04,$94,$01,$14,$01,$84,$14,$01,$94,$01,$04,$84
		.byte 	$14,$01,$94,$01,$14,$01,$84,$14,$01,$84,$14,$01,$84,$14,$01,$94
		.byte 	$01,$14,$01,$84,$04,$94,$01,$14,$01,$84,$14,$01,$94,$01,$04,$94
		.byte 	$01,$04,$94,$01,$14,$01,$84,$14,$01,$84,$14,$01,$84,$14,$01,$94
		.byte 	$01,$14,$01,$84,$04,$94,$01,$14,$01,$84,$14,$01,$94,$01,$04,$94
		.byte 	$01,$04,$94,$01,$14,$01,$84,$14,$01,$84,$14,$01,$84,$14,$04,$15
		.byte 	$0D,$04,$10,$0B,$11,$04,$10,$12,$11,$03,$10,$0E,$12,$0C,$1A,$01
		.byte 	$18,$0B,$1A,$01,$12,$13,$10,$02,$51,$06,$11,$08,$05,$14,$0C,$15
		.byte 	$01,$11,$17,$10,$02,$12,$06,$10,$03,$90,$07,$10,$1B,$12,$16,$10
		.byte 	$07,$12,$0B,$10,$10,$40,$51,$04,$11,$21,$10,$01,$12,$04,$82,$90
		.byte 	$04,$10,$12,$12,$3E,$1A,$0C,$12,$19,$16,$04,$14,$0A,$10,$03,$18
		.byte 	$04,$1A,$02,$18,$13,$19,$04,$11,$16,$09,$18,$0E,$1A,$04,$08,$58
		.byte 	$02,$50,$04,$02,$16,$0E,$12,$10,$1A,$12,$42,$50,$02,$54,$03,$14
		.byte 	$1D,$10,$01,$18,$05,$10,$0E,$90,$08,$10,$09,$18,$03,$10,$E0,$FF

demo4:		;Data for demo sequence #4.
		.byte 	$10,$13,$11,$0A,$10,$13,$90,$05,$10,$10,$11,$07,$10,$03,$90,$07
		.byte 	$10,$14,$1A,$03,$18,$1E,$19,$0A,$11,$05,$05,$95,$02,$94,$01,$14
		.byte 	$0F,$94,$03,$14,$24,$94,$04,$14,$0C,$12,$0E,$92,$05,$12,$04,$16
		.byte 	$01,$14,$17,$16,$04,$12,$06,$16,$1C,$14,$03,$16,$02,$12,$0D,$1A
		.byte 	$04,$18,$08,$10,$0D,$11,$0D,$10,$2B,$11,$0A,$19,$01,$18,$0B,$19
		.byte 	$01,$11,$11,$09,$18,$05,$19,$01,$11,$0C,$19,$02,$18,$0B,$19,$01
		.byte 	$11,$03,$10,$20,$18,$0C,$19,$02,$11,$04,$19,$01,$18,$0A,$10,$14
		.byte 	$12,$07,$10,$02,$90,$06,$10,$03,$12,$0D,$00,$90,$05,$00,$1A,$01
		.byte 	$18,$0B,$0A,$12,$05,$92,$04,$9A,$01,$1A,$01,$18,$05,$98,$05,$08
		.byte 	$10,$04,$12,$02,$14,$0B,$10,$0A,$51,$06,$11,$20,$10,$02,$12,$03
		.byte 	$10,$09,$90,$05,$10,$0E,$12,$01,$16,$0E,$12,$03,$10,$01,$12,$16
		.byte 	$0A,$18,$06,$11,$08,$19,$01,$18,$0C,$1A,$01,$12,$02,$1A,$01,$18
		.byte 	$05,$10,$01,$14,$1C,$15,$0C,$14,$11,$05,$11,$0A,$19,$0A,$89,$91
		.byte 	$05,$11,$0A,$91,$06,$01,$00,$18,$13,$98,$07,$0A,$12,$03,$16,$01
		.byte 	$14,$0B,$15,$05,$14,$05,$16,$04,$14,$05,$15,$07,$11,$01,$10,$02
		.byte 	$12,$04,$1A,$03,$18,$06,$11,$09,$10,$04,$12,$03,$16,$0C,$04,$10
		.byte 	$03,$11,$06,$10,$01,$90,$05,$10,$1A,$11,$10,$19,$06,$18,$01,$19
		.byte 	$06,$11,$0A,$19,$0F,$11,$08,$10,$0E,$08,$19,$04,$18,$02,$10,$07
		.byte 	$11,$0B,$19,$18,$11,$08,$19,$01,$18,$11,$10,$15,$18,$02,$10,$E0
		.byte 	$FF

demo5:		;Data for demo sequence #5.
		.byte 	$10,$13,$12,$27,$90,$05,$10,$0A,$11,$10,$10,$03,$14,$09,$16,$04
		.byte 	$14,$03,$16,$01,$10,$04,$14,$06,$94,$06,$14,$17,$15,$07,$11,$1F
		.byte 	$15,$12,$14,$02,$12,$13,$00,$90,$03,$10,$0D,$12,$87,$10,$17,$18
		.byte 	$25,$10,$01,$14,$18,$10,$17,$18,$16,$0A,$12,$02,$14,$0C,$10,$3C
		.byte 	$18,$1C,$98,$1D,$18,$05,$98,$04,$18,$05,$98,$04,$18,$05,$98,$03
		.byte 	$18,$30,$1A,$01,$12,$1B,$92,$05,$12,$04,$92,$03,$12,$04,$92,$03
		.byte 	$12,$15,$92,$04,$12,$04,$92,$03,$12,$03,$92,$04,$12,$4B,$1A,$01
		.byte 	$9A,$03,$18,$04,$98,$08,$18,$02,$98,$03,$18,$01,$98,$03,$18,$03
		.byte 	$98,$02,$18,$02,$98,$03,$18,$03,$98,$02,$18,$03,$98,$02,$18,$02
		.byte 	$98,$03,$18,$04,$98,$02,$18,$02,$98,$02,$18,$03,$98,$03,$18,$02
		.byte 	$98,$03,$18,$13,$19,$13,$18,$10,$19,$07,$11,$05,$15,$18,$11,$22
		.byte 	$19,$08,$18,$02,$09,$11,$01,$10,$15,$11,$0D,$10,$06,$90,$05,$10
		.byte 	$31,$18,$0B,$10,$03,$11,$34,$19,$39,$11,$11,$19,$01,$18,$01,$0A
		.byte 	$12,$23,$92,$05,$02,$1A,$02,$18,$07,$0A,$18,$05,$01,$51,$07,$11
		.byte 	$26,$10,$02,$12,$09,$10,$05,$90,$07,$10,$07,$11,$36,$91,$03,$11
		.byte 	$04,$91,$02,$11,$04,$91,$02,$11,$01,$91,$03,$11,$02,$91,$02,$11
		.byte 	$0C,$05,$94,$04,$14,$04,$94,$05,$14,$02,$94,$01,$14,$03,$94,$03
		.byte 	$14,$02,$94,$03,$14,$02,$94,$02,$14,$04,$94,$02,$14,$1B,$10,$0A
		.byte 	$14,$03,$10,$19,$14,$06,$10,$70,$FF

demo6:		;Data for demo sequence #6.
		.byte 	$10,$1E,$14,$0F,$15,$07,$11,$05,$09,$18,$12,$10,$01,$14,$49,$10
		.byte 	$07,$11,$05,$10,$06,$90,$04,$10,$06,$90,$04,$10,$05,$90,$05,$10
		.byte 	$17,$18,$09,$1A,$01,$12,$0F,$00,$14,$05,$10,$1A,$11,$05,$10,$18
		.byte 	$11,$03,$10,$0B,$14,$09,$10,$13,$14,$04,$10,$0B,$11,$06,$10,$03
		.byte 	$90,$05,$10,$04,$90,$05,$10,$04,$90,$03,$10,$03,$90,$04,$10,$04
		.byte 	$18,$22,$1A,$05,$12,$0E,$1A,$0C,$18,$07,$09,$11,$03,$91,$04,$01
		.byte 	$00,$90,$02,$10,$01,$90,$04,$10,$02,$90,$03,$10,$3D,$08,$1A,$09
		.byte 	$18,$0C,$19,$07,$11,$07,$91,$02,$90,$01,$10,$04,$90,$05,$10,$0D
		.byte 	$14,$0C,$16,$07,$02,$10,$29,$14,$03,$16,$01,$14,$27,$00,$90,$05
		.byte 	$10,$08,$90,$04,$10,$07,$90,$04,$10,$13,$12,$0D,$10,$04,$14,$04
		.byte 	$10,$13,$90,$03,$10,$07,$90,$05,$10,$07,$90,$05,$10,$10,$14,$07
		.byte 	$15,$0C,$11,$06,$10,$02,$18,$75,$10,$0C,$18,$05,$10,$0E,$11,$AA
		.byte 	$10,$0F,$14,$07,$10,$06,$90,$06,$10,$07,$90,$06,$10,$06,$90,$04
		.byte 	$10,$0A,$14,$11,$10,$05,$18,$14,$11,$1A,$10,$1B,$12,$1B,$52,$07
		.byte 	$12,$1F,$10,$01,$11,$05,$10,$0A,$90,$05,$10,$0C,$11,$8B,$15,$02
		.byte 	$14,$62,$10,$08,$14,$07,$10,$1A,$18,$0C,$12,$03,$10,$01,$12,$0E
		.byte 	$16,$0B,$02,$10,$E0,$FF

demo7:		;Data for demo sequence #7.
		.byte 	$10,$19,$15,$10,$11,$02,$09,$18,$13,$10,$01,$04,$16,$0D,$12,$0F
		.byte 	$1A,$01,$18,$0F,$10,$01,$01,$15,$08,$11,$07,$09,$18,$0C,$10,$11
		.byte 	$14,$01,$10,$0F,$90,$06,$10,$0B,$14,$1E,$15,$03,$11,$07,$15,$01
		.byte 	$14,$02,$16,$04,$12,$07,$1A,$01,$18,$2C,$19,$01,$11,$0A,$10,$08
		.byte 	$11,$07,$15,$04,$14,$03,$16,$0E,$12,$06,$1A,$07,$12,$0A,$16,$07
		.byte 	$14,$05,$16,$03,$12,$1E,$92,$06,$12,$01,$16,$02,$12,$15,$92,$05
		.byte 	$96,$01,$16,$27,$14,$1B,$15,$04,$11,$03,$91,$06,$11,$3D,$91,$05
		.byte 	$11,$18,$91,$06,$11,$14,$09,$18,$08,$19,$08,$11,$15,$19,$0C,$11
		.byte 	$07,$15,$06,$95,$05,$15,$03,$11,$05,$19,$0C,$89,$98,$06,$18,$0C
		.byte 	$98,$05,$18,$06,$11,$0C,$15,$10,$11,$1A,$19,$01,$18,$0B,$19,$01
		.byte 	$11,$04,$91,$08,$11,$17,$15,$09,$14,$06,$15,$03,$11,$11,$15,$09
		.byte 	$11,$08,$15,$03,$11,$11,$91,$06,$11,$15,$19,$03,$18,$14,$1A,$09
		.byte 	$18,$07,$09,$11,$0E,$19,$02,$18,$09,$0A,$12,$03,$16,$1F,$12,$10
		.byte 	$1A,$04,$12,$04,$1A,$01,$18,$29,$19,$01,$08,$19,$02,$11,$0C,$19
		.byte 	$04,$18,$11,$10,$E0,$FF

demo8:		;Data for demo sequence #8.
		.byte 	$10,$0D,$14,$11,$10,$01,$18,$04,$88,$90,$03,$10,$09,$18,$02,$10
		.byte 	$01,$14,$16,$15,$02,$11,$16,$19,$03,$18,$16,$11,$05,$19,$0D,$11
		.byte 	$2E,$10,$0B,$18,$07,$10,$09,$90,$03,$85,$15,$1A,$11,$0D,$19,$11
		.byte 	$18,$05,$19,$05,$11,$13,$19,$01,$18,$04,$98,$04,$18,$0C,$1A,$02
		.byte 	$12,$13,$92,$05,$12,$07,$92,$05,$12,$0C,$92,$04,$12,$0C,$92,$04
		.byte 	$12,$1B,$92,$04,$12,$09,$92,$04,$12,$0A,$92,$05,$12,$09,$92,$04
		.byte 	$12,$09,$92,$04,$12,$1B,$16,$0E,$12,$01,$06,$12,$01,$10,$2C,$11
		.byte 	$02,$19,$0E,$11,$07,$10,$28,$11,$11,$10,$11,$11,$0E,$10,$08,$11
		.byte 	$32,$15,$04,$14,$0D,$15,$1A,$11,$3C,$10,$02,$12,$0B,$16,$10,$14
		.byte 	$07,$15,$02,$11,$34,$15,$01,$14,$06,$15,$02,$11,$28,$10,$01,$12
		.byte 	$0C,$1A,$01,$18,$17,$1A,$24,$18,$05,$1A,$0F,$12,$0D,$16,$09,$14
		.byte 	$0E,$06,$12,$4A,$10,$07,$11,$0F,$10,$21,$90,$08,$10,$19,$11,$30
		.byte 	$15,$0E,$11,$0D,$09,$18,$0C,$11,$12,$81,$90,$05,$10,$22,$11,$02
		.byte 	$15,$04,$14,$10,$16,$23,$14,$14,$10,$02,$12,$0B,$10,$0A,$12,$06
		.byte 	$10,$E0,$FF


;-----------------------------------------------------------------------------
; Help screen data.
;
		.define	MAXHELP 8		;Number of help screens.
		.define	HS_ROBOT 1
		.define	HS_EXIT 4
		.define	HS_MONS 5

helpmons:	.byte 	SR_MON+DOWN,1*16,3*16-1
		.byte 	HR_MON+DOWN,1*16,5*16-1
		.byte 	IR_MON+DOWN,1*16,7*16-1
		.byte 	RR_MON+DOWN,1*16,9*16-1
		.byte 	MUD_MON,8*16,3*16-1
		.byte 	LAVA_MON,8*16,5*16-1
		.byte 	GAS_MON,8*16,7*16-1
		.byte 	$ff

helptab:	.word  	help1,help2,help3,help4,help5,help6,help7,help8

help1:		;Data for help screen #1 (STORY).
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$0C	;NEW ROW
.byte  $1B,$22,$1C,$1D,$0A,$15,$FA,$16,$12,$17
.byte  $0E,$1C,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$24,$2A	;NEW ROW
.byte  $FA,$10,$0A,$16,$0E,$FA,$1C,$1D,$18,$1B
.byte  $22,$FA,$24,$2A,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$22,$18,$1E,$FA,$11,$0A,$1F	;NEW ROW
.byte  $0E,$FA,$12,$17,$1F,$0E,$1C,$1D,$0E,$0D
.byte  $FA,$22,$18,$1E,$1B,$FA,$15,$12,$0F,$0E
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$1C,$0A,$1F,$12,$17,$10,$1C,$FA	;NEW ROW
.byte  $12,$17,$FA,$0A,$FA,$16,$12,$17,$12,$17
.byte  $10,$FA,$0C,$15,$0A,$12,$16,$FA,$18,$17
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$0A,$FA,$17,$0E,$20,$15,$22,$FA	;NEW ROW
.byte  $0D,$12,$1C,$0C,$18,$1F,$0E,$1B,$0E,$0D
.byte  $FA,$19,$15,$0A,$17,$0E,$1D,$29,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$22,$18,$1E,$FA,$20,$12,$15	;NEW ROW
.byte  $15,$FA,$1E,$1C,$0E,$FA,$22,$18,$1E,$1B
.byte  $FA,$1B,$0E,$16,$18,$1D,$0E,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$0C,$18,$17,$1D,$1B,$18,$15,$15	;NEW ROW
.byte  $0E,$0D,$FA,$1B,$18,$0B,$18,$1D,$FA,$1D
.byte  $18,$FA,$1C,$0E,$0A,$1B,$0C,$11,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$0F,$18,$1B,$FA,$0C,$1B,$22,$1C	;NEW ROW
.byte  $1D,$0A,$15,$1C,$FA,$0F,$0A,$1B,$FA,$0B
.byte  $0E,$17,$0E,$0A,$1D,$11,$FA,$1D,$11,$0E
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$19,$15,$0A,$17,$0E,$1D,$F1,$1C	;NEW ROW
.byte  $FA,$1C,$1E,$1B,$0F,$0A,$0C,$0E,$29,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$44,$46,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$45,$47,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$10,$18,$18,$0D,$FA	;NEW ROW
.byte  $15,$1E,$0C,$14,$2E,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$0A,$17,$0D,$FA,$11,$0A,$19
.byte  $19,$22,$FA,$16,$12,$17,$12,$17,$10,$28
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$1C,$0E,$15,$0E,$0C,$1D	;NEW ROW
.byte  $2D,$17,$0E,$21,$1D,$FA,$FA,$FA,$1C,$1D
.byte  $0A,$1B,$1D,$2D,$10,$0A,$16,$0E,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00	;PALETTE INFO
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$F0,$F0
.byte  $F0,$F0,$F0,$F0,$F0,$F0

help2:		;Data for help screen #2 (ROBOT).
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$B7,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $B7,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$B7,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$B7,$FA,$40,$41,$40
.byte  $40,$B7,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$E1,$A7,$87
.byte  $67,$FA,$B7,$FA,$FA,$FA,$FA,$FA,$B7,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$60,$A0	;NEW ROW
.byte  $40,$40,$82,$83,$84,$85,$40,$43,$44,$45
.byte  $47,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$B7,$FA,$FA,$FA,$FA,$80,$C0	;NEW ROW
.byte  $42,$61,$A2,$A3,$A4,$A5,$62,$63,$64,$65
.byte  $48,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$40,$40	;NEW ROW
.byte  $E0,$81,$C2,$C3,$C4,$C5,$46,$66,$86,$A6
.byte  $FA,$FA,$FA,$B7,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$B7,$40,$40	;NEW ROW
.byte  $A1,$C1,$E2,$E3,$E4,$E5,$C7,$E7,$E6,$C6
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$B7,$FA,$FA,$B7,$B7,$88	;NEW ROW
.byte  $89,$8A,$8B,$29,$2A,$2B,$2C,$2D,$4D,$6D
.byte  $40,$FA,$B7,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$A8	;NEW ROW
.byte  $A9,$AA,$AB,$49,$4A,$4B,$28,$ED,$CD,$AD
.byte  $8D,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$C8	;NEW ROW
.byte  $C9,$CA,$CB,$68,$69,$6A,$6B,$4C,$6C,$8C
.byte  $40,$B7,$FA,$FA,$FA,$FA,$B7,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$B7,$E8	;NEW ROW
.byte  $E9,$EA,$EB,$28,$EC,$CC,$AC,$2E,$40,$40
.byte  $40,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$B7,$FA,$FA,$FA,$40,$4E	;NEW ROW
.byte  $6E,$B7,$30,$50,$70,$90,$52,$B2,$53,$D3
.byte  $35,$55,$FA,$B7,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$B7,$FA,$FA,$8E,$AE	;NEW ROW
.byte  $CE,$40,$EF,$F0,$D0,$B0,$72,$D2,$73,$F3
.byte  $75,$36,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$EE,$2F	;NEW ROW
.byte  $4F,$6F,$F1,$D1,$B1,$91,$92,$F2,$93,$34
.byte  $56,$76,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$B7,$CF,$AF	;NEW ROW
.byte  $40,$8F,$32,$31,$51,$71,$71,$71,$71,$71
.byte  $71,$57,$FA,$FA,$B7,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$B7,$FA,$FA,$FA,$FA,$FA,$74,$D4,$B5	;NEW ROW
.byte  $B6,$F6,$71,$71,$71,$71,$71,$71,$71,$71
.byte  $71,$71,$57,$FA,$FA,$FA,$B7,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$94,$F4,$D5	;NEW ROW
.byte  $D6,$71,$71,$71,$71,$71,$71,$71,$71,$71
.byte  $71,$71,$71,$57,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$B4,$F5,$40	;NEW ROW
.byte  $37,$97,$71,$71,$71,$71,$71,$71,$71,$71
.byte  $71,$71,$71,$97,$57,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $97,$71,$71,$71,$71,$71,$71,$71,$77,$71
.byte  $71,$71,$71,$77,$71,$57,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$40,$FA,$40,$FA,$3C,$3B,$3B,$3B,$3B	;NEW ROW
.byte  $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B
.byte  $3B,$3B,$3B,$3B,$3B,$3D,$FA,$40,$FA,$40
.byte  $FA,$40
.byte  $40,$40,$40,$40,$40,$3A,$0C,$16,$39,$02	;NEW ROW
.byte  $00,$05,$40,$16,$12,$17,$12,$17,$10,$40
.byte  $1B,$18,$0B,$18,$1D,$3A,$40,$40,$40,$40
.byte  $40,$40
.byte  $FA,$40,$FA,$40,$FA,$3E,$3B,$3B,$3B,$3B	;NEW ROW
.byte  $3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B,$3B
.byte  $3B,$3B,$3B,$3B,$3B,$3F,$FA,$40,$FA,$40
.byte  $FA,$40
.byte  $40,$40,$40,$40,$40,$40,$40,$40,$FA,$40	;NEW ROW
.byte  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40
.byte  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40
.byte  $40,$40
.byte  $FA,$40,$FA,$40,$1C,$0E,$15,$0E,$0C,$1D	;NEW ROW
.byte  $38,$17,$0E,$21,$1D,$40,$FA,$40,$1C,$1D
.byte  $0A,$1B,$1D,$38,$10,$0A,$16,$0E,$FA,$40
.byte  $FA,$40
.byte  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40	;NEW ROW
.byte  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40
.byte  $40,$40,$40,$40,$40,$40,$40,$40,$40,$40
.byte  $40,$40
.byte  $FA,$FA,$FA,$FA,$0A,$FA,$FA,$FA,$FA,$FA	;PALETTE INFO
.byte  $00,$00,$00,$FA,$FA,$FA,$FA,$FA,$00,$50
.byte  $10,$FA,$FA,$FA,$FA,$FA,$00,$AA,$AA,$EA
.byte  $FA,$FA,$FA,$32,$88,$AA,$AA,$AA,$EA,$FA
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$F0,$F0
.byte  $F0,$F0,$F0,$F0,$F0,$F0

help3:		;Data for help screen #3 (HELP1).
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$0C	;NEW ROW
.byte  $1B,$22,$1C,$1D,$0A,$15,$FA,$16,$12,$17
.byte  $0E,$1C,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$18,$0B,$13,$0E,$0C,$1D,$1C,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$4C,$4E,$FA,$1C,$18,$0F,$1D,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$5C,$5E,$FA,$12
.byte  $16,$19,$0E,$1B,$1F,$12,$18,$1E,$1C,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$4D,$4F,$FA,$0D,$12,$1B,$1D,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$5D,$5F,$FA,$1B
.byte  $18,$0C,$14,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$4C,$4E,$FA,$11,$0A,$1B,$0D,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$60,$62,$FA,$12
.byte  $16,$19,$0E,$1B,$1F,$12,$18,$1E,$1C,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$4D,$4F,$FA,$0D,$12,$1B,$1D,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$61,$63,$FA,$0B
.byte  $18,$1E,$15,$0D,$0E,$1B,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$44,$46,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$64,$66,$FA,$1B
.byte  $0A,$0D,$12,$18,$0A,$0C,$1D,$12,$1F,$0E
.byte  $FA,$FA
.byte  $FA,$FA,$45,$47,$FA,$0C,$1B,$22,$1C,$1D	;NEW ROW
.byte  $0A,$15,$FA,$FA,$FA,$FA,$65,$67,$FA,$1B
.byte  $18,$0C,$14,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$50,$52,$FA,$1C,$18,$0F,$1D,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$50,$52,$FA,$1B
.byte  $0A,$0D,$12,$18,$0A,$0C,$1D,$12,$1F,$0E
.byte  $FA,$FA
.byte  $FA,$FA,$51,$53,$FA,$0B,$18,$1E,$15,$0D	;NEW ROW
.byte  $0E,$1B,$FA,$FA,$FA,$FA,$51,$53,$FA,$0B
.byte  $18,$1E,$15,$0D,$0E,$1B,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$54,$56,$FA,$11,$0A,$1B,$0D,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$68,$6A,$FA,$0E
.byte  $21,$19,$15,$18,$1C,$12,$1F,$0E,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$55,$57,$FA,$0B,$18,$1E,$15,$0D	;NEW ROW
.byte  $0E,$1B,$FA,$FA,$FA,$FA,$69,$6B,$FA,$0B
.byte  $18,$1E,$15,$0D,$0E,$1B,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$1C,$0E,$15,$0E,$0C,$1D	;NEW ROW
.byte  $2D,$17,$0E,$21,$1D,$FA,$FA,$FA,$1C,$1D
.byte  $0A,$1B,$1D,$2D,$10,$0A,$16,$0E,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$04,$00	;PALETTE INFO
.byte  $00,$00,$01,$00,$00,$00,$08,$00,$00,$00
.byte  $01,$00,$00,$00,$00,$00,$00,$00,$03,$00
.byte  $00,$00,$04,$00,$00,$00,$03,$00,$00,$00
.byte  $08,$00,$00,$00,$01,$00,$00,$00,$F0,$F0
.byte  $F0,$F0,$F0,$F0,$F0,$F0

help4:		;Data for help screen #4 (HELP2).
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$0C	;NEW ROW
.byte  $1B,$22,$1C,$1D,$0A,$15,$FA,$16,$12,$17
.byte  $0E,$1C,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$18,$0B,$13,$0E,$0C,$1D,$1C,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$6C,$6E,$FA,$16,$1E,$0D,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$B0,$B2,$FA,$1B
.byte  $0A,$19,$12,$0D,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$6D,$6F,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$B1,$B3,$FA,$0F
.byte  $12,$1B,$0E,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$58,$5A,$FA,$11,$0A,$1B,$0D,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$B4,$B6,$FA,$1B
.byte  $0A,$17,$10,$0E,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$59,$5B,$FA,$16,$1E,$0D,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$B5,$B7,$FA,$12
.byte  $17,$0C,$1B,$0E,$0A,$1C,$0E,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$6C,$6E,$FA,$15,$0A,$1F,$0A,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$A0,$A2,$FA,$01
.byte  $FA,$0B,$18,$16,$0B,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$6D,$6F,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$A1,$A3,$FA,$1C
.byte  $1D,$18,$0C,$14,$19,$12,$15,$0E,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$48,$4A,$FA,$0A,$0C,$1D,$12,$1F	;NEW ROW
.byte  $0E,$FA,$FA,$FA,$FA,$FA,$A4,$A6,$FA,$03
.byte  $FA,$0B,$18,$16,$0B,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$49,$4B,$FA,$0B,$18,$16,$0B,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$A5,$A7,$FA,$1C
.byte  $1D,$18,$0C,$14,$19,$12,$15,$0E,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$AC,$AE,$FA,$0B,$0A,$10,$FA,$18	;NEW ROW
.byte  $0F,$FA,$FA,$FA,$FA,$FA,$A8,$AA,$FA,$01
.byte  $00,$FA,$0B,$18,$16,$0B,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$AD,$AF,$FA,$10,$18,$15,$0D,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$A9,$AB,$FA,$1C
.byte  $1D,$18,$0C,$14,$19,$12,$15,$0E,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$1C,$0E,$15,$0E,$0C,$1D	;NEW ROW
.byte  $2D,$17,$0E,$21,$1D,$FA,$FA,$FA,$1C,$1D
.byte  $0A,$1B,$1D,$2D,$10,$0A,$16,$0E,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$08,$00	;PALETTE INFO
.byte  $00,$00,$03,$00,$00,$00,$08,$00,$00,$00
.byte  $03,$00,$00,$00,$0C,$00,$00,$00,$03,$00
.byte  $00,$00,$0C,$00,$00,$00,$03,$00,$00,$00
.byte  $04,$00,$00,$00,$03,$00,$00,$00,$F0,$F0
.byte  $F0,$F0,$F0,$F0,$F0,$F0

help5:		;Data for help screen #5 (HELP3).
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$0C	;NEW ROW
.byte  $1B,$22,$1C,$1D,$0A,$15,$FA,$16,$12,$17
.byte  $0E,$1C,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$18,$0B,$13,$0E,$0C,$1D,$1C,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$BC,$BE,$FA,$0C,$1B,$0E,$0A,$1D	;NEW ROW
.byte  $1E,$1B,$0E,$FA,$FA,$FA,$C0,$C2,$FA,$0F
.byte  $1B,$0E,$0E,$23,$0E,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$BD,$BF,$FA,$19,$1B,$18,$1D,$0E	;NEW ROW
.byte  $0C,$1D,$12,$18,$17,$FA,$C1,$C3,$FA,$1D
.byte  $12,$16,$0E,$1B,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$C8,$CA,$FA,$0E,$21,$19,$15,$18	;NEW ROW
.byte  $1C,$12,$18,$17,$FA,$FA,$C4,$C6,$FA,$0F
.byte  $1B,$0E,$0E,$23,$0E,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$C9,$CB,$FA,$19,$1B,$18,$1D,$0E	;NEW ROW
.byte  $0C,$1D,$12,$18,$17,$FA,$C5,$C7,$FA,$1B
.byte  $18,$0B,$18,$1D,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$B8,$BA,$FA,$16,$1E,$0D,$2B,$15	;NEW ROW
.byte  $0A,$1F,$0A,$FA,$FA,$FA,$D0,$D2,$FA,$0E
.byte  $21,$1D,$1B,$0A,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$B9,$BB,$FA,$19,$1B,$18,$1D,$0E	;NEW ROW
.byte  $0C,$1D,$12,$18,$17,$FA,$D1,$D3,$FA,$1B
.byte  $18,$0B,$18,$1D,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$CC,$CE,$FA,$1B,$0A,$0D,$12,$0A	;NEW ROW
.byte  $1D,$12,$18,$17,$FA,$FA,$3E,$3E,$FA,$0E
.byte  $21,$12,$1D,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$CD,$CF,$FA,$19,$1B,$18,$1D,$0E	;NEW ROW
.byte  $0C,$1D,$12,$18,$17,$FA,$3E,$3E,$FA,$1C
.byte  $1A,$1E,$0A,$1B,$0E,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$1C,$0E,$15,$0E,$0C,$1D	;NEW ROW
.byte  $2D,$17,$0E,$21,$1D,$FA,$FA,$FA,$1C,$1D
.byte  $0A,$1B,$1D,$2D,$10,$0A,$16,$0E,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $00,$00,$00,$00,$00,$00,$00,$0A,$00,$00	;PALETTE INFO
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte  $00,$00,$00,$00,$00,$00,$03,$00,$00,$00
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$F0,$F0
.byte  $F0,$F0,$F0,$F0,$F0,$F0

help6:		;Data for help screen #6 (HELP4).
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$0C	;NEW ROW
.byte  $1B,$22,$1C,$1D,$0A,$15,$FA,$16,$12,$17
.byte  $0E,$1C,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$0C,$1B,$0E,$0A,$1D,$1E,$1B,$0E,$1C
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$1C,$18,$0F,$1D,$FA	;NEW ROW
.byte  $1B,$18,$0C,$14,$FA,$FA,$FA,$FA,$FA,$16
.byte  $1E,$0D,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$0C,$1B,$0E,$0A,$1D	;NEW ROW
.byte  $1E,$1B,$0E,$FA,$FA,$FA,$FA,$FA,$FA,$0C
.byte  $1B,$0E,$0A,$1D,$1E,$1B,$0E,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$11,$0A,$1B,$0D,$FA	;NEW ROW
.byte  $1B,$18,$0C,$14,$FA,$FA,$FA,$FA,$FA,$15
.byte  $0A,$1F,$0A,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$0C,$1B,$0E,$0A,$1D	;NEW ROW
.byte  $1E,$1B,$0E,$FA,$FA,$FA,$FA,$FA,$FA,$0C
.byte  $1B,$0E,$0A,$1D,$1E,$1B,$0E,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$12,$16,$19,$0E,$1B	;NEW ROW
.byte  $1F,$12,$18,$1E,$1C,$FA,$FA,$FA,$FA,$10
.byte  $0A,$1C,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$0C,$1B,$0E,$0A,$1D	;NEW ROW
.byte  $1E,$1B,$0E,$FA,$FA,$FA,$FA,$FA,$FA,$0C
.byte  $1B,$0E,$0A,$1D,$1E,$1B,$0E,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$1B,$0A,$0D,$12,$18	;NEW ROW
.byte  $0A,$0C,$1D,$12,$1F,$0E,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$0C,$1B,$0E,$0A,$1D	;NEW ROW
.byte  $1E,$1B,$0E,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$1C,$0E,$15,$0E,$0C,$1D	;NEW ROW
.byte  $2D,$17,$0E,$21,$1D,$FA,$FA,$FA,$1C,$1D
.byte  $0A,$1B,$1D,$2D,$10,$0A,$16,$0E,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00	;PALETTE INFO
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$F0,$F0
.byte  $F0,$F0,$F0,$F0,$F0,$F0

help7:		;Data for help screen #7 (HELP5).
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$0C,$18,$17,$1D,$1B,$18,$15,$1C
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$24,$24,$24,$24,$24,$24,$24,$24,$24
.byte  $2A,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$0A,$FA,$0B,$1E	;NEW ROW
.byte  $1D,$1D,$18,$17,$FA,$2D,$FA,$0E,$17,$0E
.byte  $1B,$10,$22,$FA,$0B,$15,$0A,$1C,$1D,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$0B,$FA,$0B,$1E	;NEW ROW
.byte  $1D,$1D,$18,$17,$FA,$2D,$FA,$0D,$1B,$18
.byte  $19,$FA,$0B,$18,$16,$0B,$1C,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$1C,$1D,$0A,$1B,$1D,$FA,$0B,$1E	;NEW ROW
.byte  $1D,$1D,$18,$17,$FA,$2D,$FA,$19,$0A,$1E
.byte  $1C,$0E,$FA,$10,$0A,$16,$0E,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$1C,$0E,$15,$0E,$0C,$1D,$F2,$1C	;NEW ROW
.byte  $1D,$0A,$1B,$1D,$FA,$2D,$FA,$1C,$0E,$15
.byte  $0F,$FA,$0D,$0E,$1C,$1D,$1B,$1E,$0C,$1D
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $24,$2D,$FA,$11,$12,$17,$1D,$1C,$FA,$25
.byte  $2A,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$0E,$21,$1D,$1B,$0A,$FA,$19,$18	;NEW ROW
.byte  $12,$17,$1D,$1C,$FA,$12,$0F,$FA,$0C,$1B
.byte  $0E,$0A,$1D,$1E,$1B,$0E,$FA,$12,$1C,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$0D,$0E,$1C,$1D,$1B,$18,$22,$0E	;NEW ROW
.byte  $0D,$FA,$0B,$22,$FA,$0F,$0A,$15,$15,$12
.byte  $17,$10,$FA,$18,$0B,$13,$0E,$0C,$1D,$29
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$0E,$21,$1D,$1B,$0A,$FA,$19,$18	;NEW ROW
.byte  $12,$17,$1D,$1C,$FA,$0F,$18,$1B,$FA,$0B
.byte  $18,$16,$0B,$1C,$FA,$15,$0E,$0F,$1D,$29
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$0E,$21,$12,$1D,$FA,$1C,$1A,$1E	;NEW ROW
.byte  $0A,$1B,$0E,$FA,$16,$0A,$22,$FA,$0B,$0E
.byte  $FA,$11,$12,$0D,$0D,$0E,$17,$28,$28,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$1C,$0E,$15,$0E,$0C,$1D	;NEW ROW
.byte  $2D,$17,$0E,$21,$1D,$FA,$FA,$FA,$1C,$1D
.byte  $0A,$1B,$1D,$2D,$10,$0A,$16,$0E,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00	;PALETTE INFO
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$F0,$F0
.byte  $F0,$F0,$F0,$F0,$F0,$F0

help8:		;Data for help screen #8 (CREDITS).
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$0C	;NEW ROW
.byte  $1B,$22,$1C,$1D,$0A,$15,$FA,$16,$12,$17
.byte  $0E,$1C,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$24,$2A	;NEW ROW
.byte  $FA,$0C,$1B,$0E,$0A,$1D,$0E,$0D,$FA,$0B
.byte  $22,$FA,$24,$24,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$D4,$D6,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$D4,$D6,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$D5,$D7,$FA,$FA	;NEW ROW
.byte  $14,$0E,$17,$FA,$0B,$0E,$0C,$14,$0E,$1D
.byte  $1D,$FA,$FA,$FA,$D5,$D7,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$D8,$DA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$D8,$DA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$D9,$DB,$FA,$FA	;NEW ROW
.byte  $FA,$1B,$18,$17,$FA,$0D,$0E,$10,$0E,$17
.byte  $FA,$FA,$FA,$FA,$D9,$DB,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$DC,$DE,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$DC,$DE,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$DD,$DF,$FA,$FA	;NEW ROW
.byte  $1B,$12,$0C,$14,$FA,$20,$0A,$15,$0D,$1B
.byte  $18,$17,$FA,$FA,$DD,$DF,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$DC,$DE,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$DC,$DE,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$DD,$DF,$FA,$FA	;NEW ROW
.byte  $FA,$0D,$0A,$17,$FA,$0B,$1E,$1B,$14,$0E
.byte  $FA,$FA,$FA,$FA,$DD,$DF,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$DC,$DE,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$DC,$DE,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$DD,$DF,$FA,$FA	;NEW ROW
.byte  $1C,$0C,$18,$1D,$1D,$FA,$0D,$0A,$1F,$12
.byte  $1C,$FA,$FA,$FA,$DD,$DF,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$DC,$DE,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$DC,$DE,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$DD,$DF,$FA,$0D	;NEW ROW
.byte  $0A,$17,$17,$22,$FA,$1C,$18,$1C,$0E,$0B
.byte  $0E,$0E,$FA,$FA,$DD,$DF,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$DC,$DE,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$DC,$DE,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$DD,$DF,$FA,$FA	;NEW ROW
.byte  $FA,$13,$18,$0E,$15,$FA,$0B,$22,$0E,$1B
.byte  $1C,$FA,$FA,$FA,$DD,$DF,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$1C,$0E,$15,$0E,$0C,$1D	;NEW ROW
.byte  $2D,$17,$0E,$21,$1D,$FA,$FA,$FA,$1C,$1D
.byte  $0A,$1B,$1D,$2D,$10,$0A,$16,$0E,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00	;PALETTE INFO
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$F0,$F0
.byte  $F0,$F0,$F0,$F0,$F0,$F0

;-----------------------------------------------------------------------------

picmoon:	;Data for condo on the moon screen (CNDOMOON).
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $0F,$12,$17,$0A,$15,$FA,$1C,$0C,$18,$1B
.byte  $0E,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$00,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$C8,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$C8,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$C8,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$C8,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$BB,$BC,$BD,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$C8,$FA,$C8,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$C8,$FA,$FA,$D9,$DA,$DB,$FA	;NEW ROW
.byte  $FA,$A9,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$C8,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$DC,$DD,$DE,$FA	;NEW ROW
.byte  $FA,$FA,$40,$B0,$B1,$B2,$54,$55,$56,$57
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$A9	;NEW ROW
.byte  $FA,$FA,$CF,$D0,$D1,$D2,$75,$76,$76,$77
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$C8,$FA,$FA,$40,$30	;NEW ROW
.byte  $31,$32,$EF,$F0,$F1,$F2,$94,$76,$95,$96
.byte  $FA,$FA,$FA,$C8,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$C8,$FA,$FA,$FA,$FA,$40,$50	;NEW ROW
.byte  $51,$52,$33,$46,$35,$36,$B5,$B6,$B7,$77
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$C8,$FA,$70,$71	;NEW ROW
.byte  $72,$73,$35,$34,$B3,$35,$D5,$D6,$D7,$D8
.byte  $FA,$C8,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$90,$91	;NEW ROW
.byte  $92,$93,$35,$74,$B4,$35,$F5,$F6,$F7,$40
.byte  $FA,$FA,$FA,$EB,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$37,$38	;NEW ROW
.byte  $39,$3A,$35,$35,$D3,$D4,$46,$F8,$40,$A9
.byte  $FA,$FA,$FA,$FA,$EB,$C8,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$40,$40	;NEW ROW
.byte  $58,$59,$35,$35,$F3,$F4,$F9,$B8,$40,$40
.byte  $FA,$C8,$FA,$FA,$FA,$EB,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$C8,$FA,$FA,$FA,$FA,$C8,$40	;NEW ROW
.byte  $78,$79,$3B,$3C,$3D,$3E,$9A,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$C8,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$40,$40	;NEW ROW
.byte  $40,$97,$5A,$5B,$5C,$5D,$BA,$C8,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$C8,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$99,$7A,$7B,$7C,$B9,$FA,$FA,$FA,$C8
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$C8	;NEW ROW
.byte  $FA,$FA,$C8,$9B,$9C,$40,$FA,$EB,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$C8,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$EB,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$0C,$18,$17,$10,$1B,$0A,$1D,$1E	;NEW ROW
.byte  $15,$0A,$1D,$12,$18,$17,$1C,$7F,$FA,$22
.byte  $18,$1E,$FA,$0D,$12,$0D,$FA,$12,$1D,$7F
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$22,$18,$1E,$FA,$11,$0A	;NEW ROW
.byte  $1F,$0E,$FA,$0A,$0C,$1A,$1E,$12,$1B,$0E
.byte  $0D,$FA,$0E,$17,$18,$1E,$10,$11,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$20,$0E,$0A,$15,$1D,$11,$FA,$1D	;NEW ROW
.byte  $18,$FA,$0B,$1E,$22,$FA,$0A,$FA,$15,$1E
.byte  $21,$1E,$1B,$22,$FA,$0C,$18,$17,$0D,$18
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $18,$17,$FA,$1D,$11,$0E,$FA,$16,$18,$18
.byte  $17,$7F,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0,$FA,$BA	;PALETTE INFO
.byte  $EA,$FA,$AA,$7A,$FA,$FA,$FA,$FA,$55,$A9
.byte  $AA,$FA,$FA,$FA,$7A,$FA,$45,$5A,$D9,$FA
.byte  $DA,$FA,$FA,$FA,$F6,$F5,$FA,$FA,$FA,$FA
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$F0,$F0
.byte  $F0,$F0,$F0,$F0,$F0,$F0


picspam:	;Data for space spam picture (SPAMBAK).
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$40,$FA,$FA,$FA,$40,$FA	;NEW ROW
.byte  $EB,$40,$FA,$FA,$FA,$40,$FA,$FA,$FA,$FA
.byte  $FA,$40,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $40,$EB,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$40,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$40,$40,$40,$40,$40,$40	;NEW ROW
.byte  $40,$40,$40,$40,$40,$40,$FA,$FA,$FA,$FA
.byte  $40,$40,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$40,$40,$40,$40,$40,$C8	;NEW ROW
.byte  $C8,$A9,$40,$40,$40,$40,$FA,$40,$FA,$40
.byte  $40,$40,$FA,$FA,$FA,$FA,$FA,$40,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$40,$40,$40,$40,$40,$40	;NEW ROW
.byte  $A9,$40,$40,$40,$A9,$C9,$29,$40,$40,$40
.byte  $40,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$40,$40,$40,$40,$40,$60	;NEW ROW
.byte  $61,$62,$40,$40,$E9,$86,$89,$69,$40,$40
.byte  $FA,$FA,$FA,$FA,$40,$FA,$FA,$40,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$40,$40,$40,$40,$40,$40	;NEW ROW
.byte  $80,$81,$40,$C7,$C6,$A6,$AA,$49,$2A,$40
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$40,$40,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$40,$40,$40,$40,$40,$40,$A0	;NEW ROW
.byte  $A1,$A2,$65,$E6,$E5,$C4,$CA,$4A,$42,$40
.byte  $FA,$FA,$FA,$FA,$40,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$40,$40,$40,$40,$40,$41	;NEW ROW
.byte  $A1,$43,$47,$88,$EA,$6A,$2B,$2C,$2D,$2E
.byte  $40,$40,$40,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$40,$40,$40,$40,$40,$82	;NEW ROW
.byte  $83,$63,$67,$48,$6B,$A7,$4B,$4C,$4D,$4E
.byte  $CB,$40,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$40,$40,$40,$40,$40,$C0	;NEW ROW
.byte  $A3,$C3,$87,$68,$A8,$8A,$8A,$6C,$6D,$6E
.byte  $CC,$EC,$FA,$FA,$FA,$40,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$40,$40,$40,$40,$40,$C0	;NEW ROW
.byte  $C1,$C2,$46,$88,$EA,$6A,$8C,$8D,$8E,$46
.byte  $CD,$ED,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$40,$40,$40,$40,$40,$C0	;NEW ROW
.byte  $45,$46,$46,$48,$6B,$A7,$4B,$AC,$AD,$46
.byte  $CE,$6B,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$40,$40,$40,$40,$E0,$64	;NEW ROW
.byte  $44,$66,$66,$46,$46,$46,$46,$46,$AE,$46
.byte  $2F,$6B,$40,$40,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$E1,$84	;NEW ROW
.byte  $A4,$E4,$E4,$28,$28,$28,$28,$28,$28,$28
.byte  $4F,$6F,$8F,$AF,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$E2,$E3	;NEW ROW
.byte  $E3,$E3,$E3,$E3,$E3,$E3,$E3,$E3,$E3,$E3
.byte  $E3,$E3,$EE,$40,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$10,$1B,$0E,$0A,$1D,$FA,$13	;NEW ROW
.byte  $18,$0B,$7F,$FA,$22,$18,$1E,$9F,$1B,$0E
.byte  $FA,$11,$0A,$15,$0F,$20,$0A,$22,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$1D,$11,$0E,$1B,$0E,$3F,$FA,$22	;NEW ROW
.byte  $18,$1E,$FA,$0D,$0E,$1C,$0E,$1B,$1F,$0E
.byte  $FA,$0A,$FA,$0B,$1B,$0E,$0A,$14,$BF,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$11,$0A,$1F,$0E,$FA,$1C,$18,$16	;NEW ROW
.byte  $0E,$FA,$1D,$0A,$1C,$1D,$22,$FA,$1C,$19
.byte  $0A,$0C,$0E,$FA,$1C,$19,$0A,$16,$7F,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$19,$1B,$0E,$1C,$1C,$FA	;NEW ROW
.byte  $1C,$1D,$0A,$1B,$1D,$FA,$1D,$18,$FA,$0C
.byte  $18,$17,$1D,$12,$17,$1E,$0E,$3F,$FA,$FA
.byte  $FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA	;NEW ROW
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$FA
.byte  $FA,$FA
.byte  $00,$C0,$00,$00,$00,$00,$00,$00,$C8,$5A	;PALETTE INFO
.byte  $56,$1A,$FA,$FA,$FA,$30,$C8,$55,$00,$AA
.byte  $A2,$FA,$FA,$00,$C8,$55,$00,$AA,$AA,$EA
.byte  $FA,$00,$C8,$F5,$00,$AA,$2A,$2A,$FA,$00
.byte  $00,$00,$00,$00,$00,$00,$00,$00,$F0,$F0
.byte  $F0,$F0,$F0,$F0,$F0,$F8


;=============================================================================
; CODE SECTION:
;

;-----------------------------------------------------------------------------
; Display title screen.
;
titlescr:
		lda	#DEMOTO1
		sta	DEMO_TO		;Set demo mode timeout.

titlesc2:	jsr	scrn_off	;Blank the screen.
		lda	#palnorm & $ff
		sta	T1
		lda	#palnorm >> 8
		sta	T2
		jsr	initpals	;Initialize the palettes.
		jsr	initspr		;Initialize sprite table.
		jsr	initnmiq	;Initialize NMI buffer.
		jsr	clsp1top	;Clear status area.
		jsr	clsp1bot	;Clear bottom of screen.
		jsr	drawtitl	;Draw title screen.

		lda	#0
		jsr	selpage		;Change to character sets 0 & 1.
		lda	REG_2000
		and	#%11101111	;Switch to lower character set.
		sta	REG_2000
		sta	$2000

		lda	#0
		sta	H_SCROLL	;Set horizontal scroll offset to 0.

		lda	#NM_NORM|NM_TITL	;Set NMI mode,
		jsr	scrn_on		;   & enable the screen.

		lda	#-1
		jsr	silence		;Silence all slots.

		lda	#0
		sta	JOY1_CHG	;Reset joystick values.
		sta	JOY2_CHG
		sta	TWO_PLAY	;Reset two player flag.
		sta	DEMOMODE	;Reset demo mode flag.
		sta	HELPSCRN	;Reset help screen number.

		lda	DEMO_TO		;Get demo-mode timeout.
		sta	DEMOCNT		;Reset demo mode timeout.
		lda	#60
		sta	TENTHSEC	;Init 1 second counter.

tsinput:
		lda	NMI_TIME
tsinpwt:	cmp	NMI_TIME
		beq	tsinpwt		;Wait for NMI to occur.

		dec	TENTHSEC	;Decrement 1 second counter.
		bne	tsinp2		;Continue if not zero.
		lda	#60
		sta	TENTHSEC	;Reset 1 second counter.
		dec	DEMOCNT		;Decrement demo timer.
		bne	tsinp2		;Continue if not zero.

		inc	DEMONUM		;Increment demo number.
		lda	DEMONUM		;Get demo number.
		cmp	#MAXDEMOS
		bcc	tsdemo		;Continue if ok.
		lda	#0
		sta	DEMONUM		;Reset demo number.

tsdemo:		tay			;Put in Y.
		lda	demolev,y	;Get level number.
		sta	LEVEL_P1
		tya
		asl	a		;Make index.
		tay			;Put in Y.
		lda	demotab,y	;Get LSB of data address.
		sta	DEMOPTR		;Save it.
		lda	demotab+1,y	;Get MSB of data address.
		sta	DEMOPTR2	;Save it.

		lda	#0
		sta	CONT_CNT	;Clear continue game counter.
		sta	PLAYERUP	;Player 1 (0) always goes first.
		lda	#1		;Set number of robots.
		sta	LIVES_P1
		sta	WARPF_P1	;Set warp disable flags.

		lda	#$a7
		sta	DEMOMODE	;Set demo mode.
		jmp	pgcontg		;Go play the game.

tsinp2:		lda	NMI_TIME	;Get 1/60th counter.
		and	#%00000001
		beq	tsinpj1		;Go read joystick #1.
		jsr	readjoy2	;Read joystick #2.
		lda	JOY2_CHG
		sta	TMP_CHG		;Store change flag.
		lda	JOY2_VAL
		sta	TMP_VAL		;Store position flag.
		jmp	tsinpcnt
tsinpj1:	jsr	readjoy1	;Read joystick #1.
		lda	JOY1_CHG
		sta	TMP_CHG		;Store change flag.
		lda	JOY1_VAL
		sta	TMP_VAL		;Store position flag.
tsinpcnt:
		lda	TMP_VAL		;Get joystick value.
		beq	tsinpct2	;Continue if nothing pressed.
		lda	DEMOCNT		;Get demo timeout.
		cmp	#5
		bcs	tsinpct2	;Continue if >= 5.
		lda	#5
		sta	DEMOCNT		;Reset demo mode timeout.

tsinpct2:	lda	TMP_CHG		;Get change flag.
		and	#J_SELECT	;Check SELECT key.
		beq	tscont		;Go if no change.
		lda	TMP_VAL		;Get position flag.
		and	#J_SELECT	;Check SELECT key.
		beq	tscont		;Go if it was key-up.

		lda	TWO_PLAY	;Get two player flag.
		eor	#$ff		;Toggle it.
		sta	TWO_PLAY	;Put it back.
		jsr	sf_select	;Do SELECT sound effect.

		lda	WIZARD		;Check wizard mode.
		bne	tscont		;Continue if already set or disabled.
		lda	TMP_VAL		;Get position flags.
		and	#J_A|J_B|J_UP|J_DOWN|J_LEFT|J_RIGHT
		asl	WIZTMP1		;Shift WIZTMP & add new value.
		rol	WIZTMP2
		clc
		adc	WIZTMP1
		sta	WIZTMP1
		lda	#0
		adc	WIZTMP2
		sta	WIZTMP2
		cmp	#WIZVAL2
		bne	tscont		;Continue.
		lda	WIZTMP1
		cmp	#WIZVAL1
		bne	tscont		;Continue.

		lda	#$a5
		sta	WIZARD		;Set wizard mode.
		jsr	sf_smash	;Do WIZARD mode enable sound effect.
		lda	#0
		sta	TWO_PLAY	;Reset two player flag.

tscont:		lda	TMP_CHG		;Get change flag.
		and	#J_START	;Check START key.
		beq	tsinptj		;Loop if no change.
		lda	TMP_VAL		;Get position flag.
		and	#J_START	;Check START key.
		bne	tscont2		;Go if STARTing game.
tsinptj:	jmp	tsinput		;Loop if it was key-up.

tscont2:	lda	#-1
		jsr	silence		;Silence all slots.
		lda	WIZARD
		cmp	#$a5
		beq	tsplay		;Go if wizard mode enabled.

		lda	#$ff
		sta	WIZARD		;Disable wizard mode.

tsplay:		jmp	playgame	;Go play the game.


;-----------------------------------------------------------------------------
; Draw the title screen.
;
drawtitl:
		;Display "CRYSTAL" graphics.
		lda	#titldat & $ff
		sta	T1
		lda	#titldat >> 8
		sta	T2		;T2:T1 points to data.

		lda	$2002
		lda	#$20		;Write MSB of screen position.
		sta	$2006
		lda	#$a0		;Write LSB of screen position.
		sta	$2006

		ldy	#0
dtlp2:		ldx	#32
dtlp1:		lda	(T1),y		;Get next char of data.
		sta	$2007		;Store it.
		iny
		dex
		bne	dtlp1		;Draw one line.
		cpy	#3*32
		bcc	dtlp2		;Loop for 3 lines of data.

		;Display "MINES" graphics.
		lda	#titldat2 & $ff
		sta	T1
		lda	#titldat2 >> 8
		sta	T2		;T2:T1 points to data.

		lda	$2002
		lda	#$21		;Write MSB of screen position.
		sta	$2006
		lda	#$40		;Write LSB of screen position.
		sta	$2006

		ldy	#0
dtlp22:		ldx	#32
dtlp21:		lda	(T1),y		;Get next char of data.
		sta	$2007		;Store it.
		iny
		dex
		bne	dtlp21		;Draw one line.
		cpy	#3*32
		bcc	dtlp22		;Loop for 3 lines of data.

		;Display high score.
		ldx	#hsmsg >> 8
		ldy	#hsmsg & $ff
		jsr	message		;Display "HIGH SCORE".
		ldx	#HSCORE		;Point to high score.
		jsr	fmtscore	;Copy into S_NSBUF.
		ldy	#7		;String length.
		ldx	#S_NSBUF
		jsr	fmtdecr		;Right justify.
		ldx	#S_NSBUF	;Point to high score.
		lda	$2002
		lda	#$22		;MSB of video address.
		sta	$2006
		lda	#$12		;LSB of video address.
		sta	$2006
		ldy	#7		;String length.
		jsr	dnloop		;Go display high score.

		;Display text messages.
		ldx	#sel1msg >> 8
		ldy	#sel1msg & $ff
		jsr	message		;Display "1 PLAYER".
		ldx	#sel2msg >> 8
		ldy	#sel2msg & $ff
		jsr	message		;Display "2 PLAYERS".
		ldx	#cpymsg >> 8
		ldy	#cpymsg & $ff
		jsr	message		;Display "COPYRIGHT 1989 BY KEN BECKETT".
		ldx	#lcnmsg >> 8
		ldy	#lcnmsg & $ff
		jsr	message		;Display "LICENSED BY COLOR DREAMS".

		;Set attribute for # of players selector.
		lda	#$23		;Write MSB of screen position.
		sta	$2006
		lda	#$e2		;Write LSB of screen position.
		sta	$2006
		lda	#%01000000	;Attribute data.
		sta	$2007		;Store attribute byte.
		lda	#$23		;Write MSB of screen position.
		sta	$2006
		lda	#$ea		;Write LSB of screen position.
		sta	$2006
		lda	#%00000100	;Attribute data.
		sta	$2007		;Store attribute byte.

		rts


;-----------------------------------------------------------------------------
; Display robot screen at boot-up.
;
disprobt:
		lda	#palrobot & $ff
		sta	T1
		lda	#palrobot >> 8
		sta	T2
		jsr	initpals	;Initialize the palettes.
		jsr	initspr		;Initialize sprite table.
		jsr	initnmiq	;Initialize NMI buffer.
		jsr	clsp1top	;Clear status area.
		jsr	clsp1bot	;Clear bottom of screen.

		lda	#help2 & $ff	;Get LSB of data address.
		sta	T1
		lda	#help2 >> 8	;Get MSB of data address.
		sta	T2
		jsr	disppic		;Display picture.

		lda	#$23		;Write MSB of screen position.
		sta	$2006
		lda	#$40		;Write LSB of screen position.
		sta	$2006
		lda	#SPACE		;Data to write.
		ldx	#32
zzcln:		sta	$2007		;Store attribute byte.
		dex
		bne	zzcln		;Loop.

		jsr	esmusic		;Play robot hit exit square music.

		lda	#$10
		jsr	selpage		;Change to character sets 2 & 3.
		lda	#0
		sta	H_SCROLL	;Set horizontal scroll offset to 0.

		lda	#NM_NORM	;Set NMI mode,
		jsr	scrn_on		;   & enable the screen.

		lda	#3		;Show screen for up to 3 seconds.
		sta	DEMOCNT		;Reset demo mode timeout.
		lda	#60
		sta	TENTHSEC	;Init 1 second counter.
zzinput:
		lda	NMI_TIME
zzinpwt:	cmp	NMI_TIME
		beq	zzinpwt		;Wait for NMI to occur.

		dec	TENTHSEC	;Decrement 1 second counter.
		bne	zzinp2		;Continue if not zero.
		lda	#60
		sta	TENTHSEC	;Reset 1 second counter.
		dec	DEMOCNT		;Decrement demo timer.
		bne	zzinp2		;Continue if not zero.
		jmp	zzdone		;Go display title screen.

zzinp2:		lda	NMI_TIME	;Get 1/60th counter.
		and	#%00000001
		beq	zzinpj1		;Go read joystick #1.
		jsr	readjoy2	;Read joystick #2.
		lda	JOY2_CHG
		sta	TMP_CHG		;Store change flag.
		lda	JOY2_VAL
		sta	TMP_VAL		;Store position flag.
		jmp	zzinpcnt
zzinpj1:	jsr	readjoy1	;Read joystick #1.
		lda	JOY1_CHG
		sta	TMP_CHG		;Store change flag.
		lda	JOY1_VAL
		sta	TMP_VAL		;Store position flag.
zzinpcnt:
		lda	TMP_VAL		;Get position flag.
		beq	zzinput		;Go if no controls pressed.

zzdone:		lda	#-1
		jsr	silence		;Silence all slots.
		rts


;-----------------------------------------------------------------------------
; Read a byte of demo data & set Joystick variables.
;
; Changes: A, X, Y
; Sets: TMP_VAL, TMP_CHG
; Returns: carry flag set if out of demo data, otherwise clear.
;
readdemo:
		ldx	DEMOLAST	;Get previous value.

		lda	DEMOCNT		;Check if doing repeat count.
		beq	rddnor		;Go if not.
		lda	DEMOLAST	;Get last value.
		sta	TMP_VAL		;Set new value.
		dec	DEMOCNT		;Decrement repeat count.
		jmp	rddstor		;Go store the byte.

rddnor:		ldy	#0
		lda	(DEMOPTR),y	;Read byte of demo data.
		cmp	#$ff
		beq	rddend		;Go if end of demo data.

		and	#J_START	;Check for repeat count.
		beq	rddnrc		;Go if none.

		lda	(DEMOPTR),y	;Get byte again.
		and	#J_START ^ $ff
		sta	DEMOLAST	;Save it.
		sta	TMP_VAL
		inc	DEMOPTR		;Increment data pointer.
		bne	rddrp2		;Continue if no wrap.
		inc	DEMOPTR2
rddrp2:		lda	(DEMOPTR),y	;Get repeat count.
		sta	DEMOCNT		;Save it.
		jmp	rddnrc2		;Continue.

rddnrc:		lda	(DEMOPTR),y	;Get byte again.
		sta	TMP_VAL		;Set new value.
		sta	DEMOLAST
rddnrc2:	inc	DEMOPTR		;Increment data pointer.
		bne	rddstor		;Continue if no wrap.
		inc	DEMOPTR2

rddstor:	txa			;Get previous value.
		eor	TMP_VAL		;Make change flags.
		sta	TMP_CHG		;Save them.

		clc
		rts			;All done.

rddend:		sec
		rts			;Done (out of demo data).


;-----------------------------------------------------------------------------
; Display help screens.
;
help:
		lda	NMI_TIME
hsnmiwt1:	cmp	NMI_TIME
		beq	hsnmiwt1	;Wait for NMI to occur.

		jsr	scrn_off	;Blank the screen.

		lda	#palnorm & $ff
		sta	T1
		lda	#palnorm >> 8
		sta	T2
		jsr	initpals	;Initialize the palettes.

		jsr	initnmiq	;Initialize NMI buffer.
		jsr	initspr		;Initialize sprite table.
		jsr	clsp1top	;Clear status area.
		jsr	clsp1bot	;Clear bottom of screen.
		lda	#0
		jsr	selpage		;Change back to character sets 0 & 1.

		lda	HELPSCRN	;Get help screen number.
		asl	a		;Make index.
		tay			;Put in Y.
		lda	helptab,y	;Get LSB of data address.
		sta	T1
		lda	helptab+1,y	;Get MSB of data address.
		sta	T2
		jsr	disppic		;Display picture.

		lda	#0
		sta	NMI_TIME	;Clear NMI counter.
		sta	EXIT_ON		;Clear exit on flag.

		lda	HELPSCRN	;Get help screen number.
		cmp	#HS_EXIT
		bne	hsinit2		;Continue if not EXIT square screen.

		lda	#2
		sta	EXIT_ANC	;Set animation counter.
		ldx	#8
		stx	EXIT_X		;Set X position.
		ldy	#9
		sty	EXIT_Y		;Set Y position.
		lda	#$ff
		sta	EXIT_ON		;Set exit on flag.
		jsr	getbgblk	;Get the background block value.
		lda	#EXIT1
		jsr	qblock		;Make exit square appear.
		jmp	hsinitx		;Continue.

hsinit2:	cmp	#HS_MONS
		bne	hsinit3		;Go if not MONSTER help screen.

		lda	#helpmons & $ff
		sta	T1		;Set LSB of sprite table.
		lda	#helpmons >> 8
		sta	T2		;Set MSB of sprite table.
		jsr	putsprts	;Display monster sprites.

		ldx	#0
		ldy	#0
hsi2lp:		lda	helpmons,y	;Get monster number.
		sta	MM_LIST,x	;Save monster type!
		lda	#0
		sta	MM_LIST5,x	;Clear animation counter.
		iny
		iny
		iny
		inx
		cpx	#7
		bcc	hsi2lp		;Loop for 7 monsters.

		lda	#2
		sta	MM_LIST5+5	;Set LAVA_MON animation offset.
		jmp	hsinitx		;Continue.

hsinit3:	cmp	#HS_ROBOT
		bne	hsinitx		;Continue if not ROBOT screen.

		lda	NMI_TIME
hsnmiwt3:	cmp	NMI_TIME
		beq	hsnmiwt3	;Wait for NMI to occur.

		lda	#palrobot & $ff
		sta	T1
		lda	#palrobot >> 8
		sta	T2
		jsr	initpals	;Initialize the palettes.
		lda	#$10
		jsr	selpage		;Change to character sets 2 & 3.

hsinitx:	lda	#0
		sta	H_SCROLL	;Set horizontal scroll offset to 0.

		lda	#NM_NORM	;Set NMI mode,
		jsr	scrn_on		;   & enable the screen.

hsinput:
		lda	NMI_TIME
hsinpwt:	cmp	NMI_TIME
		beq	hsinpwt		;Wait for NMI to occur.

hsinp2:		lda	NMI_TIME	;Get 1/60th counter.
		and	#%00000001
		beq	hsinpj1		;Go read joystick #1.
		jsr	readjoy2	;Read joystick #2.
		lda	JOY2_CHG
		sta	TMP_CHG		;Store change flag.
		lda	JOY2_VAL
		sta	TMP_VAL		;Store position flag.
		jmp	hsinpcnt
hsinpj1:	jsr	readjoy1	;Read joystick #1.
		lda	JOY1_CHG
		sta	TMP_CHG		;Store change flag.
		lda	JOY1_VAL
		sta	TMP_VAL		;Store position flag.
hsinpcnt:
		lda	TMP_CHG		;Get change flag.
		and	#J_SELECT	;Check SELECT key.
		beq	hscont		;Go if no change.
		lda	TMP_VAL		;Get position flag.
		and	#J_SELECT	;Check SELECT key.
		beq	hscont		;Go if it was key-up.

		inc	HELPSCRN	;Next help screen.
		lda	HELPSCRN	;Get help screen number.
		cmp	#MAXHELP
		bcc	hsnxthlp	;Continue if OK.
		lda	#0
		sta	HELPSCRN	;Reset to screen #0.
hsnxthlp:	jmp	help		;Go display screen.
		
hscont:		lda	TMP_CHG		;Get change flag.
		and	#J_START	;Check START key.
		beq	hscont2		;Go if no change.
		lda	TMP_VAL		;Get position flag.
		and	#J_START	;Check START key.
		beq	hscont2		;Go if not STARTing game.

		lda	#-1
		jsr	silence		;Silence all slots.
		rts

hscont2:	lda	HELPSCRN	;Get help screen number.
		cmp	#HS_EXIT
		bne	hscont3		;Continue if not EXIT square screen.

		jsr	aniexit		;Animate exit square.

hscont3:	lda	HELPSCRN	;Get help screen number.
		cmp	#HS_MONS
		bne	hscont4		;Continue if not MONSTER screen.

		ldy	#S_MONS*4
		ldx	#0

hsamlp:		lda	MM_LIST,x	;Get monster number.
		cmp	#RR_MON
		bcc	hsnorm		;Go if SR_MON, HR_MON, or IR_MON.
		cmp	#LAVA_MON
		bcc	hsanim		;Go if RR_MON.
		cmp	#GAS_MON
		bcc	hsnorm		;Go if MUD_MON or LAVA_MON.

		txa			;Process each monster every 4 NMIs.
		and	#%00000011
		sta	T1
		lda	NMI_TIME
		and	#%00000011
		cmp	T1
		bne	hsnext		;Next monster.
		jmp	hsanim		;Go animate.

hsnorm:		txa			;Process each monster every 2 NMIs.
		eor	NMI_TIME
		and	#%00000001
		bne	hsnext		;Next monster.

hsanim:		inc	MM_LIST5,x	;Increment animation counter.
		lda	MM_LIST5,x	;Get animation counter.
		and	#%00001100	;Mask off 2 bits.
		lsr	a
		lsr	a
		cmp	#%00000011	;Check for 3.
		bne	hsamct		;Continue if not.
		lda	#%00000001	;Set to 1.
hsamct:		clc
		adc	MM_LIST,x	;Add object number.
		stx	T7		;Save X.
		tax
		lda	objchr1,x	;Get character number #1.
		sta	SPR_DATA+1,y	;Set character number of sprite #1.
		clc
		adc	#2		;Get character number #2.
		sta	SPR_DATA+4+1,y	;Set character number of sprite #2.
		ldx	T7		;Restore X.

hsnext:		tya
		sec
		sbc	#8
		tay
		inx
		cpx	#7
		bcc	hsamlp		;Loop for all 7 monsters.

hscont4:	jmp	hsinput		;Loop.


;-----------------------------------------------------------------------------
; Display list of sprites on screen.
;
; Entry: T2:T1 -> list of sprites.
; Uses: A, X, Y, T3, T4.
;
putsprts:
		lda	#S_MONS*4
		sta	T3		;Save sprite table offset.
		ldy	#0

ptsplp:		lda	(T1),y		;Get object number.
		cmp	#ENDLIST
		beq	ptsdone		;Go if end of list.
		pha
		iny
		lda	(T1),y		;Get X position.
		pha
		iny
		lda	(T1),y		;Get Y position.
		pha
		iny
		sty	T4		;Save list index.

		ldy	T3		;Get sprite table offset.
		pla
		sta	SPR_DATA,y	;Set Y position of sprite #1.
		sta	SPR_DATA+4,y	;Set Y position of sprite #2.

		pla
		sta	SPR_DATA+3,y	;Set X position of sprite #1.
		clc
		adc	#8
		sta	SPR_DATA+4+3,y	;Set X position of sprite #2.

		pla
		tax
		lda	objchr1,x	;Get character number #1.
		sta	SPR_DATA+1,y	;Set character number of sprite #1.
		clc
		adc	#2		;Get character number #2.
		sta	SPR_DATA+4+1,y	;Set character number of sprite #2.

		lda	objpal,x	;Get palette number.
		sta	SPR_DATA+2,y	;Set flag byte of sprite #1.
		sta	SPR_DATA+4+2,y	;Set flag byte of sprite #2.

		tya
		sec
		sbc	#8
		sta	T3		;Store new sprite table offset.

		ldy	T4		;Get list index.
		jmp	ptsplp		;Loop.

ptsdone:	rts


;-----------------------------------------------------------------------------
; Main loop for game play.
;
playgame:
		jsr	ttlmusic	;Play title screen music.
		jsr	help		;Display help screens.

		lda	#3
		sta	CONT_CNT	;Set continue game counter.

		lda	#1		;Set starting level number.
		sta	LEVEL_P1
		sta	LEVEL_P2

		lda	#NUMROBOT	;Set starting number of robots.
		sta	LIVES_P1
		sta	LIVES_P2

		lda	#0
		sta	WARPF_P1	;Clear warp disable flags.
		sta	WARPF_P2
		sta	PLAYERUP	;Player 1 (0) always goes first.

pgcontg:	lda	#0
		sta	GOTXR_P1	;Clear got EXTRA robot flags.
		sta	GOTXR_P2
		sta	JOY1_VAL	;Clear joystick bytes.
		sta	JOY2_VAL
		sta	TMP_VAL

		sta	SCORE_P1	;Set scores to 0.
		sta	SCORE_P1+1
		sta	SCORE_P1+2
		sta	SCORE_P1+3
		sta	SCORE_P1+4
		sta	SCORE_P1+5
		sta	SCORE_P1+6

		sta	SCORE_P2
		sta	SCORE_P2+1
		sta	SCORE_P2+2
		sta	SCORE_P2+3
		sta	SCORE_P2+4
		sta	SCORE_P2+5
		sta	SCORE_P2+6

pgreset:	lda	#1
		sta	NUM_EB		;Set # of energy balls to 1.
		lda	#2
		sta	RANGE_EB	;Set energy ball range to 2.

mainloop:	jsr	playlev		;Go play the level.

		ldx	PLAYERUP	;Get current player number.
		lda	#1
		sta	WARPF_P1,x	;Set warp disable flag.

		bcs	robdied		;Go if robot died.

		lda	#0
		sta	GOTXR_P1,x	;Clear got EXTRA robot flag.

		lda	#LAST_LEV*2
		cmp	LEVEL_P1,x	;Check if just finished last level.
		beq	complete	;Go if so.

		lda	#LAST_LEV
		cmp	LEVEL_P1,x	;Check if finished level LAST_LEV.
		bne	nothalf		;Go if not.

		inc	LEVEL_P1,x	;Advance to next level.
		jsr	halfway		;Do intermission routine.
		jmp	mainloop	;Go play it.

nothalf:	inc	LEVEL_P1,x	;Advance to next level.
		jmp	mainloop	;Go play it.

complete:	lda	#$ff
		sta	LEVEL_P1,x	;Signal completed game.

		jsr	endgame		;Do end of game processing.
		jmp	swapplay	;Continue.

robdied:	lda	DEMOMODE	;Check if demo mode.
		cmp	#$a7
		bne	robdied2	;Go if not.
		lda	#DEMOTO2
		sta	DEMO_TO		;Set demo mode timeout.
		jmp	titlesc2	;Reset back to title screen.

robdied2:	lda	LIVES_P1,x	;Check remaining robots.
		bne	swapplay	;Skip ahead if more robots left.

		jsr	gameover	;Display GAME OVER message.

swapplay:	lda	TWO_PLAY
		beq	next_up		;Go if only one player.

		lda	PLAYERUP
		cmp	#0		;Check current player #.
		beq	check_P2	;If 1, go try 2,
		ldx	#0		;   else try 1.
		jmp	check_oth
check_P2:	ldx	#1
check_oth:	lda	LIVES_P1,x	;Check # of lives for other player.
		beq	next_up		;Same player up if other already dead.
		stx	PLAYERUP	;Other player is now up.

next_up:	ldx	PLAYERUP	;Get current player number.
		lda	LIVES_P1,x	;Check # of lives.
		beq	alldone		;Go if no robots left.
		jmp	pgreset		;Go continue the game.

alldone:	;Both players won or lost all robots.

		lda	CONT_CNT	;Get continue game counter.
		beq	csnotok		;Go if all continues already used.

		lda	LEVEL_P1
		cmp	#$ff
		bne	csoktc		;Continue if Player 1 didn't win.
		lda	TWO_PLAY	;Check if 2 player game.
		beq	cssuper		;Go set super mode if only 1 player.

		lda	LEVEL_P2
		cmp	#$ff
		bne	csoktc		;Continue if Player 2 didn't win.

cssuper:	lda	#$a9
		sta	SUPERSPD	;Set super-speed mode.
		jmp	titlescr	;Reset back to title screen.

csnotok:	lda	LEVEL_P1
		cmp	#$ff
		beq	cssuper		;Go if Player 1 won the game.
		lda	LEVEL_P2
		cmp	#$ff
		beq	cssuper		;Go if Player 2 won the game.
		jmp	titlescr	;Reset back to title screen.

csoktc:		;At least one of the players didn't win the game, and the
		;   continue option hasn't been used 3 times yet, so display
		;   a menu to allow the game to be continued.

		jsr	scrn_off	;Blank the screen.

		jsr	clsp1top	;Clear status area.
		jsr	clsp1bot	;Clear bottom of screen.

		ldx	#contmsg >> 8
		ldy	#contmsg & $ff
		jsr	message		;Display "CONTINUE".

		ldx	#endmsg >> 8
		ldy	#endmsg & $ff
		jsr	message		;Display "END".

		;Set attribute for continue/end selector.
		lda	#$23		;Write MSB of screen position.
		sta	$2006
		lda	#$da		;Write LSB of screen position.
		sta	$2006
		lda	#%01000100	;Attribute data.
		sta	$2007		;Store attribute byte.

		lda	#$ff
		sta	CONTINUE	;Set continue flag.

		lda	#NM_NORM|NM_CONT	;Set NMI mode,
		jsr	scrn_on		;   & enable the screen.

csinput:	jsr	readjoy1	;Read joystick #1.
		jsr	readjoy2	;Read joystick #2.

		lda	JOY1_CHG	;Get change flag.
		and	#J_SELECT	;Check SELECT key.
		beq	cscont		;Go if no change.
		lda	JOY1_VAL	;Get position flag.
		and	#J_SELECT	;Check SELECT key.
		beq	cscont		;Go if it was key-up.
		jmp	cstoggle	;Go toggle mode flag.

cscont:		lda	JOY2_CHG	;Get change flag.
		and	#J_SELECT	;Check SELECT key.
		beq	cscont2		;Go if no change.
		lda	JOY2_VAL	;Get position flag.
		and	#J_SELECT	;Check SELECT key.
		beq	cscont2		;Go if it was key-up.

cstoggle:	lda	CONTINUE	;Get continue game flag.
		eor	#$ff		;Toggle it.
		sta	CONTINUE	;Put it back.
		jsr	sf_select	;Do SELECT sound effect.

cscont2:	lda	JOY1_CHG	;Get change flag.
		and	#J_START	;Check START key.
		beq	cscont3		;Go if no change.
		lda	JOY1_VAL	;Get position flag.
		and	#J_START	;Check START key.
		beq	cscont3		;Go if it was key-up.
		jmp	csstart		;Go continue game.

cscont3:	lda	JOY2_CHG	;Get change flag.
		and	#J_START	;Check START key.
		beq	csinput		;Go if no change.
		lda	JOY2_VAL	;Get position flag.
		and	#J_START	;Check START key.
		beq	csinput		;Go if it was key-up.

csstart:	lda	#-1
		jsr	silence		;Silence all slots.

		lda	CONTINUE	;Get continue game flag.
		bne	cscontf
		jmp	titlescr	;Reset back to title screen.
		
cscontf:	lda	#0
		sta	PLAYERUP	;Set Player 1 to go first.

		lda	LEVEL_P1	;Get last level player 1 got to.
		cmp	#$ff
		bne	csdwp1		;Go if didn't finish game.

		lda	#1
		sta	PLAYERUP	;Set Player 2 to go first.
		lda	#0		;Signal game over if completed.
		jmp	csstorp1	;Continue.

csdwp1:		lda	#NUMROBOT
csstorp1:	sta	LIVES_P1	;Reset number of men.

		lda	LEVEL_P2	;Get last level player 2 got to.
		cmp	#$ff
		bne	csdwp2		;Go if didn't finish game.

		lda	#0		;Signal game over if completed.
		jmp	csstorp2	;Continue.

csdwp2:		lda	#NUMROBOT
csstorp2:	sta	LIVES_P2	;Reset number of men.

cscomp:		dec	CONT_CNT	;Decrement continue game counter.
		jmp	pgcontg		;Go continue the game.


;-----------------------------------------------------------------------------
; End of game routine.
;
endgame:
		jsr	scrn_off	;Blank the screen.

		jsr	initnmiq	;Initialize NMI buffer.
		jsr	clsp1top	;Clear status area.
		jsr	clsp2top	;Clear top of page 2.
		jsr	clsp1bot	;Clear bottom of screen.
		jsr	clsp2bot	;Clear bottom of page 2.
		jsr	initspr		;Initialize sprite table.

		lda	#picmoon & $ff
		sta	T1
		lda	#picmoon >> 8
		sta	T2
		jsr	disppic		;Display picture.

		jsr	cmphigh		;Check for new high score.

		;Display high score.
		ldx	#SCORE_P1
		lda	PLAYERUP	;Get current player number.
		beq	egp1s
		ldx	#SCORE_P2
egp1s:		jsr	fmtscore	;Copy into S_NSBUF.
		ldy	#7		;String length.
		ldx	#S_NSBUF
		jsr	fmtdecr		;Right justify.
		ldx	#S_NSBUF	;Point to high score.
		lda	$2002
		lda	#$20		;MSB of video address.
		sta	$2006
		lda	#$6c		;LSB of video address.
		sta	$2006
		ldy	#7		;String length.
		jsr	dnloop		;Go display high score.

		lda	NMI_TIME
endgnmiw:	cmp	NMI_TIME
		beq	endgnmiw	;Wait for NMI to occur.

		lda	#palmoon & $ff
		sta	T1
		lda	#palmoon >> 8
		sta	T2
		jsr	initpals	;Initialize the palettes.
		lda	#$10
		jsr	selpage		;Change to character sets 2 & 3.
		lda	REG_2000
		ora	#%00010000	;Switch to upper character set.
		sta	REG_2000
		sta	$2000

		jsr	wgmusic		;Play won-game music.

		lda	#0
		sta	H_SCROLL	;Set horizontal scroll offset to 0.

		lda	#NM_NORM	;Set NMI mode,
		jsr	scrn_on		;   & enable the screen.

eginput:
		lda	NMI_TIME
eginpwt:	cmp	NMI_TIME
		beq	eginpwt		;Wait for NMI to occur.

eginp2:		lda	PLAYERUP	;Check player number.
		beq	egpl1		;Go if player #1.
		jsr	readjoy2	;Read joystick #2.
		lda	JOY2_CHG
		sta	TMP_CHG		;Store change flag.
		lda	JOY2_VAL
		sta	TMP_VAL		;Store position flag.
		jmp	egchk
egpl1:		jsr	readjoy1	;Read joystick #1.
		lda	JOY1_CHG
		sta	TMP_CHG		;Store change flag.
		lda	JOY1_VAL
		sta	TMP_VAL		;Store position flag.

egchk:		lda	TMP_CHG		;Get change flags.
		and	#J_START	;Check START key.
		beq	egcont		;Go if no change.
		lda	TMP_VAL		;Get position flag.
		and	#J_START	;Check START key.
		beq	egcont		;Go if not STARTing game.

		lda	#-1
		jsr	silence		;Silence all slots.
		rts

egcont:		jmp	eginput		;Loop.


;-----------------------------------------------------------------------------
; Intermission routine (snack break).
;
halfway:
		jsr	scrn_off	;Blank the screen.

		jsr	initnmiq	;Initialize NMI buffer.
		jsr	clsp1top	;Clear status area.
		jsr	clsp2top	;Clear top of page 2.
		jsr	clsp1bot	;Clear bottom of screen.
		jsr	clsp2bot	;Clear bottom of page 2.
		jsr	initspr		;Initialize sprite table.

		lda	#picspam & $ff
		sta	T1
		lda	#picspam >> 8
		sta	T2
		jsr	disppic		;Display picture.

		lda	NMI_TIME
hwnmiw:		cmp	NMI_TIME
		beq	hwnmiw		;Wait for NMI to occur.

		lda	#palspam & $ff
		sta	T1
		lda	#palspam >> 8
		sta	T2
		jsr	initpals	;Initialize the palettes.
		lda	#$10
		jsr	selpage		;Change to character sets 2 & 3.
		lda	REG_2000
		ora	#%00010000	;Switch to upper character set.
		sta	REG_2000
		sta	$2000

		jsr	wgmusic		;Play won-game music.

		lda	#0
		sta	H_SCROLL	;Set horizontal scroll offset to 0.

		lda	#NM_NORM	;Set NMI mode,
		jsr	scrn_on		;   & enable the screen.

hwinput:
		lda	NMI_TIME
hwinpwt:	cmp	NMI_TIME
		beq	hwinpwt		;Wait for NMI to occur.

hwinp2:		lda	PLAYERUP	;Check player number.
		beq	hwpl1		;Go if player #1.
		jsr	readjoy2	;Read joystick #2.
		lda	JOY2_CHG
		sta	TMP_CHG		;Store change flag.
		lda	JOY2_VAL
		sta	TMP_VAL		;Store position flag.
		jmp	hwchk
hwpl1:		jsr	readjoy1	;Read joystick #1.
		lda	JOY1_CHG
		sta	TMP_CHG		;Store change flag.
		lda	JOY1_VAL
		sta	TMP_VAL		;Store position flag.

hwchk:		lda	TMP_CHG		;Get change flags.
		and	#J_START	;Check START key.
		beq	hwcont		;Go if no change.
		lda	TMP_VAL		;Get position flag.
		and	#J_START	;Check START key.
		beq	hwcont		;Go if not STARTing game.

		lda	#-1
		jsr	silence		;Silence all slots.
		rts

hwcont:		jmp	hwinput		;Loop.


;-----------------------------------------------------------------------------
; Display picture (with room for status line).
;
; On entry: T2:T1 = pointer to picture data.
;
disppic:
		lda	$2002
		lda	#$20		;MSB starting video address.
		sta	$2006
		lda	#$40		;LSB starting video address.
		sta	$2006

		ldy	#2		;Starting screen line.

dploop:		ldx	#0		;Starting screen column.
dpline:		sty	T3
		ldy	#0
		lda	(T1),y		;Get next byte.
		ldy	T3
		sta	$2007		;Store the byte.
		inc	T1		;Increment data pointer.
		bne	dpskpi
		inc	T2
dpskpi:		inx
		cpx	#32
		bcc	dpline		;Move 32 bytes.

		iny			;Next line.
		cpy	#28
		bcc	dploop		;Loop for all 26 lines.

		;Move palette information.
		lda	$2002
		lda	#$23		;MSB starting video address.
		sta	$2006
		lda	#$c0		;LSB starting video address.
		sta	$2006

		ldy	#0
		ldx	#0		;Reset counter.
dploop2:	lda	(T1),y		;Get next byte.
		asl	a
		asl	a
		asl	a
		asl	a
		cpy	#8
		bcc	dpstore		;Continue if first row.
		sta	T3		;Save attribute (high bits).
		sty	T4		;Save Y.
		tya
		sec
		sbc	#8
		tay
		lda	(T1),y		;Get previous row byte.
		lsr	a
		lsr	a
		lsr	a
		lsr	a
		ora	T3		;Or in high bits.
		ldy	T4		;Restore Y.

dpstore:	sta	$2007		;Store the byte.
		iny
		inx
		cpx	#56
		bcc	dploop2		;Move 56 bytes.

		rts


;-----------------------------------------------------------------------------
; Display GAME OVER message & delay a while.
;
gameover:
		jsr	scrn_off	;Blank the screen.

		jsr	initnmiq	;Initialize NMI buffer.
		jsr	clsp1bot	;Clear bottom of screen.
		jsr	initspr		;Initialize sprite table.

		;Erase special "dot" character.
		lda	$2002
		lda	#$20
		sta	$2006		;Write MSB.
		lda	#$7f
		sta	$2006		;Write LSB.
		lda	#SPACE
		sta	$2007

		lda	#0
		sta	H_SCROLL	;Set horizontal scroll offset to 0.

		ldx	#overmsg >> 8
		ldy	#overmsg & $ff
		jsr	message		;Display "GAME OVER".

		ldx	#over2msg >> 8
		ldy	#over2msg & $ff
		jsr	message		;Display "PLAYER  N".
		lda	#SPACE
		sta	$2007		;Store it.
		sta	$2007		;Store it.
		ldx	PLAYERUP	;Get current player.
		inx
		stx	$2007		;Store it.

		lda	#0
		sta	LP_FLAG		;Clear protection flags.
		sta	CP_FLAG
		sta	EP_FLAG
		sta	RP_FLAG

		jsr	ud_score	;Update score.
		jsr	ud_lives	;Update # of lives.
		jsr	ud_level	;Update level #.
		jsr	ud_bombs	;Update # of bombs.
		jsr	ud_gems		;Update # of gems.

		jsr	cmphigh		;Check for new high score.

		lda	#NM_STAT	;Set NMI mode,
		jsr	scrn_on		;   & enable the screen.

		ldy	#go_mel1 >> 8
		ldx	#go_mel1 & $ff
		lda	#0
		jsr	play		;Play on slot #0.
		ldy	#go_mel2 >> 8
		ldx	#go_mel2 & $ff
		lda	#1
		jsr	play		;Play on slot #1.

		lda	#40		;Delay in 1/10 seconds.
		jsr	delay		;Wait for a while.

		lda	#0
		jsr	silence		;Silence slot #0.
		lda	#1
		jsr	silence		;Silence slot #1.

		rts


;-----------------------------------------------------------------------------
; Routine to display level number message on screen.
;
pllevel:
		ldx	#levmsg >> 8
		ldy	#levmsg & $ff
		jsr	message		;Display "LEVEL NNN".

		lda	L_NSBUF+1
		cmp	#SPACE		;Check for trailing space.
		bne	plslevc		;Continue if NOT two spaces.

		sta	$2007		;Store two spaces.
		sta	$2007
		lda	L_NSBUF
		sta	$2007		;Store digit.
		jmp	plslevc3	;Continue.

plslevc:	lda	L_NSBUF+2
		cmp	#SPACE		;Check for trailing space.
		bne	plslevc2	;Go if NOT a space.
		sta	$2007		;Store a space.
		lda	L_NSBUF
		sta	$2007		;Store digit.
		lda	L_NSBUF+1
		sta	$2007		;Store digit.
		jmp	plslevc3	;Continue.

plslevc2:	lda	L_NSBUF
		sta	$2007		;Store digit.
		lda	L_NSBUF+1
		sta	$2007		;Store digit.
		lda	L_NSBUF+2
		sta	$2007		;Store digit.
plslevc3:	rts


;-----------------------------------------------------------------------------
; Play a level until completed or robot dies.
;
; Returns: CS if robot died.
;
playlev:
		lda	NMI_TIME
plnmiwt1:	cmp	NMI_TIME
		beq	plnmiwt1	;Wait for NMI to occur.

		jsr	scrn_off	;Blank the screen.

		lda	#palnorm & $ff
		sta	T1
		lda	#palnorm >> 8
		sta	T2
		jsr	initpals	;Initialize the palettes.

		lda	#0
		jsr	selpage		;Change back to character sets 0 & 1.
		lda	REG_2000
		and	#%11101111	;Switch to lower character set.
		sta	REG_2000
		sta	$2000

		jsr	initnmiq	;Initialize NMI buffer.
		jsr	clsp1top	;Clear status area.
		jsr	clsp2top	;Clear top of page 2.
		jsr	clsp1bot	;Clear bottom of screen.
		jsr	clsp2bot	;Clear bottom of page 2.
		jsr	setuplev	;Copy level data into RAM.
		jsr	drawstat	;Draw status lines.
		jsr	initspr		;Initialize sprite table.

		lda	DEMOMODE	;Check if demo mode.
		cmp	#$a7
		bne	pldrwms		;Go if not.
		jmp	pldemo		;Go if so.

pldrwms:	ldx	#playmsg >> 8
		ldy	#playmsg & $ff
		jsr	message		;Display "PLAYER  N".
		ldx	PLAYERUP	;Get current player.
		inx
		stx	$2007		;Store it.

		jsr	pllevel		;Display level number.

		lda	#NM_STAT	;Set NMI mode,
		jsr	scrn_on		;   & enable the screen.

		ldy	#pg_bass >> 8
		ldx	#pg_bass & $ff
		lda	#0
		jsr	play		;Play on slot #0.
		ldy	#pg_mel >> 8
		ldx	#pg_mel & $ff
		lda	#1
		jsr	play		;Play on slot #1.

plwizlp:	lda	#25		;Delay in 1/10 seconds.
		ldy	WIZARD
		cpy	#$a5
		beq	plwiz		;Go to wizard code.

		ldx	PLAYERUP	;Get current player number.
		ldy	WARPF_P1,x	;Get warp disable flag.
		beq	plwiz		;Go if warp enabled.

		jsr	delay		;Wait for a while.
		jmp	plsetup		;Skip level-selection code.

;-----special level-selection code:

plwiz:		tay			;Get # of 1/10 seconds in Y.
plwait3:	ldx	#TICKS/10
plwait2:	lda	NMI_TIME	;Get NMI timer value.
plwait1:	cmp	NMI_TIME
		beq	plwait1		;Loop until NMI occurs.
		tya
		pha
		txa
		pha

pltinp:		lda	PLAYERUP	;Check player number.
		beq	pltpl1		;Go if player #1.
		jsr	readjoy2	;Read joystick #2.
		lda	JOY2_CHG
		sta	TMP_CHG		;Store change flag.
		lda	JOY2_VAL
		sta	TMP_VAL		;Store position flag.
		jmp	pltchk
pltpl1:		jsr	readjoy1	;Read joystick #1.
		lda	JOY1_CHG
		sta	TMP_CHG		;Store change flag.
		lda	JOY1_VAL
		sta	TMP_VAL		;Store position flag.

pltchk:		lda	TMP_CHG		;Get change flags.
		and	#J_A		;Check A button.
		beq	pltchk2		;Go if no change.
		lda	TMP_VAL		;Get position flags.
		and	#J_A		;Check for A button.
		beq	pltchk2		;Go if not down.

		ldx	PLAYERUP	;Get player number.
		lda	WIZARD
		cmp	#$a5
		beq	plwiza		;Go if WIZARD mode.
		lda	SUPERSPD
		cmp	#$a9
		beq	plsupera	;Go if SUPERSPD mode.

		lda	LEVEL_P1,x
		clc
		adc	#5
		cmp	#LAST_LEV*2-19	;Check for last level.
		bcc	pltstor		;Go if not.
		lda	#LAST_LEV*2-19
		jmp	pltstor		;Continue.

plsupera:	inc	LEVEL_P1,x	;Go to next level.
		lda	LEVEL_P1,x
		cmp	#LAST_LEV*2+1	;Check for last level.
		bcc	pltnext		;Go if not.
		lda	#LAST_LEV*2
		jmp	pltstor		;Continue.

plwiza:		inc	LEVEL_P1,x	;Go to next level.
		lda	LEVEL_P1,x
		cmp	#LAST_LEV*2+1	;Check for last level.
		bcc	pltnext		;Go if not.

		lda	#$a9
		sta	SUPERSPD	;Set super-speed mode.
		lda	#1

pltstor:	sta	LEVEL_P1,x	;Set new level number.

pltnext:	lda	#0
		sta	GOTXR_P1,x	;Clear got EXTRA robot flag.
		pla
		pla
		jsr	setuplev	;Copy level data into RAM.

		jsr	scrn_off	;Blank the screen.
		jsr	pllevel		;Display level number.
		lda	#NM_STAT	;Set NMI mode,
		jsr	scrn_on		;   & enable the screen.

		jmp	plwizlp		;Next level.

pltchk2:	lda	TMP_CHG		;Get change flags.
		and	#J_B		;Check B button.
		beq	pltchk3		;Go if no change.
		lda	TMP_VAL		;Get position flags.
		and	#J_B		;Check for B button.
		beq	pltchk3		;Go if not down.

		ldx	PLAYERUP	;Get player number.
		lda	WIZARD
		cmp	#$a5
		beq	plwizb		;Go if WIZARD mode.
		lda	SUPERSPD
		cmp	#$a9
		beq	plsuperb	;Go if SUPERSPD mode.

		lda	LEVEL_P1,x
		sec
		sbc	#5
		bcc	plcontb
		jmp	pltstor		;Continue.
plcontb:	lda	#1		;Reset to level 1.
		jmp	pltstor		;Go set it.

plsuperb:	dec	LEVEL_P1,x	;Go to previous level.
		bne	pltnext		;Go if not zero.
		lda	#1		;Reset to level 1.
		jmp	pltstor		;Continue.

plwizb:		dec	LEVEL_P1,x	;Go to previous level.
		bne	pltnext		;Go if not zero.
		lda	#0
		sta	SUPERSPD	;Reset super-speed mode.
		lda	#LAST_LEV*2	;Get last level.
		jmp	pltstor		;Go set it.

pltchk3:	lda	WIZARD
		cmp	#$a5
		beq	plwizcnt	;Go if WIZARD mode.
		jmp	pltcont		;Continue if not.

plwizcnt:	lda	TMP_CHG		;Get change flags.
		and	#J_START	;Check START button.
		beq	pltchk4		;Go if no change.
		lda	TMP_VAL		;Get position flags.
		and	#J_START	;Check for START button.
		beq	pltchk4		;Go if not down.
		ldx	PLAYERUP	;Get player number.
		inc	LIVES_P1,x	;Increment number of robots.
		jsr	ud_lives	;Update # of lives.
		pla
		pla
		jmp	plwizlp		;Continue.

pltchk4:	lda	TMP_CHG		;Get change flags.
		and	#J_SELECT	;Check SELECT button.
		beq	pltcont		;Go if no change.
		lda	TMP_VAL		;Get position flags.
		and	#J_SELECT	;Check for SELECT button.
		beq	pltcont		;Go if not down.
		lda	#MAX_EB
		sta	NUM_EB		;Set number of energy balls to max.
		lda	#MAX_RGEB
		sta	RANGE_EB	;Set range of energy balls to max.
		pla
		pla
		jmp	plwizlp		;Continue.

pltcont:	pla
		tax
		pla
		tay
		dex
		beq	pltcnt2
		jmp	plwait2		;Loop for # of NMI's in 1/10 second.
pltcnt2:	dey
		beq	plsetup
		jmp	plwait3		;Wait for # of 1/10 seconds.

;-----end of special level-selection code

plsetup:	lda	#-1
		jsr	silence		;Silence all slots.

		jsr	scrn_off	;Blank the screen.
pldemo:
		jsr	drawlev		;Draw level in VRAM.
		jsr	putrobot	;Display the robot.

		lda	#NM_STAT|NM_HORZ|NM_PLAY	;Set NMI mode,
		jsr	scrn_on		;   & enable the screen.

		jsr	plmusic		;Play level music.

		lda	#0
		sta	NMI_TIME	;Reset NMI timer so play is the same!
		sta	DEMOLAST
		sta	DEMOCNT		;Clear demo mode counter.

.ifdef RECDEMO	;IFDEF(`RECDEMO',`
	;Code for recording demo mode.
	lda	DEMOMODE
	cmp	#$a7
	beq	plxxx
	lda	#demobuf & $ff
	sta	DEMOPTR
	lda	#demobuf >> 8
	sta	DEMOPTR2
	lda	#$fe
	sta	DEMOLAST
plxxx:
.endif	;',)	;ENDIF

		;Play the level.
		lda	#6
		sta	TENTHSEC	;Init 1/10 second counter.
plloop:
		lda	SUPERSPD	;Check for super-speed mode.
		cmp	#$a9
		beq	pltimer		;Skip NMI wait if so.

		lda	NMI_TIME

plnmiwt:	cmp	NMI_TIME
		beq	plnmiwt		;Wait for NMI to occur.

pltimer:	lda	TL_CHG		;Check time left change flag.
		beq	planiex		;Continue if no change.
		lda	#0
		sta	TL_CHG		;Clear change flag.
		jsr	ud_time		;Update remaining time.
		lda	TIMELEFT	;Check LSB remaining time.
		bne	planiex		;Continue if OK.
		lda	TIMLEFT2	;Check MSB remaining time.
		bne	planiex		;Continue if OK.

		lda	#0		;Do not blow up robot.
		jsr	kilrobot	;Start robot death animation.

planiex:	jsr	aniexit		;Animate exit square (if visible).

plinput:	lda	PLAYERUP	;Check player number.
		beq	plply1		;Go if player #1.
		jsr	readjoy2	;Read joystick #2.
		lda	JOY2_CHG
		sta	TMP_CHG		;Store change flag.
		lda	JOY2_VAL
		sta	TMP_VAL		;Store position flag.
		jmp	plchkj
plply1:		jsr	readjoy1	;Read joystick #1.
		lda	JOY1_CHG
		sta	TMP_CHG		;Store change flag.
		lda	JOY1_VAL
		sta	TMP_VAL		;Store position flag.
plchkj:
		lda	DEMOMODE	;Check if demo mode.
		cmp	#$a7
		bne	plchkj2x	;Go if not.
		lda	TMP_VAL
		bne	plchkj3		;Go if key pressed.
		jsr	readjoy2	;Read joystick #2.
		lda	JOY2_VAL
		bne	plchkj3		;Go if key pressed.
		jsr	readdemo	;Read next byte of demo data.
		bcc	plchkj2		;Continue.
plchkj3:	jmp	pldemodn	;Go if demo mode complete.

plchkj2x:

.ifdef RECDEMO	;IFDEF(`RECDEMO',`
	;TEMPORARY demo recording code.
	lda	PAUSED		;Check paused flag.
	bne	plchkjxx	;Abort if game paused.
;	lda	DEMOPTR2
;	cmp	#(demobuf+1800) >> 8
;	bcs	plchkjxx	;Abort if buffer full.
;	lda	DEMOPTR
;	cmp	#(demobuf+1800) & 255
;	bcs	plchkjxx	;Abort if buffer full.

	lda	TMP_VAL
	and	#J_START
	bne	plchkjxx	;Abort if START button down.

	lda	TMP_VAL
	cmp	DEMOLAST	;Compare to last byte.
	bne	plcjx2		;Go if different.
	inc	DEMOCNT		;Increment count.
	beq	plcjx8		;Go if 256.
	jmp	plchkjxx	;Continue.
plcjx8:	dec	DEMOCNT
	jmp	plcjx3
plcjx2:	lda	DEMOLAST
	cmp	#254
	bne	plcjx3
	lda	TMP_VAL
	sta	DEMOLAST
	jmp	plchkjxx

plcjx3:	ldy	#0
	lda	DEMOCNT
	beq	plcjx4
	lda	DEMOLAST
	ora	#J_START
	sta	(DEMOPTR),y
	inc	DEMOPTR
	bne	plcjx6
	inc	DEMOPTR2
plcjx6:	lda	DEMOCNT
	jmp	plcjx7
plcjx4:	lda	DEMOLAST
plcjx7:	sta	(DEMOPTR),y
	inc	DEMOPTR
	bne	plcjx5
	inc	DEMOPTR2
plcjx5:	lda	TMP_VAL
	sta	DEMOLAST
	lda	#0
	sta	DEMOCNT
plchkjxx:
.endif	;',)	;ENDIF

plchkj2:	lda	TMP_VAL		;Get position flags.
		and	#J_START | J_SELECT	;Check for START or SELECT.
		cmp	#J_START | J_SELECT	;Check if BOTH pressed.
		bne	plchkp		;Go if not both pressed.

		lda	PAUSED		;Check paused flag.
		beq	plab2
		lda	#0
		sta	PAUSED		;Clear paused flag.
		jsr	plmusic		;Play level music.
plab2:		lda	#$ff		;Blow up the robot.
		jsr	kilrobot	;Start robot death animation.
		jmp	plnopa		;Continue.

plchkp:		lda	TMP_CHG		;Get change flags.
		and	#J_START	;Check if START key changed.
		beq	plchkp2		;Go if didn't change.
		lda	TMP_VAL		;Get position flags.
		and	#J_START	;Check START key.
		beq	plchkp2		;Go if not down.

.ifdef RECDEMO	;IFDEF(`RECDEMO',`
	;TEMPORARY!
	lda	#255
	ldy	#0
	sta	(DEMOPTR),y
.endif;	',)	;ENDIF

		lda	PAUSED		;Get paused flag.
		eor	#$ff		;Toggle it.
		sta	PAUSED		;Store it.
		beq	plunpa

		jsr	pamusic		;Play paused music.
		jmp	plchkp2		;Continue.

plunpa:		lda	ROBOT_A		;Check if robot dying.
		beq	plunpa1		;Continue if not.
		jsr	plmusic		;Play normal music.
		jmp	plchkp2		;Continue.

plunpa1:	lda	FR_FLAG		;Check freeze-robot flag.
		beq	plunpa2		;Continue if zero.
		jsr	frmusic		;Play freeze robot music.
		jmp	plchkp2		;Continue.

plunpa2:	jsr	chksuper	;Check for super mode.
		bcs	plunpa3		;Go if so.
		jsr	plmusic		;Play normal music.
		jmp	plchkp2		;Continue.

plunpa3:	jsr	spmusic		;Play super mode music.

plchkp2:	lda	PAUSED		;Get paused flag.
		beq	plnopa		;Go if not paused.
		jmp	plloop		;Loop if paused.

plnopa:
		;Rotate sprites.
		lda	SPR_OFS
		clc
		adc	#$22		;Rotate sprites.
		sta	SPR_OFS		;Set new sprite rotation offset.

		;Put physical sprite #1 off the screen.
		lda	#$f8
		sta	SPR_DATA+4	;Put sprite off the screen.

		;Put logical sprite #1 off the screen.
		lda	#1
		clc
		adc	SPR_OFS		;Add sprite rotation offset.
		asl	a
		asl	a
		bne	plspok		;Continue if not 0.
		lda	SPR_OFS		;Switch with sprite 0.
		asl	a
		asl	a
plspok:		tay			;Y = sprite table offset.
		lda	#$f8
		sta	SPR_DATA,y	;Put sprite off the screen.

		;Put logical sprite #S_UNUSED off the screen.
		lda	#S_UNUSED
		clc
		adc	SPR_OFS		;Add sprite rotation offset.
		asl	a
		asl	a
		bne	plspok2		;Continue if not 0.
		lda	SPR_OFS		;Switch with sprite 0.
		asl	a
		asl	a
plspok2:	tay			;Y = sprite table offset.
		lda	#$f8
		sta	SPR_DATA,y	;Put sprite off the screen.

		jsr	tentimer	;Process 1/10th second timers.

		lda	ROBOT_A		;Check death animation flag.
		beq	plfroz		;Continue if not dying.

		jsr	robdying	;Do death animation.
		lda	DIED
		beq	plcont4		;Continue if not dead yet.

.ifdef RECDEMO;IFDEF(`RECDEMO',`
	;TEMPORARY!
	lda	DEMOMODE
	cmp	#167
	beq	pldemodn
	lda	#255
	ldy	#0
	sta	(DEMOPTR),y
.endif;	',)	;ENDIF

pldemodn:	lda	#-1
		jsr	silence		;Silence all slots.
		lda	#0
		sta	MU_SLOW		;Clear slow-music flag.
		lda	#0
		sta	REG4015		;Disable all voices.

		sec
		rts			;Return with carry set.

plfroz:		lda	FR_FLAG		;Check robot frozen flag.
		bne	plcont4		;Skip ahead if frozen.

plcont:		jsr	movrobot	;Check for robot movement.

plcont2:	lda	EXITED
		beq	plcont3		;Go if have not exited level yet.

		lda	#-1
		jsr	silence		;Silence all slots.
		lda	#0
		sta	MU_SLOW		;Clear slow-music flag.

		lda	#NM_STAT|NM_HORZ	;Clear NM_PLAY bit.
		sta	NMI_MODE	;Set new NMI mode.

		jsr	esmusic		;Play robot hit exit square music.
		lda	#20
		jsr	delay		;Wait 2 seconds (for music).
		jsr	addbonus	;Add bonus for remaining time.
		lda	#5
		jsr	delay		;Wait 1/2 second.
		jsr	addbombs	;Add bonus for remaining bombs.
		lda	#10
		jsr	delay		;Wait 1 second.

		ldx	PLAYERUP
		lda	LEVEL_P1,x	;Get current level.
		cmp	#LAST_LEV*2
		bne	plnotend	;Go if not end of game.
		jsr	addrobts	;Add bonus for remaining robots.
		lda	#20
		jsr	delay		;Wait 2 seconds.
plnotend:
		lda	#0
		sta	REG4015		;Disable all voices.

		clc
		rts			;Completed level.

plcont3:	jsr	checkab		;Check for A & B buttons.

plcont4:	jsr	putrobot	;Display the robot.

		jsr	ebupdate	;Update active energy balls.
		jsr	bmupdate	;Update active bombs.

		jsr	movmons		;Process monster sprites.
		jsr	dispmons	;Display monster sprites.

		jsr	procani		;Process animation lists.

		jsr	scanlev		;Scan level for rocks needing moving.
		jsr	movrocks	;Process moving rocks.
		jsr	dispobjs	;Display moving rocks.

		jmp	plloop		;Loop.


;-----------------------------------------------------------------------------
; Initialize title screen music.
;
ttlmusic:
		lda	#0
		jsr	silence		;Silence slot #0.
		lda	#1
		jsr	silence		;Silence slot #1.
		ldy	#ttl_mel1 >> 8
		ldx	#ttl_mel1 & $ff
		lda	#0
		jsr	play		;Play on slot #0.
		ldy	#ttl_mel2 >> 8
		ldx	#ttl_mel2 & $ff
		lda	#1
		jsr	play		;Play on slot #1.
		rts


;-----------------------------------------------------------------------------
; Initialize won-game music.
;
wgmusic:
		lda	#0
		jsr	silence		;Silence slot #0.
		lda	#1
		jsr	silence		;Silence slot #1.
		ldy	#win_mel1 >> 8
		ldx	#win_mel1 & $ff
		lda	#0
		jsr	play		;Play on slot #0.
		ldy	#win_mel2 >> 8
		ldx	#win_mel2 & $ff
		lda	#1
		jsr	play		;Play on slot #1.
		rts


;-----------------------------------------------------------------------------
; Initialize game-playing music.
;
plmusic:
		lda	#0
		jsr	silence		;Silence slot #0.
		lda	#1
		jsr	silence		;Silence slot #1.

		lda	TIME_LOW	;Get time running out flag.
		eor	#$ff		;Toggle it.
		sta	MU_SLOW		;Set slow-music flag.

		ldy	#bass1 >> 8
		ldx	#bass1 & $ff
		lda	#0
		jsr	play		;Play on slot #0.
		ldy	#melody1 >> 8
		ldx	#melody1 & $ff
		lda	#1
		jsr	play		;Play on slot #1.
		rts


;-----------------------------------------------------------------------------
; Initialize game-paused music.
;
pamusic:
		lda	#0
		jsr	silence		;Silence slot #0.
		lda	#1
		jsr	silence		;Silence slot #1.

		lda	TIME_LOW	;Get time running out flag.
		eor	#$ff		;Toggle it.
		sta	MU_SLOW		;Set slow-music flag.

		ldy	#bass2 >> 8
		ldx	#bass2 & $ff
		lda	#0
		jsr	play		;Play on slot #0.
		ldy	#melody2 >> 8
		ldx	#melody2 & $ff
		lda	#1
		jsr	play		;Play on slot #1.
		rts


;-----------------------------------------------------------------------------
; Play robot death music.
;
rdmusic:
		lda	#0
		jsr	silence		;Silence slot #0.
		lda	#1
		jsr	silence		;Silence slot #1.

		lda	#0
		sta	MU_SLOW		;Clear slow-music flag.

		ldy	#rd_bass >> 8
		ldx	#rd_bass & $ff
		lda	#0
		jsr	play		;Play on slot #0.
		ldy	#rd_mel >> 8
		ldx	#rd_mel & $ff
		lda	#1
		jsr	play		;Play on slot #1.
		rts


;-----------------------------------------------------------------------------
; Play robot made it onto exit square music.
;
esmusic:
		lda	#0
		jsr	silence		;Silence slot #0.
		lda	#1
		jsr	silence		;Silence slot #1.

		lda	#0
		sta	MU_SLOW		;Clear slow-music flag.

		ldy	#es_bass >> 8
		ldx	#es_bass & $ff
		lda	#0
		jsr	play		;Play on slot #0.
		ldy	#es_mel >> 8
		ldx	#es_mel & $ff
		lda	#1
		jsr	play		;Play on slot #1.
		rts


;-----------------------------------------------------------------------------
; Initialize freeze-robot music.
;
frmusic:
		lda	#0
		jsr	silence		;Silence slot #0.
		lda	#1
		jsr	silence		;Silence slot #1.

		lda	#$ff
		sta	MU_SLOW		;Set slow-music flag.

		ldy	#frz_bass >> 8
		ldx	#frz_bass & $ff
		lda	#0
		jsr	play		;Play on slot #0.
		ldy	#frz_mel >> 8
		ldx	#frz_mel & $ff
		lda	#1
		jsr	play		;Play on slot #1.
		rts


;-----------------------------------------------------------------------------
; Initialize super-power music.
;
spmusic:
		lda	#0
		jsr	silence		;Silence slot #0.
		lda	#1
		jsr	silence		;Silence slot #1.

		lda	#0
		sta	MU_SLOW		;Clear slow-music flag.

		ldy	#bass2 >> 8
		ldx	#bass2 & $ff
		lda	#0
		jsr	play		;Play on slot #0.
		ldy	#melody3 >> 8
		ldx	#melody3 & $ff
		lda	#1
		jsr	play		;Play on slot #1.

		lda	#$ff
		sta	SUPERM		;Set super mode.
		rts


;-----------------------------------------------------------------------------
; Sound effect calls:
;
sf_expl:
		pha
		txa
		pha
		tya
		pha
		ldy	#explode >> 8
		ldx	#explode & $ff
		lda	#SREG3
		jsr	sound		;Play using register set #3.
		pla
		tay
		pla
		tax
		pla
		rts

sf_dest:	pha
		txa
		pha
		tya
		pha
		ldy	#destroy >> 8
		ldx	#destroy & $ff
		lda	#SREG3
		jsr	sound		;Play using register set #3.
		pla
		tay
		pla
		tax
		pla
		rts

sf_kill:	pha
		txa
		pha
		tya
		pha
		ldy	#kill >> 8
		ldx	#kill & $ff
		lda	#SREG3
		jsr	sound		;Play using register set #3.
		pla
		tay
		pla
		tax
		pla
		rts

sf_rico:	pha
		txa
		pha
		tya
		pha
		ldy	#ricochet >> 8
		ldx	#ricochet & $ff
		lda	#SREG3
		jsr	sound		;Play using register set #3.
		pla
		tay
		pla
		tax
		pla
		rts

sf_shoot:	pha
		txa
		pha
		tya
		pha
		ldy	#shoot >> 8
		ldx	#shoot & $ff
		lda	#SREG2
		jsr	sound		;Play using register set #2.
		pla
		tay
		pla
		tax
		pla
		rts

sf_pcrys:	pha
		txa
		pha
		tya
		pha
		ldy	#pcrys >> 8
		ldx	#pcrys & $ff
		lda	#SREG2
		jsr	sound		;Play using register set #2.
		pla
		tay
		pla
		tax
		pla
		rts

sf_ppriz:	pha
		txa
		pha
		tya
		pha
		ldy	#ppriz >> 8
		ldx	#ppriz & $ff
		lda	#SREG2
		jsr	sound		;Play using register set #2.
		pla
		tay
		pla
		tax
		pla
		rts

sf_smash:	pha
		txa
		pha
		tya
		pha
		ldy	#smash >> 8
		ldx	#smash & $ff
		lda	#SREG3
		jsr	sound		;Play using register set #3.
		pla
		tay
		pla
		tax
		pla
		rts

sf_dropb:	pha
		txa
		pha
		tya
		pha
		ldy	#drop >> 8
		ldx	#drop & $ff
		lda	#SREG2
		jsr	sound		;Play using register set #2.
		pla
		tay
		pla
		tax
		pla
		rts

sf_select:	pha
		txa
		pha
		tya
		pha
		ldy	#select >> 8
		ldx	#select & $ff
		lda	#SREG2
		jsr	sound		;Play using register set #2.
		pla
		tay
		pla
		tax
		pla
		rts

sf_tbon:	pha
		txa
		pha
		tya
		pha
		ldy	#tbonus >> 8
		ldx	#tbonus & $ff
		lda	#SREG0
		jsr	sound		;Play using register set #0.
		pla
		tay
		pla
		tax
		pla
		rts

sf_bbon:	pha
		txa
		pha
		tya
		pha
		ldy	#bbonus >> 8
		ldx	#bbonus & $ff
		lda	#SREG0
		jsr	sound		;Play using register set #0.
		pla
		tay
		pla
		tax
		pla
		rts


;-----------------------------------------------------------------------------
; Check if in "super mode".
;
; Returns: carry set if super mode, otherwise clear.
;
chksuper:
		lda	LP_FLAG		;Check liquid-proof flag.
		cmp	#22
		bcs	superdn		;Continue if super mode.
		lda	CP_FLAG		;Check creature-proof flag.
		cmp	#22
		bcs	superdn		;Continue if super mode.
		lda	EP_FLAG		;Check explosion-proof flag.
		cmp	#22
		bcs	superdn		;Continue if super mode.
		lda	RP_FLAG		;Check radioactive-proof flag.
		cmp	#22
		bcs	superdn		;Continue if super mode.

		clc
		rts

superdn:	sec
		rts


;-----------------------------------------------------------------------------
; Process 1/10th second countdown timers.
;
tentimer:
		dec	TENTHSEC	;Decrement 1/10 second counter.
		bne	ttdone		;Continue if not zero.
		lda	#6
		sta	TENTHSEC	;Reset 1/10 second counter.

		;1/10 of a second has passed, check all countdown timers.
		lda	LP_FLAG		;Check liquid-proof flag.
		beq	ttck2		;Continue if zero.
		dec	LP_FLAG		;Decrement count.
ttck2:		lda	CP_FLAG		;Check creature-proof flag.
		beq	ttck3		;Continue if zero.
		dec	CP_FLAG		;Decrement count.
ttck3:		lda	FT_FLAG		;Check freeze-timer flag.
		beq	ttck4		;Continue if zero.
		dec	FT_FLAG		;Decrement count.
ttck4:		lda	EP_FLAG		;Check explosion-proof flag.
		beq	ttck5		;Continue if zero.
		dec	EP_FLAG		;Decrement count.
ttck5:		lda	RP_FLAG		;Check radioactive-proof flag.
		beq	ttck6		;Continue if zero.
		dec	RP_FLAG		;Decrement count.
ttck6:		lda	FR_FLAG		;Check freeze-robot flag.
		beq	ttck8		;Continue if zero.
		dec	FR_FLAG		;Decrement count.
		bne	ttck8		;Continue if not zero.
		ldx	FROBOT_X	;Get X,Y position.
		ldy	FROBOT_Y
		jsr	getbgblk	;Read object at location.
		jsr	qblock		;Update block (remove FROBOT object).

		lda	ROBOT_A		;Check if robot dying.
		bne	ttck9		;Go if so.
		jsr	chksuper	;Check for super mode.
		bcs	ttck7		;Go if so.
		jsr	plmusic		;Play normal music.
		jmp	ttck8b		;Continue.
ttck7:		jsr	spmusic		;Play super mode music.
		jmp	ttck9		;Continue.

ttck8:		jsr	chksuper	;Check for super mode.
		bcs	ttck9		;Continue if so.
ttck8b:		lda	SUPERM
		beq	ttck9		;Go if super mode wasn't set.

		lda	#0
		sta	SUPERM		;Clear super mode.
		lda	FR_FLAG		;Check freeze-robot flag.
		bne	ttck9		;Continue if non-zero.
		lda	ROBOT_A		;Check if robot dying.
		bne	ttck9		;Go if so.
		jsr	plmusic		;Play normal music.

ttck9:		lda	ROBRADIO	;Check radioactive-robot flag.
		beq	ttdone		;Continue if zero.

		lda	ROBOT_F
		eor	#%00000011	;Toggle between palette 0 & 3.
		sta	ROBOT_F

		dec	ROBRADIO	;Decrement count.
		bne	ttdone		;Go if not zero.
		lda	#$ff		;Blow up the robot.
		jsr	kilrobot	;Destroy robot.
ttdone:		rts


;-----------------------------------------------------------------------------
; Start robot death animation.
;
kilrobot:
		pha			;Save A.

		lda	ROBOT_A		;Check animation pointer.
		bne	krobdn		;Exit if already dying.
		ldy	#RDEATH
		lda	anitab+1,y	;Get new count.
		sta	ROBOT_AC	;Set count.
		sty	ROBOT_A		;Start robot death animation.
		lda	#R_DOWN		;Set object to "down" view.
		sta	ROBOT_N
		lda	#0
		sta	ROBOT_C		;Clear robot movement animation count.
		sta	ROBRADIO	;Clear radioactive flag.
		lda	#0
		sta	ROBOT_F		;Set palette & flags.

		ldx	PLAYERUP	;Get player number.
		dec	LIVES_P1,x	;One less little robot.
		jsr	ud_lives	;Update # of lives.

		pla
		cmp	#0
		beq	kilrnoex	;Go if not self-destruct.

		lda	ROBOT_X+1	;A = MSB X position.
		ldx	ROBOT_X		;X = LSB X position.
		ldy	ROBOT_Y		;Y = Y position.
		jsr	calcxy		;Calculate grid X,Y.
		ldx	T3		;Get X grid position.
		ldy	T4		;Get Y grid position.

		lda	T1
		cmp	#9
		bcc	kilrxok		;Go if T1 < 9.
		inx
kilrxok:	lda	T2
		cmp	#9
		bcc	kilryok		;Go if T2 < 9.
		iny
kilryok:
		lda	#6		;Set explosion counter.
		jsr	addexpl		;Add explosion to bomb list.

kilrnoex:	jsr	rdmusic		;Play robot death music.

krobdn2:	rts

krobdn:		pla
		rts


;-----------------------------------------------------------------------------
; Process robot death animation.
;
; Entry: A = value of ROBOT_A (non-zero).
;
robdying:
		dec	ROBOT_AC	;Decrement countdown.
		bne	rddone		;Continue if not zero.

		clc
		adc	#2		;Point to next anitab entry.
		sta	ROBOT_A		;Save new animation index.
		tay
		lda	anitab+1,y	;Get new count.
		bne	rdcont		;Go if not end of list.

		sta	ROBOT_A		;Reset animation index.
		lda	#1
		sta	DIED		;Set robot died flag.
		jmp	rdcont2		;Go display last object.

rdcont:		sta	ROBOT_AC	;Save new count.
rdcont2:	lda	anitab,y	;Get new object.
		sta	ROBOT_N		;Save object.
		cmp	#EMPTY
		bne	rddone		;Go if not EMPTY object.

		lda	#$f8
		sta	ROBOT_Y		;Set sprite off screen.

rddone:		rts


;-----------------------------------------------------------------------------
; Check for A and B buttons (energy balls and bombs).
;
checkab:
		lda	TMP_CHG		;Get change flags.
		and	#J_A		;Check if A button changed.
		beq	checkb		;Go if not.
		lda	TMP_VAL		;Get position flags.
		and	#J_A		;Check A button state.
		beq	checkb		;Go if not pressed.

		lda	CUR_EB		;Get # of energy balls active.
		cmp	NUM_EB		;Compare with # allowed.
		bcs	checkb		;Go if can't shoot one.
		jsr	shooteb		;Shoot an energy ball.
		rts

checkb:		lda	TMP_CHG		;Get change flags.
		and	#J_B		;Check if B button changed.
		beq	checkdn		;Go if not.
		lda	TMP_VAL		;Get position flags.
		and	#J_B		;Check B button state.
		beq	checkdn		;Go if not pressed.

		lda	NUM_BOMB	;Get # of bombs.
		beq	checkdn		;Go if don't have any bombs.
		jsr	dropbomb	;Drop a bomb.
checkdn:	rts


;-----------------------------------------------------------------------------
; Check joystick and move robot accordingly.
;
movrobot:
		lda	#0
		sta	MV_FLAG		;Clear moved left/right flag.

		lda	TMP_VAL
		and	#%00001111
		bne	movrcnt

		lda	#0
		sta	MRR_CNT		;Reset hit counter.

movrcnt:	cmp	#J_LEFT
		beq	mvonlyl		;Go if only LEFT pressed.

		lda	#0
		sta	PSHL_FLG	;Clear push-left flag.
		jmp	mvonlylc	;Continue.

mvonlyl:	inc	PSHL_CNT	;Increment push-left counter.
		bne	mvonlylc	;Skip if not zero.
		lda	#1
		sta	PSHL_CNT	;Restart push-left counter.
mvonlylc:
		lda	TMP_VAL
		and	#%00001111
		cmp	#J_RIGHT
		beq	mvonlyr		;Go if only RIGHT pressed.

		lda	#0
		sta	PSHR_FLG	;Clear push-right flag.
		jmp	mvonlyrc	;Continue.

mvonlyr:	inc	PSHR_CNT	;Increment push-right counter.
		bne	mvonlyrc	;Skip if not zero.
		lda	#1
		sta	PSHR_CNT	;Restart push-right counter.
mvonlyrc:

mvchkl:		lda	TMP_VAL		;Get position flags.
		and	#J_LEFT		;Check LEFT key.
		beq	mvchkr		;Go if not down.
		jsr	mvleft		;Move robot left.
		jmp	mvchku		;Continue.

mvchkr:		lda	TMP_VAL		;Get position flags.
		and	#J_RIGHT	;Check RIGHT key.
		beq	mvchku		;Go if not down.
		jsr	mvright		;Move robot right.

mvchku:		lda	TMP_VAL		;Get position flags.
		and	#J_UP		;Check UP key.
		beq	mvchkd		;Go if not down.
		jsr	mvup		;Move robot up.
		jmp	mvdone		;Continue.

mvchkd:		lda	TMP_VAL		;Get position flags.
		and	#J_DOWN		;Check DOWN key.
		beq	mvdone		;Go if not down.
		jsr	mvdown		;Move robot down.

mvdone:		lda	ROBOT_X+1	;A = MSB X position.
		ldx	ROBOT_X		;X = LSB X position.
		ldy	ROBOT_Y		;Y = Y pos.
		jsr	calcxy		;Calculate grid X,Y.
		jsr	pickup		;Check if object to be picked up.

mvdone2:	rts


;-----------------------------------------------------------------------------
; Animate exit square if visible.
;
aniexit:
		lda	EXIT_ON		;Check exit on flag.
		beq	aedone		;Continue if not.
		dec	EXIT_ANC	;Decrement animation count.
		bne	aedone		;Go if not zero.

		lda	#2
		sta	EXIT_ANC	;Reset animation counter.
		ldx	EXIT_X		;Get exit square coordinates.
		ldy	EXIT_Y
		jsr	getbgblk	;Set T6:T5 to low RAM address.
		cmp	#EXIT1		;Check object number.
		bne	aeexit2		;Go if not EXIT1.
		lda	#EXIT2
		jsr	qblock		;Update background block.
		jmp	aedone
aeexit2:	cmp	#EXIT2
		bne	aedone
		lda	#EXIT1
		jsr	qblock		;Update background block.
aedone:		rts


;-----------------------------------------------------------------------------
; Shoot an energy ball.
;
shooteb:
		lda	EB_DELAY	;Get inter-shot delay.
		beq	sebcont		;Continue if delay is zero.
		rts

sebcont:	ldx	#0
sebsrch:	lda	EB_LIST,x	;Get character number byte.
		beq	sebfnd		;Go if not used.
		inx
		cpx	#MAX_EB
		bcc	sebsrch		;Loop until empty one found.
		jmp	sebdone		;Go if no empty slot found (ERROR).

sebfnd:		lda	#EBALL1
		sta	EB_LIST,x	;Set character.

		lda	ROBOT_N		;Get robot object number.
		cmp	#R_DOWN		;Check if facing down.
		bcc	sebchk2		;Go if not.

		lda	ROBOT_X		;Get robot LSB X position.
		clc
		adc	#4
		sta	a:EB_LIST1,x	;Set LSB X position.
		lda	ROBOT_X+1	;Get robot MSB X position.
		adc	#0
		sta	a:EB_LIST2,x	;Set MSB X position.
		lda	ROBOT_Y		;Get robot Y position.
		clc
		adc	#10
		sta	a:EB_LIST3,x	;Set Y position.
		lda	#DOWN		;Set to move DOWN.
		jmp	sebdir		;Continue.

sebchk2:	cmp	#R_UP		;Check if facing up.
		bcc	sebchk3		;Go if not.

		lda	ROBOT_X		;Get robot LSB X position.
		clc
		adc	#4
		sta	a:EB_LIST1,x	;Set LSB X position.
		lda	ROBOT_X+1	;Get robot MSB X position.
		adc	#0
		sta	a:EB_LIST2,x	;Set MSB X position.
		lda	ROBOT_Y		;Get robot Y position.
		sec
		sbc	#2
		sta	a:EB_LIST3,x	;Set Y position.
		lda	#UP		;Set to move UP.
		jmp	sebdir		;Continue.

sebchk3:	lda	ROBOT_F		;Get robot flags.
		and	#%01000000	;Check left/right flip bit.
		beq	sebright	;Go if facing right.

		lda	ROBOT_X		;Get robot LSB X position.
		sec
		sbc	#2
		sta	a:EB_LIST1,x	;Set LSB X position.
		lda	ROBOT_X+1	;Get robot MSB X position.
		sbc	#0
		sta	a:EB_LIST2,x	;Set MSB X position.
		lda	ROBOT_Y		;Get robot Y position.
		clc
		adc	#4
		sta	a:EB_LIST3,x	;Set Y position.
		lda	#LEFT		;Set to move LEFT.
		jmp	sebdir		;Continue.

sebright:	lda	ROBOT_X		;Get robot LSB X position.
		clc
		adc	#10
		sta	a:EB_LIST1,x	;Set LSB X position.
		lda	ROBOT_X+1	;Get robot MSB X position.
		adc	#0
		sta	a:EB_LIST2,x	;Set MSB X position.
		lda	ROBOT_Y		;Get robot Y position.
		clc
		adc	#4
		sta	a:EB_LIST3,x	;Set Y position.
		lda	#RIGHT		;Set to move RIGHT.

sebdir:		sta	a:EB_LIST4,x	;Set direction.

		lda	RANGE_EB	;Get energy ball range.
		cmp	#32
		bcc	sebrok		;Go if range ok (less than 32).
		lda	#31
sebrok:		asl	a
		asl	a
		asl	a
		clc
		adc	#1		;A = range * 8 + 1.
		sta	a:EB_LIST5,x	;Save range (movement countdown).

		lda	#EB_TIME
		sta	EB_DELAY	;Set inter-shot delay.
		inc	CUR_EB		;Increment # of energy balls active.
		jsr	sf_shoot	;Do shoot sound effect.
sebdone:	rts


;-----------------------------------------------------------------------------
; Update positions of active energy balls & check for collisions.
;
ebupdate:
		lda	EB_DELAY
		beq	ebucont
		dec	EB_DELAY	;Decrement inter-shot delay.

ebucont:	ldx	#0
ebuloop:	lda	EB_LIST,x	;Get character number.
		bne	ebuproc		;Go if active.

ebuhide:	txa			;Get energy ball number in A.
		clc
		adc	#S_EBALL	;Add first sprite # offset.
		adc	SPR_OFS		;Add sprite rotation offset.
		asl	a
		asl	a
		bne	ebuspok		;Continue if not 0.
		lda	SPR_OFS		;Switch with sprite 0.
		asl	a
		asl	a
ebuspok:	tay			;Y = sprite table offset.
		lda	#$f8
		sta	SPR_DATA,y	;Set sprite off the screen.

ebunext:	inx
		cpx	#MAX_EB
		bcc	ebuloop		;Loop.
		rts			;Exit if end of list.

ebuproc:	dec	a:EB_LIST5,x	;Decrement movement countdown.
		bne	ebuani		;Go animate if still active.

ebukill:	lda	#0
		sta	EB_LIST,x	;De-activate energy ball.
		dec	CUR_EB		;Decrement # of energy balls active.
		jmp	ebuhide		;Go hide the sprite.

ebuani:		cmp	#EBALL1		;Check character & toggle it.
		beq	ebuprc2
		lda	#EBALL1
		jmp	ebuprc3
ebuprc2:	lda	#EBALL2
ebuprc3:	sta	EB_LIST,x	;Store new character.

		lda	a:EB_LIST1,x	;Save old position.
		sta	OLD_EB1
		lda	a:EB_LIST2,x
		sta	OLD_EB2
		lda	a:EB_LIST3,x
		sta	OLD_EB3

		lda	a:EB_LIST4,x	;Get direction flag.
		cmp	#DOWN
		bcs	ebuprc4		;Go if DOWN or LEFT.
		cmp	#UP
		bcs	ebuup		;Go if UP.

eburight:	lda	a:EB_LIST1,x	;Get LSB X position.
		cmp	#251-EB_MOVE
		bcc	eburght2	;Continue if range ok.
		lda	a:EB_LIST2,x	;Get MSB X position.
		bne	ebukill		;Kill ball if off right side.
		lda	a:EB_LIST1,x	;Get LSB X position.

eburght2:	clc
		adc	#EB_MOVE	;Add movement value.
		sta	a:EB_LIST1,x	;Save new LSB X position.
		lda	a:EB_LIST2,x	;Get MSB X position.
		adc	#0
		sta	a:EB_LIST2,x	;Save new MSB X position.
		jmp	ebuchkc		;Go set sprite.

ebuup:		lda	a:EB_LIST3,x	;Get Y position.
		cmp	#30+EB_MOVE
		bcc	ebukill		;Kill ball if off top of screen.
		sec
		sbc	#EB_MOVE	;Subtract movement value.
		sta	a:EB_LIST3,x	;Save new Y position.
		jmp	ebuchkc		;Go set sprite.

ebuprc4:	cmp	#LEFT
		bcs	ebuleft		;Go if LEFT.

ebudown:	lda	a:EB_LIST3,x	;Get Y position.
		cmp	#238-EB_MOVE
		bcs	ebukill		;Kill ball if off bottom of screen.
		clc
		adc	#EB_MOVE	;Add movement value.
		sta	a:EB_LIST3,x	;Save new Y position.
		jmp	ebuchkc		;Go set sprite.

ebuleft:	lda	a:EB_LIST1,x	;Get LSB X position.
		cmp	#EB_MOVE
		bcs	ebuleft2	;Continue if range ok.
		lda	a:EB_LIST2,x	;Get MSB X position.
		beq	ebukill2	;Kill ball if off left side.
		lda	a:EB_LIST1,x	;Get LSB X position.

ebuleft2:	sec
		sbc	#EB_MOVE	;Subtract movement value.
		sta	a:EB_LIST1,x	;Save new LSB X position.
		lda	a:EB_LIST2,x	;Get MSB X position.
		sbc	#0
		sta	a:EB_LIST2,x	;Save new MSB X position.

ebuchkc:	txa
		pha			;Save X.
		lda	#0
		sta	EB_KILL		;Clear destroyed flag.
		sta	EB_BNCE		;Clear bounce flag.
		lda	a:EB_LIST1,x	;Get LSB X position.
		sta	T7		;Save it.
		ldy	a:EB_LIST3,x	;Get Y position.
		lda	a:EB_LIST2,x	;Get MSB X position.
		ldx	T7		;Get LSB X position.
		jsr	calcxy		;Calculate grid X,Y.
		jsr	clsn_eb		;Check for collision with object.
		pla
		tax			;Restore X.
		pha
		jsr	clsn_ebs	;Check for collision with sprite.
		pla
		tax			;Restore X.
		lda	EB_KILL
		beq	ebubnce		;Go set energy ball sprite.
ebukill2:	jmp	ebukill		;Go if energy ball destroyed.

ebubnce:	lda	EB_BNCE		;Check bounce flag.
		beq	ebusets		;Continue if not set.

		lda	OLD_EB1		;Restore original position.
		sta	a:EB_LIST1,x
		lda	OLD_EB2
		sta	a:EB_LIST2,x
		lda	OLD_EB3
		sta	a:EB_LIST3,x

		lda	a:EB_LIST4,x	;Get direction.
		cmp	#DOWN
		bcs	ebub_c2		;Go if DOWN or LEFT.
		cmp	#UP
		bcs	ebub_u		;Go if UP.
		lda	#LEFT		;Change RIGHT to LEFT.
		jmp	ebub_c3		;Continue.
ebub_u:		lda	#DOWN		;Change UP to DOWN.
		jmp	ebub_c3		;Continue.
ebub_c2:	cmp	#LEFT
		bcs	ebub_l		;Go if LEFT.
		lda	#UP		;Change DOWN to UP.
		jmp	ebub_c3		;Continue.
ebub_l:		lda	#RIGHT		;Change LEFT to RIGHT.
ebub_c3:	sta	a:EB_LIST4,x	;Save new direction.
		jsr	sf_rico		;Do ricochet sound effect.

ebusets:	txa			;Get energy ball number in A.
		clc
		adc	#S_EBALL	;Add first sprite # offset.
		adc	SPR_OFS		;Add sprite rotation offset.
		asl	a
		asl	a
		bne	ebuspok2	;Continue if not 0.
		lda	SPR_OFS		;Switch with sprite 0.
		asl	a
		asl	a
ebuspok2:	tay			;Y = sprite table offset.

		lda	EB_LIST,x	;Get character number.
		sta	SPR_DATA+1,y	;Set character number of sprite.

		lda	#%00000011
		sta	SPR_DATA+2,y	;Set flag byte of sprite.

		lda	REG_2000	;Get register 2000 mirror.
		and	#%00000001	;Mask off page 2 bit.
		sta	T1
		lda	a:EB_LIST1,x	;Get LSB X position.
		sec
		sbc	H_SCROLL	;Adjust for horizontal scroll.
		pha			;Save result.
		lda	a:EB_LIST2,x	;Get MSB X position.
		sbc	T1		;Subtract MSB of horizontal scroll.
		bcc	ebuhide2	;Go if off left side of screen.
		bne	ebuhide2	;Go if off right side of screen.
		pla			;Retrieve value.
		sta	SPR_DATA+3,y	;Set X position of sprite.

		lda	a:EB_LIST3,x	;Get Y position.
		sec
		sbc	#1		;Adjust for hardware bug.
		sta	SPR_DATA,y	;Set Y position of sprite.
		jmp	ebunext		;Continue processing list.

ebuhide2:	pla
		lda	#$f8
		sta	SPR_DATA,y	;Set sprite off the screen.
		jmp	ebunext		;Continue processing list.


;-----------------------------------------------------------------------------
; Check for energy ball collision with object.
;
; Entry: T1 = X MOD 16, T2 = Y MOD 16, T3 = X DIV 16, T4 = Y DIV 16
; Changes: A, X, Y
;
clsn_eb:
		ldx	T3		;Get X grid position in X.
		ldy	T4		;Get Y grid position in Y.

       		lda	T2		;Get Y fraction.
		cmp	#16-EB_SIZE
		bcc	cebcnt		;Go if Y only.
		bne	cebcnt2		;Go if Y+1 only.
		jsr	cebchkx		;Check X.
cebcnt2:	iny
cebcnt:		jsr	cebchkx		;Check X.
		rts

cebchkx:	lda	T1		;Get X fraction.
		cmp	#16-EB_SIZE
		bcc	cebcnt3		;Go if X only.
		bne	cebcnt4		;Go if X+1 only.
		jsr	cebobj		;Check object.
cebcnt4:	inx
		jsr	cebobj		;Check object.
		dex
		rts

cebcnt3:	jsr	cebobj		;Check object.
cebexit:	rts

cebobj:		jsr	getbgblk	;Get object.
		cmp	#NUM_OBJ
		bcs	cebexit		;Go if past jump table limit.
		stx	T7		;Save X.
		pha			;Save A.
		asl	a		;Make table index.
		tax
		lda	eb_jtab,x	;Get LSB of function address.
		sta	JMP_VECT	;Store it.
		lda	eb_jtab+1,x	;Get MSB of function address.
		sta	JMP_VECT+1	;Store it.
		pla			;Restore A.
		ldx	T7		;Restore X.
		jmp	(JMP_VECT)	;Execute specific function.


;-----------------------------------------------------------------------------
; Energy ball object collision functions.
;
; Entry: X = X grid position, Y = Y grid position.
;        A = object number of block, T6:T5 = address of object in low RAM.
;        Must NOT change X, Y, or T1-T6!
;
ebh_bomb:	jsr	rembomb		;Remove bomb from bomb list.

ebh_expl:	lda	#6		;Set explosion counter.
		jsr	addexpl		;Add explosion to bomb list.
		jmp	ebh_noef

ebh_priz:	jsr	remhobj		;Remove from hidden object list.

ebh_dest:	lda	#AN_DEST	;Do "destruction" animation.
		jsr	chkdanim	;Check for special animation.
		jsr	sf_dest		;Do destroy sound effect.
		jmp	ebh_ani

ebh_bnce:	lda	#$ff
		sta	EB_BNCE		;Set bounce flag.
		jmp	ebh_pass

ebh_sr1:	lda	#SROCK2		;Change SROCK to SROCK2.
		jmp	ebh_set

ebh_sr2:	lda	#SROCK3		;Change SROCK2 to SROCK3.
		jmp	ebh_set

ebh_hdrt:	lda	#HDIRT2		;Change HDIRT to HDIRT2.
		jmp	ebh_set

ebh_mud:	lda	#HMUD		;Change MUD to HMUD.

ebh_set:	jsr	qblock
		jmp	ebh_noef	;Go do flash.
		sty	T7		;Save Y.
		ldy	#0
		sta	(T5),y		;Store new object in RAM array.
		ldy	T7		;Restore Y.

ebh_ani:	jsr	startani

ebh_crys:
ebh_noef:	lda	#$ff
		sta	EB_KILL		;Kill energy ball.
ebh_pass:	rts


;-----------------------------------------------------------------------------
; Check for energy ball collision with robot or sprite.
;
; Entry: X = index into EB_LIST of energy ball.
; Changes: A, X, T7, TY1, TY2, TXL1, TXH1, TXL2, TXH2
;
clsn_ebs:
		lda	a:EB_LIST3,x	;Get Y position.
		sec
		sbc	#10
		sta	TY1		;TY1 = Y - 10.
		clc
		adc	#10+3
		sta	TY2		;TY2 = Y + 3.

		lda	a:EB_LIST1,x	;Get LSB X position.
		sec
		sbc	#10
		sta	TXL1
		lda	a:EB_LIST2,x	;Get MSB X position.
		sbc	#0
		sta	TXH1		;TXH1:TXL1 = X - 10.

		lda	a:EB_LIST1,x	;Get LSB X position.
		clc
		adc	#3
		sta	TXL2
		lda	a:EB_LIST2,x	;Get MSB X position.
		adc	#0
		sta	TXH2		;TXH2:TXL2 = X + 3.

		;Check for energy ball collision with robot sprite.
		lda	ROBOT_Y		;Get Y position.
		cmp	TY1
		bcc	cesobjs		;Continue if no hit.
		cmp	TY2
		bcs	cesobjs		;Continue if no hit.

		lda	ROBOT_X+1	;Get MSB X position.
		cmp	TXH1
		bcc	cesobjs		;Continue if no hit.
		bne	cesx2r		;Go check upper X range.
		lda	ROBOT_X		;Get LSB X position.
		cmp	TXL1		;Get X.
		bcc	cesobjs		;Continue if no hit.

cesx2r:		lda	ROBOT_X+1	;Get MSB X position.
		cmp	TXH2
		bcc	ceshitr		;Go if hit.
		bne	cesobjs		;Continue if no hit.
		lda	ROBOT_X		;Get LSB X position.
		cmp	TXL2		;Get X.
		bcs	cesobjs		;Go if not hit.

ceshitr:	lda	#0		;Do not blow up robot.
		jsr	kilrobot	;Destroy robot.

cesobjs:	ldx	#0
cesloop:	lda	MV_LIST,x	;Get object number.
		bne	ceschk		;Go if active.
cesnext:	inx
		cpx	LMAX_MV
		bcc	cesloop		;Loop.
		jmp	cesmons		;Go check for collision with monster.

ceschk:		cmp	#CRYSTAL
		bcc	cesnext		;No collision if < CRYSTAL.

		lda	MV_LIST3,x	;Get Y position.
		cmp	TY1
		bcc	cesnext		;Continue if no hit.
		cmp	TY2
		bcs	cesnext		;Continue if no hit.

		lda	MV_LIST2,x	;Get MSB X position.
		cmp	TXH1
		bcc	cesnext		;Continue if no hit.
		bne	cesx2		;Go check upper X range.
		lda	MV_LIST1,x	;Get LSB X position.
		cmp	TXL1		;Get X.
		bcc	cesnext		;Continue if no hit.

cesx2:		lda	MV_LIST2,x	;Get MSB X position.
		cmp	TXH2
		bcc	ceshit		;Go if hit.
		bne	cesnext		;Continue if no hit.
		lda	MV_LIST1,x	;Get LSB X position.
		cmp	TXL2		;Get X.
		bcs	cesnext		;Go if not hit.

ceshit:		lda	MV_LIST,x	;Get object number.
		cmp	#RROCK
		bcs	cesnext		;Go if past jump table limit.
		sec
		sbc	#CRYSTAL	;Adjust it down.
		stx	T7		;Save X.
		pha			;Save A.
		asl	a		;Make table index.
		tax
		lda	ebo_jtab,x	;Get LSB of function address.
		sta	JMP_VECT	;Store it.
		lda	ebo_jtab+1,x	;Get MSB of function address.
		sta	JMP_VECT+1	;Store it.
		pla			;Restore A.
		ldx	T7		;Restore X.
		jmp	(JMP_VECT)	;Execute specific function.

cesmons:	ldx	#0
cesloop2:	lda	MM_LIST,x	;Get monster number.
		bne	ceschk2		;Go if active.
cesnext2:	inx
		cpx	NUM_MON
		bcc	cesloop2	;Loop.
		rts

ceschk2:	cmp	#SR_MON
		bcc	cesnext2	;No collision if < SR_MON.

		lda	MM_LIST3,x	;Get Y position.
		cmp	TY1
		bcc	cesnext2	;Continue if no hit.
		cmp	TY2
		bcs	cesnext2	;Continue if no hit.

		lda	MM_LIST2,x	;Get MSB X position.
		cmp	TXH1
		bcc	cesnext2	;Continue if no hit.
		bne	cesx22		;Go check upper X range.
		lda	MM_LIST1,x	;Get LSB X position.
		cmp	TXL1		;Get X.
		bcc	cesnext2	;Continue if no hit.

cesx22:		lda	MM_LIST2,x	;Get MSB X position.
		cmp	TXH2
		bcc	ceshit2		;Go if hit.
		bne	cesnext2	;Continue if no hit.
		lda	MM_LIST1,x	;Get LSB X position.
		cmp	TXL2		;Get X.
		bcs	cesnext2	;Go if not hit.

ceshit2:	lda	MM_LIST,x	;Get monster number.
		cmp	#RR_MON
		bcs	ebm_cmp2	;Go if RR_MON, LAVA, MUD, or GAS.
		cmp	#HR_MON
		bcs	ebm_noef	;Go if HR_MON or IR_MON.
		cmp	#SR_MON
		beq	ebm_sr1		;Go if SR_MON.
		cmp	#SR_MON2
		beq	ebm_sr2		;Go if SR_MON2.
		jmp	ebm_dest	;Go if SR_MON3.

ebm_cmp2:	cmp	#MUD_MON
		bcs	ebm_stun	;Go if MUD_MON or GAS_MON.
		cmp	#LAVA_MON
		bcs	ebm_lava	;Go if LAVA_MON.

ebm_bnce:	lda	#$ff
		sta	EB_BNCE		;Set bounce flag.
		jmp	ebm_pass

ebm_noef:	lda	#$ff
		sta	EB_KILL		;Kill energy ball.
ebm_pass:	rts

ebm_sr1:	lda	#SR_MON2
		sta	MM_LIST,x	;Set new monster number.

		lda	MM_LIST4,x	;Get flags byte.
		ora	#MAD		;Set MAD bit.
		sta	MM_LIST4,x	;Save new value.
		jmp	ebm_set

ebm_sr2:	lda	#SR_MON3
		sta	MM_LIST,x	;Set new monster number.

ebm_set:	lda	#MON_STN2	;1/10th of a second.
		sta	MM_LIST6,x	;Set stunned counter.
		jmp	ebm_noef	;Continue.

ebm_lava:	lda	MM_LIST4,x	;Get flags byte.
		and	#MAD
		bne	ebm_noef	;Go if already mad.
		lda	MM_LIST4,x	;Get flags byte.
		ora	#MAD		;Set MAD bit.
		sta	MM_LIST4,x	;Save new value.

ebm_stun:	lda	#MON_STUN
		sta	MM_LIST6,x	;Set stunned counter.
		jmp	ebm_noef	;Continue.

ebm_dest:	lda	#2
		jsr	destmon		;Destroy the monster.
		jsr	sf_kill		;Do kill sound effect.
		jmp	ebm_noef	;Continue.


;-----------------------------------------------------------------------------
; Energy ball moving object collision functions.
;
; Entry: X = index into MV_LIST of moving object.
;        A = object number of block minus CRYSTAL.
;
ebo_expl:	txa
		pha			;Save X.
		lda	MV_LIST4,x
		pha			;Save direction.
		ldy	MV_LIST3,x
		lda	MV_LIST2,x
		pha
		lda	MV_LIST1,x
		tax
		pla
		jsr	calcxy		;Calculate grid position.
		ldx	T3		;Get X grid position.
		ldy	T4		;Get Y grid position.
		pla			;Get direction.
		cmp	#DOWN
		beq	ebo_exdn	;Go if DOWN.
		bcc	ebo_exrt	;Go if RIGHT.

ebo_exlf:	lda	T1
		cmp	#9
		bcc	ebo_excn	;Go if T1 < 9.
		inx
		jmp	ebo_excn	;Continue.

ebo_exrt:	lda	T1
		cmp	#8
		bcc	ebo_excn	;Go if T1 < 8.
		inx
		jmp	ebo_excn	;Continue.

ebo_exdn:	lda	T2
		cmp	#8
		bcc	ebo_excn	;Go if T2 < 8.
		iny

ebo_excn:	lda	#6		;Set explosion counter.
		jsr	addexpl		;Add explosion to bomb list.
		pla
		tax			;Restore X.

ebo_dest:	lda	#AN_DEST
		sta	MV_LIST4,x	;Set animation list pointer.
		tay
		lda	anitab,y	;Get first character of animation.
		sta	MV_LIST,x	;Set character.
		lda	anitab+1,y	;Get new count.
		sta	MV_LIST5,x	;Set count.
		jsr	sf_dest		;Do destroy sound effect.
		jmp	ebo_noef	;Continue.

ebo_sr1:	lda	#SROCK2		;Change SROCK to SROCK2.
		jmp	ebo_set

ebo_sr2:	lda	#SROCK3		;Change SROCK2 to SROCK3.

ebo_set:	sta	MV_LIST,x	;Set new object number.
		jmp	ebo_noef	;Continue.

ebo_bnce:	lda	#$ff
		sta	EB_BNCE		;Set bounce flag.
		jmp	ebo_pass
ebo_crys:
ebo_noef:	lda	#$ff
		sta	EB_KILL		;Kill energy ball.
ebo_pass:	rts


;-----------------------------------------------------------------------------
; Drop a bomb.
;
dropbomb:
		ldx	#0
dbsrch:		lda	BM_LIST,x	;Get countdown byte.
		beq	dbfnd		;Go if not used.
		inx
		cpx	#MAX_BM
		bcs	dbdone		;Go if no empty slot found (ERROR).
		jmp	dbsrch		;Loop until empty one found.

dbfnd:		txa
		pha			;Save X.
		lda	ROBOT_X+1	;A = MSB X position.
		ldx	ROBOT_X		;X = LSB X position.
		ldy	ROBOT_Y		;Y = Y pos.
		jsr	calcxy		;Calculate grid X,Y.

		ldx	T3		;Get X position.
		lda	T1		;Get X fraction.
		cmp	#8
		bcc	dbcnt3		;Go if X ok.
		bne	dbcnt2		;Go if need to increment X.

		lda	ROBOT_F		;Get robot flags.
		and	#%01000000	;Check left/right flip bit.
		beq	dbcnt3		;Go if facing right.

dbcnt2:		inx

dbcnt3:		ldy	T4		;Get Y position.
		lda	T2		;Get Y fraction.
		cmp	#8
		bcc	dbcnt5		;Go if Y ok.
		bne	dbcnt4		;Go if need to increment Y.

		lda	ROBOT_N		;Get robot object number.
		cmp	#R_DOWN		;Check direction.
		bcs	dbcnt5		;Go if facing down.

dbcnt4:		iny

dbcnt5:		jsr	getbgblk	;Set T6:T5 to low RAM address.
		cmp	#PBOMB1
		bcs	dbcnt6		;Go if space is already occupied.
		jsr	chkbmo		;Check for moving object in the way.
		bcs	dbcnt6		;Go if so.
		lda	#BOMB
		jsr	qblock		;Update background block.
		jsr	killani		;Kill any animations.
		stx	T7		;Save X position.
		pla
		tax			;Restore X index.
		lda	#BOMB_CNT
		sta	BM_LIST,x	;Set countdown.
		lda	T7		;Get X position.
		sta	BM_LIST1,x	;Save X position of bomb.
		tya
		sta	BM_LIST2,x	;Save Y position of bomb.
		dec	NUM_BOMB	;Decrement # of bombs remaining.
		jsr	ud_bombs	;Update # of bombs.
		jsr	sf_dropb	;Do drop bomb sound effect.
dbdone:		rts

dbcnt6:		pla			;Fix stack & return.
		rts


;-----------------------------------------------------------------------------
; Check if background square partly covered by moving object.
;
; Entry: X = X grid position, Y = Y grid position.
; Returns: carry set if collision, clear if no collision.
; Changes: TY1-TY2, TXL1-TXL2, TXH1-TXH2
;
chkbmo:
		tya
		pha			;Save Y.
		asl	a		;Adjust & store it.
		asl	a
		asl	a
		asl	a
		sec
		sbc	#15
		sta	TY1		;TY1 = Y - 15.
		clc
		adc	#16+15
		sta	TY2		;TY2 = Y + 16.

		txa
		pha			;Save X.
		asl	a		;Adjust & store it.
		asl	a
		asl	a
		asl	a
		sta	TXL1
		sta	TXL2
		lda	#0
		rol	a
		sta	TXH1
		sta	TXH2

		lda	TXL1		;Get LSB X position.
		sec
		sbc	#15
		sta	TXL1
		lda	TXH1		;Get MSB X position.
		sbc	#0
		sta	TXH1		;TXH1:TXL1 = X - 15.

		lda	TXL2		;Get LSB X position.
		clc
		adc	#16
		sta	TXL2
		lda	TXH2		;Get MSB X position.
		adc	#0
		sta	TXH2		;TXH2:TXL2 = X + 16.

		ldx	#0
bmoloop:	lda	MV_LIST,x	;Get object number.
		beq	bmonext		;Continue if not active.

		lda	MV_LIST3,x	;Check Y position.
		cmp	TY1
		bcc	bmonext		;Continue if no hit.
		cmp	TY2
		bcs	bmonext		;Continue if no hit.

		lda	MV_LIST2,x	;Check MSB X position.
		cmp	TXH1
		bcc	bmonext		;Continue if no hit.
		bne	bmox2		;Go check upper X range.
		lda	MV_LIST1,x	;Check LSB X position.
		cmp	TXL1		;Get X.
		bcc	bmonext		;Continue if no hit.

bmox2:		lda	MV_LIST2,x	;Check MSB X position.
		cmp	TXH2
		bcc	bmohit		;Go if hit.
		bne	bmonext		;Continue if no hit.
		lda	MV_LIST1,x	;Check LSB X position.
		cmp	TXL2		;Get X.
		bcc	bmohit		;Go if hit.

bmonext:	inx
		cpx	LMAX_MV
		bcc	bmoloop		;Loop.

		pla
		tax			;Restore X.
		pla
		tay			;Restore Y.
		clc			;Signal no collision.
		rts

bmohit:		pla
		tax			;Restore X.
		pla
		tay			;Restore Y.
		sec			;Signal collision.
		rts


;-----------------------------------------------------------------------------
; Update countdown timers of active bombs & check for explosions.
;
bmupdate:
		ldx	#0
bmuloop:	lda	BM_LIST,x	;Get countdown value.
		bne	bmuproc		;Go if active.
bmunext:	inx
		cpx	#MAX_BM
		bcc	bmuloop		;Loop.
		rts			;Exit if end of list.

bmuproc:	dec	BM_LIST,x	;Decrement countdown.
		lda	BM_LIST,x	;Get countdown.
		cmp	#6
		bcs	bmunext		;Continue if too high.
		cmp	#5
		beq	bmuexp
		cmp	#2
		beq	bmuexp1
		cmp	#0
		bne	bmunext		;Continue processing.

bmuexp2:	txa
		pha			;Save X index.
		ldy	BM_LIST2,x	;Get Y position of bomb.
		lda	BM_LIST1,x	;Get X position of bomb.
		tax
		jsr	doexpld2	;Do explosion (stage 3).
		pla
		tax			;Restore X index.
		jmp	bmunext		;Continue processing list.

bmuexp1:	txa
		pha			;Save X index.
		ldy	BM_LIST2,x	;Get Y position of bomb.
		lda	BM_LIST1,x	;Get X position of bomb.
		tax
		jsr	doexpld1	;Do explosion (stage 2).
		pla
		tax			;Restore X index.
		jmp	bmunext		;Continue processing list.

bmuexp:		txa
		pha			;Save X index.
		ldy	BM_LIST2,x	;Get Y position of bomb.
		lda	BM_LIST1,x	;Get X position of bomb.
		tax
		jsr	killani		;Kill any other animations.
		lda	#AN_DEST	;Do "destruction" animation at X,Y.
		jsr	chkdanim	;Check for special animation.
		jsr	startani
		jsr	clsn_exs	;Check for collision with sprites.
		jsr	sf_expl		;Do explosion sound effect.
		pla
		tax			;Restore X index.
		jmp	bmunext		;Continue processing list.


;-----------------------------------------------------------------------------
; Add a new explosion to the bomb list.
;
; Entry: A = countdown value, X = X grid position, Y = Y grid position.
;
addexpl:
		pha			;Save A.
		stx	T7		;Save X.
aerstrt:	ldx	#0
aesrch:		lda	BM_LIST,x	;Get countdown byte.
		beq	aefnd		;Go if not used.
		inx
		cpx	#MAX_BM
		bcc	aesrch		;Loop until empty one found.

		jsr	bmupdate	;Process bomb lists.
		jmp	aerstrt		;Try again.

aefnd:		pla			;Get countdown value.
		sta	BM_LIST,x	;Set countdown.
		lda	T7		;Get X position.
		sta	BM_LIST1,x	;Save X position of bomb.
		tya
		sta	BM_LIST2,x	;Save Y position of bomb.
		ldx	T7		;Restore X.
		rts


;-----------------------------------------------------------------------------
; Remove a prematurely detonated bomb from the bomb list.
;
; Entry: X = X grid position, Y = Y grid position.
;
rembomb:
		stx	T7		;Save X.
		ldx	#0
rbsrch:		lda	BM_LIST,x	;Get countdown byte.
		bne	rbchk		;Go if used.
rbcont:		inx
		cpx	#MAX_BM
		bcs	rbdone		;Go if end of list (bomb not found).
		jmp	rbsrch		;Loop.

rbchk:		lda	T7		;Get X position.
		cmp	BM_LIST1,x	;Compare X position.
		bne	rbcont		;Continue search if not equal.
		tya
		cmp	BM_LIST2,x	;Compare Y position.
		bne	rbcont		;Continue search if not equal.
		lda	#0
		sta	BM_LIST,x	;Kill bomb entry.
rbdone:		ldx	T7		;Restore X.
		rts


;-----------------------------------------------------------------------------
; Do an explosion (type 1).
;
; Entry: X = X position, Y = Y position.
; Changes: A
;
doexpld1:
		dey
		jsr	explohit	;Hit object at X,Y-1.
		iny
		dex
		jsr	explohit	;Hit object at X-1,Y.
		iny
		inx
		jsr	explohit	;Hit object at X,Y+1.
		dey
		inx
		jsr	explohit	;Hit object at X+1,Y.
		dex
		rts


;-----------------------------------------------------------------------------
; Do an explosion (type 2).
;
; Entry: X = X position, Y = Y position.
; Changes: A
;
doexpld2:
		dey
		dex
		jsr	explohit	;Hit object at X-1,Y-1.
		iny
		iny
		jsr	explohit	;Hit object at X-1,Y+1.
		inx
		inx
		jsr	explohit	;Hit object at X+1,Y+1.
		dey
		dey
		jsr	explohit	;Hit object at X+1,Y-1.
		iny
		dex
		rts


;-----------------------------------------------------------------------------
; Execute explosion function through jump table depending upon object number.
;
; Entry: X = X position, Y = Y position.
;
explohit:
		jsr	getbgblk	;Get object.
		cmp	#NUM_OBJ
		bcs	exexit		;Go if past jump table limit.
		stx	T7		;Save X.
		pha			;Save A.
		asl	a		;Make table index.
		tax
		lda	ex_jtab,x	;Get LSB of function address.
		sta	JMP_VECT	;Store it.
		lda	ex_jtab+1,x	;Get MSB of function address.
		sta	JMP_VECT+1	;Store it.
		pla			;Restore A.
		ldx	T7		;Restore X.
		jmp	(JMP_VECT)	;Execute specific function.

exexit:		rts


;-----------------------------------------------------------------------------
; Explosion hit object functions.
;
; Entry: X = X grid position, Y = Y grid position.
;        A = object number of block, T6:T5 = address of object in low RAM.
;        Must NOT change X, Y, or T5-T6!
;
exh_bomb:	jsr	rembomb		;Remove bomb from bomb list.

exh_expl:	lda	#6		;Set explosion counter.
		jsr	addexpl		;Add explosion to bomb list.
		jmp	exh_noef

exh_priz:	jsr	remhobj		;Remove from hidden object list.

exh_dest:	jsr	killani		;Kill any other animations.
		lda	#AN_DEST	;Do "destruction" animation.
		jsr	chkdanim	;Check for special animation.
		jmp	exh_ani

exh_hrck:	lda	#HROCK2		;Change HROCK to HROCK2.
		jmp	exh_set

exh_mrk:	lda	#MRROCK2	;Change MRROCK to MRROCK2.
		jmp	exh_set

exh_mrk2:	lda	#MRROCK3	;Change MRROCK2 to MRROCK3.
		jmp	exh_set

exh_rrk:	lda	#RROCK2		;Change RROCK to RROCK2.
		jmp	exh_set

exh_rrk2:	lda	#RROCK3		;Change RROCK2 to RROCK3.
		jmp	exh_set

exh_hmud:	lda	#CRYSTAL	;Change HMUD to CRYSTAL.

exh_set:	sty	T7		;Save Y.
		ldy	#0
		sta	(T5),y		;Store new object in RAM array.
		ldy	T7		;Restore Y.
exh_flsh:	lda	#AN_FLASH	;Do "flash" animation.
exh_ani:	jsr	startani
exh_noef:	rts


;-----------------------------------------------------------------------------
; Check for explosion collision with sprite.
;
; Entry: X = X grid position, Y = Y grid position.
; Must preserve: X, Y
; Changes: A, T7, TY1, TY2, TXL1, TXH1, TXL2, TXH2
;
clsn_exs:
		tya
		pha			;Save Y.
		asl	a		;Adjust & store it.
		asl	a
		asl	a
		asl	a
		sec
		sbc	#26
		sta	TY1		;TY1 = Y - 26.
		clc
		adc	#27+26
		sta	TY2		;TY2 = Y + 27.

		txa
		pha			;Save X.
		asl	a		;Adjust & store it.
		asl	a
		asl	a
		asl	a
		sta	TXL1
		sta	TXL2
		lda	#0
		rol	a
		sta	TXH1
		sta	TXH2

		lda	TXL1		;Get LSB X position.
		sec
		sbc	#26
		sta	TXL1
		lda	TXH1		;Get MSB X position.
		sbc	#0
		sta	TXH1		;TXH1:TXL1 = X - 26.
		bcs	cexxlok		;Go if NOT less than 0.
		lda	#0
		sta	TXL1
		sta	TXH1

cexxlok:	lda	TXL2		;Get LSB X position.
		clc
		adc	#27
		sta	TXL2
		lda	TXH2		;Get MSB X position.
		adc	#0
		sta	TXH2		;TXH2:TXL2 = X + 27.

		;Check for explosion collision with robot sprite.
		lda	EP_FLAG
		bne	cexobjs		;Go if explosion proof.

		lda	ROBOT_Y		;Get Y position.
		cmp	TY1
		bcc	cexobjs		;Continue if no hit.
		cmp	TY2
		bcs	cexobjs		;Continue if no hit.

		lda	ROBOT_X+1	;Get MSB X position.
		cmp	TXH1
		bcc	cexobjs		;Continue if no hit.
		bne	cexx2r		;Go check upper X range.
		lda	ROBOT_X		;Get LSB X position.
		cmp	TXL1		;Get X.
		bcc	cexobjs		;Continue if no hit.

cexx2r:		lda	ROBOT_X+1	;Get MSB X position.
		cmp	TXH2
		bcc	cexhitr		;Go if hit.
		bne	cexobjs		;Continue if no hit.
		lda	ROBOT_X		;Get LSB X position.
		cmp	TXL2		;Get X.
		bcs	cexobjs		;Go if not hit.

cexhitr:	lda	#0		;Do not blow up robot.
		jsr	kilrobot	;Destroy robot.

cexobjs:	ldx	#0
cexloop:	lda	MV_LIST,x	;Get object number.
		bne	cexchk		;Go if active.
cexnext:	inx
		cpx	LMAX_MV
		bcc	cexloop		;Loop.
		jmp	cexmons		;Go check for collision with monster.

cexchk:		cmp	#CRYSTAL
		bcc	cexnext		;No collision if < CRYSTAL.

		lda	MV_LIST3,x	;Get Y position.
		cmp	TY1
		bcc	cexnext		;Continue if no hit.
		cmp	TY2
		bcs	cexnext		;Continue if no hit.

		lda	MV_LIST2,x	;Get MSB X position.
		cmp	TXH1
		bcc	cexnext		;Continue if no hit.
		bne	cexx2		;Go check upper X range.
		lda	MV_LIST1,x	;Get LSB X position.
		cmp	TXL1		;Get X.
		bcc	cexnext		;Continue if no hit.

cexx2:		lda	MV_LIST2,x	;Get MSB X position.
		cmp	TXH2
		bcc	cexhit		;Go if hit.
		bne	cexnext		;Continue if no hit.
		lda	MV_LIST1,x	;Get LSB X position.
		cmp	TXL2		;Get X.
		bcs	cexnext		;Go if not hit.

cexhit:		lda	MV_LIST,x	;Get object number.
		cmp	#BOMB
		bcs	cexnext		;Go if past jump table limit.
		sec
		sbc	#CRYSTAL	;Adjust it down.
		stx	T7		;Save X.
		pha			;Save A.
		asl	a		;Make table index.
		tax
		lda	exo_jtab,x	;Get LSB of function address.
		sta	JMP_VECT	;Store it.
		lda	exo_jtab+1,x	;Get MSB of function address.
		sta	JMP_VECT+1	;Store it.
		pla			;Restore A.
		ldx	T7		;Restore X.
		jmp	(JMP_VECT)	;Execute specific function.

cexmons:	ldx	#0
cexloop2:	lda	MM_LIST,x	;Get monster number.
		bne	cexchk2		;Go if active.
cexnext2:	inx
		cpx	NUM_MON
		bcc	cexloop2	;Loop.
		pla
		tax			;Restore X.
		pla
		tay			;Restore Y.
		rts

cexchk2:	cmp	#SR_MON
		bcc	cexnext2	;No collision if < SR_MON.

		lda	MM_LIST3,x	;Get Y position.
		cmp	TY1
		bcc	cexnext2	;Continue if no hit.
		cmp	TY2
		bcs	cexnext2	;Continue if no hit.

		lda	MM_LIST2,x	;Get MSB X position.
		cmp	TXH1
		bcc	cexnext2	;Continue if no hit.
		bne	cexx22		;Go check upper X range.
		lda	MM_LIST1,x	;Get LSB X position.
		cmp	TXL1		;Get X.
		bcc	cexnext2	;Continue if no hit.

cexx22:		lda	MM_LIST2,x	;Get MSB X position.
		cmp	TXH2
		bcc	cexhit2		;Go if hit.
		bne	cexnext2	;Continue if no hit.
		lda	MM_LIST1,x	;Get LSB X position.
		cmp	TXL2		;Get X.
		bcs	cexnext2	;Go if not hit.

cexhit2:	lda	MM_LIST,x	;Get monster number.
		cmp	#RR_MON
		bcs	exm_cmp3	;Go if RR_MON, LAVA, MUD, or GAS.
		cmp	#HR_MON2
		bcs	exm_cmp2	;Go if HR_MON2 or IR_MON.
		cmp	#HR_MON
		bcs	exm_hr1		;Go if HR_MON.
		jmp	exm_dest	;Go if SR_MON, SR_MON2, or SR_MON3.

exm_cmp2:	cmp	#IR_MON
		bcs	exm_noef	;Go if IR_MON.
		jmp	exm_dest	;Go if HR_MON2.

exm_cmp3:	cmp	#RR_MON3
		bcs	exm_dest	;Go if RR_MON3, LAVA, MUD, or GAS_MON.
		cmp	#RR_MON2
		bcs	exm_rr2		;Go if RR_MON2.

exm_rr1:	lda	#RR_MON2
		jmp	exm_set

exm_rr2:	lda	#RR_MON3
		jmp	exm_set

exm_hr1:	lda	#HR_MON2
exm_set:	sta	MM_LIST,x	;Set new monster number.

exm_stun:	lda	#MON_STUN
		sta	MM_LIST6,x	;Set stunned counter.

exm_noef:	jmp	cexnext2	;Continue.

exm_dest:	lda	#1
		jsr	destmon		;Destroy the monster.
		jsr	sf_kill		;Do kill sound effect.
		jmp	exm_noef	;Continue.


;-----------------------------------------------------------------------------
; Explosion moving object collision functions.
;
; Entry: X = index into MV_LIST of moving object.
;        A = object number of block minus CRYSTAL.
; Must preserve: X
;
exo_expl:	txa
		pha			;Save X.
		lda	MV_LIST4,x
		pha			;Save direction.
		ldy	MV_LIST3,x
		lda	MV_LIST2,x
		pha
		lda	MV_LIST1,x
		tax
		pla
		jsr	calcxy		;Calculate grid position.
		ldx	T3		;Get X grid position.
		ldy	T4		;Get Y grid position.
		pla			;Get direction.
		cmp	#DOWN
		beq	exo_exdn	;Go if DOWN.
		bcc	exo_exrt	;Go if RIGHT.

exo_exlf:	lda	T1
		cmp	#9
		bcc	exo_excn	;Go if T1 < 9.
		inx
		jmp	exo_excn	;Continue.

exo_exrt:	lda	T1
		cmp	#8
		bcc	exo_excn	;Go if T1 < 8.
		inx
		jmp	exo_excn	;Continue.

exo_exdn:	lda	T2
		cmp	#8
		bcc	exo_excn	;Go if T2 < 8.
		iny

exo_excn:	lda	#6		;Set explosion counter.
		jsr	addexpl		;Add explosion to bomb list.
		pla
		tax			;Restore X.

exo_dest:	lda	#AN_DEST
		sta	MV_LIST4,x	;Set animation list pointer.
		tay
		lda	anitab,y	;Get first character of animation.
		sta	MV_LIST,x	;Set character.
		lda	anitab+1,y	;Get new count.
		sta	MV_LIST5,x	;Set count.
		jmp	exo_noef	;Continue.

exo_mrk:	lda	#MRROCK2	;Change MRROCK to MRROCK2.
		jmp	exo_set		;Continue.
exo_mrk2:	lda	#MRROCK3	;Change MRROCK2 to MRROCK3.
		jmp	exo_set		;Continue.

exo_rrk:	lda	#RROCK2		;Change RROCK to RROCK2.
		jmp	exo_set		;Continue.
exo_rrk2:	lda	#RROCK3		;Change RROCK2 to RROCK3.
		jmp	exo_set		;Continue.

exo_hrck:	lda	#HROCK2		;Change HROCK to HROCK2.
exo_set:	sta	MV_LIST,x	;Set new object number.
exo_noef:	jmp	cexnext		;Continue.


;-----------------------------------------------------------------------------
; Add an object to the hidden object list.
;
; Entry: A = object number, X = X grid position, Y = Y grid position.
;
addhobj:
		pha			;Save A.
		stx	T7		;Save X.

		cmp	#EXTRA		;Check for EXTRA robot prize.
		bne	ahcont		;Continue if not.
		ldx	PLAYERUP	;Get current player number.
		lda	GOTXR_P1,x	;Get got-EXTRA-robot flag.
		beq	ahcont		;Continue if didn't get it yet.
		pla			;Restore A.
		ldx	T7		;Restore X.
		rts

ahcont:		ldx	#0
ahsrch:		lda	HO_LIST,x	;Get object number byte.
		beq	ahfnd		;Go if not used.
		inx
		cpx	#MAX_HO
		bcc	ahsrch		;Loop.

		lda	#255
		sta	QUOTA		;Signal too many hidden objects.
		pla
		jmp	ahdone		;Go if couldn't add object (ERROR).

ahfnd:		pla			;Get object number.
		sta	HO_LIST,x	;Set object number.
		lda	T7		;Get X position.
		sta	HO_LIST1,x	;Save X position of object.
		tya
		sta	HO_LIST2,x	;Save Y position of object.
		inx
		stx	LASTHOBJ	;Save next entry in list.
ahdone:		ldx	T7		;Restore X.
		rts


;-----------------------------------------------------------------------------
; Remove an object from the hidden object list.
;
; Entry: X = X grid position, Y = Y grid position.
;
remhobj:
		stx	T7		;Save X.
		ldx	#0
rhsrch:		lda	HO_LIST,x	;Get object number.
		bne	rhchk		;Go if used.
rhcont:		inx
		cpx	#MAX_HO
		bcs	rhdone		;Go if end of list (object not found).
		jmp	rhsrch		;Loop.

rhchk:		lda	T7		;Get X position.
		cmp	HO_LIST1,x	;Compare X position.
		bne	rhcont		;Continue search if not equal.
		tya
		cmp	HO_LIST2,x	;Compare Y position.
		bne	rhcont		;Continue search if not equal.
		lda	#0
		sta	HO_LIST,x	;Kill object entry.
rhdone:		ldx	T7		;Restore X.
		rts


;-----------------------------------------------------------------------------
; Check for hidden objects (called whenever block becomes empty).
;
; Entry: A = object number (EMPTY), X = X grid position, Y = Y grid position.
;        T6:T5 = address of object in array in low RAM.
; MUST NOT CHANGE: X, Y, T5, T6
; MAY CHANGE: A (new object #), T7
;
chkhobj:
		stx	T7		;Save X.
		ldx	#0
chsrch:		lda	HO_LIST,x	;Get object number.
		bne	chchk		;Go if used.
chcont:		inx
		cpx	#MAX_HO
		bcc	chsrch		;Loop.

chdone:		lda	EXIT_ON
		beq	chdone2		;Go if exit square not on.
		lda	T7
		cmp	EXIT_X		;Check X position.
		bne	chdone2		;Exit if not equal.
		tya
		cmp	EXIT_Y		;Check Y position.
		bne	chdone2		;Exit if not equal.
		lda	#EXIT1
		jmp	chdone3		;Skip ahead.
chdone2:	lda	#EMPTY		;Return EMPTY object.
chdone3:	ldx	T7		;Restore X.
		rts

chchk:		lda	T7		;Get X position.
		cmp	HO_LIST1,x	;Compare X position.
		bne	chcont		;Continue search if not equal.
		tya
		cmp	HO_LIST2,x	;Compare Y position.
		bne	chcont		;Continue search if not equal.
		lda	HO_LIST,x	;Get the object number.
		ldx	T7		;Restore X.
		rts


;-----------------------------------------------------------------------------
; Set animation type according to any hidden objects.
;
chkdanim:
		cmp	#AN_DEST
		bne	cdadone
		jsr	chkhobj		;Check for hidden objects.
		cmp	#EMPTY
		beq	cdanoh
		lda	#AN_DESTH
		rts
cdanoh:		lda	#AN_DEST
cdadone:	rts

chkcanim:	;Call here when picking up crystals.
		cmp	#AN_CRYS
		bne	ccadone
		jsr	chkhobj		;Check for hidden objects.
		cmp	#EMPTY
		beq	ccanoh
		lda	#AN_CRYSH
		rts
ccanoh:		lda	#AN_CRYS
ccadone:	rts


;-----------------------------------------------------------------------------
; Start a new animation list.
;
; Entry: A = index number of new animation, X = X position, Y = Y position.
; Changes: A (contains first object of animation)
;
startani:
		pha			;Save A.
		tya
		pha			;Save Y.
		txa
		pha			;Save X.

starstrt:	ldx	#0
staloop:	lda	AN_LIST,x	;Get animation index.
		beq	stafnd		;Go if found empty slot.
stanext:	inx
		cpx	#MAX_AN
		bcc	staloop		;Loop.

		jsr	procani		;Process animation lists.
		jmp	starstrt	;Try again.

stafnd:		pla
		sta	AN_LIST1,x	;Set X position.
		pla
		sta	AN_LIST2,x	;Set Y position.
 		pla			;Get index number.
		sta	AN_LIST,x	;Set index number.
		tay
		lda	anitab+1,y	;Get count.
		sta	AN_LIST3,x	;Set count.

		lda	anitab,y	;Get starting object.
		pha			;Save it.
		ldy	AN_LIST2,x	;Get Y position.
		lda	AN_LIST1,x
		tax			;Get X position.
		jsr	getbgblk	;Set T6:T5 to low RAM address.
		pla			;Get object.
		jsr	qblock		;Start animation.
		rts


;-----------------------------------------------------------------------------
; Kill an animation at a specific X,Y location.
;
; Entry: X = X position, Y = Y position.
;
killani:
		pha			;Save A.
		stx	T7		;Save X.
		ldx	#0
kasrch:		lda	AN_LIST,x	;Get animation index.
		bne	kachk		;Go if used.
kacont:		inx
		cpx	#MAX_AN
		bcs	kadone		;Go if end of list (not found).
		jmp	kasrch		;Loop.

kachk:		lda	T7		;Get X position.
		cmp	AN_LIST1,x	;Compare X position.
		bne	kacont		;Continue search if not equal.
		tya
		cmp	AN_LIST2,x	;Compare Y position.
		bne	kacont		;Continue search if not equal.
		lda	#0
		sta	AN_LIST,x	;Kill animation entry.
kadone:		ldx	T7		;Restore X.
		pla			;Restore A.
		rts


;-----------------------------------------------------------------------------
; Process animation lists.
;
; Uses: T8
;
procani:
		ldx	#0
praloop:	lda	AN_LIST,x	;Get animation index.
		beq	pranext		;Go if not active.
		dec	AN_LIST3,x	;Decrement countdown.
		bne	pranext		;Continue if not zero.

praget:		clc
		adc	#2		;Point to next anitab entry.
		sta	AN_LIST,x	;Save new animation index.
		tay
		lda	anitab+1,y	;Get new count.
		bne	pracont		;Go if not end of list.

		sta	AN_LIST,x	;Reset animation index.
		jmp	pracont2	;Go display last object.

pracont:	sta	AN_LIST3,x	;Save new count.
pracont2:	lda	anitab,y	;Get new object.
		sta	T8		;Save object.
		ldy	AN_LIST2,x	;Get Y position.
		txa
		pha			;Save X.
		lda	AN_LIST1,x
		tax			;Get X position.
		jsr	getbgblk	;Set T6:T5 to low RAM address.
		lda	T8		;Get object number.
		jsr	qblock		;Update background block.
		pla
		tax			;Restore X.

pranext:	inx
		cpx	#MAX_AN
		bcc	praloop		;Loop.
		rts			;Exit if end of list.


;-----------------------------------------------------------------------------
; Display moving objects as sprites.
;
dispobjs:
		ldx	#0

doloop:		txa			;Get moving object number in A.
		pha			;Save X on stack.
		asl	a
		clc
		adc	#S_OBJS		;Add first sprite # offset.
		adc	SPR_OFS		;Add sprite rotation offset.
		asl	a
		asl	a
		bne	dospok		;Continue if not 0.
		lda	SPR_OFS		;Switch with sprite 0.
		asl	a
		asl	a
dospok:		tay			;Y = sprite table offset.

		lda	MV_LIST,x	;Get object number.
		beq	doright		;Go if not active.
		tax
		lda	objchr1,x	;Get character number #1.
		sta	SPR_DATA+1,y	;Set character number of sprite #1.
		lda	objchr3,x	;Get character number #2.
		sta	SPR_DATA+4+1,y	;Set character number of sprite #2.
		lda	objpal,x	;Get palette number.
		sta	SPR_DATA+2,y	;Set flag byte of sprite #1.
		sta	SPR_DATA+4+2,y	;Set flag byte of sprite #2.
		pla
		tax			;Restore X.

		lda	REG_2000	;Get register 2000 mirror.
		and	#%00000001	;Mask off page 2 bit.
		sta	T1
		lda	MV_LIST1,x	;Get LSB X position.
		sec
		sbc	H_SCROLL	;Adjust for horizontal scroll.
		pha			;Save result.
		lda	MV_LIST2,x	;Get MSB X position.
		sbc	T1		;Subtract MSB of horizontal scroll.
		bcc	doleft		;Go if off left side of screen.
		bne	doright		;Go if off right side of screen.

		pla			;Retrieve value.
		sta	SPR_DATA+3,y	;Set X position of sprite #1.
		cmp	#248
		bcs	doright2	;Go if sprite #2 off right side.
		clc
		adc	#8
		sta	SPR_DATA+4+3,y	;Set X position of sprite #2.

		lda	MV_LIST3,x	;Get Y position.
		sec
		sbc	#1		;Adjust for hardware bug.
		sta	SPR_DATA,y	;Set Y position of sprite #1.
		sta	SPR_DATA+4,y	;Set Y position of sprite #2.

donext:		inx
		cpx	LMAX_MV
		bcc	doloop		;Loop.
		rts

doright:	pla
		lda	#$f8
		sta	SPR_DATA,y	;Set sprite #1 off the screen.
		sta	SPR_DATA+4,y	;Set sprite #2 off the screen.
		jmp	donext		;Continue processing list.

doleft:		lda	#$f8
		sta	SPR_DATA,y	;Set sprite #1 off the screen.
		pla
		cmp	#248		;Compare to -8.
		bcs	doleft2		;Continue if >= -8.

		lda	#$f8
		sta	SPR_DATA+4,y	;Set sprite #2 off the screen.
		jmp	donext		;Continue processing list.

doleft2:	clc
		adc	#8
		sta	SPR_DATA+4+3,y	;Set X position of sprite #2.
		lda	MV_LIST3,x	;Get Y position.
		sec
		sbc	#1		;Adjust for hardware bug.
		sta	SPR_DATA+4,y	;Set Y position of sprite #2.
		jmp	donext		;Continue processing list.

doright2:	lda	MV_LIST3,x	;Get Y position.
		sec
		sbc	#1		;Adjust for hardware bug.
		sta	SPR_DATA,y	;Set Y position of sprite #1.
		lda	#$f8
		sta	SPR_DATA+4,y	;Set sprite #2 off the screen.
		jmp	donext		;Continue processing list.


;-----------------------------------------------------------------------------
; Check for moving object collision with sprites (from LEFT or RIGHT).
;
; Entry: X = index into MV_LIST.
; MUST NOT USE: T1-T7, TY1-TY4, TXL1-TXL4, TXH1-TXH4.
; Uses: Y, TY5-TY6, TXL5-TXL8, TXH5-TXH8.
;
clsn_spr:
		txa
		pha			;Save X.

		lda	MV_LIST3,x	;Get Y position.
		clc
		adc	#15-MV_ADJ
		sta	TY6		;TY6 = Y + (15-MV_ADJ).
		sec
		sbc	#(15-MV_ADJ)+(16-MV_ADJ)
		sta	TY5		;TY5 = Y - (16-MV_ADJ).

		lda	MV_LIST1,x	;Get LSB X position.
		clc
		adc	#15
		sta	TXL6
		lda	MV_LIST2,x	;Get MSB X position.
		adc	#0
		sta	TXH6		;TXH6:TXL6 = X + 15.

		lda	MV_LIST1,x	;Get LSB X position.
		sec
		sbc	#16
		sta	TXL5
		lda	MV_LIST2,x	;Get MSB X position.
		sbc	#0
		sta	TXH5		;TXH5:TXL5 = X - 16.

		lda	MV_LIST1,x	;Get LSB X position.
		clc
		adc	#15-MV_ADJ
		sta	TXL8
		lda	MV_LIST2,x	;Get MSB X position.
		adc	#0
		sta	TXH8		;TXH8:TXL8 = X + (15-MV_ADJ).

		lda	MV_LIST1,x	;Get LSB X position.
		sec
		sbc	#16-MV_ADJ
		sta	TXL7
		lda	MV_LIST2,x	;Get MSB X position.
		sbc	#0
		sta	TXH7		;TXH7:TXL7 = X - (16-MV_ADJ).

		;Check for object collision with robot sprite.
		lda	TY6
		cmp	ROBOT_Y		;Check Y position.
		bcc	cspcont2	;Continue if no hit.
		lda	TY5
		cmp	ROBOT_Y		;Check Y position.
		bcs	cspcont2	;Continue if no hit.

		lda	TXH6
		cmp	ROBOT_X+1	;Check MSB X position.
		bcc	cspcont2	;Continue if no hit.
		bne	cspx2		;Go check upper X range.
		lda	TXL6		;Get X.
		cmp	ROBOT_X		;Check LSB X position.
		bcc	cspcont2	;Continue if no hit.

cspx2:		lda	TXH5
		cmp	ROBOT_X+1	;Check MSB X position.
		bcc	csphitr		;Go if hit.
		bne	cspcont2	;Continue if no hit.
		lda	TXL5		;Get X.
		cmp	ROBOT_X		;Check LSB X position.
		bcs	cspcont2	;Go if not hit.

csphitr:	lda	MV_LIST,x	;Get object number.
		cmp	#CRYSTAL
		bne	csphitr2	;Go if not CRYSTAL.

		lda	#AN_CRYS
		sta	MV_LIST4,x	;Set animation list pointer.
		tay
		lda	anitab,y	;Get first character of animation.
		sta	MV_LIST,x	;Set character.
		lda	anitab+1,y	;Get new count.
		sta	MV_LIST5,x	;Set count.
		jsr	addcrys		;Add one to # of crystals picked up.
		jmp	cspexit		;Exit.

csphitr2:	lda	CLSNSPRD	;Get direction flag.
		cmp	#LEFT
		beq	csppshl		;Push to left.
		cmp	#RIGHT
		beq	csppshr		;Push to right.

cspkilr:	;First check if overlapping more than 4 pixels.
		lda	TXH8
		cmp	ROBOT_X+1	;Check MSB X position.
		bcc	cspcont2	;Continue if no hit.
		bne	cspx2b		;Go check upper X range.
		lda	TXL8		;Get X.
		cmp	ROBOT_X		;Check LSB X position.
		bcc	cspcont2	;Continue if no hit.

cspx2b:		lda	TXH7
		cmp	ROBOT_X+1	;Check MSB X position.
		bcc	cspkilr2	;Go if hit.
		bne	cspcont2	;Continue if no hit.
		lda	TXL7		;Get X.
		cmp	ROBOT_X		;Check LSB X position.
		bcs	cspcont2	;Go if not hit.

cspkilr2:	lda	#0		;Do not blow up robot.
		jsr	kilrobot	;Destroy robot.
		jmp	cspcont2	;Continue.

csppshl:	jsr	prleft		;Push robot to left.
		bcs	cspkilr		;Kill robot if couldn't push him.
		jmp	cspcont2	;Continue.

csppshr:	jsr	prright		;Push robot to right.
		bcs	cspkilr		;Kill robot if couldn't push him.

cspcont2:	;Check for object collision with monster sprites here.
		ldx	#0
csp2loop:	lda	MM_LIST,x	;Get monster number.
		bne	csp2chk		;Go if active.
csp2next:	inx
		cpx	NUM_MON
		bcc	csp2loop	;Loop.

cspexit:	pla
		tax			;Restore X.
		rts

csp2chk:	;Check for object collision with monster sprite.
		cmp	#CRYSTAL
		bcc	csp2next	;No collision if < CRYSTAL.
		cmp	#GAS_MON
		bcs	csp2next	;No collision if gas monster.

		lda	TY6
		cmp	MM_LIST3,x	;Check Y position.
		bcc	csp2next	;Continue if no hit.
		lda	TY5
		cmp	MM_LIST3,x	;Check Y position.
		bcs	csp2next	;Continue if no hit.

		lda	TXH6
		cmp	MM_LIST2,x	;Check MSB X position.
		bcc	csp2next	;Continue if no hit.
		bne	csp2x2		;Go check upper X range.
		lda	TXL6		;Get X.
		cmp	MM_LIST1,x	;Check LSB X position.
		bcc	csp2next	;Continue if no hit.

csp2x2:		lda	TXH5
		cmp	MM_LIST2,x	;Check MSB X position.
		bcc	csp2hitm	;Go if hit.
		bne	csp2next	;Continue if no hit.
		lda	TXL5		;Get X.
		cmp	MM_LIST1,x	;Check LSB X position.
		bcs	csp2next	;Go if not hit.

csp2hitm:	lda	CLSNSPRD	;Get direction flag.
		cmp	#LEFT
		beq	csp2pshl	;Push to left.
		cmp	#RIGHT
		beq	csp2pshr	;Push to right.

cspkilm:	;First check if overlapping more than 4 pixels.
		lda	TXH8
		cmp	MM_LIST2,x	;Check MSB X position.
		bcc	csp2next	;Continue if no hit.
		bne	csp2x2b		;Go check upper X range.
		lda	TXL8		;Get X.
		cmp	MM_LIST1,x	;Check LSB X position.
		bcc	csp2next	;Continue if no hit.

csp2x2b:	lda	TXH7
		cmp	MM_LIST2,x	;Check MSB X position.
		bcc	csp2hit2	;Go if hit.
		bne	csp2next	;Continue if no hit.
		lda	TXL7		;Get X.
		cmp	MM_LIST1,x	;Check LSB X position.
		bcs	csp2next	;Go if not hit.

csp2hit2:	lda	#0		;Signal falling object.
		jsr	destmon		;Destroy monster.
		jsr	sf_kill		;Do kill sound effect.
		jmp	csp2next	;Continue.

csp2pshl:	stx	MM_INDEX	;Save X.
		jsr	pmleft		;Push monster to left.
		ldx	MM_INDEX	;Restore X.
		bcs	cspkilm		;Kill monster if couldn't push him.
		jmp	csp2next	;Continue.

csp2pshr:	stx	MM_INDEX	;Save X.
		jsr	pmright		;Push monster to right.
		ldx	MM_INDEX	;Restore X.
		bcs	cspkilm		;Kill monster if couldn't push him.
		jmp	csp2next	;Continue.


;-----------------------------------------------------------------------------
; Check for moving object collision with sprites (DOWN only).
;
; Entry: X = index into MV_LIST.
; MUST NOT USE: T1-T7, TY1-TY4, TXL1-TXL4, TXH1-TXH4.
; Uses: Y, TY5-TY6, TXL5-TXL6, TXH5-TXH6.
;
clsndspr:
		txa
		pha			;Save X.

		lda	MV_LIST3,x	;Get Y position.
		clc
		adc	#15-MV_ADJ
		sta	TY6		;TY6 = Y + (15-MV_ADJ).
		sec
		sbc	#(15-MV_ADJ)+(16-MV_ADJ)
		sta	TY5		;TY5 = Y - (16-MV_ADJ).

		lda	MV_LIST1,x	;Get LSB X position.
		clc
		adc	#15-MV_ADJ
		sta	TXL6
		lda	MV_LIST2,x	;Get MSB X position.
		adc	#0
		sta	TXH6		;TXH6:TXL6 = X + (15-MV_ADJ).

		lda	MV_LIST1,x	;Get LSB X position.
		sec
		sbc	#16-MV_ADJ
		sta	TXL5
		lda	MV_LIST2,x	;Get MSB X position.
		sbc	#0
		sta	TXH5		;TXH5:TXL5 = X - (16-MV_ADJ).

		;Check for object collision with robot sprite.
		lda	TY6
		cmp	ROBOT_Y		;Check Y position.
		bcc	csdcont2	;Continue if no hit.
		lda	TY5
		cmp	ROBOT_Y		;Check Y position.
		bcs	csdcont2	;Continue if no hit.

		lda	TXH6
		cmp	ROBOT_X+1	;Check MSB X position.
		bcc	csdcont2	;Continue if no hit.
		bne	csdx2		;Go check upper X range.
		lda	TXL6		;Get X.
		cmp	ROBOT_X		;Check LSB X position.
		bcc	csdcont2	;Continue if no hit.

csdx2:		lda	TXH5
		cmp	ROBOT_X+1	;Check MSB X position.
		bcc	csdhitr		;Go if hit.
		bne	csdcont2	;Continue if no hit.
		lda	TXL5		;Get X.
		cmp	ROBOT_X		;Check LSB X position.
		bcs	csdcont2	;Go if not hit.

csdhitr:	lda	MV_LIST,x	;Get object number.
		cmp	#CRYSTAL
		bne	csdhitr2	;Go if not CRYSTAL.

		lda	#AN_CRYS
		sta	MV_LIST4,x	;Set animation list pointer.
		tay
		lda	anitab,y	;Get first character of animation.
		sta	MV_LIST,x	;Set character.
		lda	anitab+1,y	;Get new count.
		sta	MV_LIST5,x	;Set count.
		jsr	addcrys		;Add one to # of crystals picked up.
		jmp	csdexit		;Exit.

csdhitr2:	lda	#0		;Do not blow up robot.
		jsr	kilrobot	;Destroy robot.

csdcont2:	;Check for object collision with monster sprites here.
		ldx	#0
csd2loop:	lda	MM_LIST,x	;Get monster number.
		bne	csd2chk		;Go if active.
csd2next:	inx
		cpx	NUM_MON
		bcc	csd2loop	;Loop.

csdexit:	pla
		tax			;Restore X.
		rts

csd2chk:	;Check for object collision with monster sprite.
		cmp	#CRYSTAL
		bcc	csd2next	;No collision if < CRYSTAL.
		cmp	#GAS_MON
		bcs	csd2next	;No collision if gas monster.

		lda	TY6
		cmp	MM_LIST3,x	;Check Y position.
		bcc	csd2next	;Continue if no hit.
		lda	TY5
		cmp	MM_LIST3,x	;Check Y position.
		bcs	csd2next	;Continue if no hit.

		lda	TXH6
		cmp	MM_LIST2,x	;Check MSB X position.
		bcc	csd2next	;Continue if no hit.
		bne	csd2x2		;Go check upper X range.
		lda	TXL6		;Get X.
		cmp	MM_LIST1,x	;Check LSB X position.
		bcc	csd2next	;Continue if no hit.

csd2x2:		lda	TXH5
		cmp	MM_LIST2,x	;Check MSB X position.
		bcc	csd2hitm	;Go if hit.
		bne	csd2next	;Continue if no hit.
		lda	TXL5		;Get X.
		cmp	MM_LIST1,x	;Check LSB X position.
		bcs	csd2next	;Go if not hit.

csd2hitm:	lda	#0		;Signal falling object.
		jsr	destmon		;Destroy monster.
		jsr	sf_kill		;Do kill sound effect.
		jmp	csd2next	;Continue.


;-----------------------------------------------------------------------------
; Process destruction animation for object.
;
mobjanim:
		dec	MV_LIST5,x	;Decrement countdown.
		bne	moadone		;Exit if not zero.

		lda	MV_LIST4,x	;Get animation pointer.
		clc
		adc	#2		;Point to next anitab entry.
		sta	MV_LIST4,x	;Set new animation pointer.
		tay
		lda	anitab+1,y	;Get new count.
		bne	moacont		;Go if not end of list.

		lda	#0
		sta	MV_LIST,x	;Kill animation.
		sta	MV_LIST4,x	;Clear animation pointer.
		rts

moacont:	sta	MV_LIST5,x	;Save new count.
		lda	anitab,y	;Get new object.
		sta	MV_LIST,x	;Save object.

moadone:	rts


;-----------------------------------------------------------------------------
; Process moving (sliding or falling) rocks & crystals.
;
movrocks:
		ldx	#0
mrloop:		lda	MV_LIST,x	;Get object number.
		bne	mrfnd		;Go if active.
mrnext:		inx
		cpx	LMAX_MV
		bcc	mrloop		;Loop.
		rts

mranim:		jsr	mobjanim	;Process animation.
		jmp	mrnext		;Next object.

mrfnd:		cmp	#CRYSTAL
		bcc	mranim		;Go if animation.
		lda	MV_LIST4,x	;Get direction.
		cmp	#DOWN
		beq	mrdown		;Go if DOWN.
		bcc	mrright		;Go if RIGHT.

mrleft:		lda	MV_LIST1,x	;Check LSB X position.
		bne	mrlcnt		;Go if not zero.
		dec	MV_LIST2,x	;Decrement MSB X position.
mrlcnt:		dec	MV_LIST1,x	;Decrement LSB X position.

		lda	#LEFT
		sta	CLSNSPRD	;Set direction flag.
		jsr	clsn_spr	;Check for collision with sprites.

		dec	MV_LIST5,x	;Decrement pixel counter.
		bne	mrnext		;Go if not done moving.

		lda	MV_LIST4,x	;Get direction.
		cmp	#SLEFT
		beq	mrdone		;Exit if LEFT only.

		dec	MV_LIST6,x	;Decrement X grid position.
		lda	#DOWN
		sta	MV_LIST4,x	;Change to DOWN.
		lda	#16
		sta	MV_LIST5,x	;Reset pixel counter.
		jmp	mrnext		;Continue.

mrright:	inc	MV_LIST1,x	;Increment LSB X position.
		bne	mrrcnt		;Go if no wrap.
		inc	MV_LIST2,x	;Increment MSB X position.
mrrcnt:
		lda	#RIGHT
		sta	CLSNSPRD	;Set direction flag.
		jsr	clsn_spr	;Check for collision with sprites.

		dec	MV_LIST5,x	;Decrement pixel counter.
		bne	mrnext		;Go if not done moving.

		lda	MV_LIST4,x	;Get direction.
		cmp	#SRIGHT
		beq	mrdone		;Exit if RIGHT only.

		inc	MV_LIST6,x	;Increment X grid position.
		lda	#DOWN
		sta	MV_LIST4,x	;Change to DOWN.
		lda	#16
		sta	MV_LIST5,x	;Reset pixel counter.
		jmp	mrnext		;Continue.

mrdown:		inc	MV_LIST3,x	;Increment Y position.

		lda	#DOWN
		sta	CLSNSPRD	;Set direction flag.
		jsr	clsndspr	;Check for collision with sprites.

		dec	MV_LIST5,x	;Decrement pixel counter.
		bne	mrjnext		;Go if not done moving.

mrdone:		txa
		pha			;Save X index.
		lda	MV_LIST4,x	;Get direction.
		pha			;Save for later.
		lda	MV_LIST,x	;Get object number.
		pha			;Save for later.
		lda	#0
		sta	MV_LIST,x	;Kill list entry.
		ldy	MV_LIST3,x	;Y = Y position.
		lda	MV_LIST2,x	;A = MSB X position.
		pha
		lda	MV_LIST1,x
		tax			;X = LSB X position.
		pla
		jsr	calcxy		;Calculate grid X,Y.
		ldx	T3		;X = X grid position.
		ldy	T4		;Y = Y grid position.
		jsr	getbgblk	;Get block (calculate T6:T5).
		pla			;Get object number.
		ora	#%10000000	;Set high bit to indicate falling.
		jsr	qblock		;Store object (strips high bit).
		jsr	killani		;Kill any animations.

		cmp	#MIROCK
		bne	mrnotmi		;Continue if not MIROCK.
		pla			;Get direction.
		cmp	#DOWN
		bne	mrnotmi2	;Continue if not DOWN.
		iny
		jsr	getbgblk	;Get block at (X,Y+1).
		cmp	#CRYSTAL
		bne	mrnotmi2	;Continue if not CRYSTAL.
		lda	#AN_DEST2	;Do "destruction" animation at X,Y.
		jsr	startani
		jsr	sf_smash	;Do smash sound effect.
		jmp	mrnotmi2	;Continue.

mrnotmi:	pla
mrnotmi2:	pla
		tax			;Restore X index.
mrjnext:	jmp	mrnext		;Process next object.


;-----------------------------------------------------------------------------
; Check for stationary or moving objects at a specific grid position.
;
; Entry: X = X grid position, Y = Y grid position.
; Changes: T5-T8
; Must preserve: X, Y
; Returns: carry clear if no collision, set if collision (A = object #).
;
chkobjs:
		jsr	getbgblk	;Get block at (X,Y).
		cmp	#SMOKE1
		bcc	cocont		;Continue if square is empty.
		rts			;Return with carry flag set.

cocont:		txa
		pha			;Save X.

		stx	T7		;Save X grid position.
		sty	T8		;Save Y grid position.

		ldx	#0
coloop:		lda	MV_LIST,x	;Get object number.
		beq	conext		;Go if NOT active.
		cmp	#CRYSTAL
		bcc	conext		;Go if animation.

		lda	MV_LIST4,x	;Get direction.
		cmp	#DOWN
		beq	codown		;Go if DOWN.
		bcc	coright		;Go if RIGHT.

coleft:		lda	MV_LIST6,x	;Get X grid position.
		cmp	T7
		bne	coleft3		;Go check square #2 if not equal.

		lda	MV_LIST7,x	;Get Y grid position.
coleft2:	cmp	T8
		bne	conext		;Continue if not equal.
		jmp	comatch		;Go if match.

coleft3:	sec
		sbc	#1
		cmp	T7
		bne	conext		;Go if not equal to X-1.

		lda	MV_LIST7,x	;Get Y grid position.
		cmp	T8
		beq	comatch		;Go if match.

		clc
		adc	#1
		jmp	coleft2		;Go check Y+1.

coright:	lda	MV_LIST6,x	;Get X grid position.
		cmp	T7
		bne	coright3	;Go check square #2 if not equal.

		lda	MV_LIST7,x	;Get Y grid position.
coright2:	cmp	T8
		bne	conext		;Continue if not equal.

comatch:	sec			;Signal object hit.
		pla
		tax			;Restore X.
		lda	#IROCK		;Dummy object value.
		rts

coright3:	clc
		adc	#1
		cmp	T7
		bne	conext		;Go if not equal to X+1.

coright4:	lda	MV_LIST7,x	;Get Y grid position.
		cmp	T8
		beq	comatch		;Go if match.

		clc
		adc	#1
		jmp	coright2	;Go check Y+1.

codown:		lda	MV_LIST6,x	;Get X grid position.
		cmp	T7
		bne	conext		;Go if not equal.
		jmp	coright4	;Continue.

conext:		inx
		cpx	LMAX_MV
		bcc	coloop		;Loop.

		clc			;Signal no objects hit.
		pla
		tax			;Restore X.
		rts


;-----------------------------------------------------------------------------
; Check for sprite below object holding it up.
;
; Entry: X = X grid position, Y = Y grid position.
; Must preserve: X, Y
; Changes: T1-T6
; Returns: carry flag set if sprite is holding up object.
;
chksprb:
		txa			;Get X grid position.
		pha			;Save X.
		asl	a		;Adjust & store it.
		asl	a
		asl	a
		asl	a
		sta	T1		;Store LSB X sprite position.
		sta	T3		;Store LSB X sprite position.
		lda	#0
		rol	a
		sta	T2		;Store MSB X sprite position.
		sta	T4		;Store MSB X sprite position.

		lda	T1		;Subtract 15 from T2:T1.
		sec
		sbc	#15-MV_ADJ
		sta	T1
		lda	T2
		sbc	#0
		sta	T2

		lda	T3		;Add 16 to T4:T3.
		clc
		adc	#16-MV_ADJ
		sta	T3
		lda	T4
		adc	#0
		sta	T4

		tya			;Get Y grid position.
		asl	a		;Adjust & store it.
		asl	a
		asl	a
		asl	a
		sta	T6		;Store Y sprite position.
		inc	T6
		sec
		sbc	#MV_ADJ
		sta	T5		;Store Y-MV_ADJ.

csbchky:	lda	ROBOT_Y		;Check Y robot position.
		cmp	T5
		bcc	csbcont		;Continue if below.
		cmp	T6
		bcs	csbcont		;Continue if above.

		lda	ROBOT_X+1	;Check MSB X robot position.
		cmp	T2
		bcc	csbcont		;Continue if below.
		bne	csbx2		;Go check high X range.
		lda	ROBOT_X		;Check LSB X robot position.
		cmp	T1
		bcc	csbcont		;Continue if below.

csbx2:		lda	ROBOT_X+1	;Check MSB X robot position.
		cmp	T4
		bcc	csbhitr		;Go if hit.
		bne	csbcont		;Continue if above.
		lda	ROBOT_X		;Check LSB X robot position.
		cmp	T3
		bcs	csbcont		;Go if no collision.

csbhitr:	pla
		tax			;Restore X.
		lda	#0		;Signal hit robot.
		sec			;Signal sprite holding up object.
		rts

csbcont:	;Check monster sprites here.
		ldx	#0
csb2loop:	lda	MM_LIST,x	;Get monster number.
		bne	csb2chk		;Go if active.
csb2next:	inx
		cpx	NUM_MON
		bcc	csb2loop	;Loop.

		pla
		tax			;Restore X.
csbnohit:	lda	#$ff		;Signal no collision.
		clc			;Signal object OK to fall.
		rts

csbhit:		pla
		tax			;Restore X.
		lda	#$01		;Signal hit monster.
		sec			;Signal sprite holding up object.
		rts

csb2chk:	cmp	#GAS_MON
		beq	csb2next	;Ignore if gas monster.

		lda	MM_LIST3,x	;Check Y robot position.
		cmp	T5
		bcc	csb2next	;Continue if below.
		cmp	T6
		bcs	csb2next	;Continue if above.

		lda	MM_LIST2,x	;Check MSB X robot position.
		cmp	T2
		bcc	csb2next	;Continue if below.
		bne	csb2x2		;Go check high X range.
		lda	MM_LIST1,x	;Check LSB X robot position.
		cmp	T1
		bcc	csb2next	;Continue if below.

csb2x2:		lda	MM_LIST2,x	;Check MSB X robot position.
		cmp	T4
		bcc	csbhit		;Go if hit.
		bne	csb2next	;Continue if above.
		lda	MM_LIST1,x	;Check LSB X robot position.
		cmp	T3
		bcc	csbhit		;Go if hit.
		jmp	csb2next	;Continue.


;-----------------------------------------------------------------------------
; Check for sprite next to object on right side preventing it from moving.
;
; Entry: X = X grid position, Y = Y grid position.
; Must preserve: X, Y
; Changes: T1-T6
; Returns: carry flag set if sprite is holding up object.
;
chksprnr:
		txa			;Get X grid position.
		pha			;Save X.
		asl	a		;Adjust & store it.
		asl	a
		asl	a
		asl	a
		sta	T1		;Store LSB X sprite position.
		sta	T3		;Store LSB X sprite position.
		lda	#0
		rol	a
		sta	T2		;Store MSB X sprite position.
		sta	T4		;Store MSB X sprite position.

		lda	T1		;Subtract MV_ADJ from T2:T1.
		sec
		sbc	#MV_ADJ
		sta	T1
		lda	T2
		sbc	#0
		sta	T2

		lda	T3		;Add MV_ADJ+1 to T4:T3.
		clc
		adc	#MV_ADJ+1
		sta	T3
		lda	T4
		adc	#0
		sta	T4

chksprny:	tya			;Get Y grid position.
		asl	a		;Adjust & store it.
		asl	a
		asl	a
		asl	a
		sta	T5		;Store Y sprite position.
		sta	T6		;Store Y sprite position.

		lda	T5		;Subtract 15 from T5.
		sec
		sbc	#15
		sta	T5

		lda	T6		;Add 17 to T6.
		clc
		adc	#17
		sta	T6

		jmp	csbchky		;Continue.


;-----------------------------------------------------------------------------
; Check for sprite next to object on left side preventing it from moving.
;
; Entry: X = X grid position, Y = Y grid position.
; Must preserve: X, Y
; Changes: T1-T6
; Returns: carry flag set if sprite is holding up object.
;
chksprnl:
		txa			;Get X grid position.
		pha			;Save X.
		asl	a		;Adjust & store it.
		asl	a
		asl	a
		asl	a
		sta	T1		;Store LSB X sprite position.
		sta	T3		;Store LSB X sprite position.
		lda	#0
		rol	a
		sta	T2		;Store MSB X sprite position.
		sta	T4		;Store MSB X sprite position.

		lda	T1		;Subtract MV_ADJ from T2:T1.
		sec
		sbc	#MV_ADJ
		sta	T1
		lda	T2
		sbc	#0
		sta	T2

		lda	T3		;Add MV_ADJ+1 to T4:T3.
		clc
		adc	#MV_ADJ+1
		sta	T3
		lda	T4
		adc	#0
		sta	T4

		jmp	chksprny	;Continue.


;-----------------------------------------------------------------------------
; Display monster sprites.
;
dispmons:
		ldx	#0

dmloop:		txa			;Get monster number in A.
		pha			;Save X on stack.
		asl	a
		sta	T1		;Save X*2.
		lda	#S_MONS		;Get last sprite # offset.
		sec
		sbc	T1		;Subtract X*2.
		clc
		adc	SPR_OFS		;Add sprite rotation offset.
		asl	a
		asl	a
		bne	dmspok		;Continue if not 0.
		lda	SPR_OFS		;Switch with sprite 0.
		asl	a
		asl	a
dmspok:		tay			;Y = sprite table offset.

		lda	MM_LIST,x	;Get object number.
		beq	dmright		;Go if not active.
		cmp	#CRYSTAL
		bcs	dmnani		;Go if not animation.

		tax
		jmp	dmcont3		;Continue.

dmnani:		sta	T1		;Save object number.
		lda	MM_LIST5,x	;Get animation counter.
		and	#%00001100	;Mask off 2 bits.
		lsr	a
		lsr	a
		cmp	#%00000011	;Check for 3.
		bne	dmcont		;Continue if not.
		lda	#%00000001	;Set to 1.
dmcont:		clc
		adc	T1		;Add object number.
		sta	T1		;Save object # + count.

		lda	MM_LIST,x	;Get object number.
		cmp	#LAVA_MON
		bcc	dmcont2		;Go if not LAVA, MUD, or GAS monster.
		ldx	T1
		jmp	dmcont3		;Continue.

dmcont2:	lda	MM_LIST7,x	;Get direction last moved.
		and	#%00001111	;Mask off high nibble.
		cmp	#LEFT
		beq	dmcont4		;Go if facing left.

		clc
		adc	T1		;Add object # + count to direction.
		tax

dmcont3:	lda	#0
		sta	T2		;Clear left/right flip bit.
		lda	objchr1,x	;Get character number #1.
		sta	SPR_DATA+1,y	;Set character number of sprite #1.
		clc
		adc	#2		;Get character number #2.
		sta	SPR_DATA+4+1,y	;Set character number of sprite #2.
		jmp	dmcont5		;Continue.

dmright:	pla
		lda	#$f8
		sta	SPR_DATA,y	;Set sprite #1 off the screen.
		sta	SPR_DATA+4,y	;Set sprite #2 off the screen.

dmnext:		inx
		cpx	NUM_MON
		bcc	dmloop		;Loop.
		rts

dmcont4:	lda	#%01000000
		sta	T2		;Set left/right flip bit.
		ldx	T1		;Get object # + count.
		lda	objchr1,x	;Get character number #1.
		sta	SPR_DATA+4+1,y	;Set character number of sprite #2.
		clc
		adc	#2		;Get character number #2.
		sta	SPR_DATA+1,y	;Set character number of sprite #1.

dmcont5:	lda	objpal,x	;Get palette number.
		ora	T2		;Or in flip bit.
		sta	SPR_DATA+2,y	;Set flag byte of sprite #1.
		sta	SPR_DATA+4+2,y	;Set flag byte of sprite #2.
		pla
		tax			;Restore X.

		lda	REG_2000	;Get register 2000 mirror.
		and	#%00000001	;Mask off page 2 bit.
		sta	T1
		lda	MM_LIST1,x	;Get LSB X position.
		sec
		sbc	H_SCROLL	;Adjust for horizontal scroll.
		pha			;Save result.
		lda	MM_LIST2,x	;Get MSB X position.
		sbc	T1		;Subtract MSB of horizontal scroll.
		bcc	dmleft		;Go if off left side of screen.
		bne	dmright		;Go if off right side of screen.

		pla			;Retrieve value.
		sta	SPR_DATA+3,y	;Set X position of sprite #1.
		cmp	#248
		bcs	dmright2	;Go if sprite #2 off right side.
		clc
		adc	#8
		sta	SPR_DATA+4+3,y	;Set X position of sprite #2.

		lda	MM_LIST3,x	;Get Y position.
		sec
		sbc	#1		;Adjust for hardware bug.
		sta	SPR_DATA,y	;Set Y position of sprite #1.
		sta	SPR_DATA+4,y	;Set Y position of sprite #2.
		jmp	dmnext		;Continue processing list.

dmleft:		lda	#$f8
		sta	SPR_DATA,y	;Set sprite #1 off the screen.
		pla
		cmp	#248		;Compare to -8.
		bcs	dmleft2		;Continue if >= -8.

		lda	#$f8
		sta	SPR_DATA+4,y	;Set sprite #2 off the screen.
		jmp	dmnext		;Continue processing list.

dmleft2:	clc
		adc	#8
		sta	SPR_DATA+4+3,y	;Set X position of sprite #2.
		lda	MM_LIST3,x	;Get Y position.
		sec
		sbc	#1		;Adjust for hardware bug.
		sta	SPR_DATA+4,y	;Set Y position of sprite #2.
		jmp	dmnext		;Continue processing list.

dmright2:	lda	MM_LIST3,x	;Get Y position.
		sec
		sbc	#1		;Adjust for hardware bug.
		sta	SPR_DATA,y	;Set Y position of sprite #1.
		lda	#$f8
		sta	SPR_DATA+4,y	;Set sprite #2 off the screen.
		jmp	dmnext		;Continue processing list.


;-----------------------------------------------------------------------------
; Destroy a monster.
; Entry: X = index of monster in MM_LIST (must not be changed).
;        A = 2 if killed by energy ball, 1 if killed by explosion, 0 if
;              killed by falling object.
; Changes: A, Y
;
destmon:
		tay			;Save method of death.
		txa
		pha			;Save X.

		lda	MM_LIST,x	;Get monster number.
		cmp	#RR_MON
		bcc	dm_cmp3		;Go if IR_MON, HR_MON, or SR_MON.
		cmp	#MUD_MON
		bcc	dm_cmp2		;Go if RR_MON or LAVA_MON.
		cmp	#GAS_MON
		bcc	dm_mud		;Go if MUD_MON.
dm_gas:		ldy	#SC1000
		jmp	dm_adds		;Go add to score.
dm_mud:		tya
		beq	dm_mud2
		ldy	#SC400
		jmp	dm_adds		;Go add to score.
dm_mud2:	ldy	#SC800
		jmp	dm_adds		;Go add to score.
dm_cmp2:	cmp	#LAVA_MON
		bcc	dm_rr		;Go if RR_MON.
dm_lava:	tya
		beq	dm_lava2
		ldy	#SC500
		jmp	dm_adds		;Go add to score.
dm_lava2:	ldy	#SC1000
		jmp	dm_adds		;Go add to score.
dm_rr:		tya
		beq	dm_rr2
		ldy	#SC1500
		jmp	dm_adds		;Go add to score.
dm_rr2:		ldy	#SC3000
		jmp	dm_adds		;Go add to score.
dm_cmp3:	cmp	#HR_MON
		bcc	dm_cmp4		;Go if SR_MON or invalid.
		cmp	#IR_MON
		bcc	dm_hr		;Go if HR_MON.
dm_ir:		ldy	#SC2000
		jmp	dm_adds		;Go add to score.
dm_hr:		tya
		beq	dm_hr2
		ldy	#SC500
		jmp	dm_adds		;Go add to score.
dm_hr2:		ldy	#SC1000
		jmp	dm_adds		;Go add to score.
dm_cmp4:	cmp	#SR_MON
		bcc	dm_cont		;Go if invalid.
dm_sr:		tya
		beq	dm_sr2
		cmp	#1
		beq	dm_sr3
		ldy	#SC100
		jmp	dm_adds		;Go add to score.
dm_sr3:		ldy	#SC200
		jmp	dm_adds		;Go add to score.
dm_sr2:		ldy	#SC400

dm_adds:	jsr	addscore	;Add points to score.
		jsr	ud_score	;Update score string.

dm_cont:	pla
		tax			;Restore X.
		lda	#AN_DEST2
		sta	MM_LIST6,x	;Set animation list pointer.
		tay
		lda	anitab,y	;Get first character of animation.
		sta	MM_LIST,x	;Set character.
		lda	anitab+1,y	;Get new count.
		sta	MM_LIST5,x	;Set count.
		rts


;-----------------------------------------------------------------------------
; Process death animation for monster.
;
mondying:
		dec	MM_LIST5,x	;Decrement countdown.
		bne	mdydone		;Exit if not zero.

		lda	MM_LIST6,x	;Get animation pointer.
		clc
		adc	#2		;Point to next anitab entry.
		sta	MM_LIST6,x	;Set new animation pointer.
		tay
		lda	anitab+1,y	;Get new count.
		bne	mdycont		;Go if not end of list.

		lda	#0
		sta	MM_LIST,x	;Kill animation.
		sta	MM_LIST6,x	;Clear animation pointer.
		rts

mdycont:	sta	MM_LIST5,x	;Save new count.
		lda	anitab,y	;Get new object.
		sta	MM_LIST,x	;Save object.

mdydone:	rts


;-----------------------------------------------------------------------------
; Move monster sprites.
;
movmons:
		ldx	#0
mmloop:		lda	MM_LIST,x	;Get monster number.
		bne	mmfnd		;Go if active.
mmnext:		inx
		cpx	NUM_MON
		bcc	mmloop		;Loop.
		rts

mmfnd:		cmp	#CRYSTAL
		bcc	mmanim		;Go if animation.
		lda	MM_LIST6,x
		bne	mmstun		;Go if monster is stunned.
		lda	MM_LIST,x	;Get monster number.
		cmp	#RR_MON
		bcc	mmnorm		;Go if SR_MON, HR_MON, or IR_MON.
		cmp	#MUD_MON
		bcc	mmcmp2		;Go if LAVA_MON or RR_MON.
		cmp	#GAS_MON
		bcc	mmmud		;Go if MUD_MON.
		jmp	mmgas		;Go if GAS_MON.
mmcmp2:		cmp	#LAVA_MON
		bcc	mmradio		;Go if RR_MON.
		jmp	mmlava		;Go if LAVA_MON.

mmanim:		jsr	mondying	;Continue death animation.
		jmp	mmnext		;Next monster.

mmstun:		txa
		pha			;Save X.
		dec	MM_LIST6,x	;Decrement stun count.
		ldy	MM_LIST3,x	;Y = Y position.
		lda	MM_LIST2,x	;Get MSB X position.
		pha
		lda	MM_LIST1,x	;Get LSB X position.
		tax			;X = LSB X position.
		pla			;A = MSB X position.
		jsr	clsn_rob	;Kill robot if he got in the way.
		pla
		tax			;Restore X.
mmjnext:	jmp	mmnext		;Next monster.

mmnorm:		lda	MM_LIST4,x	;Get direction.
		and	#MAD		;Check MAD bit.
		bne	mmradio		;Go if monster is mad.

		txa			;Process each monster every 2 NMIs.
		eor	NMI_TIME
		and	#%00000001
		bne	mmnext		;Next monster.
mmradio:
		lda	MM_LIST4,x	;Get direction.
		and	#CCW		;Check CCW bit.
		bne	mmccw		;Go if counter clock-wise algorithm.

		jsr	mmalgo2		;Move monster.
		jmp	mmnext		;Continue.

mmccw:		jsr	mmalgo1		;Move monster.
		jmp	mmnext		;Continue.

mmlava:		lda	MM_LIST4,x	;Get direction.
		and	#MAD		;Check MAD bit.
		bne	mmdo3		;Go if monster is mad.

mmmud:		txa			;Process each monster every 2 NMIs.
		eor	NMI_TIME
		and	#%00000001
		bne	mmnext		;Next monster.
mmdo3:		jsr	mmalgo3		;Move monster.
		jmp	mmnext		;Continue.

mmgas:		txa			;Process each monster every 4 NMIs.
		and	#%00000011
		sta	T1
		lda	NMI_TIME
		and	#%00000011
		cmp	T1
		bne	mmjnext		;Next monster.
		jsr	mmalgo4		;Move monster.
		jmp	mmnext		;Continue.


;-----------------------------------------------------------------------------
; Monster movement algorithm #1 (follow walls counter clock-wise).
;
mmalgo1:
		inc	MM_LIST5,x	;Increment animation counter.
		lda	MM_LIST4,x	;Get direction.
		and	#%00001111	;Mask off high nibble.
		cmp	#DOWN
		bcc	mm1chk2		;Go if RIGHT or UP.
		beq	mm1down		;Go if DOWN.

mm1left:	stx	MM_INDEX
		lda	MM_LIST4,x
		and	#MFLG
		bne	mm1left2	;Go if special movement flag set.

		jsr	mmsup		;Move monster up.
		ldx	MM_INDEX
		bcs	mm1left2	;Go if didn't change direction.

		lda	MM_LIST4,x
		and	#CHGDIR		;Check changed direction bit.
		beq	mm1chgd

		lda	MM_LIST4,x
		and	#%11110000	;Mask off low nibble.
		ora	#MFLG+LEFT	;Set special movement flag.
		sta	MM_LIST4,x
		rts

mm1left2:	jsr	mmsleft		;Move monster left.
		ldx	MM_INDEX
		bcc	mm1same		;Go if able to move.

		lda	MM_LIST4,x
		and	#MFLG^$f0	;Clear special movement flag.
		ora	#DOWN
		sta	MM_LIST4,x
		rts

mm1down:	stx	MM_INDEX
		lda	MM_LIST4,x
		and	#MFLG
		bne	mm1down2	;Go if special movement flag set.

		jsr	mmsleft		;Move monster left.
		ldx	MM_INDEX
		bcs	mm1down2	;Go if didn't change direction.

		lda	MM_LIST4,x
		and	#CHGDIR		;Check changed direction bit.
		beq	mm1chgd

		lda	MM_LIST4,x
		and	#%11110000	;Mask off low nibble.
		ora	#MFLG+DOWN	;Set special movement flag.
		sta	MM_LIST4,x
		rts

mm1down2:	jsr	mmsdown		;Move monster down.
		ldx	MM_INDEX
		bcc	mm1same		;Go if moved in same direction.

		lda	MM_LIST4,x
		and	#MFLG^$f0	;Clear special movement flag.
		ora	#RIGHT
		sta	MM_LIST4,x
		rts

mm1chgd:	lda	MM_LIST4,x
		ora	#CHGDIR		;Set changed direction bit.
		sta	MM_LIST4,x
		rts

mm1same:	lda	MM_LIST4,x
		and	#CHGDIR^$ff	;Clear changed direction bit.
		sta	MM_LIST4,x
		rts

mm1chk2:	cmp	#UP
		bcs	mm1up		;Go if UP.

mm1right:	stx	MM_INDEX
		lda	MM_LIST4,x
		and	#MFLG
		bne	mm1rght2	;Go if special movement flag set.

		jsr	mmsdown		;Move monster down.
		ldx	MM_INDEX
		bcs	mm1rght2	;Go if didn't change direction.

		lda	MM_LIST4,x
		and	#CHGDIR		;Check changed direction bit.
		beq	mm1chgd

		lda	MM_LIST4,x
		and	#%11110000	;Mask off low nibble.
		ora	#MFLG+RIGHT	;Set special movement flag.
		sta	MM_LIST4,x
		rts

mm1rght2:	jsr	mmsright	;Move monster right.
		ldx	MM_INDEX
		bcc	mm1same		;Go if moved in same direction.

		lda	MM_LIST4,x
		and	#MFLG^$f0	;Clear special movement flag.
		ora	#UP
		sta	MM_LIST4,x
		rts

mm1up:		stx	MM_INDEX
		lda	MM_LIST4,x
		and	#MFLG
		bne	mm1up2		;Go if special movement flag set.

		jsr	mmsright	;Move monster right.
		ldx	MM_INDEX
		bcs	mm1up2		;Go if didn't change direction.

		lda	MM_LIST4,x
		and	#CHGDIR		;Check changed direction bit.
		beq	mm1chgd

		lda	MM_LIST4,x
		and	#%11110000	;Mask off low nibble.
		ora	#MFLG+UP	;Set special movement flag.
		sta	MM_LIST4,x
		rts

mm1up2:		jsr	mmsup		;Move monster up.
		ldx	MM_INDEX
		bcc	mm1same		;Go if moved in same direction.

		lda	MM_LIST4,x
		and	#MFLG^$f0	;Clear special movement flag.
		ora	#LEFT
		sta	MM_LIST4,x
		rts


;-----------------------------------------------------------------------------
; Monster movement algorithm #2 (follow walls clock-wise).
;
mmalgo2:
		inc	MM_LIST5,x	;Increment animation counter.
		lda	MM_LIST4,x	;Get direction.
		and	#%00001111	;Mask off high nibble.
		cmp	#DOWN
		bcc	mm2chk2		;Go if RIGHT or UP.
		beq	mm2down		;Go if DOWN.

mm2left:	stx	MM_INDEX
		lda	MM_LIST4,x
		and	#MFLG
		bne	mm2left2	;Go if special movement flag set.

		jsr	mmsdown		;Move monster down.
		ldx	MM_INDEX
		bcs	mm2left2	;Go if didn't change direction.

		lda	MM_LIST4,x
		and	#CHGDIR		;Check changed direction bit.
		beq	mm2chgd

		lda	MM_LIST4,x
		and	#%11110000	;Mask off low nibble.
		ora	#MFLG+LEFT	;Set special movement flag.
		sta	MM_LIST4,x
		rts

mm2left2:	jsr	mmsleft		;Move monster left.
		ldx	MM_INDEX
		bcc	mm2same		;Go if able to move.

		lda	MM_LIST4,x
		and	#MFLG^$f0	;Clear special movement flag.
		ora	#UP
		sta	MM_LIST4,x
		rts

mm2down:	stx	MM_INDEX
		lda	MM_LIST4,x
		and	#MFLG
		bne	mm2down2	;Go if special movement flag set.

		jsr	mmsright	;Move monster right.
		ldx	MM_INDEX
		bcs	mm2down2	;Go if didn't change direction.

		lda	MM_LIST4,x
		and	#CHGDIR		;Check changed direction bit.
		beq	mm2chgd

		lda	MM_LIST4,x
		and	#%11110000	;Mask off low nibble.
		ora	#MFLG+DOWN	;Set special movement flag.
		sta	MM_LIST4,x
		rts

mm2down2:	jsr	mmsdown		;Move monster down.
		ldx	MM_INDEX
		bcc	mm2same		;Go if moved in same direction.

		lda	MM_LIST4,x
		and	#MFLG^$f0	;Clear special movement flag.
		ora	#LEFT
		sta	MM_LIST4,x
		rts

mm2chgd:	lda	MM_LIST4,x
		ora	#CHGDIR		;Set changed direction bit.
		sta	MM_LIST4,x
		rts

mm2same:	lda	MM_LIST4,x
		and	#CHGDIR^$ff	;Clear changed direction bit.
		sta	MM_LIST4,x
		rts

mm2chk2:	cmp	#UP
		bcs	mm2up		;Go if UP.

mm2right:	stx	MM_INDEX
		lda	MM_LIST4,x
		and	#MFLG
		bne	mm2rght2	;Go if special movement flag set.

		jsr	mmsup		;Move monster up.
		ldx	MM_INDEX
		bcs	mm2rght2	;Go if didn't change direction.

		lda	MM_LIST4,x
		and	#CHGDIR		;Check changed direction bit.
		beq	mm2chgd

		lda	MM_LIST4,x
		and	#%11110000	;Mask off low nibble.
		ora	#MFLG+RIGHT	;Set special movement flag.
		sta	MM_LIST4,x
		rts

mm2rght2:	jsr	mmsright	;Move monster right.
		ldx	MM_INDEX
		bcc	mm2same		;Go if moved in same direction.

		lda	MM_LIST4,x
		and	#MFLG^$f0	;Clear special movement flag.
		ora	#DOWN
		sta	MM_LIST4,x
		rts

mm2up:		stx	MM_INDEX
		lda	MM_LIST4,x
		and	#MFLG
		bne	mm2up2		;Go if special movement flag set.

		jsr	mmsleft		;Move monster left.
		ldx	MM_INDEX
		bcs	mm2up2		;Go if didn't change direction.

		lda	MM_LIST4,x
		and	#CHGDIR		;Check changed direction bit.
		beq	mm2chgd

		lda	MM_LIST4,x
		and	#%11110000	;Mask off low nibble.
		ora	#MFLG+UP	;Set special movement flag.
		sta	MM_LIST4,x
		rts

mm2up2:		jsr	mmsup		;Move monster up.
		ldx	MM_INDEX
		bcc	mm2same		;Go if moved in same direction.

		lda	MM_LIST4,x
		and	#MFLG^$f0	;Clear special movement flag.
		ora	#RIGHT
		sta	MM_LIST4,x
		rts


;-----------------------------------------------------------------------------
; Monster movement algorithm #3 (move until hit, then random direction).
;
mmalgo3:
		inc	MM_LIST5,x	;Increment animation counter.
		lda	MM_LIST4,x	;Get direction.
		and	#%00001111	;Mask off high nibble.
		cmp	#DOWN
		bcc	mm3chk2		;Go if RIGHT or UP.
		beq	mm3down		;Go if DOWN.

mm3left:	stx	MM_INDEX
		jsr	mmsleft		;Move monster left.
		ldx	MM_INDEX
		bcs	mm3chng		;Go if couldn't move.
		rts

mm3down:	stx	MM_INDEX
		jsr	mmsdown		;Move monster down.
		ldx	MM_INDEX
		bcs	mm3chng		;Go if couldn't move.
		rts

mm3chng:	jsr	randnum		;Get random number.
		and	#%00000011
		sta	T1
		asl	a
		adc	T1		;A = 0, 3, 6, or 9.
		sta	T1
		lda	MM_LIST4,x	;Get old direction.
		and	#%11110000	;Mask off low nibble.
		ora	T1
		sta	MM_LIST4,x	;Set new direction.
		rts

mm3chk2:	cmp	#UP
		bcs	mm3up		;Go if UP.

mm3right:	stx	MM_INDEX
		jsr	mmsright	;Move monster right.
		ldx	MM_INDEX
		bcs	mm3chng		;Go if couldn't move.
		rts

mm3up:		stx	MM_INDEX
		jsr	mmsup		;Move monster up.
		ldx	MM_INDEX
		bcs	mm3chng		;Go if couldn't move.
		rts


;-----------------------------------------------------------------------------
; Monster movement algorithm #4 (move towards robot).
;
mmalgo4:
		inc	MM_LIST5,x	;Increment animation counter.
		lda	ROBOT_Y
		cmp	#$f8
		bcc	mm4cont		;Continue if robot on screen.
		rts

mm4cont:	lda	MM_LIST3,x	;Get Y position.
		cmp	ROBOT_Y
		beq	mm4chkx
		bcc	mm4incy

		dec	MM_LIST3,x	;Decrement Y position.
		jmp	mm4chkx		;Continue.

mm4incy:	inc	MM_LIST3,x	;Increment Y position.

mm4chkx:	lda	MM_LIST2,x	;Get MSB X position.
		cmp	ROBOT_X+1
		beq	mm4chkx2
		bcc	mm4incx

mm4decx:	lda	MM_LIST1,x	;Decrement X position.
		bne	mm4decx2
		dec	MM_LIST2,x
mm4decx2:	dec	MM_LIST1,x

mm4done:	stx	MM_INDEX
		ldy	MM_LIST3,x	;Y = Y position.
		lda	MM_LIST2,x	;Get MSB X position.
		pha
		lda	MM_LIST1,x	;Get LSB X position.
		tax			;X = LSB X position.
		pla			;A = MSB X position.
		jsr	clsn_rob	;Kill robot if he got in the way.
		ldx	MM_INDEX
		rts

mm4chkx2:	lda	MM_LIST1,x	;Get LSB X position.
		cmp	ROBOT_X
		beq	mm4done
		bcs	mm4decx

mm4incx:	inc	MM_LIST1,x	;Increment X position.
		bne	mm4done
		inc	MM_LIST2,x
		jmp	mm4done		;Continue.


;-----------------------------------------------------------------------------
; Check if monster hits object number in A or not.
;
; MUST NOT CHANGE: A, X, Y
; Returns: carry flag set if monster cannot pass through object.
;
chkmhit:	;Entry point to test for radioactive rock.
		cmp	#MRROCK
		bcc	chkmhit2
		cmp	#IROCK
		bcs	chkmhit2

		pha			;Save A.
		txa
		pha			;Save X.
		ldx	MM_INDEX
		jsr	makmrad		;Make robot radioactive.
		pla
		tax			;Restore X.
		pla			;Restore A.
		sec
		rts

chkmhit2:	;Entry point to skip radioactive rock test.
		cmp	#MUD-8
		bcc	cmhcont		;Go if not MUD or LAVA.
		cmp	#LAVA-8
		bcs	cmhlava		;Go if LAVA.

cmhmud:		pha			;Save A.
		txa
		pha			;Save X.
		ldx	MM_INDEX
		lda	MM_LIST,x	;Get monster number.
		cmp	#MUD_MON
		bne	cmhabort
		pla
		tax			;Restore X.
		pla			;Restore A.
		clc
		rts

cmhabort:	pla
		tax			;Restore X.
		pla			;Restore A.
		sec
		rts

cmhcont:	cmp	#SMOKE1		;Hits if >= SMOKE1.
		rts

cmhlava:	pha			;Save A.
		txa
		pha			;Save X.
		ldx	MM_INDEX
		lda	MM_LIST,x	;Get monster number.
		cmp	#LAVA_MON
		bne	cmhabort
		pla
		tax			;Restore X.
		pla			;Restore A.
		clc
		rts


;-----------------------------------------------------------------------------
; Check for monster horizontal collision with background.
;
; Entry: T1 = X MOD 16, T2 = Y MOD 16, T3 = X DIV 16, T4 = Y DIV 16
; Changes: A, X, Y
; Returns: carry flag set if collision occured.
;
clsn_mh:
		ldx	T3		;Get X grid position in X.
		ldy	T4		;Get Y grid position in Y.

       		lda	T2		;Get Y fraction.
		cmp	#1
		bcs	cmh_cnt1	;Go if against 2nd block.
		jsr	getbgblk	;Get the 1st block.
		jsr	chkmhit		;Check if monster hits block or not.
		bcs	cmh_hit		;Go if NOT ok to move.
		jmp	cmh_ok		;Go move it.

cmh_cnt1:	jsr	getbgblk	;Get 1st block.
		jsr	chkmhit		;Check if monster hits block or not.
		bcc	cmh_cnt2	;Go if no collision.
		iny			;Point to 2nd block.
		jsr	getbgblk	;Get the 2nd block.
		jsr	chkmhit		;Check if monster hits block or not.
		jmp	cmh_hit		;Continue.

cmh_cnt2:	iny			;Point to 2nd block.
		jsr	getbgblk	;Get the 2nd block.
		jsr	chkmhit		;Check if monster hits block or not.
		bcs	cmh_hit		;Go if NOT ok to move.

cmh_ok:		clc			;Report NO collision.
		rts
cmh_hit:	sec			;Report collision.
		rts


;-----------------------------------------------------------------------------
; Check for monster vertical collision with background.
;
; Entry: T1 = X MOD 16, T2 = Y MOD 16, T3 = X DIV 16, T4 = Y DIV 16
; Changes: A, X, Y
; Returns: carry flag set if collision occured.
;
clsn_mv:
		ldx	T3		;Get X grid position in X.
		ldy	T4		;Get Y grid position in Y.

       		lda	T1		;Get X fraction.
		cmp	#1
		bcs	cmv_cnt1	;Go if against 2nd block.
		jsr	getbgblk	;Get the 1st block.
		jsr	chkmhit		;Check if monster hits block or not.
		bcs	cmv_hit		;Go if NOT ok to move.
		jmp	cmv_ok		;Go move it.

cmv_cnt1:	jsr	getbgblk	;Get 1st block.
		jsr	chkmhit		;Check if monster hits block or not.
		bcc	cmv_cnt2	;Go if no collision.
		inx			;Point to 2nd block.
		jsr	getbgblk	;Get the 2nd block.
		jsr	chkmhit		;Check if monster hits block or not.
		jmp	cmv_hit		;Continue.

cmv_cnt2:	inx			;Point to 2nd block.
		jsr	getbgblk	;Get the 2nd block.
		jsr	chkmhit		;Check if monster hits block or not.
		bcs	cmv_hit		;Go if NOT ok to move.

cmv_ok:		clc			;Report NO collision.
		rts
cmv_hit:	sec			;Report collision.
		rts


;-----------------------------------------------------------------------------
; Make monster radioactive.
;
; Entry: X = index into MM_LIST
; Changes: A
;
makmrad:
		lda	MM_RADF
		bne	mmrdone		;Exit if flag not zero.
		lda	MM_LIST,x	;Get monster number.
		cmp	#SR_MON
		bcc	mmrdone		;Go if < SR_MON.
		cmp	#RR_MON
		bcs	mmrdone		;Go if >= RR_MON.
		lda	#RR_MON
		sta	MM_LIST,x	;Set new monster number.
mmrdone:	rts


;-----------------------------------------------------------------------------
; Move monster left.
;
mmsleft:
		lda	MM_LIST7,x	;Get direction last moved.
		and	#%00001111	;Mask off high nibble.
		sec
		sbc	#LEFT
		sta	MM_RADF		;Set radioactive enable flag.

		lda	MM_LIST2,x	;Get MSB X position.
		ldy	MM_LIST1,x	;Get LSB X position.
		bne	mslchk2
		sec
		sbc	#1
mslchk2:	dey
		pha			;Save new MSB X.
		tya
		ldy	MM_LIST3,x	;Y = Y position.
		tax			;X = LSB X position.
		pla			;A = MSB X position.

		jsr	clsn_rob	;Kill robot if he got in the way.

		jsr	calcxy		;Calculate grid X,Y.
		jsr	clsn_mh		;Check for collision with background.
		bcs	mslhit		;Go if can't move.

		ldx	MM_INDEX
		lda	MM_LIST2,x	;Get MSB X position.
		ldy	MM_LIST1,x	;Get LSB X position.
		bne	mslchk3
		sec
		sbc	#1
mslchk3:	dey
		pha			;Save new MSB X.
		tya
		ldy	MM_LIST3,x	;Y = Y position.
		tax			;X = LSB X position.
		pla			;A = MSB X position.

		jsr	clsnmmo		;Check if hit moving object.
		ldx	MM_INDEX
		cmp	#MRROCK
		bcc	mslcmp2
		cmp	#IROCK
		bcs	mslhit		;Go if can't move.
		jsr	makmrad		;Make monster radioactive.
		jmp	mslhit		;Go if can't move.
mslcmp2:	cmp	#0
		bne	mslhit		;Go if can't move.

mslmove:	lda	MM_LIST1,x	;Move left one pixel.
		bne	mslcont
		dec	MM_LIST2,x
mslcont:	dec	MM_LIST1,x

		lda	MM_LIST4,x	;Get direction.
		and	#%11110000	;Mask off low nibble.
		ora	#LEFT
		sta	MM_LIST4,x	;Set direction.
		sta	MM_LIST7,x	;Set direction last moved.
		clc
		rts			;Return with carry flag clear.

mslhit:		sec
		rts			;Return with carry flag set.


;-----------------------------------------------------------------------------
; Move monster right.
;
mmsright:
		lda	MM_LIST7,x	;Get direction last moved.
		and	#%00001111	;Mask off high nibble.
		sec
		sbc	#RIGHT
		sta	MM_RADF		;Set radioactive enable flag.

		ldy	MM_LIST3,x	;Y = Y position.
		lda	MM_LIST2,x	;Get MSB X position.
		pha
		lda	MM_LIST1,x	;Get LSB X position.
		clc
		adc	#1
		tax			;X = LSB X position + 1.
		pla			;A = MSB X position + 1.
		adc	#0

		jsr	clsn_rob	;Kill robot if he got in the way.

		pha
		txa
		clc
		adc	#15		;Point to right edge of monster.
		tax
		pla
		adc	#0

		jsr	calcxy		;Calculate grid X,Y.
		jsr	clsn_mh		;Check for collision with background.
		bcs	msrhit		;Go if can't move.

		ldx	MM_INDEX
		lda	MM_LIST1,x	;Get LSB X position.
		clc
		adc	#1
		tay
		lda	MM_LIST2,x	;Get MSB X position.
		adc	#0
		pha			;Save new MSB X.
		tya
		ldy	MM_LIST3,x	;Y = Y position.
		tax			;X = LSB X position.
		pla			;A = MSB X position.

		jsr	clsnmmo		;Check if hit moving object.
		ldx	MM_INDEX
		cmp	#MRROCK
		bcc	msrcmp2
		cmp	#IROCK
		bcs	msrhit		;Go if can't move.
		jsr	makmrad		;Make monster radioactive.
		jmp	msrhit		;Go if can't move.
msrcmp2:	cmp	#0
		bne	msrhit		;Go if can't move.

msrmove:	inc	MM_LIST1,x	;Move right one pixel.
		bne	msrcont
		inc	MM_LIST2,x
msrcont:
		lda	MM_LIST4,x	;Get direction.
		and	#%11110000	;Mask off low nibble.
		ora	#RIGHT
		sta	MM_LIST4,x	;Set direction.
		sta	MM_LIST7,x	;Set direction last moved.
		clc
		rts			;Return with carry flag clear.

msrhit:		sec
		rts			;Return with carry flag set.


;-----------------------------------------------------------------------------
; Move monster up.
;
mmsup:
		lda	MM_LIST7,x	;Get direction last moved.
		and	#%00001111	;Mask off high nibble.
		sec
		sbc	#UP
		sta	MM_RADF		;Set radioactive enable flag.

		ldy	MM_LIST3,x
		dey			;Y = Y position - 1.
		lda	MM_LIST2,x	;A = MSB X position.
		pha
		lda	MM_LIST1,x
		tax			;X = LSB X position.
		pla

		jsr	clsn_rob	;Kill robot if he got in the way.

		jsr	calcxy		;Calculate grid X,Y.
		jsr	clsn_mv		;Check for collision with background.
		bcs	msuhit		;Go if can't move.

		ldx	MM_INDEX
		ldy	MM_LIST3,x
		dey			;Y = Y position.
		lda	MM_LIST2,x	;A = MSB X position.
		pha
		lda	MM_LIST1,x
		tax			;X = LSB X position.
		pla

		jsr	clsnmmo		;Check if hit moving object.
		ldx	MM_INDEX
		cmp	#MRROCK
		bcc	msucmp2
		cmp	#IROCK
		bcs	msuhit		;Go if can't move.
		jsr	makmrad		;Make robot radioactive.
		jmp	msuhit		;Go if can't move.
msucmp2:	cmp	#0
		bne	msuhit		;Go if can't move.

msumove:	dec	MM_LIST3,x	;Move up one pixel.

		lda	MM_LIST4,x	;Get direction.
		and	#%11110000	;Mask off low nibble.
		ora	#UP
		sta	MM_LIST4,x	;Set direction.
		sta	MM_LIST7,x	;Set direction last moved.
		clc
		rts			;Return with carry flag clear.

msuhit:		sec
		rts			;Return with carry flag set.


;-----------------------------------------------------------------------------
; Move monster down.
;
mmsdown:
		lda	MM_LIST7,x	;Get direction last moved.
		and	#%00001111	;Mask off high nibble.
		sec
		sbc	#DOWN
		sta	MM_RADF		;Set radioactive enable flag.

		ldy	MM_LIST3,x
		iny			;Y = Y position + 1.
		lda	MM_LIST2,x	;A = MSB X position.
		pha
		lda	MM_LIST1,x
		tax			;X = LSB X position.
		pla

		jsr	clsn_rob	;Kill robot if he got in the way.

		pha
		tya
		clc
		adc	#15		;Point to bottom edge of monster.
		tay
		pla

		jsr	calcxy		;Calculate grid X,Y.
		jsr	clsn_mv		;Check for collision with background.
		bcs	msdhit		;Go if can't move.

		ldx	MM_INDEX
		ldy	MM_LIST3,x
		iny			;Y = Y position + 1.
		lda	MM_LIST2,x	;A = MSB X position.
		pha
		lda	MM_LIST1,x
		tax			;X = LSB X position.
		pla

		jsr	clsnmmo		;Check if hit moving object.
		ldx	MM_INDEX
		cmp	#MRROCK
		bcc	msdcmp2
		cmp	#IROCK
		bcs	msdhit		;Go if can't move.
		jsr	makmrad		;Make robot radioactive.
		jmp	msdhit		;Go if can't move.
msdcmp2:	cmp	#0
		bne	msdhit		;Go if can't move.

msdmove:	inc	MM_LIST3,x	;Move down one pixel.

		lda	MM_LIST4,x	;Get direction.
		and	#%11110000	;Mask off low nibble.
		ora	#DOWN
		sta	MM_LIST4,x	;Set direction.
		sta	MM_LIST7,x	;Set direction last moved.
		clc
		rts			;Return with carry flag clear.

msdhit:		sec
		rts			;Return with carry flag set.


;-----------------------------------------------------------------------------
; Push monster left.
;
pmleft:
		lda	#0
		sta	MM_RADF		;Clear radioactive enable flag.

		lda	MM_LIST2,x	;Get MSB X position.
		ldy	MM_LIST1,x	;Get LSB X position.
		bne	pmlchk2
		sec
		sbc	#1
pmlchk2:	dey
		pha			;Save new MSB X.
		tya
		ldy	MM_LIST3,x	;Y = Y position.
		tax			;X = LSB X position.
		pla			;A = MSB X position.

		jsr	clsn_rob	;Kill robot if he got in the way.

		jsr	calcxy		;Calculate grid X,Y.
		jsr	clsn_mh		;Check for collision with background.
		bcs	pmlhit		;Go if can't move.

		ldx	MM_INDEX
		lda	MM_LIST2,x	;Get MSB X position.
		ldy	MM_LIST1,x	;Get LSB X position.
		bne	pmlchk3
		sec
		sbc	#1
pmlchk3:	dey
		pha			;Save new MSB X.
		tya
		ldy	MM_LIST3,x	;Y = Y position.
		tax			;X = LSB X position.
		pla			;A = MSB X position.

		jsr	clsnmmo		;Check if hit moving object.
		ldx	MM_INDEX
		cmp	#MRROCK
		bcc	pmlcmp2
		cmp	#IROCK
		bcs	pmlhit		;Go if can't move.
		jsr	makmrad		;Make monster radioactive.
		jmp	pmlhit		;Go if can't move.
pmlcmp2:	cmp	#0
		bne	pmlhit		;Go if can't move.

pmlmove:	lda	MM_LIST1,x	;Move left one pixel.
		bne	pmlcont
		dec	MM_LIST2,x
pmlcont:	dec	MM_LIST1,x
		clc
		rts			;Return with carry flag clear.

pmlhit:		sec
		rts			;Return with carry flag set.


;-----------------------------------------------------------------------------
; Move monster right.
;
pmright:
		lda	#0
		sta	MM_RADF		;Set radioactive enable flag.

		ldy	MM_LIST3,x	;Y = Y position.
		lda	MM_LIST2,x	;Get MSB X position.
		pha
		lda	MM_LIST1,x	;Get LSB X position.
		clc
		adc	#1
		tax			;X = LSB X position + 1.
		pla			;A = MSB X position + 1.
		adc	#0

		jsr	clsn_rob	;Kill robot if he got in the way.

		pha
		txa
		clc
		adc	#15		;Point to right edge of monster.
		tax
		pla
		adc	#0

		jsr	calcxy		;Calculate grid X,Y.
		jsr	clsn_mh		;Check for collision with background.
		bcs	pmrhit		;Go if can't move.

		ldx	MM_INDEX
		lda	MM_LIST1,x	;Get LSB X position.
		clc
		adc	#1
		tay
		lda	MM_LIST2,x	;Get MSB X position.
		adc	#0
		pha			;Save new MSB X.
		tya
		ldy	MM_LIST3,x	;Y = Y position.
		tax			;X = LSB X position.
		pla			;A = MSB X position.

		jsr	clsnmmo		;Check if hit moving object.
		ldx	MM_INDEX
		cmp	#MRROCK
		bcc	pmrcmp2
		cmp	#IROCK
		bcs	pmrhit		;Go if can't move.
		jsr	makmrad		;Make monster radioactive.
		jmp	pmrhit		;Go if can't move.
pmrcmp2:	cmp	#0
		bne	pmrhit		;Go if can't move.

pmrmove:	inc	MM_LIST1,x	;Move right one pixel.
		bne	pmrcont
		inc	MM_LIST2,x
pmrcont:	clc
		rts			;Return with carry flag clear.

pmrhit:		sec
		rts			;Return with carry flag set.


;-----------------------------------------------------------------------------
; Seed random number generator.
;
seedrand:
		lda	#$fd
		sta	RNDNUM1
		lda	#$43
		sta	RNDNUM2
		lda	#$03
		sta	RNDNUM3
		rts


;-----------------------------------------------------------------------------
; Get next pseudo random number.
;
randnum:
		lda	RNDNUM1
		clc
		adc	#$c3
		sta	RNDNUM1
		lda	RNDNUM2
		adc	#$9e
		sta	RNDNUM2
		lda	RNDNUM3
		adc	#$26
		sta	RNDNUM3
		rts


;-----------------------------------------------------------------------------
; Scan level for any rocks or crystals that need to be moved.
;
; Uses: T8
;
scanlev:
		lda	SCANNING	;Check scanning flag.
		bne	sclcont		;Go if set.

sclstart:	lda	#1
		sta	SCAN_X		;Set starting X scan position.
		sta	SCANNING	;Set scanning flag.
		lda	#13
		sta	SCAN_Y		;Set starting Y scan position.

sclcont:	ldx	SCAN_X		;Get current X position.
		ldy	SCAN_Y		;Get current Y position.
		lda	#MAX_MVCK+1
		sta	SL_CHKD		;Set # of blocks to check.

sclloop:	dec	SL_CHKD		;Decrement # of blocks checked.
		beq	sclabort	;Abort if checked max. for this 1/60.
		jsr	getbgblk	;Get block.
		cmp	#CRYSTAL
		bcc	sclnext		;Go to next block if < CRYSTAL.
		cmp	#RROCK
		bcc	sclchk		;Go if movable object.
		cmp	#MUD
		bne	sclchkl
		jmp	sclmud		;Go if MUD.
sclchkl:	cmp	#LAVA
		bne	sclnext
		jmp	scllava		;Go if LAVA.

sclnext:	inx			;Increment X.
		cpx	#31
		bcc	sclloop		;Continue if X < 31.

		ldx	#1		;Reset X position.
		dey
		cpy	#3
		bcs	sclloop		;Continue if Y >= 3.

		lda	#0
		sta	SCANNING	;Reset scanning flag.
scldone:	rts

sclabort:	stx	SCAN_X		;Save current X position.
		sty	SCAN_Y		;Save current Y position.
		rts

sclchk:		pha
		iny

		sty	T8		;Save Y.
		ldy	#0
		sta	(T5),y		;Store object with high bit clear.
		ldy	T8		;Restore Y.
		lda	LAST_BLK
		pha			;Save value of object with high bit.

		jsr	chkobjs		;Check for objects at (X,Y+1).
		bcs	sclchk2		;Go if square not empty.

		pla			;Retrieve object # with high bit.
		bmi	sclnospr	;Go if high bit set.
		jsr	chksprb		;Check for sprite below object.
		dey
		bcs	scljnxt		;Go if sprite holding up object.

sclfall:	lda	#DOWN
		sta	T8		;Set direction.
		pla
		jsr	addmobj		;Make into moving object.
		bcs	scldone		;Abort if out of sprites.
		jmp	sclnext		;Go check next square.

sclnospr:	cmp	#CRYSTAL|%10000000
		bne	sclnscnt	;Go if not CRYSTAL.
		jsr	chksprb		;Check for sprite below object.
		dey
		cmp	#0
		bne	sclfall		;Go if robot NOT holding up object.
		pla
		jmp	sclnext		;Go if robot holding up object.

sclnscnt:	dey
		jmp	sclfall		;Go make object fall.

sclchk2:	dey
		cmp	#CRYSTAL
		bcc	scljnxt2	;Go if < CRYSTAL.
		cmp	#RROCK
		bcs	scljnxt2	;Go if >= RROCK.

		pla
		dex
		jsr	chkobjs		;Check for objects at (X-1,Y).
		inx
		bcs	sclchk3		;Go if square not empty.

		dex
		iny
		jsr	chkobjs		;Check for objects at (X-1,Y+1).
		inx
		dey
		bcs	sclchk3		;Go if square not empty.

		dex
		jsr	chksprnl	;Check for sprite next to object.
		inx
		bcs	scljnxt		;Go if sprite blocks object movement.

		lda	#LEFT
		sta	T8		;Set direction.
		pla
		jsr	addmobj		;Make into moving object.
		bcs	scljdne		;Abort if out of sprites.
		jmp	sclnext		;Go check next square.

scljnxt2:	pla
scljnxt:	pla
		jmp	sclnext		;Go check next square.

sclchk3:	inx
		jsr	chkobjs		;Check for objects at (X+1,Y).
		dex
		bcs	scljnxt		;Go if square not empty.

		inx
		iny
		jsr	chkobjs		;Check for objects at (X+1,Y+1).
		dex
		dey
		bcs	scljnxt		;Go if square not empty.

		inx
		jsr	chksprnr	;Check for sprite next to object.
		dex
		bcs	scljnxt		;Go if sprite blocks object movement.

		lda	#RIGHT
		sta	T8		;Set direction.
		pla
		jsr	addmobj		;Make into moving object.
		bcs	scljdne		;Abort if out of sprites.
		jmp	sclnext		;Go check next square.
scljdne:	jmp	scldone

sclmud:		jsr	randnum		;Get random number.
		cmp	#$04
		bcs	sclmdn

		lda	RNDNUM2		;Get random number 2.
		cmp	#$80
		bcc	sclmy		;Go change Y.
		cmp	#$c0
		bcc	sclmx2
		inx
		lda	#ANMUDR
		jsr	growmud		;Make mud grow into (X+1,Y).
		dex
		jmp	sclnext		;Continue.
sclmx2:		dex
		lda	#ANMUDL
		jsr	growmud		;Make mud grow into (X-1,Y).
		inx
		jmp	sclnext		;Continue.
sclmy:		cmp	#$40
		bcc	sclmy2
		iny
		lda	#ANMUDD
		jsr	growmud		;Make mud grow into (X,Y+1).
		dey
		jmp	sclnext		;Continue.
sclmy2:		dey
		lda	#ANMUDU
		jsr	growmud		;Make mud grow into (X,Y-1).
		iny
sclmdn:		jmp	sclnext		;Go check next square.

scllava:	jsr	randnum		;Get random number.
		cmp	#$05
		bcs	sclldn

		lda	RNDNUM2		;Get random number 2.
		cmp	#$80
		bcc	sclly		;Go change Y.
		cmp	#$c0
		bcc	scllx2
		inx
		lda	#ANLAVAR
		jsr	growlava	;Make lava grow into (X+1,Y).
		dex
		jmp	sclnext		;Continue.
scllx2:		dex
		lda	#ANLAVAL
		jsr	growlava	;Make lava grow into (X-1,Y).
		inx
		jmp	sclnext		;Continue.
sclly:		cmp	#$40
		bcc	sclly2
		iny
		lda	#ANLAVAD
		jsr	growlava	;Make lava grow into (X,Y+1).
		dey
		jmp	sclnext		;Continue.
sclly2:		dey
		lda	#ANLAVAU
		jsr	growlava	;Make lava grow into (X,Y-1).
		iny
sclldn:		jmp	sclnext		;Go check next square.


;-----------------------------------------------------------------------------
; Make mud grow into adjacent square.
;
growmud:
		pha			;Save animation number.
		jsr	getbgblk	;Get block at (X,Y).
		cmp	#SMOKE1
		bcs	gmcont		;Continue if square not empty.

gmgrow:		pla			;Get animation number.
		jsr	startani	;Do animation.
		rts

gmcont:		cmp	#DIRT
		bcc	gmdone		;Exit if can't grow.
		cmp	#HMUD+1
		bcc	gmgrow		;Go if DIRT, HDIRT, or HMUD.
		cmp	#LAVA
		bne	gmdone		;Go if not LAVA.

		pla			;Get animation number.
		clc
		adc	#ANRMUDL-ANMUDL	;Adjust for HROCK animations.
		jsr	startani	;Do animation.
		rts

gmdone:		pla
		rts


;-----------------------------------------------------------------------------
; Make lava grow into adjacent square.
;
growlava:
		pha			;Save animation number.
		jsr	getbgblk	;Get block at (X,Y).
		cmp	#SMOKE1
		bcs	glcont		;Continue if square not empty.

glgrow:		pla			;Get animation number.
		jsr	startani	;Do animation.
		rts

glbomb:		jsr	rembomb		;Remove bomb from bomb list.
glexpl:		lda	#6		;Set explosion counter.
		jsr	addexpl		;Add explosion to bomb list.
		pla
		rts

glcont:		cmp	#CRYSTAL
		bcc	gldone		;Exit if can't grow.
		cmp	#HROCK
		bcc	glgrow		;Go if CRYSTAL or SROCK.
		cmp	#EROCK
		beq	glexpl		;Go if EROCK.
		cmp	#BOMB
		beq	glbomb		;Go if BOMB.
		bcc	gldone
		cmp	#HMUD+1
		bcc	glgrow		;Go if DIRT, HDIRT, or HMUD.
		cmp	#MUD
		bne	gldone		;Go if not MUD.

		pla			;Get animation number.
		clc
		adc	#ANRLAVAL-ANLAVAL	;Adjust for HROCK animations.
		jsr	startani	;Do animation.
		rts

gldone:		pla
		rts


;-----------------------------------------------------------------------------
; Add object to moving object list.
;
; Entry: A = object number, X = X position, Y = Y position, T8 = direction.
; Must preserve: X, Y
; Uses: T7, T8
;
addmobj:
		sta	T7		;Save A.
		txa
		pha			;Save X.

		ldx	#0
amoloop:	lda	MV_LIST,x	;Get object number.
		beq	amofnd		;Go if found empty slot.
amonext:	inx
		cpx	LMAX_MV
		bcc	amoloop		;Loop.

		pla
		tax			;Restore X.
		sec			;Signal list full.
		rts

amofnd:		lda	T7		;Get object number.
		sta	MV_LIST,x	;Store it.

		pla			;Retrieve X grid position.
		pha
		asl	a		;Adjust & store it.
		asl	a
		asl	a
		asl	a
		sta	MV_LIST1,x	;Store LSB X sprite position.
		lda	#0
		rol	a
		sta	MV_LIST2,x	;Store MSB X sprite position.

		tya			;Get Y grid position.
		asl	a		;Adjust & store it.
		asl	a
		asl	a
		asl	a
		sta	MV_LIST3,x	;Store Y sprite position.

		lda	T8
		sta	MV_LIST4,x	;Store direction.

		lda	#16
		sta	MV_LIST5,x	;Set pixel count to move.

		tya
		sta	MV_LIST7,x	;Store Y grid position #1.
		pla			;Retrieve X grid position.
		sta	MV_LIST6,x	;Store X grid position.

		tax			;Restore X.
		jsr	getbgblk	;Get block.
		lda	#EMPTY
		jsr	qblock		;Make vacated block empty.

		clc			;Signal success.
		rts


;-----------------------------------------------------------------------------
; Check for sprite collision with robot.
;
; Entry: A = MSB X position, X = LSB X position, Y = Y position.
; Changes: T7, TY1-TY2, TXL1-TXL2, TXH1-TXH2
; Must NOT change A, X, or Y.
;
clsn_rob:
		pha			;Save A.
		sta	T7		;Temporary storage for A.

		lda	CP_FLAG
		beq	cnrcont		;Continue if not creature proof.
		jmp	cnrproof	;Go if creature proof.

cnrcont:	tya
		pha			;Save Y.
		sec
		sbc	#16-MV_ADJ
		sta	TY1		;TY1 = Y - (16-MV_ADJ).
		clc
		adc	#(15-MV_ADJ)+(16-MV_ADJ)
		sta	TY2		;TY2 = Y + (15-MV_ADJ).

		txa
		pha			;Save X.
		sec
		sbc	#16-MV_ADJ
		sta	TXL1
		lda	T7		;Get MSB X position.
		sbc	#0
		sta	TXH1		;TXH1:TXL1 = X - (16-MV_ADJ).

		txa
		clc
		adc	#15-MV_ADJ
		sta	TXL2
		lda	T7		;Get MSB X position.
		adc	#0
		sta	TXH2		;TXH2:TXL2 = X + (15-MV_ADJ).

		lda	ROBOT_Y		;Get Y position.
		cmp	TY1
		bcc	cnrnohit	;Continue if no hit.
		cmp	TY2
		bcs	cnrnohit	;Continue if no hit.

		lda	ROBOT_X+1	;Get MSB X position.
		cmp	TXH1
		bcc	cnrnohit	;Continue if no hit.
		bne	cnrx2		;Go check upper X range.
		lda	ROBOT_X		;Get LSB X position.
		cmp	TXL1		;Get X.
		bcc	cnrnohit	;Continue if no hit.

cnrx2:		lda	ROBOT_X+1	;Get MSB X position.
		cmp	TXH2
		bcc	cnrhit		;Go if hit.
		bne	cnrnohit	;Continue if no hit.
		lda	ROBOT_X		;Get LSB X position.
		cmp	TXL2		;Get X.
		bcs	cnrnohit	;Go if not hit.

cnrhit:		lda	#0		;Do not blow up robot.
		jsr	kilrobot	;Destroy robot.

cnrnohit:	pla
		tax			;Restore X.
		pla
		tay			;Restore Y.
cnrproof:	pla			;Restore A.
		rts


;-----------------------------------------------------------------------------
; Check for robot collision with moving object.
;
; Entry: A = MSB X position, X = LSB X position, Y = Y position.
; Returns: A = 0 if no collision or object number if collision,
;          X = index into MV_LIST of object hit.
; Changes: T7, TY1-TY4, TXL1-TXL4, TXH1-TXH4
;
clsnmobj:
		sta	T7		;Save A.
		
		tya
		sec
		sbc	#15
		sta	TY1		;TY1 = Y - 15.
		clc
		adc	#15+16
		sta	TY2		;TY2 = Y + 16.

		txa
		sec
		sbc	#15
		sta	TXL1
		lda	T7		;Get MSB X position.
		sbc	#0
		sta	TXH1		;TXH1:TXL1 = X - 15.

		txa
		clc
		adc	#16
		sta	TXL2
		lda	T7		;Get MSB X position.
		adc	#0
		sta	TXH2		;TXH2:TXL2 = X + 16.

		tya
		sec
		sbc	#15-MV_ADJ
		sta	TY3		;TY3 = Y - (15-MV_ADJ).
		clc
		adc	#(15-MV_ADJ)+(16-MV_ADJ)
		sta	TY4		;TY4 = Y + (16-MV_ADJ).

		txa
		sec
		sbc	#15-MV_ADJ
		sta	TXL3
		lda	T7		;Get MSB X position.
		sbc	#0
		sta	TXH3		;TXH3:TXL3 = X - (15-MV_ADJ).

		txa
		clc
		adc	#16-MV_ADJ
		sta	TXL4
		lda	T7		;Get MSB X position.
		adc	#0
		sta	TXH4		;TXH4:TXL4 = X + (16-MV_ADJ).

		ldx	#0
cmoloop:	lda	MV_LIST,x	;Get object number.
		beq	cmonext		;Continue if not active.

		lda	MV_LIST3,x	;Check Y position.
		cmp	TY1
		bcc	cmonext		;Continue if no hit.
		cmp	TY2
		bcs	cmonext		;Continue if no hit.

		lda	MV_LIST2,x	;Check MSB X position.
		cmp	TXH1
		bcc	cmonext		;Continue if no hit.
		bne	cmox2		;Go check upper X range.
		lda	MV_LIST1,x	;Check LSB X position.
		cmp	TXL1
		bcc	cmonext		;Continue if no hit.

cmox2:		lda	MV_LIST2,x	;Check MSB X position.
		cmp	TXH2
		bcc	cmohit		;Go if hit.
		bne	cmonext		;Continue if no hit.
		lda	MV_LIST1,x	;Check LSB X position.
		cmp	TXL2
		bcc	cmohit		;Go if hit.

cmonext:	inx
		cpx	LMAX_MV
		bcc	cmoloop		;Loop.

		lda	#0		;Signal no collision.
		rts

		;Check if really hit object (allow for rounded edges).
cmohit:
		lda	MV_LIST3,x	;Check Y position.
		cmp	TY3
		bcc	cmochkx		;Continue if no hit.
		cmp	TY4
		bcs	cmochkx		;Continue if no hit.

cmohit2:	lda	MV_LIST,x	;Return object number of object hit.
		rts

cmochkx:	lda	MV_LIST2,x	;Check MSB X position.
		cmp	TXH3
		bcc	cmonext		;Continue if no hit.
		bne	cmohx2		;Go check upper X range.
		lda	MV_LIST1,x	;Check LSB X position.
		cmp	TXL3		;Get X.
		bcc	cmonext		;Continue if no hit.

cmohx2:		lda	MV_LIST2,x	;Check MSB X position.
		cmp	TXH4
		bcc	cmohit2		;Go if hit.
		bne	cmonext		;Continue if no hit.
		lda	MV_LIST1,x	;Check LSB X position.
		cmp	TXL4		;Get X.
		bcc	cmohit2		;Go if hit.
		jmp	cmonext		;Continue if no hit.


;-----------------------------------------------------------------------------
; Check for monster collision with moving object.
;
; Entry: A = MSB X position, X = LSB X position, Y = Y position.
; Returns: A = 0 if no collision or object number if collision,
;          X = index into MV_LIST of object hit.
; Changes: T7, TY1-TY2, TXL1-TXL2, TXH1-TXH2
;
clsnmmo:
		sta	T7		;Save A.
		
		tya
		sec
		sbc	#15
		sta	TY1		;TY1 = Y - 15.
		clc
		adc	#15+16
		sta	TY2		;TY2 = Y + 16.

		txa
		sec
		sbc	#15
		sta	TXL1
		lda	T7		;Get MSB X position.
		sbc	#0
		sta	TXH1		;TXH1:TXL1 = X - 15.

		txa
		clc
		adc	#16
		sta	TXL2
		lda	T7		;Get MSB X position.
		adc	#0
		sta	TXH2		;TXH2:TXL2 = X + 16.

		ldx	#0
cmmloop:	lda	MV_LIST,x	;Get object number.
		beq	cmmnext		;Continue if not active.

		lda	MV_LIST3,x	;Check Y position.
		cmp	TY1
		bcc	cmmnext		;Continue if no hit.
		cmp	TY2
		bcs	cmmnext		;Continue if no hit.

		lda	MV_LIST2,x	;Check MSB X position.
		cmp	TXH1
		bcc	cmmnext		;Continue if no hit.
		bne	cmmx2		;Go check upper X range.
		lda	MV_LIST1,x	;Check LSB X position.
		cmp	TXL1
		bcc	cmmnext		;Continue if no hit.

cmmx2:		lda	MV_LIST2,x	;Check MSB X position.
		cmp	TXH2
		bcc	cmmhit		;Go if hit.
		bne	cmmnext		;Continue if no hit.
		lda	MV_LIST1,x	;Check LSB X position.
		cmp	TXL2
		bcc	cmmhit		;Go if hit.

cmmnext:	inx
		cpx	LMAX_MV
		bcc	cmmloop		;Loop.

		lda	#0		;Signal no collision.
		rts

cmmhit:		lda	MV_LIST,x	;Return object number of object hit.
		rts


;-----------------------------------------------------------------------------
; Move robot left.
;
mvleft:
		lda	ROBOT_X+1	;Check X position.
		bne	mvlchk		;Continue if X > 255.
		lda	ROBOT_X
		bne	mvlchk		;Continue if X >= 1.
		jmp	mvldir		;Go set direction & animate.

mvlchk:		ldy	ROBOT_X+1
		ldx	ROBOT_X
		bne	mvlchk2
		dey
mvlchk2:	dex			;X = LSB X position.
		tya			;A = MSB X position.
		ldy	ROBOT_Y		;Y = Y pos.

		jsr	calcxy		;Calculate grid X,Y.
		lda	#LEFT
		sta	PUSH_DIR	;Set push direction.
		sta	ROB_MOV		;Set robot movement direction flag.
		jsr	clsn_rh		;Check for collision with background.
		bcs	mvldir		;Go if can't move.

		ldy	ROBOT_X+1
		ldx	ROBOT_X
		bne	mvlchk3
		dey
mvlchk3:	dex			;X = LSB X position.
		tya			;A = MSB X position.
		ldy	ROBOT_Y		;Y = Y pos.

		jsr	clsnmobj	;Check if hit moving object.
		cmp	#MRROCK
		bcc	mvlcmp2
		cmp	#IROCK
		bcs	mvldir		;Go if can't move.
		jsr	makrrad		;Make robot radioactive.
		jmp	mvldir		;Go if can't move.
mvlcmp2:	cmp	#0
		bne	mvldir		;Go if can't move.

mvlmove:	lda	ROBOT_X		;Move left one pixel.
		bne	mvlcont
		dec	ROBOT_X+1
mvlcont:	dec	ROBOT_X

		inc	MV_FLAG		;Set moved left/right flag.
		jmp	mvldir2		;Continue.

mvldir:		lda	TMP_VAL		;Get position flags.
		and	#J_UP|J_DOWN	;Check for UP or DOWN.
		beq	mvldir2		;Go if not one pressed.
		jmp	mvranim		;Go if one pressed.

mvldir2:	lda	MRR_LAST
		cmp	#LEFT
		beq	mvldirc		;Continue.
		lda	#0
		sta	MRR_CNT		;Reset hit counter.

mvldirc:	lda	ROBOT_F
		ora	#%01000000	;Set left/right flip bit.
		jmp	mvrcont		;Continue.


;-----------------------------------------------------------------------------
; Move robot right.
;
mvright:
		lda	ROBOT_X+1	;Check X position.
		beq	mvrchk		;Continue if X < 256.
		lda	ROBOT_X
		cmp	#240
		bcc	mvrchk		;Continue if X < 496.
		jmp	mvrdir		;Go set direction & animate.

mvrchk:		lda	ROBOT_X
		clc
		adc	#16		;Point to right edge of ROBOT.
		tax			;X = LSB X position.
		lda	ROBOT_X+1
		adc	#0		;A = MSB X position.
		ldy	ROBOT_Y		;Y = Y pos.

		jsr	calcxy		;Calculate grid X,Y.
		lda	#RIGHT
		sta	PUSH_DIR	;Set push direction.
		sta	ROB_MOV		;Set robot movement direction flag.
		jsr	clsn_rh		;Check for collision with background.
		bcs	mvrdir		;Go if can't move.

		lda	ROBOT_X
		clc
		adc	#1
		tax			;X = LSB X position.
		lda	ROBOT_X+1
		adc	#0		;A = MSB X position.
		ldy	ROBOT_Y		;Y = Y pos.

		jsr	clsnmobj	;Check if hit moving object.
		cmp	#MRROCK
		bcc	mvrcmp2
		cmp	#IROCK
		bcs	mvrdir		;Go if can't move.
		jsr	makrrad		;Make robot radioactive.
		jmp	mvrdir		;Go if can't move.
mvrcmp2:	cmp	#0
		bne	mvrdir		;Go if can't move.

mvrmove:	inc	ROBOT_X		;Move right one pixel.
		bne	mvrmvcnt
		inc	ROBOT_X+1
mvrmvcnt:
		inc	MV_FLAG		;Set moved left/right flag.
		jmp	mvrdir2		;Continue.

mvrdir:		lda	TMP_VAL		;Get position flags.
		and	#J_UP|J_DOWN	;Check for UP or DOWN.
		bne	mvranim		;Go if one pressed.

mvrdir2:	lda	MRR_LAST
		cmp	#RIGHT
		beq	mvrdirc		;Continue.
		lda	#0
		sta	MRR_CNT		;Reset hit counter.

mvrdirc:	lda	ROBOT_F
		and	#%10111111	;Clear left/right flip bit.
mvrcont:	sta	ROBOT_F

		lda	#R_SIDE		;Set object to side view.
		sta	ROBOT_N

mvranim:	ldy	ROBOT_C		;Get animation counter.
		cpy	#2
		bcc	mvrcont2	;Go if less than 2.
		ldy	#255		;Reset counter.
mvrcont2:	iny			;Increment animation counter.
		sty	ROBOT_C		;Save it.
		rts


;-----------------------------------------------------------------------------
; Move robot up.
;
mvup:
		lda	ROBOT_Y		;Check Y position.
		cmp	#33
		bcs	mvuchk		;Continue if X >= 33.
		jmp	mvudir		;Go set object & animate.

mvuchk:		ldy	ROBOT_Y
		dey			;Y = Y pos.
		ldx	ROBOT_X		;X = LSB X position.
		lda	ROBOT_X+1	;A = MSB X position.

		jsr	calcxy		;Calculate grid X,Y.
		lda	#0
		sta	PSHL_CNT	;Clear push-left counter.
		sta	PSHR_CNT	;Clear push-right counter.
		lda	#UP
		sta	ROB_MOV		;Set robot movement direction flag.
		jsr	clsn_rv		;Check for collision with background.
		bcs	mvudir		;Go if can't move.

		ldy	ROBOT_Y
		dey			;Y = Y pos.
		ldx	ROBOT_X		;X = LSB X position.
		lda	ROBOT_X+1	;A = MSB X position.

		jsr	clsnmobj	;Check if hit moving object.
		cmp	#MRROCK
		bcc	mvucmp2
		cmp	#IROCK
		bcs	mvudir		;Go if can't move.
		jsr	makrrad		;Make robot radioactive.
		jmp	mvudir		;Go if can't move.
mvucmp2:	cmp	#0
		bne	mvudir		;Go if can't move.

mvumove:	dec	ROBOT_Y		;Move up one pixel.

mvudir:		lda	MV_FLAG		;Check if moved left or right.
		bne	mvuskip		;Skip "up" view if so.

		lda	MRR_LAST
		cmp	#UP
		beq	mvudirc		;Continue.
		lda	#0
		sta	MRR_CNT		;Reset hit counter.

mvudirc:	lda	#R_UP		;Set object to "up" view.
		sta	ROBOT_N

mvucont:	lda	ROBOT_F
		and	#%10111111	;Clear left/right flip bit.
		sta	ROBOT_F

mvuskip:	jmp	mvranim		;Go animate.


;-----------------------------------------------------------------------------
; Move robot down.
;
mvdown:
		lda	ROBOT_Y		;Check Y position.
		cmp	#224
		bcc	mvdchk		;Continue if X < 224.
		jmp	mvddir		;Go set object & animate.

mvdchk:		lda	ROBOT_Y
		clc
		adc	#16		;Point to bottom edge of robot.
		tay			;Y = Y pos.
		ldx	ROBOT_X		;X = LSB X position.
		lda	ROBOT_X+1	;A = MSB X position.

		jsr	calcxy		;Calculate grid X,Y.
		lda	#0
		sta	PSHL_CNT	;Clear push-left counter.
		sta	PSHR_CNT	;Clear push-right counter.
		lda	#DOWN
		sta	ROB_MOV		;Set robot movement direction flag.
		jsr	clsn_rv		;Check for collision with background.
		bcs	mvddir		;Go if can't move.

		ldy	ROBOT_Y
		iny			;Y = Y pos.
		ldx	ROBOT_X		;X = LSB X position.
		lda	ROBOT_X+1	;A = MSB X position.

		jsr	clsnmobj	;Check if hit moving object.
		cmp	#MRROCK
		bcc	mvdcmp2
		cmp	#IROCK
		bcs	mvddir		;Go if can't move.
		jsr	makrrad		;Make robot radioactive.
		jmp	mvddir		;Go if can't move.
mvdcmp2:	cmp	#0
		bne	mvddir		;Go if can't move.

mvdmove:	inc	ROBOT_Y		;Move down one pixel.

mvddir:		lda	MV_FLAG		;Check if moved left or right.
		bne	mvuskip		;Skip "down" view if so.

		lda	MRR_LAST
		cmp	#DOWN
		beq	mvddirc		;Continue.
		lda	#0
		sta	MRR_CNT		;Reset hit counter.

mvddirc:	lda	#R_DOWN		;Set object to "down" view.
		sta	ROBOT_N

		jmp	mvucont		;Go animate.


;-----------------------------------------------------------------------------
; Push robot left.
;
prleft:
		lda	ROBOT_X+1	;Check X position.
		bne	prlchk		;Continue if X > 255.
		lda	ROBOT_X
		bne	prlchk		;Continue if X >= 1.
		jmp	prldir		;Go set direction & animate.

prlchk:		ldy	ROBOT_X+1
		ldx	ROBOT_X
		bne	prlchk2
		dey
prlchk2:	dex			;X = LSB X position.
		tya			;A = MSB X position.
		ldy	ROBOT_Y		;Y = Y pos.

		jsr	calcxy		;Calculate grid X,Y.
		lda	#LEFT
		sta	PUSH_DIR	;Set push direction.
		sta	ROB_MOV		;Set robot movement direction flag.
		jsr	clsn_rh		;Check for collision with background.
		bcs	prldir		;Go if can't move.

		ldy	ROBOT_X+1
		ldx	ROBOT_X
		bne	prlchk3
		dey
prlchk3:	dex			;X = LSB X position.
		tya			;A = MSB X position.
		ldy	ROBOT_Y		;Y = Y pos.

		jsr	clsnmobj	;Check if hit moving object.
		cmp	#MRROCK
		bcc	prlcmp2
		cmp	#IROCK
		bcs	prldir		;Go if can't move.
		jsr	makrrad		;Make robot radioactive.
		jmp	prldir		;Go if can't move.
prlcmp2:	cmp	#0
		bne	prldir		;Go if can't move.

prlmove:	lda	ROBOT_X		;Move left one pixel.
		bne	prlcont
		dec	ROBOT_X+1
prlcont:	dec	ROBOT_X
		clc
		rts			;Return with carry clear (moved).

prldir:		sec
		rts			;Return with carry set (couldn't move).


;-----------------------------------------------------------------------------
; Push robot right.
;
prright:
		lda	ROBOT_X+1	;Check X position.
		beq	prrchk		;Continue if X < 256.
		lda	ROBOT_X
		cmp	#240
		bcc	prrchk		;Continue if X < 496.
		jmp	prrdir		;Go set direction & animate.

prrchk:		lda	ROBOT_X
		clc
		adc	#16		;Point to right edge of ROBOT.
		tax			;X = LSB X position.
		lda	ROBOT_X+1
		adc	#0		;A = MSB X position.
		ldy	ROBOT_Y		;Y = Y pos.

		jsr	calcxy		;Calculate grid X,Y.
		lda	#RIGHT
		sta	PUSH_DIR	;Set push direction.
		sta	ROB_MOV		;Set robot movement direction flag.
		jsr	clsn_rh		;Check for collision with background.
		bcs	prrdir		;Go if can't move.

		lda	ROBOT_X
		clc
		adc	#1
		tax			;X = LSB X position.
		lda	ROBOT_X+1
		adc	#0		;A = MSB X position.
		ldy	ROBOT_Y		;Y = Y pos.

		jsr	clsnmobj	;Check if hit moving object.
		cmp	#MRROCK
		bcc	prrcmp2
		cmp	#IROCK
		bcs	prrdir		;Go if can't move.
		jsr	makrrad		;Make robot radioactive.
		jmp	prrdir		;Go if can't move.
prrcmp2:	cmp	#0
		bne	prrdir		;Go if can't move.

prrmove:	inc	ROBOT_X		;Move right one pixel.
		bne	prrcont
		inc	ROBOT_X+1
prrcont:	clc
		rts			;Return with carry clear (moved).

prrdir:		sec
		rts			;Return with carry set (couldn't move).


;-----------------------------------------------------------------------------
; Add one to number of crystals picked up.
;
; Changes: X, Y, T5-T9
;
addcrys:
		inc	NUM_GEMS	;Increment count of gems picked up.
		lda	NUM_GEMS
		bne	addcrysc	;Continue if no wrap.
		lda	#255		;Reset crystal count to maximum.
		sta	NUM_GEMS
		jmp	addcrys2	;Continue.

addcrysc:	cmp	QUOTA		;Check gems collected against quota.
		bne	addcrys2	;Go if not equal.

		lda	#$ff
		sta	EXIT_ON		;Set exit on flag.
		lda	#6
		sta	SCR_FLSH	;Flash the screen background.
		ldx	EXIT_X		;Get exit square X position.
		ldy	EXIT_Y		;Get exit square Y position.
		jsr	getbgblk	;Get the background block value.
		cmp	#EMPTY
		bne	addcrys2	;Go if not empty.
		lda	#EXIT1
		jsr	qblock		;Make exit square appear.

addcrys2:	jsr	ud_gems		;Update # of gems.
		ldy	#SC100
		jsr	addscore	;Give 100 points.
		jsr	ud_score	;Update score string.
		rts


;-----------------------------------------------------------------------------
; Check if robot should pick up an object.
;
; Entry: T1 = X MOD 16, T2 = Y MOD 16, T3 = X DIV 16, T4 = Y DIV 16
;
pickup:
		ldx	T3		;Get X grid position in X.
		ldy	T4		;Get Y grid position in Y.

		lda	T1		;Get X fraction.
		cmp	#16-PU_ADJ
		bcs	pux1		;Skip ahead to X+1 blocks.

		lda	T2		;Get Y fraction.
		cmp	#16-PU_ADJ
		bcs	puxy1		;Skip ahead to Y+1 block.

		txa
		pha			;Save X.
		tya
		pha			;Save Y.
		jsr	puobject	;Check block (X,Y).
		pla
		tay			;Restore Y.
		pla
		tax			;Restore X.

		lda	T2		;Get Y fraction.
		cmp	#PU_ADJ+1
		bcc	pux		;Skip ahead to X+1 blocks.

puxy1:		txa
		pha			;Save X.
		tya
		pha			;Save Y.
		iny
		jsr	puobject	;Check block (X,Y+1).
		pla
		tay			;Restore Y.
		pla
		tax			;Restore X.

pux:		lda	T1		;Get X fraction.
		cmp	#PU_ADJ+1
		bcc	pudone		;Exit if not on X+1 blocks.

pux1:		lda	T2		;Get Y fraction.
		cmp	#16-PU_ADJ
		bcs	pux1y1		;Skip ahead to Y+1 block.

		txa
		pha			;Save X.
		tya
		pha			;Save Y.
		inx
		jsr	puobject	;Check block (X+1,Y).
		pla
		tay			;Restore Y.
		pla
		tax			;Restore X.

		lda	T2		;Get Y fraction.
		cmp	#PU_ADJ+1
		bcc	pudone		;Exit if not on Y+1 block.

pux1y1:		txa
		pha			;Save X.
		tya
		pha			;Save Y.
		inx
		iny
		jsr	puobject	;Check block (X+1,Y+1).
		pla
		tay			;Restore Y.
		pla
		tax			;Restore X.

pudone:		rts


;-----------------------------------------------------------------------------
; Execute pickup function through jump table depending upon object number.
;
; Entry: X = X position, Y = Y position.
;
puobject:
		jsr	getbgblk	;Get object.
		cmp	#CRYSTAL+1
		bcs	puoexit		;Go if past jump table limit.
		stx	T7		;Save X.
		pha			;Save A.
		asl	a		;Make table index.
		tax
		lda	pu_jtab,x	;Get LSB of function address.
		sta	JMP_VECT	;Store it.
		lda	pu_jtab+1,x	;Get MSB of function address.
		sta	JMP_VECT+1	;Store it.
		pla			;Restore A.
		ldx	T7		;Restore X.
		jmp	(JMP_VECT)	;Execute specific function.

puoexit:	rts


;-----------------------------------------------------------------------------
; Pickup object functions.
;
; Entry: X = X grid position, Y = Y grid position.
;        A = object number of block, T6:T5 = address of object in low RAM.
; Must preserve: T1-T4
;
puo_noef:	rts

puo_exit:	lda	T1		;Get X fraction.
		cpx	T3
		bne	puoexnx		;Go if at X+1.
		cmp	#4
		bcc	puoexcky	;Go check Y if X fraction < 4.
		rts
puoexnx:	cmp	#13
		bcs	puoexcky	;Go check Y if X fraction >= 13.
		rts

puoexcky:	lda	T2		;Get Y fraction.
		cpy	T4
		bne	puoexny		;Go if at Y+1.
		cmp	#4
		bcc	puoexhit	;Hit if Y fraction < 4.
		rts
puoexny:	cmp	#13
		bcs	puoexhit	;Hit if Y fraction >= 13.
		rts

puoexhit:	inc	EXITED		;Set level completed flag.
		rts

puo_pb1:	lda	#1		;Add 1 to # of bombs.
pubomb1:	clc
		adc	NUM_BOMB	;Add current # of bombs.
		bcc	pubomb2
		lda	#255
pubomb2:	sta	NUM_BOMB
		jsr	remhobj		;Remove from hidden object list.
		lda	#EMPTY
		jsr	qblock		;Update background block.
		jsr	ud_bombs	;Update # of bombs.
		jsr	sf_ppriz	;Make pickup prize sound effect.
		rts

puo_pb3:	lda	#3		;Add 3 to # of bombs.
		jmp	pubomb1

puo_pb10:	lda	#10		;Add 10 to # of bombs.
		jmp	pubomb1

puo_mny:	jsr	remhobj		;Remove from hidden object list.
		lda	#EMPTY
		jsr	qblock		;Update background block.
		ldy	#SC1000
		jsr	addscore	;Give 1000 points.
		jsr	ud_score	;Update score string.
		jsr	sf_ppriz	;Make pickup prize sound effect.
		rts

puo_ebn:	jsr	remhobj		;Remove from hidden object list.
		lda	#EMPTY
		jsr	qblock		;Update background block.
		inc	NUM_EB		;Increment # of energy balls.
		lda	NUM_EB
		cmp	#MAX_EB+1	;Check if maxed out.
		bcc	puebnc		;Go if ok.
		lda	#MAX_EB
		sta	NUM_EB		;Set back to maximum.
puebnc:		jsr	sf_ppriz	;Make pickup prize sound effect.
		rts

puo_ebr:	jsr	remhobj		;Remove from hidden object list.
		lda	#EMPTY
		jsr	qblock		;Update background block.
		lda	RANGE_EB
		asl	a		;Double range of energy balls.
		sta	RANGE_EB
		cmp	#MAX_RGEB+1	;Check if maxed out.
		bcc	puebrc		;Go if ok.
		lda	#MAX_RGEB
		sta	RANGE_EB	;Set back to maximum.
puebrc:		jsr	sf_ppriz	;Make pickup prize sound effect.
		rts

puo_lpr:	jsr	remhobj		;Remove from hidden object list.
		lda	#EMPTY
		jsr	qblock		;Update background block.
		lda	#LP_TIME
		sta	LP_FLAG		;Set liquid proof flag.
		jsr	sf_ppriz	;Make pickup prize sound effect.
		jsr	spmusic		;Change music.
		rts

puo_cpr:	jsr	remhobj		;Remove from hidden object list.
		lda	#EMPTY
		jsr	qblock		;Update background block.
		lda	#CP_TIME
		sta	CP_FLAG		;Set creature proof flag.
		jsr	sf_ppriz	;Make pickup prize sound effect.
		jsr	spmusic		;Change music.
		rts

puo_ftmr:	jsr	remhobj		;Remove from hidden object list.
		lda	#EMPTY
		jsr	qblock		;Update background block.
		lda	#FT_TIME
		sta	FT_FLAG		;Set freeze timer flag.
		jsr	sf_ppriz	;Make pickup prize sound effect.
		rts

puo_frbt:	lda	FR_FLAG		;Check freeze robot flag.
		bne	pfrbtc		;Abort if already set.
		jsr	remhobj		;Remove from hidden object list.
		lda	#UPDATE
		jsr	qblock		;Make FROBOT object visible.
		stx	FROBOT_X	;Remember X,Y position.
		sty	FROBOT_Y
		ldy	#0
		lda	#EMPTY
		sta	(T5),y		;Set to EMPTY in RAM.
		lda	#FR_TIME
		sta	FR_FLAG		;Set freeze robot flag.
		jsr	sf_ppriz	;Make pickup prize sound effect.
		jsr	frmusic		;Change music.
pfrbtc:		rts

puo_epr:	jsr	remhobj		;Remove from hidden object list.
		lda	#EMPTY
		jsr	qblock		;Update background block.
		lda	#EP_TIME
		sta	EP_FLAG		;Set explosion-proof flag.
		jsr	sf_ppriz	;Make pickup prize sound effect.
		jsr	spmusic		;Change music.
		rts

puo_rpr:	jsr	remhobj		;Remove from hidden object list.
		lda	#EMPTY
		jsr	qblock		;Update background block.
		lda	#RP_TIME
		sta	RP_FLAG		;Set radioactive-proof flag.
		lda	#0
		sta	ROBRADIO	;Fix robot if radioactive.
		lda	ROBOT_F
		and	#%11111100	;Reset to palette 0.
		sta	ROBOT_F
		jsr	sf_ppriz	;Make pickup prize sound effect.
		jsr	spmusic		;Change music.
		rts

puo_extr:	jsr	remhobj		;Remove from hidden object list.
		lda	#EMPTY
		jsr	qblock		;Update background block.
		ldx	PLAYERUP	;Get current player number.
		lda	#1
		sta	GOTXR_P1,x	;Set got EXTRA robot flag.
		inc	LIVES_P1,x	;Give extra robot.
		bne	puexcnt		;Go if no wrap.
		lda	#255
		sta	LIVES_P1,x
puexcnt:	jsr	ud_lives	;Update # of lives.
		jsr	sf_ppriz	;Make pickup prize sound effect.
		rts

puo_crys:	lda	#EMPTY
		jsr	qblock		;Update background block.
		lda	#AN_CRYS
		jsr	chkcanim	;Check for special animation.
		jsr	startani	;Start animation.
		jsr	addcrys		;Add one to # of crystals picked up.
		jsr	sf_pcrys	;Make pickup crystal sound effect.
		rts


;-----------------------------------------------------------------------------
; Check if robot can push rock.
;
; Entry: A = object number, X = X grid position, Y = Y grid position
;        T1 = X MOD 16, T2 = Y MOD 16, T3 = X DIV 16, T4 = Y DIV 16
; MUST NOT CHANGE: X, Y
; Returns: carry flag set if robot cannot pass through object.
;
chkpush:
		bcc	chkpno3		;Exit if carry clear.
		php			;Save flags.
		pha			;Save object number.
		cmp	#SROCK
		bcc	chkpno		;Exit if < SROCK.
		cmp	#RROCK
		bcs	chkpno		;Exit if >= RROCK.

		lda	PUSH_DIR
 		beq	cp_right	;Go if pushing to the right.

cp_left:	lda	PSHL_FLG
		bne	cpleftp		;Skip ahead if already pushing left.

		lda	#0
		sta	PSHL_CNT	;Clear push left counter.
		lda	#1
		sta	PSHL_FLG	;Set push left flag.
		jmp	chkpno		;Exit.

cpleftp:	lda	PSHL_CNT
		cmp	#PSH_TIME	;Check push left counter.
		bcc	chkpno		;Exit if not pushed long enough.

		dex
		jsr	chkobjs		;Check for objects at (X-1,Y).
		inx
		bcs	chkpno		;Exit if square not empty.

		dex
		iny
		jsr	chkobjs		;Check for objects at (X-1,Y+1).
		inx
		dey
		lda	#LEFT
		bcc	cpleft2		;Go if square is empty.
		lda	#SLEFT
cpleft2:
		sta	T8		;Set direction.
		pla
		jsr	addmobj		;Make into moving object.
		bcs	chkpno2		;Abort if out of sprites.
		jmp	chkpyes		;Exit.

cp_right:	lda	PSHR_FLG
		bne	cprightp	;Skip ahead if already pushing right.

		lda	#0
		sta	PSHR_CNT	;Clear push right counter.
		lda	#1
		sta	PSHR_FLG	;Set push right flag.
		jmp	chkpno		;Exit.

cprightp:	lda	PSHR_CNT
		cmp	#PSH_TIME	;Check push right counter.
		bcc	chkpno		;Exit if not pushed long enough.

		inx
		jsr	chkobjs		;Check for objects at (X+1,Y).
		dex
		bcs	chkpno		;Exit if square not empty.

		inx
		iny
		jsr	chkobjs		;Check for objects at (X+1,Y+1).
		dex
		dey
		lda	#RIGHT
		bcc	cpright2	;Go if square is empty.
		lda	#SRIGHT
cpright2:
		sta	T8		;Set direction.
		pla
		jsr	addmobj		;Make into moving object.
		bcs	chkpno2		;Abort if out of sprites.

chkpyes:	plp			;Restore flags.
		clc			;Signal OK to move.
		rts

chkpno:		pla
chkpno2:	plp			;Restore flags.
chkpno3:	rts


;-----------------------------------------------------------------------------
; Check for robot horizontal collision with background.
;
; Entry: T1 = X MOD 16, T2 = Y MOD 16, T3 = X DIV 16, T4 = Y DIV 16
; Changes: A, X, Y
; Returns: carry flag set if collision occured.
;
clsn_rh:
		ldx	T3		;Get X grid position in X.
		ldy	T4		;Get Y grid position in Y.

       		lda	T2		;Get Y fraction.
		cmp	#MV_ADJ+1
		bcs	crh_cnt1	;Go if against 2nd block.
		jsr	getbgblk	;Get the 1st block.
		jsr	chkrhit		;Check if robot hits block or not.
		jsr	chkpush		;Check if robot can push rock.
		bcs	crh_hit		;Go if NOT ok to move.
       		lda	T2		;Get Y fraction.
		beq	crh_ok		;Go if no adjustment needed.
		iny			;Point to 2nd block.
		jsr	getbgblk	;Get the 2nd block.
		jsr	chkrhit2	;Check if robot hits block or not.
		bcc	crh_ok		;Go if no adjustment needed.
		dec	ROBOT_Y		;Adjust Y position.
		jmp	crh_ok		;Go move it.

crh_cnt1:	cmp	#16-MV_ADJ
		bcc	crh_cnt2	;Go if against BOTH blocks.
		iny			;Point to 2nd block.
		jsr	getbgblk	;Get the 2nd block.
		jsr	chkrhit		;Check if robot hits block or not.
		jsr	chkpush		;Check if robot can push rock.
		bcs	crh_hit		;Go if NOT ok to move.
		dey			;Point to 1st block.
		jsr	getbgblk	;Get the 1st block.
		jsr	chkrhit2	;Check if robot hits block or not.
		bcc	crh_ok		;Go if no adjustment needed.
		inc	ROBOT_Y		;Adjust Y position.
		jmp	crh_ok		;Go move it.

crh_cnt2:	jsr	getbgblk	;Get 1st block.
		jsr	chkrhit		;Check if robot hits block or not.
		bcc	crh_cnt3	;Go if no collision.
		iny			;Point to 2nd block.
		jsr	getbgblk	;Get the 2nd block.
		jsr	chkrhit		;Check if robot hits block or not.
		jmp	crh_hit		;Continue.

crh_cnt3:	iny			;Point to 2nd block.
		jsr	getbgblk	;Get the 2nd block.
		jsr	chkrhit		;Check if robot hits block or not.
		jsr	chkpush		;Check if robot can push rock.
		bcs	crh_hit		;Go if NOT ok to move.

crh_ok:		clc			;Report NO collision.
		rts
crh_hit:	sec			;Report collision.
		rts


;-----------------------------------------------------------------------------
; Check for robot vertical collision with background.
;
; Entry: T1 = X MOD 16, T2 = Y MOD 16, T3 = X DIV 16, T4 = Y DIV 16
; Changes: A, X, Y
; Returns: carry flag set if collision occured.
;
clsn_rv:
		ldx	T3		;Get X grid position in X.
		ldy	T4		;Get Y grid position in Y.

       		lda	T1		;Get X fraction.
		cmp	#MV_ADJ+1
		bcs	crv_cnt1	;Go if against 2nd block.
		jsr	getbgblk	;Get the 1st block.
		jsr	chkrhit		;Check if robot hits block or not.
		bcs	crv_hit		;Go if NOT ok to move.
       		lda	T1		;Get X fraction.
		beq	crv_ok		;Go if no adjustment needed.
		inx			;Point to 2nd block.
		jsr	getbgblk	;Get the 2nd block.
		jsr	chkrhit2	;Check if robot hits block or not.
		bcc	crv_ok		;Go if no adjustment needed.
		lda	ROBOT_X
		bne	crv_cnt2
		dec	ROBOT_X+1
crv_cnt2:	dec	ROBOT_X		;Adjust X position.
		jmp	crv_ok		;Go move it.

crv_cnt1:	cmp	#16-MV_ADJ
		bcc	crv_cnt3	;Go if against BOTH blocks.
		inx			;Point to 2nd block.
		jsr	getbgblk	;Get the 2nd block.
		jsr	chkrhit		;Check if robot hits block or not.
		bcs	crv_hit		;Go if NOT ok to move.
		dex			;Point to 1st block.
		jsr	getbgblk	;Get the 1st block.
		jsr	chkrhit2	;Check if robot hits block or not.
		bcc	crv_ok		;Go if no adjustment needed.
		inc	ROBOT_X		;Adjust X position.
		bne	crv_ok
		inc	ROBOT_X+1
		jmp	crv_ok		;Go move it.

crv_cnt3:	jsr	getbgblk	;Get 1st block.
		jsr	chkrhit		;Check if robot hits block or not.
		bcc	crv_cnt4	;Go if no collision.
		inx			;Point to 2nd block.
		jsr	getbgblk	;Get the 2nd block.
		jsr	chkrhit		;Check if robot hits block or not.
		jmp	crv_hit		;Continue.

crv_cnt4:	inx			;Point to 2nd block.
		jsr	getbgblk	;Get the 2nd block.
		jsr	chkrhit		;Check if robot hits block or not.
		bcs	crv_hit		;Go if NOT ok to move.

crv_ok:		clc			;Report NO collision.
		rts
crv_hit:	sec			;Report collision.
		rts


;-----------------------------------------------------------------------------
; Calculate grid X,Y & remainders from sprite X,Y.
;
; Entry: A = MSB X position, X = LSB X position, Y = Y position.
; Changes: A
; Returns: T1 = X MOD 16, T2 = Y MOD 16, T3 = X DIV 16, T4 = Y DIV 16
;
calcxy:
		lsr	a
		txa
		ror	a
		lsr	a
		lsr	a
		lsr	a
		sta	T3		;T3 = X DIV 16.
		txa
		and	#$0f
		sta	T1		;T1 = X MOD 16.
		tya
		lsr	a
		lsr	a
		lsr	a
		lsr	a
		sta	T4		;T4 = Y DIV 16.
		tya
		and	#$0f
		sta	T2		;T2 = Y MOD 16.
		rts


;-----------------------------------------------------------------------------
; Get background block from grid array.
;
; Entry: X = X grid position, Y = Y grid position.
; Changes: T5, T6, T7
; Returns: A = object number of block, T6:T5 = address of object in low RAM.
;
getbgblk:
		sty	T7		;Save Y value.
		stx	T5		;Save X in T5 for later.
		lda	#0
		sta	T6		;Clear T6 for later.
		dey			;Adjust for missing first 2 lines.
		dey
		tya
		asl	a		;Multiply by 32.
		asl	a
		asl	a
		asl	a
		asl	a
		rol	T6		;T6 = carry from multiply.
		ora	T5		;Add in X grid position.
		clc
		adc	#CUR_LEV & $ff
		sta	T5		;T5 = LSB of address.
		lda	#CUR_LEV >> 8
		clc
		adc	T6
		sta	T6		;T6 = MSB of address.
		ldy	#0
		lda	(T5),y		;Get block object number in A.
		sta	LAST_BLK	;Save unmasked value.
		and	#%01111111	;Mask off high bit.
		ldy	T7		;Restore Y value.
		rts


;-----------------------------------------------------------------------------
; Make robot radioactive.
;
makrrad:
		pha			;Save A.
		lda	RP_FLAG
		bne	mkrrdn		;Exit if radioactive-proof.

		lda	ROBRADIO	;Check radioactive flag.
		bne	mkrrdn		;Exit if already set.

		lda	ROBOT_N		;Get robot object number.
		cmp	#R_UP
		bcs	mkrrfud		;Go if UP or DOWN.
		lda	ROBOT_F		;Get robot flags.
		and	#%01000000	;Check left/right flip bit.
		beq	mkrrfr		;Go if facing right.
		lda	#LEFT
		jmp	mkrrcnt		;Continue.
mkrrfr:		lda	#RIGHT
		jmp	mkrrcnt		;Continue.
mkrrfud:	cmp	#R_DOWN
		bcs	mkrrfd		;Go if DOWN.
		lda	#UP
		jmp	mkrrcnt		;Continue.
mkrrfd:		lda	#DOWN
mkrrcnt:	cmp	ROB_MOV		;Check against movement direction.
		bne	mkrrdn		;Exit if not facing radioactive rock.

		cmp	MRR_LAST
		beq	mkrsame		;Continue if same as last time.
		sta	MRR_LAST	;Store direction.
		lda	#0
		sta	MRR_CNT		;Reset hit counter.
		jmp	mkrrdn		;Exit.

mkrsame:	inc	MRR_CNT		;Increment hit count.
		lda	MRR_CNT
		cmp	#6
		bcc	mkrrdn		;Exit if not enough hits.

		lda	#30
		sta	ROBRADIO	;Make robot radioactive for 3 seconds.
		lda	ROBOT_F
		ora	#%00000011	;Set to palette #3.
		sta	ROBOT_F		;Save new flag byte.

mkrrdn:		pla			;Restore A.
		rts


;-----------------------------------------------------------------------------
; Check if robot hits object number in A or not.
;
; MUST NOT CHANGE: A, X, Y
; Returns: carry flag set if robot cannot pass through object.
;
chkrhit:	;Entry point to test for radioactive rock.
		cmp	#MRROCK
		bcc	chkrhit2
		cmp	#IROCK
		bcs	chkrhit2

		jsr	makrrad		;Make robot radioactive.

chkrhit2:	;Entry point to skip radioactive rock test.
		cmp	#HMUD+1
		bcs	chkrhit3	;Go if > HMUD.

		cmp	#BOMB
		beq	ckrhbomb	;Go if BOMB.

		cmp	#SROCK		;Hits if >= SROCK.
		rts

ckrhbomb:	pha
		lda	ROB_MOV		;Get robot movement direction.
		cmp	#DOWN
		bcs	ckrhchk2	;Go if DOWN or LEFT.
		cmp	#UP
		bcs	ckrhb_u		;Go if UP.

ckrhb_r:	lda	T1		;Get X fraction.
		cmp	#MV_ADJ
		bcc	ckrh_hit	;Go if collision.
		jmp	ckrh_ok		;Go if no collision.

ckrhb_u:	lda	T2		;Get Y fraction.
		cmp	#16-MV_ADJ
		bcs	ckrh_hit	;Go if collision.
		jmp	ckrh_ok		;Go if no collision.

ckrhchk2:	cmp	#LEFT
		bcs	ckrhb_l

ckrhb_d:	lda	T2		;Get Y fraction.
		cmp	#MV_ADJ
		bcc	ckrh_hit	;Go if collision.
		jmp	ckrh_ok		;Go if no collision.

ckrhb_l:	lda	T1		;Get X fraction.
		cmp	#16-MV_ADJ
		bcs	ckrh_hit	;Go if collision.
		jmp	ckrh_ok		;Go if no collision.

chkrhit3:	pha
		lda	LP_FLAG		;Check for liquid-proof.
		beq	ckrh_hit	;Go if not.

ckrh_ok:	pla
		clc
		rts			;Return with carry clear.

ckrh_hit:	pla
		sec
		rts			;Return with carry set.


;-----------------------------------------------------------------------------
; Put robot on screen (set sprites & horizontal scroll).
;
; Changes: A, X, Y.
;
putrobot:
		lda	#S_PLAYER	;Get first sprite #.
		clc
		adc	SPR_OFS		;Add sprite rotation offset.
		asl	a
		asl	a
		bne	prspok		;Continue if not 0.
		lda	SPR_OFS		;Switch with sprite 0.
		asl	a
		asl	a
prspok:		tax			;X = sprite table offset.

		lda	ROBOT_Y
		sec
		sbc	#1		;Adjust for hardware bug.
		sta	SPR_DATA,x	;Set Y position of 1st sprite.
		sta	SPR_DATA+4,x	;Set Y position of 2nd sprite.

		lda	ROBOT_N		;Get object number.
		clc
		adc	ROBOT_C		;Add animation counter.
		tay
		lda	ROBOT_F
		and	#%01000000	;Check left/right flip bit.
		bne	prflip		;Go if flipped.

		lda	objchr1,y	;Get starting character.
		sta	SPR_DATA+1,x	;Set character number of 1st sprite.
		clc
		adc	#2
		sta	SPR_DATA+4+1,x	;Set character number of 2nd sprite.
		jmp	prsets		;Continue.

prflip:		lda	objchr1,y	;Get starting character.
		sta	SPR_DATA+4+1,x	;Set character number of 2nd sprite.
		clc
		adc	#2
		sta	SPR_DATA+1,x	;Set character number of 1st sprite.

prsets:		;Set horizontal scroll & page-1/page-2 bit.
		lda	ROBOT_X+1	;Check MSB of X position.
		and	#%00000001
		bne	prfarr		;Go if X >= 256.

		lda	ROBOT_X		;Get LSB of X position.
		cmp	#121		;Check it.
		bcs	prmid		;Go if X >= 121.
		tay			;Save X position in Y.
		lda	#0		;Set horizontal scroll to 0.
		jmp	prseth		;Continue.

prmid:		ldy	#120		;Set X position to 120.
		sec
		sbc	#120		;Subtract 120 from X.
prseth:		sta	H_SCROLL	;Set horizontal scroll.
		lda	REG_2000
		and	#%11111110	;Clear page 2 bit of register 2000.
		sta	REG_2000
		jmp	prcont		;Continue.

prfarr:		lda	ROBOT_X		;Get LSB of X position.
		cmp	#120		;Check it.
		bcc	prmid		;Go if X < 376.

		tay			;Save X position in Y.
		lda	#0		;Set horizontal scroll to 0.
		sta	H_SCROLL
		lda	REG_2000
		ora	#%00000001	;Set page 2 bit of register 2000.
		sta	REG_2000

prcont:		lda	ROBOT_F
		sta	SPR_DATA+2,x	;Set flag byte of 1st sprite.
		sta	SPR_DATA+4+2,x	;Set flag byte of 2nd sprite.

		tya			;Get X position in A.
		sta	SPR_DATA+3,x	;Set X position of 1st sprite.
		clc
		adc	#8
		sta	SPR_DATA+4+3,x	;Set X position of 2nd sprite.
		rts


;-----------------------------------------------------------------------------
; Setup level structures in RAM.
;
; Changes: A, X, Y
;
setuplev:
		;Copy level data to low RAM.
		jsr	call_sul	;Call routine in second ROM page.

		jsr	seedrand	;Seed random number generator.
		jsr	ud_score	;Update score.
		jsr	ud_lives	;Update # of lives.
		jsr	ud_level	;Update level #.
		jsr	ud_bombs	;Update # of bombs.
		jsr	ud_gems		;Update # of gems.
		jsr	ud_time		;Update time remaining.

		rts


;-----------------------------------------------------------------------------
; Draw status lines at top of screen.
;
; Changes: A, X, Y
;
drawstat:
		;Set attribute for level & bomb characters.
		lda	$2002
		lda	#$23		;Write MSB of screen position.
		sta	$2006
		lda	#$c3		;Write LSB of screen position.
		sta	$2006
		lda	#%00110000	;Attribute data.
		sta	$2007		;Store attribute byte.

		ldx	#scrmsg >> 8
		ldy	#scrmsg & $ff
		jsr	message		;Display "SCORE".

		ldx	#nrmsg >> 8
		ldy	#nrmsg & $ff
		jsr	message		;Display "R=".

		ldx	#nbmsg >> 8
		ldy	#nbmsg & $ff
		jsr	message		;Display "B=".

		ldx	#lnmsg >> 8
		ldy	#lnmsg & $ff
		jsr	message		;Display "L=".

		ldx	#csmsg >> 8
		ldy	#csmsg & $ff
		jsr	message		;Display "C=".

		ldx	#timemsg >> 8
		ldy	#timemsg & $ff
		jsr	message		;Display "TIME".

		rts


;-----------------------------------------------------------------------------
; Draw level in VRAM.
;
; Changes: A, X, Y, T1, T2, T3
;
drawlev:
		lda	#CUR_LEV & $ff
		sta	T1
		lda	#CUR_LEV >> 8
		sta	T2		;T2:T1 points to level data.

		ldy	#2
dlloop:		ldx	#0
dlline:		sty	T3
		ldy	#0
		lda	(T1),y		;Get next object.
		cmp	#FROBOT
		bne	dlcont		;Continue if not FROBOT.
		lda	#EMPTY		;Display as EMPTY.
dlcont:		ldy	T3
		jsr	putobj		;Draw the object.
		inc	T1		;Increment data pointer.
		bne	dlskp
		inc	T2
dlskp:		inx
		cpx	#32
		bcc	dlline		;Draw 32 blocks.
		iny			;Next line.
		cpy	#15
		bcc	dlloop		;Loop for all 13 lines.

		rts


;-----------------------------------------------------------------------------
; Queue object for background update during NMI.
;
; Entry: A = object number, X = X grid position, Y = Y grid position.
;        T6:T5 = address of object in array in low RAM.
; Changes: T7, T8, T9
;
qblock:
		cmp	#SPEHO		;Check for special hidden object.
		bne	qbcnt1
		stx	T7		;Save X position.
		sty	T8		;Save Y position.
		jsr	chkhobj		;Check for hidden objects.
		jmp	qbcont		;Don't store in RAM.

qbcnt1:		cmp	#EMPTY		;Check for empty block.
		bne	qbcnt3		;Continue if not.
		jsr	chkhobj		;Check for hidden objects.

qbcnt3:		stx	T7		;Save X position.
		sty	T8		;Save Y position.
		cmp	#FLASH		;Check for special FLASH code.
		bne	qbcnt4		;Continue if not.
		lda	#WHITEOUT	;Set to WHITEOUT object,
		jmp	qbcont		;   but don't store in RAM.

qbcnt4:		ldy	#0
		cmp	#UPDATE		;Check for special flag.
		bne	qbcnt2		;Go if not.
		lda	(T5),y		;Read block from low RAM.
		and	#%01111111	;Mask off high bit.
		jmp	qbcont2		;Continue.

qbcnt2:		sta	(T5),y		;Put block in low RAM array.
		and	#%01111111	;Mask off high bit.

qbcont:		cmp	#FROBOT		;Check for FROBOT object.
		bne	qbcont2		;Continue if not.
		lda	#EMPTY		;Display as EMPTY.

qbcont2:	ldy	NMIBHEAD	;Get queue pointer.
		sta	NMI_BUF2,y	;Save object #.

		lda	#0
		sta	T9		;Clear T9.
		lda	T8		;Get Y pos in A.
		asl	a
		asl	a
		sta	NMI_BUF3,y	;Save for palette address later.
		asl	a
		asl	a
		asl	a
		rol	T9
		asl	a
		rol	T9		;Get top 2 bits of Y pos in T9.
		sta	NMI_BUF1,y
		lda	T7		;Get X pos in A.
		asl	a
		ora	NMI_BUF1,y
		and	#%11011110	;A is now LSB of block.
		sta	NMI_BUF1,y	;Save LSB.

		lda	T7		;Get X pos in A.
		and	#%00010000
		beq	qbpage1		;Go if page 1.
		lda	T9
		ora	#$04		;Page 2 is at 2400.
		jmp	qbpcont
qbpage1:	lda	T9
qbpcont:	ora	#$20		;VRAM starts at 2000.
		sta	NMI_BUF,y	;Save MSB.

		ldx	NMI_BUF2,y	;Get object # in X.
		lda	objpal,x	;Get palette # for object.
		sta	T9		;Save it.

		lda	T8		;Get Y pos in A.
		and	#%00000001
		bne	qbhnib		;Go if in high nibble.
		lda	T7		;Get X pos in A.
		and	#%00000001
		bne	qbhlnib		;Go if in high low-nibble.
		lda	#%11111100
		jmp	qbllnibc
qbhlnib:	lda	#%11110011
		jmp	qbhlnibc
qbhnib:		lda	T7		;Get X pos in A.
		and	#%00000001
		bne	qbhhnib		;Go if in high high-nibble.
		lda	#%11001111
		jmp	qblhnibc
qbhhnib:	lda	#%00111111
		asl	T9
		asl	T9
qblhnibc:	asl	T9
		asl	T9
qbhlnibc:	asl	T9
		asl	T9
qbllnibc:	sta	NMI_BUF4,y	;Save palette mask.
		lda	T9
		sta	NMI_BUF5,y	;Save adjusted palette value.

		lda	NMI_BUF3,y	;Get earlier shifted value.
		and	#%00111000	;Mask it.
		ora	#%11000000	;Palette area starts at XXC0.
		sta	T9		;Save it.
		lda	T7		;Get X pos in A.
		lsr	a		;Shift it.
		and	#%00000111	;Mask it.
		ora	T9		;A is now LSB of address.
		sta	NMI_BUF3,y	;Save LSB.

		iny
		tya			;Get queue pointer in A.
		cmp	#NMI_BNUM
		bcc	qbnowrap	;Go if no wrap.
		lda	#0		;Reset pointer.
qbnowrap:	cmp	NMIBTAIL	;Compare with tail pointer.
		beq	qbnowrap	;Wait for NMI if queue is full.
		sta	NMIBHEAD	;Save new queue pointer.

		dey
		lda	NMI_BUF2,y	;Restore A.
		ldx	T7		;Restore X.
		ldy	T8		;Restore Y.

		rts


;-----------------------------------------------------------------------------
; Put object in VRAM.
;
; On entry: A = object #, X = x pos, Y = y pos
; Changes: T5, T6, T7, T8
;
putobj:		pha			;Save A.
		sta	T5
		tya
		pha			;Push Y.
		txa
		pha			;Push X.
		lda	T5
		pha			;Save object #.

		lda	#0
		sta	T5		;Clear T5.
		tya			;Get Y pos in A.
		asl	a
		asl	a
		sta	T7		;Save for palette address later.
		asl	a
		asl	a
		asl	a
		rol	T5
		asl	a
		rol	T5		;Get top 2 bits of Y pos in T5.
		sta	T6
		txa			;Get X pos in A.
		asl	a
		ora	T6
		and	#%11011110	;A is now LSB of block.
		sta	T6		;Save LSB.

		txa
		and	#%00010000
		beq	popage1		;Go if page 1.
		lda	T5
		ora	#$04		;Page 2 is at 2400.
		jmp	popcont
popage1:	lda	T5
popcont:	ora	#$20		;VRAM starts at 2000.
		sta	T5		;Save MSB.

		lda	$2002		;Reset reg 2006.
		lda	T5
		sta	$2006		;Write MSB.
		lda	T6
		sta	$2006		;Write LSB.

		pla			;Get object #.
		tax

		lda	objchr1,x	;Get first character.
		sta	$2007		;Store it.
		lda	objchr3,x	;Get second character.
		sta	$2007		;Store next char.

		lda	T5
		sta	$2006		;Write MSB.
		lda	T6
		ora	#%00100000	;Bump to next row.
		sta	$2006		;Write LSB.

		lda	objchr2,x	;Get third character.
		sta	$2007		;Store char.
		lda	objchr4,x	;Get fourth character.
		sta	$2007		;Store next char.

		lda	objpal,x	;Get palette # for object.
		sta	T6		;Save it.

		pla			;Pop X.
		tax
		pla			;Pop Y.
		tay

		and	#%00000001
		bne	pohnib		;Go if in high nibble.
		txa
		and	#%00000001
		bne	pohlnib		;Go if in high low-nibble.
		lda	#%11111100
		jmp	pollnibc
pohlnib:	lda	#%11110011
		jmp	pohlnibc
pohnib:		txa
		and	#%00000001
		bne	pohhnib		;Go if in high high-nibble.
		lda	#%11001111
		jmp	polhnibc
pohhnib:	lda	#%00111111
		asl	T6
		asl	T6
polhnibc:	asl	T6
		asl	T6
pohlnibc:	asl	T6
		asl	T6
pollnibc:	sta	T8		;Save mask in T8, adjusted palette
					;   value is in T6.

		lda	T7		;Get earlier shifted value.
		and	#%00111000	;Mask it.
		ora	#%11000000	;Palette area starts at XXC0.
		sta	T7		;Save it.
		txa
		lsr	a		;Shift it.
		and	#%00000111	;Mask it.
		ora	T7		;A is now LSB of address.
		sta	T7		;Save LSB.

		lda	T5
		ora	#%00000011	;Point to palette area.
		sta	T5		;Save for later.
		sta	$2006		;Write MSB.
		lda	T7
		sta	$2006		;Write LSB.

		lda	$2007
		lda	$2007		;Read palette assignment byte.
		and	T8		;Clear the 2 bits being changed.
		ora	T6		;Set palette number.
		sta	T6		;Save new palette byte.
		
		lda	T5
		sta	$2006		;Write MSB.
		lda	T7
		sta	$2006		;Write LSB.

		lda	T6
		sta	$2007		;Write new palette byte.

		pla			;Restore A.
		rts


;-----------------------------------------------------------------------------
; Initialize all palettes.
;
; On entry: T2:T1 = ptr to palette data.
; Changes: A, X, T1, T2
;
initpals:
		ldx	#0		;Start with palette 0.
tsloop:		txa
		jsr	setpal
		lda	T1
		clc
		adc	#4
		sta	T1
		lda	T2
		adc	#0
		sta	T2
		inx
		cpx	#8
		bcc	tsloop		;Set all 8 palettes.
		rts


;-----------------------------------------------------------------------------
; Set a palette (from 0 to 7).
;
; On entry: A = palette #, T2:T1 = ptr to palette data.
; Changes: T3
;
setpal:
		pha			;Save A.
		asl	a
		asl	a
		sta	T3		;Save LSB of palette address.
		tya
		pha			;Save Y register.
		lda	$2002		;Reset reg 2006.
		lda	#$3f
		sta	$2006		;Write MSB.
		lda	T3
		sta	$2006		;Write LSB.

		ldy	#0
sploop:		lda	(T1),y
		sta	$2007		;Write palette data.
		iny
		cpy	#4
		bcc	sploop		;Loop for all 4 bytes.

		pla			;Pop Y.
		tay
		pla			;Pop A.

		rts


;-----------------------------------------------------------------------------
; Add bonus for remaining time if level completed.
;
addbonus:
		lda	NMI_TIME
abwt1:		cmp	NMI_TIME
		beq	abwt1		;Wait for NMI to occur.

abagain:	lda	TIMELEFT	;Get LSB remaining time.
		bne	abcont		;Go if some.
		lda	TIMLEFT2	;Get MSB remaining time.
		bne	abcont		;Go if some.

		rts

abcont:		lda	TIMELEFT	;Check LSB remaining time.
		bne	abcnt2		;Go if no wrap will occur.
		dec	TIMLEFT2	;Decrement MSB remaining time.
abcnt2:		dec	TIMELEFT	;Decrement LSB remaining time.

		lda	TIMELEFT
		and	#%00000001
		bne	abskips
		jsr	sf_tbon		;Time bonus sound effect.
abskips:
		jsr	ud_time		;Update time remaining.
		ldy	#SC10
		jsr	addscore	;Give 10 points.
		jsr	ud_score	;Update score string.

		ldx	#1
abloop:		lda	NMI_TIME	;Wait for 1/60 of a second.
abwt2:		cmp	NMI_TIME
		beq	abwt2		;Wait for NMI to occur.
		dex
		bne	abloop

		jmp	abagain		;Loop.


;-----------------------------------------------------------------------------
; Add bonus for remaining bombs if level completed.
;
addbombs:
		lda	NMI_TIME
atwt1:		cmp	NMI_TIME
		beq	atwt1		;Wait for NMI to occur.

atagain:	lda	NUM_BOMB	;Get remaining bombs.
		bne	atcont		;Go if some.

		rts

atcont:		dec	NUM_BOMB	;Decrement remaining bombs.

		jsr	sf_bbon		;Bomb bonus sound effect.
		jsr	ud_bombs	;Update bombs remaining.
		ldy	#SC100
		jsr	addscore	;Give 100 points per bomb.
		jsr	ud_score	;Update score string.

		lda	#1
		jsr	delay		;Wait 1/10 of a second.

		jmp	atagain		;Loop.


;-----------------------------------------------------------------------------
; Add bonus for remaining robots if game completed.
;
addrobts:
		lda	NMI_TIME
arwt1:		cmp	NMI_TIME
		beq	arwt1		;Wait for NMI to occur.

aragain:	ldx	PLAYERUP
		lda	LIVES_P1,x	;Get remaining robots.
		bne	arcont		;Go if some.

		rts

arcont:		dec	LIVES_P1,x	;Decrement remaining robots.

		jsr	sf_expl		;Make sound effect.
		jsr	ud_lives	;Update robots remaining.
		ldy	#SC5000
		jsr	addscore
		ldy	#SC5000
		jsr	addscore	;Give 10000 points per robot.
		jsr	ud_score	;Update score string.

		lda	#5
		jsr	delay		;Wait 5/10 of a second.

		jmp	aragain		;Loop.


;-----------------------------------------------------------------------------
; Check for new high score.
;
; Changes: A, X, Y
;
cmphigh:
		ldx	#SCORE_P1	;Point to player 1 buffer.
		lda	PLAYERUP	;Get current player number.
		beq	chskip		;Go if player 1 (0).
		ldx	#SCORE_P2	;Point to player 2 buffer.
chskip:		txa
		pha			;Save X for later.
		ldy	#0

chloop:		lda	HSCORE,y	;Get high score byte.
		cmp	0,x		;Compare player's score.
		bcc	chnew		;Go if new high.
		iny
		inx
		cpy	#7
		bcc	chloop		;Check all 7 digits.
		pla

		rts

chnew:		;Copy new high score.
		pla
		tax			;Get original X value.

		lda	0,x		;Get byte.
		sta	HSCORE		;Store it.
		lda	1,x		;Get byte.
		sta	HSCORE+1	;Store it.
		lda	2,x		;Get byte.
		sta	HSCORE+2	;Store it.
		lda	3,x		;Get byte.
		sta	HSCORE+3	;Store it.
		lda	4,x		;Get byte.
		sta	HSCORE+4	;Store it.
		lda	5,x		;Get byte.
		sta	HSCORE+5	;Store it.
		lda	6,x		;Get byte.
		sta	HSCORE+6	;Store it.

		rts


;-----------------------------------------------------------------------------
; Add 4-byte simple number to 7-byte simple score for current player.
;
; On entry: Y = offset from stable of 4-byte value to be added.
; Changes: A, X, Y
;
addscore:
		ldx	#SCORE_P1	;Point to player 1 buffer.
		lda	PLAYERUP	;Get current player number.
		beq	asskip		;Go if player 1 (0).
		ldx	#SCORE_P2	;Point to player 2 buffer.
asskip:		clc			;Clear carry.

		lda	6,x		;Get first byte.
		adc	stable+3,y	;Add byte from table.
		cmp	#10		;Check for carry.
		bcc	asskip1		;Go if no carry.
		sbc	#10		;Adjust value.
asskip1:	sta	6,x		;Store result.

		lda	5,x		;Get second byte.
		adc	stable+2,y	;Add byte from table.
		cmp	#10		;Check for carry.
		bcc	asskip2		;Go if no carry.
		sbc	#10		;Adjust value.
asskip2:	sta	5,x		;Store result.

		lda	4,x		;Get third byte.
		adc	stable+1,y	;Add byte from table.
		cmp	#10		;Check for carry.
		bcc	asskip3		;Go if no carry.
		sbc	#10		;Adjust value.
asskip3:	sta	4,x		;Store result.

		lda	3,x		;Get fourth byte.
		adc	stable,y	;Add byte from table.
		cmp	#10		;Check for carry.
		bcc	asskip4		;Go if no carry.
		sbc	#10		;Adjust value.
asskip4:	sta	3,x		;Store result.

		lda	2,x		;Get fifth byte.
		adc	#0		;Add carry.
		cmp	#10		;Check for carry.
		bcc	asskip5		;Go if no carry.
		sbc	#10		;Adjust value.
asskip5:	sta	2,x		;Store result.

		lda	1,x		;Get sixth byte.
		adc	#0		;Add carry.
		cmp	#10		;Check for carry.
		bcc	asskip6		;Go if no carry.
		sbc	#10		;Adjust value.
asskip6:	sta	1,x		;Store result.

		lda	0,x		;Get seventh byte.
		adc	#0		;Add carry.
		cmp	#10		;Check for carry.
		bcc	asskip7		;Go if no carry.

		lda	#9		;Set score to 9,999,999 if it
		sta	6,x		;   rolled over.
		sta	5,x
		sta	4,x
		sta	3,x
		sta	2,x
		sta	1,x

asskip7:	sta	0,x		;Store result.

		rts


;-----------------------------------------------------------------------------
; Format 7 byte simple number into S_NSBUF.
;
; Changes: A
;
fmtscore:
		lda	0,x		;Get byte.
		sta	S_NSBUF		;Store it.
		lda	1,x		;Get byte.
		sta	S_NSBUF+1	;Store it.
		lda	2,x		;Get byte.
		sta	S_NSBUF+2	;Store it.
		lda	3,x		;Get byte.
		sta	S_NSBUF+3	;Store it.
		lda	4,x		;Get byte.
		sta	S_NSBUF+4	;Store it.
		lda	5,x		;Get byte.
		sta	S_NSBUF+5	;Store it.
		lda	6,x		;Get byte.
		sta	S_NSBUF+6	;Store it.

		rts


;-----------------------------------------------------------------------------
; Update score numeric string.
;
; Changes: A, X, Y
;
ud_score:
		ldx	#SCORE_P1	;Point to player 1 score.
		lda	PLAYERUP	;Get current player number.
		beq	udsskip		;Go if player 1 (0).
		ldx	#SCORE_P2	;Point to player 2 score.
udsskip:
		jsr	fmtscore	;Copy number into S_NSBUF.

		ldy	#7
		ldx	#S_NSBUF
		jsr	fmtdecl		;Left justify.

		lda	#S_NSBUF
		sta	S_FLAG		;Set update flag.

		rts


;-----------------------------------------------------------------------------
; Update # of lives numeric string.
;
; Changes: A, X, Y
;
ud_lives:
		ldx	PLAYERUP	;Get current player number.
		lda	LIVES_P1,x	;Get level number.
		ldx	#R_NSBUF	;Get address of buffer.
		jsr	putdec		;Format into buffer.
		ldy	#3
		jsr	fmtdecl		;Left justify.

		lda	#R_NSBUF
		sta	R_FLAG		;Set update flag.

		rts


;-----------------------------------------------------------------------------
; Update level # numeric string.
;
; Changes: A, X, Y
;
ud_level:
		ldx	PLAYERUP	;Get current player number.
		lda	LEVEL_P1,x	;Get level number.
		ldx	#L_NSBUF	;Get address of buffer.
		jsr	putdec		;Format into buffer.
		ldy	#3
		jsr	fmtdecl		;Left justify.

		lda	#L_NSBUF
		sta	L_FLAG		;Set update flag.

		rts


;-----------------------------------------------------------------------------
; Update # of bombs numeric string.
;
; Changes: A, X, Y
;
ud_bombs:
		lda	NUM_BOMB	;Get # of bombs.
		ldx	#B_NSBUF	;Get address of buffer.
		jsr	putdec		;Format into buffer.
		ldy	#3
		jsr	fmtdecl		;Left justify.

		lda	#B_NSBUF
		sta	B_FLAG		;Set update flag.

		rts


;-----------------------------------------------------------------------------
; Update # of gems numeric string.
;
; Changes: A, X, Y
;
ud_gems:
		lda	NUM_GEMS	;Get # of gems.
		ldx	#G_NSBUF	;Get address of buffer.
		jsr	putdec		;Format into buffer.
		ldy	#3
		jsr	fmtdecl		;Left justify.

		lda	#SLASH
		sta	0,x		;Put '/' in string.
		inx

		lda	QUOTA		;Get gem quota for level.
		jsr	putdec		;Format into buffer.
		ldy	#3
		jsr	fmtdecl		;Left justify.

udglp:		cpx	#G_NSBUF+7	;Compare for end of buffer.
		beq	udgdone		;Done if so.
		sta	0,x		;Put trailing space.
		inx
		jmp	udglp		;Loop.
udgdone:

		lda	#G_NSBUF
		sta	G_FLAG		;Set update flag.

		rts


;-----------------------------------------------------------------------------
; Update time remaining numeric string.
;
; Changes: A, X, Y, T11, T12
;
ud_time:
		lda	TIMELEFT	;Get time remaining.
		sta	T11
		lda	TIMLEFT2
		sta	T12
		ldx	#T_NSBUF	;Get address of buffer.

		ldy	#0		;Reset hundreds counter.
utdig1:		lda	T11
		sec
		sbc	#100		;Check for hundred.
		sta	T11
		lda	T12
		sbc	#0
		bcc	utdig1c		;Go if no more hundreds.
		sta	T12
		iny			;Increment hundreds counter.
		jmp	utdig1		;Loop.

utdig1c:	lda	T11
		clc
		adc	#100		;Add back last hundred.
		sty	0,x		;Put hundreds digit in buffer.
		inx

		ldy	#0		;Reset tens counter.
		sec
utdig2:		sbc	#10		;Check for ten.
		bcc	utdig2c		;Go if no more tens.
		iny			;Increment tens counter.
		jmp	utdig2		;Loop.

utdig2c:	adc	#10		;Add back last ten.
		sty	0,x		;Put tens digit in buffer.
		inx

		sta	0,x		;Put ones digit in buffer.
		dex
		dex

		ldy	#3
		jsr	fmtdecr		;Right justify.

		lda	#T_NSBUF
		sta	T_FLAG		;Set update flag.

		rts


;-----------------------------------------------------------------------------
; Special NMI display message routine for displaying numeric strings.
;
; Entry: X = offset of string in zero page RAM, Y = string length.
;        A = LSB of video offset.
; Changes: A, X, Y
; Used by NMI!
;
dispnum:
		pha			;Save video offset.
		lda	$2002
		lda	#$20		;MSB of video address.
		sta	$2006
		pla			;Get LSB of video address.
		sta	$2006

dnloop:		lda	0,x		;Get next char of message.
		sta	$2007		;Store it.
		inx
		dey
		bne	dnloop		;Loop for count in Y.

		rts


;-----------------------------------------------------------------------------
; Display a message at a specified VRAM offset.
;
; Entry: X:Y points to message data structure.
; Changes: A, Y
;
message:
		stx	T12		;Make T12:T11 = X:Y.
		sty	T11

		lda	$2002
		ldy	#1
		lda	(T11),y
		sta	$2006
		dey
		lda	(T11),y
		sta	$2006

		ldy	#2
meloop:		lda	(T11),y		;Get next char of message.
		cmp	#$ff
		beq	medone		;Done if $ff character.
		sta	$2007		;Store it.
		iny
		jmp	meloop		;Loop until high bit set.

medone:		rts


;-----------------------------------------------------------------------------
; Remove leading zeros of ASCII decimal number, padding right with spaces.
;
; Entry: X = zero page RAM offset of string, Y = length of string.
; Changes: A, Y, T11, T12
; Returns: X = offset of first trailing space.
;
fmtdecl:
		dey			;Don't check last byte of string.
		stx	T11
fdllp:		lda	0,x		;Get character.
		bne	fdlcnt		;Go if not '0'.
		inx
		dey
		bne	fdllp		;Count leading zeros.

fdlcnt:		iny			;Y is number of chars to move.
fdllp2:		lda	0,x		;Get character.
		inx
		stx	T12		;Save source X.
		ldx	T11		;Get destination pointer.
		sta	0,x		;Store character.
		inc	T11		;Increment destination pointer.
		ldx	T12		;Restore source X.
		dey
		bne	fdllp2		;Move characters to left.

		lda	#SPACE
		ldx	T11
fdllp3:		cpx	T12		;Compare for end of string.
		beq	fdldone		;Done if so.
		sta	0,x		;Put trailing space.
		inx
		jmp	fdllp3		;Loop.

fdldone:	ldx	T11		;X = offset of first trailing space.
		rts


;-----------------------------------------------------------------------------
; Change leading zeros of ASCII decimal number to spaces.
;
; Entry: X = zero page RAM offset of string, Y = length of string.
; Changes: A, X, Y
;
fmtdecr:
		dey			;Don't check last byte of string.
fdrlp:		lda	0,x		;Get character.
		bne	fdrdone		;Go if not '0'.
		lda	#SPACE
		sta	0,x		;Change to ' '.
		inx
		dey
		bne	fdrlp

fdrdone:	rts


;-----------------------------------------------------------------------------
; Format byte into buffer as ASCII decimal, with leading zeros.
;
; Entry: A = byte to display, X = zero page RAM offset.
; Changes: A, Y
;
putdec:
		ldy	#0		;Reset hundreds counter.
		sec
pddig1:		sbc	#100		;Check for hundred.
		bcc	pddig1c		;Go if no more hundreds.
		iny			;Increment hundreds counter.
		jmp	pddig1		;Loop.

pddig1c:	adc	#100		;Add back last hundred.
		sty	0,x		;Put hundreds digit in buffer.
		inx

		ldy	#0		;Reset tens counter.
		sec
pddig2:		sbc	#10		;Check for ten.
		bcc	pddig2c		;Go if no more tens.
		iny			;Increment tens counter.
		jmp	pddig2		;Loop.

pddig2c:	adc	#10		;Add back last ten.
		sty	0,x		;Put tens digit in buffer.
		inx

		sta	0,x		;Put ones digit in buffer.
		dex
		dex

		rts


;-----------------------------------------------------------------------------
; Read Joystick #1
;
; Changes: A, X, Y
; Sets: JOY1_VAL, JOY1_CHG
;
readjoy1:	ldy	JOY1_VAL	;Get previous value.
		lda	#1
		sta	$4016		;Latch joystick.
		lda	#0
		sta	$4016

		ldx	#8
rj1loop:	lda	$4016		;Read bit.
		lsr	a		;Shift bit 0 into carry flag.
		rol	JOY1_VAL	;Shift carry into bit 0.
		dex
		bne	rj1loop		;Read all 8 bits.

		tya			;Get previous value.
		eor	JOY1_VAL	;Make change flags.
		sta	JOY1_CHG	;Save them.

		rts			;All done.


;-----------------------------------------------------------------------------
; Read Joystick #2
;
; Changes: A, X, Y
; Sets: JOY1_VAL, JOY1_CHG
;
readjoy2:	ldy	JOY2_VAL	;Get previous value.
		lda	#1
		sta	$4016		;Latch joystick.
		lda	#0
		sta	$4016

		ldx	#8
rj2loop:	lda	$4017		;Read bit.
		lsr	a		;Shift bit 0 into carry flag.
		rol	JOY2_VAL	;Shift carry into bit 0.
		dex
		bne	rj2loop		;Read all 8 bits.

		tya			;Get previous value.
		eor	JOY2_VAL	;Make change flags.
		sta	JOY2_CHG	;Save them.

		rts			;All done.


;-----------------------------------------------------------------------------
; Disable screen routine.
;
; Changes: A
;
scrn_off:
		lda	REG_2001
		and	#%11101111	;Disable sprites.
		sta	$2001

		lda	#$ff
		sta	SCRN_REQ	;Request NMI routine to blank screen.
soflp:		lda	SCRN_REQ
		bne	soflp		;Wait for NMI to occur.
		rts


;-----------------------------------------------------------------------------
; Enable screen routine.
;
; Entry: A = NMI mode.
; Changes: A
;
scrn_on:
		sta	SCRN_REQ	;Request NMI routine to enable screen.
sonlp:		lda	SCRN_REQ
		bne	sonlp		;Wait for NMI to occur.
		rts


;-----------------------------------------------------------------------------
; Wait for start of vertical retrace.
;
; Changes: A
;
waitvert:	lda	$2002
		bpl	waitvert	;Loop until bit 7 set.
		rts


;-----------------------------------------------------------------------------
; Delay for a specified number of 1/10 seconds.
;
; Entry: A = # of 1/10 seconds to wait.
; Changes: A, X, Y
;
delay:
		tay			;Get # of 1/10 seconds in Y.
dswait3:	ldx	#TICKS/10
dswait2:	lda	NMI_TIME	;Get NMI timer value.
dswait1:	cmp	NMI_TIME
		beq	dswait1		;Loop until NMI occurs.
		dex
		bne	dswait2		;Loop for # of NMI's in 1/10 second.
		dey
		bne	dswait3		;Wait for # of 1/10 seconds.
		rts


;-----------------------------------------------------------------------------
; Clear top 4 rows of VRAM page 1.
;
clsp1top:
		lda	#$20		;MSB for page 1.
clstop:		pha			;Save for later.
		ldx	$2002		;Reset reg 2006.
		sta	$2006		;Write MSB.
		lda	#$00
		sta	$2006		;Write LSB.

		lda	#SPACE
		ldy	#4
ctlp2:		ldx	#32
ctlp1:		sta	$2007		;Clear VRAM.
		dex
		bne	ctlp1		;Clear row.
		dey
		bne	ctlp2		;Clear next row.

		pla			;Retrieve MSB.
		ora	#$03		;Adjust for palette address.
		sta	$2006		;Write MSB.
		lda	#$c0
		sta	$2006		;Write LSB.

		lda	#%00000000	;Palette data.
		ldx	#8
ctlp3:		sta	$2007		;Set palette registers.
		dex
		bne	ctlp3

		rts


;-----------------------------------------------------------------------------
; Clear top 4 rows of VRAM page 2.
;
clsp2top:
		lda	#$24		;MSB for page 2.
		jmp	clstop		;Continue.


;-----------------------------------------------------------------------------
; Clear bottom 26 rows of VRAM page 1.
;
clsp1bot:
		lda	#$20		;MSB for page 1.
clsbot:		pha			;Save for later.
		lda	$2002		;Reset reg 2006.
		lda	#$20
		sta	$2006		;Write MSB.
		lda	#$80
		sta	$2006		;Write LSB.

		lda	#SPACE
		ldy	#26
cp1blp2:	ldx	#32
cp1blp1:	sta	$2007		;Clear VRAM.
		dex
		bne	cp1blp1		;Clear row.
		dey
		bne	cp1blp2		;Clear next row.

		pla			;Retrieve MSB.
		ora	#$03		;Adjust for palette address.
		sta	$2006		;Write MSB.
		lda	#$c8
		sta	$2006		;Write LSB.

		lda	#%00000000	;Palette data.
		ldx	#56
cp1blp3:	sta	$2007		;Set palette registers.
		dex
		bne	cp1blp3

		rts


;-----------------------------------------------------------------------------
; Clear bottom 26 rows of VRAM page 2.
;
clsp2bot:
		lda	#$24		;MSB for page 2.
		jmp	clsbot		;Continue.


;-----------------------------------------------------------------------------
; Initialize sprite table.
;
initspr:
		ldx	#0
ivlp1:		lda	#$f8
		sta	SPR_DATA,x	;Initialize sprite table.
		inx
		lda	#0
		sta	SPR_DATA,x
		inx
		sta	SPR_DATA,x
		inx
		sta	SPR_DATA,x
		inx
		bne	ivlp1
		rts


;-----------------------------------------------------------------------------
; Initialize the NMI update queue.
;
initnmiq:
		lda	#0
		ldx	#NMI_BNUM*6
inqlp:		dex
		sta	NMI_BUF,x	;Clear NMI update queue.
		bne	inqlp

		sta	NMIBHEAD	;Reset queue head pointer.
		sta	NMIBTAIL	;Reset queue tail pointer.
		rts


;-----------------------------------------------------------------------------
; Special sound effect routine (overrides any current sounds).
;
; Entry: A = register set, Y:X = address of sound data.
;
sound:
		stx	STMP1
		sty	STMP2
		sta	STMP3
		tay

		lda	STMP1
		sec
		sbc	STMP3
		sta	STMP1
		lda	STMP2
		sbc	#0
		sta	STMP2

		lda	(STMP1),y
		sta	SF_LIST,y
		iny
		lda	(STMP1),y
		sta	SF_LIST,y
		iny
		lda	(STMP1),y
		sta	SF_LIST,y
		iny
		lda	(STMP1),y
		sta	SF_LIST,y

		lda	STMP3
		lsr	a
		lsr	a
		tax
		lda	sregtab,x		;Get bit mask.
		ora	SF_FLAGS
		sta	SF_FLAGS		;Set process flag.

		rts


;=============================================================================
; SOUND ROUTINES AND DATA FROM SUBS.ASM:
;
;-----------------------------------------------------------------------------
;THE FOLLOWING EQUATES ARE USED TO MAKE MUSIC STRINGS.

 .define	LC $00
 .define	LCs $01
 .define	LDb $01
 .define	LD $02
 .define	LDs $03
 .define	LEb $03
 .define	LE $04
 .define	LF $05
 .define	LFs $06
 .define	LGb $06
 .define	LG $07
 .define	LGs $08
 .define	LAb $08
 .define	LA $09
 .define	LAs $0A
 .define	LBb $0A
 .define	LB $0B
 .define	C $0C
 .define	Cs $0D
 .define	Db $0D
 .define	D $0E
 .define	Ds $0F		
 .define	Eb $0F
 .define	E $10
 .define	F $11
 .define	Fs $12
 .define	Gb $12
 .define	G $13	       	;NOTES (CENTER AROUND INSTRUMENT RANGE)
 .define	Gs $14
 .define	Ab $14
 .define	Ax $15		;SPECIAL CASE.  A WAS REGISTER INDICATOR.  USE Ax.
 .define	As $16
 .define	Bb $16
 .define	B $17
 .define	HC $18
 .define	HCs $19	;s MEANS SHARP (#)
 .define	HDb $19	;b MEANS FLAT
 .define	HD $1A
 .define	HDs $1B
 .define	HEb $1B
 .define	HE $1C
 .define	HF $1D
 .define	HFs $1E
 .define	HGb $1E
 .define	PAUSE $1F

 .define	N16 %00000000		;NOTE DURATIONS.  USE BY ADDING (Gs+N16)
 .define	N8 %00100000
 .define	N4 %01000000
 .define	N2 %01100000
 .define	N12 %10000000

 .define	BASE_HARPSI %10100000
 .define	HARPSI %10100001
 .define	HIGH_HARPSI %10100010
 .define	BASE_STRING %10100011
 .define	STRING %10100100
 .define	HIGH_STRING %10100101
 .define	BASE_ELECPIANO %10100110
 .define	ELECPIANO %10100111
 .define	HIGH_ELECPIANO %10101000	;INSTRUMENT SELECT COMMANDS
 .define	BASE_SLIDER %10101001
 .define	SLIDER %10101010
 .define	HIGH_SLIDER %10101011
 .define	BASE_BEE %10101100
 .define	BEE %10101101
 .define	HIGH_BEE %10101110
 .define	BASE_PIANO %10101111
 .define	PIANO %10110000
 .define	HIGH_PIANO %10110001
 .define	BASE_ARCADE %10110010
 .define	ARCADE %10110011
 .define	HIGH_ARCADE %10110100

 .define	VOICE0 %11100000
 .define	VOICE1 %11100001	;USED TO SELECT A REGISTER SET (VOICE).
 .define	VOICE2 %11100010
 .define	VOICE3 %11100011

 .define	REPLAY %11100100	;USED TO REPEAT THE SOUND STRING OR END IT.
 .define	ENDPLAY %11101000

 .define	LOADREG0 %11101100
 .define	LOADREG1 %11101101	;USED TO HARD CODE LOADING OF REGISTERS
 .define	LOADREG2 %11101110	;IN CURRENTLY SELECTED REGISTER SET (VOICE).
 .define	LOADREG3  %11101111

 .define	STOPVOICE %11110000
 .define	STARTVOICE %11110100 	;USED TO SILENCE OR ACTIVATE A VOICE

 .define	COMPLEX %11111100	;USED TO SELECT THE COMPLEX SOUND GENERATOR

;-----------------------------------------------------------------------------
; Music & sound effects data:
;
explode:	.byte 	$0f,$00,$7d,$40
destroy:	.byte 	$04,$00,$0e,$a9
kill:		.byte 	$04,$00,$0e,$a9
ricochet:	.byte 	$05,$00,$ad,$40
shoot:		.byte 	$07,$00,$80,$00
pcrys:		.byte 	$0d,$0b,$0f,$d8
ppriz:		.byte 	$0f,$00,$40,$00
smash:		.byte 	$03,$00,$04,$08
drop:		.byte 	$0f,$00,$60,$00
select:		.byte 	$0f,$00,$60,$00
tbonus:		.byte 	$00,$00,$20,$11
bbonus:		.byte 	$02,$01,$00,$24

bass1:  
.byte 	VOICE0,BASE_PIANO
.byte 	C+N16,C+N16,Eb+N16,C+N16,F+N16,Fs+N16,F+N16,Eb+N16
.byte 	C+N16,C+N16,Eb+N16,C+N16,F+N16,Fs+N16,F+N16,Eb+N16
.byte 	LAb+N16,LAb+N16,C+N16,LAb+N16,Eb+N16,LAb+N16,C+N16,Eb+N16
.byte 	LAb+N16,LAb+N16,C+N16,LAb+N16,Eb+N16,LAb+N16,C+N16,Eb+N16
.byte 	C+N16,C+N16,Eb+N16,C+N16,F+N16,Fs+N16,F+N16,Eb+N16
.byte 	C+N16,C+N16,Eb+N16,C+N16,F+N16,Fs+N16,F+N16,Eb+N16
.byte 	LAb+N16,LAb+N16,C+N16,LAb+N16,Eb+N16,LAb+N16,C+N16,Eb+N16
.byte 	LAb+N16,LAb+N16,C+N16,LAb+N16,Eb+N16,LAb+N16,C+N16,Eb+N16
.byte 	LF+N16,LF+N16,LAb+N16,LF+N16,LBb+N16,LB+N16,LBb+N16,LAb+N16
.byte 	LF+N16,LF+N16,LAb+N16,LF+N16,LBb+N16,LB+N16,LBb+N16,LAb+N16
.byte      LG+N16,LG+N16,LB+N16,LG+N16,D+N16,LG+N16,LB+N16,D+N16
.byte 	G+N16,G+N16,F+N16,F+N16,Eb+N16,Eb+N16,D+N16,D+N16,REPLAY
melody1:
.byte 	VOICE1,HARPSI,C+N8,G+N8,G+N8,G+N8
.byte 	G+N16,Fs+N16,F+N16,Eb+N16,G+N16,Fs+N16,F+N16,Eb+N16
.byte 	LAb+N8,Eb+N8,Eb+N8,Eb+N8
.byte 	Eb+N16,D+N16,Db+N16,C+N16,Eb+N16,D+N16,Db+N16,C+N16
.byte  	C+N8,G+N8,G+N8,G+N8
.byte 	G+N16,Fs+N16,F+N16,Eb+N16,G+N16,Fs+N16,F+N16,Eb+N16
.byte 	LAb+N8,Eb+N8,Eb+N8,Eb+N8
.byte 	Eb+N16,D+N16,Db+N16,C+N16,Eb+N16,D+N16,Db+N16,C+N16
.byte 	LF+N8,C+N8,C+N8,C+N8
.byte 	C+N16,LB+N16,LBb+N16,LAb+N16,C+N16,LB+N16,LBb+N16,LAb+N16
.byte 	LG+N8,D+N8,D+N8,D+N8
.byte 	G+N16,G+N16,D+N16,D+N16,Eb+N16,Eb+N16,LB+N16,LB+N16,REPLAY
bass2:
.byte 	VOICE0,BASE_PIANO,LC+N16,LG+N16,C+N16,Eb+N16,LG+N16,C+N16,LC+N16,PAUSE+N16
.byte 	LC+N16,LG+N16,C+N16,Eb+N16,D+N16,C+N16,LG+N16,PAUSE+N16
.byte 	LEb+N16,LAb+N16,C+N16,Eb+N16,LAb+N16,C+N16,LAb+N16,PAUSE+N16
.byte 	LEb+N16,LAb+N16,C+N16,Eb+N16,Cs+N16,C+N16,LAb+N16,PAUSE+N16
.byte 	LC+N16,LG+N16,C+N16,Eb+N16,LG+N16,C+N16,LC+N16,PAUSE+N16
.byte 	LC+N16,LG+N16,C+N16,Eb+N16,D+N16,C+N16,LG+N16,PAUSE+N16
.byte 	LEb+N16,LAb+N16,C+N16,Eb+N16,LAb+N16,C+N16,LAb+N16,PAUSE+N16
.byte 	LEb+N16,LAb+N16,C+N16,Eb+N16,Cs+N16,C+N16,LAb+N16,PAUSE+N16
.byte 	LC+N16,LF+N16,LAb+N16,C+N16,LF+N16,LAb+N16,LF+N16,PAUSE+N16
.byte 	LC+N16,LF+N16,LAb+N16,C+N16,LBb+N16,LAb+N16,LF+N16,PAUSE+N16
.byte 	LD+N16,LG+N16,LB+N16,D+N16,LG+N16,LB+N16,LG+N16,PAUSE+N16
.byte 	LD+N16,LG+N16,LB+N16,D+N16,C+N16,LB+N16,LG+N16,PAUSE+N16,REPLAY
melody2:
.byte 	VOICE1,PIANO,C+N16,G+N16,C+N16,Ab+N16,C+N16,G+N16,C+N16,PAUSE+N16
.byte 	C+N16,G+N16,C+N16,Ab+N16,C+N16,G+N16,C+N16,PAUSE+N16
.byte 	LAb+N16,Eb+N16,LAb+N16,F+N16,LAb+N16,Eb+N16,LAb+N16,PAUSE+N16
.byte 	LAb+N16,Eb+N16,LAb+N16,F+N16,LAb+N16,Eb+N16,LAb+N16,PAUSE+N16
.byte 	C+N16,G+N16,C+N16,Ab+N16,C+N16,G+N16,C+N16,PAUSE+N16
.byte 	C+N16,G+N16,C+N16,Ab+N16,C+N16,G+N16,C+N16,PAUSE+N16
.byte 	LAb+N16,Eb+N16,LAb+N16,F+N16,LAb+N16,Eb+N16,LAb+N16,PAUSE+N16
.byte 	LAb+N16,Eb+N16,LAb+N16,F+N16,LAb+N16,Eb+N16,LAb+N16,PAUSE+N16
.byte 	LF+N16,C+N16,LF+N16,Db+N16,LF+N16,C+N16,LF+N16,PAUSE+N16
.byte 	LF+N16,C+N16,LF+N16,Db+N16,LF+N16,C+N16,LF+N16,PAUSE+N16
.byte 	LG+N16,D+N16,LG+N16,Eb+N16,LG+N16,D+N16,LG+N16,PAUSE+N16
.byte 	LG+N16,D+N16,LG+N16,Eb+N16,LG+N16,D+N16,LG+N16,PAUSE+N16,REPLAY
melody3:
.byte 	VOICE1,HARPSI,G+N2,PAUSE+N4,D+N8,Eb+N8,C+N2,PAUSE+N2
.byte 	G+N2,PAUSE+N4,D+N8,Eb+N8,C+N2,PAUSE+N2
.byte 	F+N2,PAUSE+N4,C+N8,D+N8,LB+N2,PAUSE+N2,ENDPLAY
frz_bass:
.byte 	VOICE0,BASE_PIANO,LC+N8,LG+N8,C+N8,LG+N8,LAb+N8,LEb+N8,LG+N8,LD+N8,LC+N4,PAUSE+N4,ENDPLAY
frz_mel:
.byte 	VOICE1,BASE_STRING,HC+N8,Eb+N8,F+N8,G+N8,Ab+N8,C+N8,D+N8,Eb+N8,C+N4,PAUSE+N4,ENDPLAY
win_mel1:
.byte   	VOICE0,BASE_PIANO,LC+N8,LG+N8,LE+N8,PAUSE+N16,LC+N8,LG+N8,LG+N16,LE+N8,LC+N8
.byte 	LD+N8,LG+N8,LF+N8,PAUSE+N16,LD+N8,LG+N8,LG+N16,LF+N8,LD+N8
.byte 	LD+N8,LG+N8,LF+N8,PAUSE+N16,LD+N8,LG+N8,LG+N16,LF+N8,LD+N8
.byte 	LC+N8,LG+N8,LE+N8,PAUSE+N16,LC+N8,LG+N8,LG+N16,LE+N8,LC+N8,REPLAY
win_mel2:
.byte 	VOICE1,HIGH_STRING,G+N4,E+N4,C+N8,C+N16,C+N16,E+N8,G+N8,F+N4,D+N4,LA+N2
.byte 	F+N4,D+N4,LA+N8,LA+N16,LA+N16,D+N8,F+N8,E+N4,C+N4,LG+N2,REPLAY
ttl_mel1:
.byte 	VOICE0,BASE_PIANO,C+N8,G+N8,Eb+N8,PAUSE+N16,C+N8,G+N8,G+N16,Eb+N8,C+N8
.byte 	C+N8,G+N8,Eb+N8,PAUSE+N16,C+N8,G+N8,G+N16,Eb+N8,C+N8
.byte 	LAb+N8,Eb+N8,C+N8,PAUSE+N16,LAb+N8,Eb+N8,Eb+N16,C+N8,LAb+N8
.byte 	LAb+N8,Eb+N8,C+N8,PAUSE+N16,LAb+N8,Eb+N8,Eb+N16,C+N8,LAb+N8
.byte 	C+N8,G+N8,Eb+N8,PAUSE+N16,C+N8,G+N8,G+N16,Eb+N8,C+N8
.byte 	C+N8,G+N8,Eb+N8,PAUSE+N16,C+N8,G+N8,G+N16,Eb+N8,C+N8
.byte 	LAb+N8,Eb+N8,C+N8,PAUSE+N16,LAb+N8,Eb+N8,Eb+N16,C+N8,LAb+N8
.byte 	LAb+N8,Eb+N8,C+N8,PAUSE+N16,LAb+N8,Eb+N8,Eb+N16,C+N8,LAb+N8
.byte 	LF+N8,C+N8,LAb+N8,PAUSE+N16,LF+N8,C+N8,C+N16,LAb+N8,LF+N8
.byte 	LF+N8,C+N8,LAb+N8,PAUSE+N16,LF+N8,C+N8,C+N16,LAb+N8,LF+N8
.byte      LG+N8,D+N8,LB+N8,PAUSE+N16,LG+N8,D+N8,D+N16,LB+N8,LG+N8
.byte      LG+N8,D+N8,LB+N8,PAUSE+N16,LG+N8,D+N8,D+N16,LG+N16,LA+N16,LBb+N16,LB+N16,REPLAY
ttl_mel2:
.byte 	VOICE1,HIGH_STRING,G+N2,PAUSE+N8,D+N8,Eb+N8,LB+N8,C+N2,PAUSE+N2
.byte 	Eb+N2,PAUSE+N8,LBb+N8,C+N8,LEb+N8,LAb+N2,PAUSE+N2
.byte 	G+N2,PAUSE+N8,D+N8,Eb+N8,LB+N8,C+N2,PAUSE+N2
.byte 	Eb+N2,PAUSE+N8,LBb+N8,C+N8,LEb+N8,LAb+N2,PAUSE+N2
.byte 	C+N2,PAUSE+N8,LG+N8,LAb+N8,LC+N8,LF+N2,PAUSE+N2
.byte 	D+N2,PAUSE+N8,LBb+N8,LB+N8,LD+N8,LG+N2,PAUSE+N2,REPLAY
pg_bass:
.byte 	VOICE0,BASE_HARPSI,LC+N8,LG+N16,C+N16,D+N8,LBb+N16,LG+N16
.byte 	LF+N8,C+N16,LAb+N16,LG+N8,PAUSE+N8,ENDPLAY
pg_mel:
.byte 	VOICE1,PIANO,C+N8,G+N16,Eb+N16,LBb+N8,F+N16,D+N16
.byte 	LAb+N8,Eb+N16,C+N16,LB+N8,PAUSE+N8,ENDPLAY
go_mel1:
.byte 	VOICE0,HARPSI,Ab+N2,G+N4,F+N4,G+N2,PAUSE+N2,ENDPLAY
go_mel2:
.byte 	VOICE1,PIANO,F+N2,Eb+N4,D+N4,C+N2,PAUSE+N2,ENDPLAY
rd_bass:
.byte 	VOICE0,PIANO,C+N8,LBb+N8,LA+N8,LAb+N8,LG+N4,PAUSE+N4,ENDPLAY
rd_mel:
.byte 	VOICE1,HARPSI,Ab+N16,F+N16,G+N16,Eb+N16,Fs+N16,D+N16,F+N16,Eb+N16,C+N4,PAUSE+N4,ENDPLAY
es_bass:
.byte 	VOICE0,PIANO,G+N16,D+N16,Eb+N16,C+N16,D+N4,PAUSE+N4,ENDPLAY
es_mel:
.byte 	VOICE1,HARPSI,C+N16,G+N16,Eb+N16,Bb+N16,G+N4,PAUSE+N4,ENDPLAY




;-----------------------------------------------------------------------------
;THIS ROUTINE WILL PLAY (ACTIVATE) THE SOUND STRUCTURE POINTED TO BY
;Y:X.  THE SLOT TO PLAY IT IN IS PASSED IN A.  A RETURNS Z IF SUCCESS
;AND NZ IF FAILURE.  THE VALUES FOR A ARE:

;0 AND Z IF SUCCESS.
;-1 IF THE SOUND SLOT # WAS INVALID (OVER RANGE).
;1 IF THE SLOT WAS ALREADY IN USE (USE SILENCE TO FREE THE SLOT).

play:
  	STX	SUBSVAR1
	STY	SUBSVAR2	;SAVE ENTRY POINTERS
	JSR	SNDINDX		;IN RANGE?
	BEQ	P10
	RTS

P10:	LDA	SND_RAM+SF,X	;IN USE?
	BPL	P20
	LDA	#1		;IF IT IS, RETURN 1
	RTS

P20:	LDA	#1
	STA	SND_RAM+ST,X	;SET NEXT NMI TO ACTIVATE SOUND
	LDA	#0
	STA	SND_RAM+SI,X	;SET INSTRUMENT 0 AS DEFAULT
	LDA	SUBSVAR1
	STA	SND_RAM+SBL,X
	STA	SND_RAM+SOL,X	;SET LOW OFFSET
	LDA	SUBSVAR2
	STA	SND_RAM+SBH,X
	STA	SND_RAM+SOH,X	;SET HIGH OFFSET
	LDA	#$C0
	STA	SND_RAM+SF,X	;SET AS ACTIVE SOUND STRUCTURE BUT NO REG.
	RTS


;-----------------------------------------------------------------------------
;THIS ROUTINE WILL SILENCE (FREE UP) THE SOUND SLOT SPECIFIED BY A.
;IT IS OK TO SILENCE A SOUND THAT IS NOT ACTIVE.  ON RETURN A=0 AND Z 
;IF SUCCESS OR A=-1 AND NZ IF INVALID SLOT #.

silence:
	CMP	#-1		;SILENCE ALL?
	BNE	S10

	LDA	#0
S5:	PHA
	JSR	silence		;IF SO, LOOP WITH ALL VALUES
	BNE	S7
	PLA
	CLC
	ADC	#1
	JMP	S5
S7:	PLA
	LDA	#0		;AND RETURN OK.
	RTS

S10:	JSR	SNDINDX
	BEQ	S20	
	RTS			;IF BAD INDEX, RETURN -1

;INTERNAL CALL LOCATION IF X HAS A VALID SLOT NUMBER TO SILENCE.

S20:  	LDA	SND_RAM+SF,X	;GET THE FLAG BYTE
	BPL	S50		;SKIP IF NOT IN USE

;THIS SLOT WAS ACTIVE.  IF IT WAS NOT ACTUALLY PLAYING WE ARE DONE BUT
;IF IT WAS PLAYING, WE MIGHT HAVE TO REACTIVATE ANOTHER SUSPENDED SOUND
;SLOT.  WE SCAN THE LIST FROM THE TOP DOWN AND ONLY REACTIVATE THE FIRST
;WE FIND.

	TAY			;SAVE A COPY
	AND	#$60		;SEE IF NOT ASSIGNED OR IF SUSPENDED
	BEQ	S25		;SKIP IF TRULY ACTIVE
	LDA	#0
	STA	SND_RAM+SF,X	;IF INACTIVE, JUST FREE IT UP
	JMP	S50		;IF THIS ONE'S INACTIVE, IT DIDN'T SUSPEND ANY

S25:  	JSR	DISABLE_VOICE	;IF ACTIVE, DISABLE IT'S VOICE
	LDA	SND_RAM+SF,X	;GET BACK IT'S FLAG
	PHA			;SAVE THE FLAG
	LDA	#0
	STA	SND_RAM+SF,X	;FREE UP THIS SOUND STRUCTURE
	PLA
	AND	#$1F		;KEEP BASE OF REGISTERS IN USE
	STA	SUBSVAR1	;SAVE HERE FOR COMPARE TO ONES WE FIND

	LDX	#0		;START AT LOWEST SLOT

S30:	TXA
	PHA
	LDA	SND_RAM+SF,X	;GET ITS FLAG BYTE
	BPL	S42		;IF NOT IN USE, SKIP IT

	AND	#$20		;SEE IF SUSPENDED
	BEQ	S42		;WE DON'T CARE UNLESS IT IS
	LDA	SND_RAM+SF,X
	AND	#$1F		;GET THE VOICE IT WAS USING
	EOR	SUBSVAR1	;SEE IF SAME AS OURS
	BNE	S42		;IF NOT, WE DON'T CARE
	PLA			;IF IT WAS, DISCARD SLOT INDEX
	JSR	INITSND		;AND INITIALIZE IT
	LDA	SND_RAM+SF,X
	AND	#$DF
	STA	SND_RAM+SF,X	;AND MARK AS NOT SUSPENDED ANY MORE
	JMP	S50

S42:	PLA
	CLC
	ADC	#SND_WIDE
	TAX
	CMP	#SND_WIDE*SNDSLOTS	;SEE IF DONE WITH LIST
	BCC	S30			;DO NEXT
	JMP	S50

S45:	PLA			;IF LIST END, DONE

S50:	LDA	#0
	RTS


;-----------------------------------------------------------------------------
;THESE ARE THE 2 BYTES TO LOAD INTO THE LOW REGISTERS FOR A GIVEN INSTRUMENT.
;THE SOUND FLAG BYTES SPECIFY THE INSTRUMENT AND THAT IS CONVERTED INTO
;A *4 INDEX FOR USE HERE.  IF THE VOICE IS 3 OR 4 THEN THESE VALUES DO NOT
;REALLY MAKE SENSE. 

INSTRUMENTS:	

.byte 	$C0,$00          		;BASE_HARPSI
.byte 	$C0,$00          		;HARPSI
.byte 	$C0,$00          		;HIGH_HARPSI    
.byte 	$80,$00          		;BASE_STRING
.byte 	$80,$00          		;STRING
.byte 	$80,$00          		;HIGH_STRING    
.byte 	$00,$00          		;BASE_ELECPIANO
.byte 	$00,$00          		;ELECPIANO
.byte 	$00,$00          		;HIGH_ELECPIANO
.byte 	$80,$FF          		;BASE_SLIDER
.byte 	$80,$FF          		;SLIDER
.byte 	$80,$FF          		;HIGH_SLIDER   
.byte 	$00,$D6          		;BASE_BEE
.byte 	$00,$D6          		;BEE
.byte 	$00,$D6          		;HIGH_BEE
.byte 	$40,$00          		;BASE_PIANO
.byte 	$40,$00          		;PIANO
.byte 	$40,$00          		;HIGH_PIANO
.byte  	$80,$C9			;BASE_ARCADE
.byte  	$80,$C9			;ARCADE
.byte  	$80,$C9			;HIGH ARCADE


;-----------------------------------------------------------------------------
;THIS ROUTINE WILL GO THROUGH THE SOUND SLOTS AND WILL FEED THE NEXT
;CORRECT DATA TO THE SOUND CHIP ACCORDING TO THE ACTIVE SLOTS.  IT SHOULD
;BE CALLED EACH NMI.

FEED_SOUND:

	LDX	#0		;START WITH THE LOWEST SOUND SLOT.
	
FS20:	LDA	SND_RAM+SF,X	;GET THE SOUND FLAG
	BPL	FS30		;IF NOT IN USE, SKIP IT

;FOUND A SOUND THAT IS RUNNING.  COUNT DOWN ITS TIMER.

	DEC	SND_RAM+ST,X	;COUNT IT DOWN
	BEQ	FS50		;IF REACHES ZERO, TIME FOR MORE PROCESSING	

;DONE WITH THIS SOUND, OR NOT IN USE.

FS30:	TXA
	CLC
	ADC	#SND_WIDE
	TAX
	CMP	#SND_WIDE*SNDSLOTS	;END OF LIST?
	BCC	FS20			;IF NOT, CONTINUE
	RTS

;THIS SOUND NEEDS TO BE UPDATED.  ITS TIMER RAN OUT.

FS50:  	LDA	SND_RAM+SOL,X		;GET LOW OFFSET OF NEXT BYTE TO USE
	STA	SUBSVAR1
	LDA	SND_RAM+SOH,X		;GET HIGH
	STA	SUBSVAR2		;MAKE POINTER TO THE NEXT BYTE
	LDY	#0

;PROCESS NEXT COMMAND FOR THIS SOUND SLOT.

FS60:	LDA	(SUBSVAR1),Y
	AND	#%11100000		;SEE IF JUST A NOTE
	CMP	#%10100000		;NOTES END BELOW THIS
	BCS	FS200

;JUST ANOTHER NOTE TO PLAY.

	LDA	(SUBSVAR1),Y		;GET BACK DURATION
	JSR	SET_DURATION

	LDA	SND_RAM+SI,X		;GET INSTRUMENT TYPE
	ASL	A			;MAKE *2 POINTER
	TAY
	LDA	FREQBASES,Y		;GET LOW BASE OF FREQUENCY TABLE
	STA	NMI_PTR
	LDA	FREQBASES+1,Y
	STA	NMI_PTR+1		;MAKE POINTER TO FREQUENCY TABLE
	LDY	#0
	LDA	(SUBSVAR1),Y		;GET NOTE TO USE
	AND	#$1F
	CMP	#PAUSE			;SILENCE?
	BEQ	FS70
	ASL	A			;MAKE INDEX FROM IT
	TAY
	LDA	(NMI_PTR),Y
	STA	SUBSVAR3
	INY
	LDA	(NMI_PTR),Y
	STA	SUBSVAR4		;SET FREQUENCY TO USE
	JSR	SET_FREQUENCY
FS70:  	JSR	INC_INDX
	JMP	FS30
	
;ITS A SPECIAL COMMAND.

FS200:	CMP	#%10100000	;SELECT INSTRUMENT?
	BNE	FS220
	LDA	(SUBSVAR1),Y	;GET BACK INSTRUMENT
	AND	#$1F
	STA	SND_RAM+SI,X	;PUT INTO SLOT
	LDA	SND_RAM+SF,X	;SEE IF SUSPENDED OR NO BASE
	AND	#$60
	BNE	FS210
	JSR	INITSND		;INITIALIZE FOR THIS INSTRUMENT

;DONE WITH THIS SOUND AND NEED TO INC THE POINTER AND PUT IN A 1 NMI DELAY.

FS210:	JSR	INC_INDX
	LDA	#1
	STA	SND_RAM+ST,X	;SET TIMER FOR NEXT NMI
	JMP	FS30
	
;ABSOLUTE FREQUENCY LOAD?

FS220:	CMP	#%11000000	;LOAD FREQUENCY?
	BNE	FS240

	LDA	(SUBSVAR1),Y	;GET NOTE DURATION
	ASL	A
	ASL	A
	ASL	A		;MOVE NOTE DURATION INTO NORMAL LOCATION
	JSR	SET_DURATION

	LDY	#0
	LDA	(SUBSVAR1),Y	;GET HIGH FREQUENCY 2 BITS
	AND	#3
	STA	SUBSVAR4
	INY
	LDA	(SUBSVAR1),Y	;GET LOW FREQUENCY BYTE
	STA	SUBSVAR3	;SAVE IT

	JSR	SET_FREQUENCY	;SET FREQUENCY.  WILL CAUSE IT TO PLAY
	JSR	INC_INDX
	JSR	INC_INDX
	JMP	FS30

;EXTENDED COMMAND.

FS240:	LDA	(SUBSVAR1),Y	;GET THE EXTENDED BITS
	AND	#%00011111	;KEEP THEM AND THE DATA BITS TOO.
	CMP	#%00000011+1	;SEE IF SPECIFY VOICE COMMAND
	BCS	FS260

	AND	#3		;GET THE VOICE TO USE
	ASL	A
	ASL	A		;MAKE *4 BASE POINTER

FS245:	ORA	SND_RAM+SF,X	;PUT IT INTO THE FLAG BYTE
	AND	#$9F		;REMOVE REGISTER NOT SELECTED BIT AND SUSPEND
	STA	TMP_NMI1	;SAVE HERE FOR CHECK FOR OTHER'S USING IT
	STA	SND_RAM+SF,X
	STX	TMP_NMI2	;SAVE OUR INDEX

	LDX	#0
FS250:	LDA	SND_RAM+SF,X	;GET A FLAG BYTE
	EOR	TMP_NMI1	;SEE IF THAT SOUND SLOT IS USING THIS VOICE
	BNE	FS255
      	LDA	SND_RAM+SF,X
	ORA	#$20		;IF SO, SUSPEND HIM
	STA	SND_RAM+SF,X
FS255:	TXA
	CLC
	ADC	#SND_WIDE
	TAX
	CMP	#SND_WIDE*SNDSLOTS	;DONE?
	BCC	FS250

	LDX	TMP_NMI2	;GET BACK OUR INDEX
	LDA	TMP_NMI1	;AND OUR FLAG BYTE
	STA	SND_RAM+SF,X	;PUT BACK OUR FLAG CAUSE OUR LOOP SUSPENDED US
	JSR	ENABLE_VOICE	;AND ENABLE OUR VOICE
	JMP	FS210

FS260:	CMP	#%00000111+1	;REPEAT LIST?
	BCS	FS280
	LDA	SND_RAM+SBL,X
	STA	SND_RAM+SOL,X
	LDA	SND_RAM+SBH,X
	STA	SND_RAM+SOH,X	;IF SO, JUST RESET POINTER
	JMP	FS210		;AND SKIP THIS COMMAND.


FS280:	CMP	#%00001011+1	;END LIST?
	BCS	FS300
	TXA
	PHA
	JSR	S20		;USE THE SILENCE ROUTINE'S SPECIAL ENTRY PNT.
	PLA
	TAX
	JMP	FS210

FS300:	CMP	#%00001111+1	;ABSOLUTE REG LOAD?
	BCS	FS320

	LDA	SND_RAM+SF,X
	AND	#$60
	BEQ	FS310
	JMP	FS210		;SKIP IT IF NOT SELECTED OR SUSPENDED

FS310:	LDA	SND_RAM+SF,X	;GET REG BASE FOR THIS VOICE
	AND	#$1F		;KEEP THE REG OFFSET
	STA	SUBSVAR3
	LDY	#0
	LDA	(SUBSVAR1),Y	;GET LOW 2 BITS OF REG TO USE
	AND	#3
	CLC
	ADC	SUBSVAR3	;MAKE IT INTO A POINTER
	STA	NMI_PTR
	LDA	#$40
	STA	NMI_PTR+1	;AND POINT TO THE REG AT 40XX
	LDY	#1
	LDA	(SUBSVAR1),Y	;GET VALUE TO USE
	LDY	#0
	STA	(NMI_PTR),Y	;PUT IT OUT THERE
	JSR	INC_INDX		;SKIP THE EXTRA BYTE WE USED
	JMP	FS210	

FS320:	CMP	#%00010011+1	;DISABLE SOUND?
	BCS	FS340
	JSR	DISABLE_VOICE
	JMP	FS210

FS340:	CMP	#%00010111+1	;ENABLE SOUND?
	BCS	FS360
	JSR	ENABLE_VOICE
	JMP	FS210

FS360:	CMP	#%000110111+1	;USE COMPLEX VOICE?
	BCS	FS380
	LDA	#$10		;ITS BASE IS HERE
	JMP	FS245		;SHARE CODE WITH THE OTHER VOICE LOGIC

;COMMAND NOT RECOGNIZED.  JUST SKIP IT.

FS380:	JMP	FS210


;-----------------------------------------------------------------------------
;THIS ROUTINE WILL TAKE A SOUND SLOT INDEX IN X AND ENABLE THE APPROPRIATE
;BIT IN THE SOUND ENABLE REGISTER TO MAKE THOSE REGISTERS ACTIVE.

ENABLE_VOICE:

	JSR	ENABLE_BIT
	ORA	REG4015
	STA	REG4015
	STA	$4015		;ENABLE IT AND SAVE VALUE FOR OTHERS TO REF.
	RTS


;-----------------------------------------------------------------------------
;THIS ROUTINE WILL DISABLE A VOICE SIMILAR TO ENABLE VOICE.

DISABLE_VOICE:
	JSR	ENABLE_BIT
	EOR	#$FF
	AND	REG4015
	STA	REG4015
	STA	$4015		;DISABLE IT AND SAVE STATE	
	RTS


;-----------------------------------------------------------------------------
;THIS ROUTINE WILL PUT AN ENABLE REGISTER BIT VALUE INTO A FOR THE SOUND
;SLOT INDEX IN X.  THIS VALUE IS FOR REG4015.

ENABLE_BIT:
	LDA	SND_RAM+SF,X	;GET THE REGISTERS TO USE
	AND	#$1F
	LSR	A
	LSR	A		;MAKE INTO UNIQUE NUMBER 0-4
	TAY
	LDA	#1
	INY
EB10:	DEY
	BEQ	EB20
	ASL	A   		;SHIFT UP ENABLE BIT
     	JMP	EB10
EB20:	RTS


;-----------------------------------------------------------------------------
;THIS TABLE HAS A 2 BYTE VALUE FOR EACH NOTE DURATION.  THIS FIRST IS
;THE NUMBER OF NMI CYCLES WE SHOULD WAIT FOR THE NOTE TO COMPLETE.
;THE SECOND IS THE VALUE TO PUT INTO THE SOUND CHIP DURATION REGISTER BITS.

TIME_BASE:
.byte 	8,1			;1/16 NOTE
.byte 	16,5			;1/8 NOTE
.byte 	32,8			;1/4 NOTE
.byte 	64,15			;1/2 NOTE
.byte 	128,31			;WHOLE NOTE

.byte 	12,3			;3/32 NOTE
.byte 	24,7			;3/16 NOTE
.byte 	48,12			;3/8 NOTE
.byte 	96,23			;3/4 NOTE


;-----------------------------------------------------------------------------
;THIS ROUTINE WILL TAKE A NOTE DURATION (1/16, 1/8, 1/4, ETC) AS SPECIFIED
;IN THE TOP 3 BITS OF A AND WILL SET THE TIME COUNTER VALUE IN
;THE SOUND SLOT AND WILL ALSO SET UP THE SOUND REGISTER RESPONSIBLE FOR
;THE TIME.  THE SLOT INDEX MUST BE IN X.  THE VALUES IN THE HIGH 3 BITS OF 
;A SHOULD RANGE FROM %000 TO %100.  IF THE SLOT IS SUSPENDED OR THE
;REGISTERS ARE NOT SELECTED, THIS ROUTINE WILL SET UP ONLY THE TIME
;BASE AND WILL NOT DO AN ACTUAL LOAD.

;X IS SAVED BUT Y IS NOT.  SUBSVARs ARE NOT DISTURBED.    NMI LEVEL
;ROUTINE ONLY!

SET_DURATION:

	LSR	A
	LSR	A
	LSR	A
	LSR	A		;MOVE BITS DOWN TO MAKE *2 INDEX
	AND	#$FE		;MAKE SURE INDEX IS EVEN
	TAY			;USE INDEX HERE
	lda	MU_SLOW
	beq	stdcnt		;Go if not slow music (50% slow).
	cpx	#SND_WIDE*2
	bcs	stdcnt		;Go if not slot 0 or 1.

	tya
	clc
	adc	#10		;Point Y to slow table.
	tay

stdcnt:	LDA	TIME_BASE,Y	;GET THE TIME BASE FOR OUR SOUND STRUCTURE
	STA	SND_RAM+ST,X	;RELOAD THE TIMER

	LDA	SND_RAM+SF,X	;GET BACK THE FLAG
	AND	#$60		;SEE IF SUSPENDED OR NO REGS SELECTED
	BNE	SD60

	INY
	LDA	TIME_BASE,Y	;GET THE RELOAD BITS FOR THE LOW REGISTER
	STA	TMP_NMI1	;SAVE IT HERE

	LDA	SND_RAM+SF,X	;GET REGISTER BASE
	AND	#$1F		;MAKE BASE REG
	STA	NMI_PTR
	LDA	#$40
	STA	NMI_PTR+1	;INTO A POINTER WE CAN USE

	LDA	SND_RAM+SI,X	;GET INSTRUMENT
	ASL	A		;MAKE *2 POINTER FROM IT
	TAY
	LDA	INSTRUMENTS,Y	;GET REGISTER VALUE TO LOAD
	ORA	TMP_NMI1	;OR IN THE TIME BASE
	LDY	#0
	STA	(NMI_PTR),Y	;PUT INTO THE SOUND CHIP
SD60:	RTS


;-----------------------------------------------------------------------------
;THE FOLLOWING TABLE HAS A 1 WORD PTR TO THE FREQUENCY TABLE TO USE
;FOR A GIVEN INSTRUMENT.  THE INSTRUMENTS REPEAT THEIR RANGES IN 3'S
;SO ACTUALLY THE TABLE REPEATS A WHOLE LOT.

FREQBASES:

.word  	LOW_FREQ,MID_FREQ,HIGH_FREQ
.word  	LOW_FREQ,MID_FREQ,HIGH_FREQ
.word  	LOW_FREQ,MID_FREQ,HIGH_FREQ
.word  	LOW_FREQ,MID_FREQ,HIGH_FREQ
.word  	LOW_FREQ,MID_FREQ,HIGH_FREQ
.word  	LOW_FREQ,MID_FREQ,HIGH_FREQ
.word  	LOW_FREQ,MID_FREQ,HIGH_FREQ
.word  	LOW_FREQ,MID_FREQ,HIGH_FREQ
.word  	LOW_FREQ,MID_FREQ,HIGH_FREQ
.word  	LOW_FREQ,MID_FREQ,HIGH_FREQ
.word  	LOW_FREQ,MID_FREQ


;-----------------------------------------------------------------------------
;THIS TABLE CONTAINS THE FREQUENCIES TO USE FOR SPECIFIC NOTES IN
;A MULTI-OCTIVE RANGE.  THERE ARE 3 REFERENCE POINTS INTO THE TABLE
;FOR USE WITH THE VARIOUS INSTRUMENTS.

LOW_FREQ:
.word  	$352		;C	
.word  	$325		;C#	
.word  	$2FD		;D	
.word  	$2CC		;Eb	
.word  	$2A7		;E	
.word  	$27C		;F	
.word  	$25A		;F#	
.word  	$23B		;G	
.word  	$213		;Ab	
.word  	$1FD		;A	
.word  	$1DE		;Bb	
.word  	$1C6		;B	

MID_FREQ:
.word  	$1AB		;C	
.word  	$191		;C#	
.word  	$17A		;D	
.word  	$167		;Eb	
.word  	$151		;E	
.word  	$13F		;F	
.word  	$12C		;F#	
.word  	$11C		;G	
.word  	$10D		;Ab	
.word  	$FE 		;A	
.word  	$EF 		;Bb	
.word  	$E2 		;B	

HIGH_FREQ:
.word  	$D5  		;MIDDLE C	
.word  	$C8		;C#	
.word  	$BE		;D	
.word  	$B3		;Eb	
.word  	$A9		;E	
.word  	$9F		;F	
.word  	$96		;F#	
.word  	$8E		;G	
.word  	$86		;Ab	
.word  	$7E		;A	
.word  	$77		;Bb	
.word  	$70		;B	
.word  	$6A		;C	
.word  	$64		;C#	
.word  	$5E		;D	
.word  	$59		;Eb	
.word  	$54		;E	
.word  	$4F		;F	
.word  	$4B		;F#	
.word  	$46		;G	
.word  	$42		;Ab	
.word  	$3F		;A	
.word  	$3B		;Bb	
.word  	$38		;B	
.word  	$34		;C	
.word  	$32		;C#	
.word  	$2F		;D	
.word  	$2C		;Eb	
.word  	$29		;E	
.word  	$27		;F	
.word  	$24		;F#	
.word  	$23		;G	


;-----------------------------------------------------------------------------
;THIS ROUTINE WILL TAKE A FREQUENCY IN SUBSVAR3 AND 4 AND WILL LOAD
;IT INTO THE SOUND CHIP POINTED TO BY THE SLOT INDEX IN X.  IT JUST
;RETURNS IF THE REGISTERS ARE NOT SELECTED OR THE SOUND IS SUSPENDED.

SET_FREQUENCY:

	LDA	SND_RAM+SF,X	;GET BACK THE FLAG
	AND	#$60		;SEE IF SUSPENDED OR NO REGS SELECTED
	BNE	SQ60

	LDA	SND_RAM+SF,X	;GET REGISTER BASE
	AND	#$1F		;MAKE BASE REG
	STA	NMI_PTR
	LDA	#$40
	STA	NMI_PTR+1	;INTO A POINTER WE CAN USE

	LDY	#2		;START WITH LOW REG LOAD
	LDA	SUBSVAR3
	STA	(NMI_PTR),Y
	INY
	LDA	SUBSVAR4	;THEN GET HIGH
	ORA	#8		;OR IN THE BIT TO USE DURATION REG
	STA	(NMI_PTR),Y
SQ60:	RTS


;-----------------------------------------------------------------------------
;THIS ROUTINE WILL INCREMENT THE CURRENT SOUND OFFSET POINTER IN THE
;SOUND SLOT SPECIFIED BY INDEX IN X.

INC_INDX:
	INC	SND_RAM+SOL,X	;DONE, MOVE INDEX ALONG
	BNE	IX5
	INC	SND_RAM+SOH,X
IX5:	RTS


;-----------------------------------------------------------------------------
;THIS ROUTINE WILL TAKE A SLOT INDEX IN X (NOT A SLOT #) AND WILL USE
;THE INSTRUMENT SPECIFICATION TO INITIALIZE THAT REGISTER SET.  MAKE SURE
;THAT THE REGISTER SET SPECIFICATION IS VALID, NOT SUSPENDED, AND THAT
;THE INSTRUMENT IS VALID, THIS ROUTINE DOES NOT CHECK THAT.

;YOUR INDEX IN X IS SAVED.  SUBSVARs ARE ALL CHANGED.

INITSND:
	LDA	SND_RAM+SI,X	;GET INSTRUMENT
	ASL	A		;MAKE *2 POINTER FROM IT
	STA	SUBSVAR4	;SAVE IT HERE
	LDA	SND_RAM+SF,X	;GET BASE
	AND	#$1F
	STA	SUBSVAR1
	LDA	#$40
	STA	SUBSVAR2	;MAKE FULL POINTER TO IT IN MEMORY

 	LDY	SUBSVAR4
	LDA	INSTRUMENTS,Y	;GET REGISTER VALUE TO LOAD
	LDY	#0
	STA	(SUBSVAR1),Y	;PUT INTO CORRECT REGISTER
	LDY	SUBSVAR4
	INY			;GET NEXT REGISTER VALUE
	LDA	INSTRUMENTS,Y
	LDY	#1
	STA	(SUBSVAR1),Y	;PUT INTO NEXT REG
	JSR	ENABLE_VOICE
	RTS


;-----------------------------------------------------------------------------
;THIS ROUTINE WILL CONVERT A SOUND SLOT NUMBER IN A INTO AN INDEX IN X.  IT
;ALSO CHECKS FOR IN RANGE.  ON RETURN Z AND A=0 IF VALID.    

SNDINDX:
	CMP	#SNDSLOTS	;VALID VALUE?
	BCS	SX40		;SKIP IF NOT

	TAX
	LDY	#SND_WIDE
	JSR	MUL
	LDA	#0
	RTS

SX40:	LDA	#-1
	RTS


;-----------------------------------------------------------------------------
;THIS ROUTINE WILL MULTIPLY REGISTER X BY REGISTER Y AND STORE THE RESULT
;LOW BYTE IN X AND HIGH IN Y.  THIS ROUTINE MAY BE CALLED FROM
;ANY LEVEL AND IT USES ITS OWN VARIABLES.  THIS ROUTINE DOES NOT CHANGE
;MATH4.

MUL: 	STY	MATH1		;SAVE MULTIPLIER
	STX	MATH3		;SAVE MULTIPLICAND
	LDA	#0
	STA	MATH2		;ZERO HIGH RESULT
	LDX	#8		;THERE ARE 8 BITS TO TEST FOR

M10:	ASL	A		;SHIFT PRODUCT 1 TO DOUBLE IT.  FIRST LOOP=0
	ROL	MATH2		;AND MOVE BIT UP INTO RESULT HIGH BYTE

	ASL	MATH1		;SEE IF WE NEED TO ADD FOR THIS BIT
	BCC	M20
	CLC
	ADC	MATH3		;IF SO, ADD IN THE VALUE
	BCC	M20
	INC	MATH2		;IF CARRY, BRING UP TO HIGH RESULT
M20:	DEX
	BNE	M10
	TAX			;SAVE LOW BYTE IN RETURN REG	
	LDY	MATH2		;AND GET HIGH
	RTS


;-----------------------------------------------------------------------------
; Set sound registers during NMI.
;
do_sf:
		lda	#$40
		sta	NMI_PTR+1
		lda	#0
		sta	NMI_PTR
		tay
		lda	SF_FLAGS		;Get sound effect flags.

dsfloop:	lsr	a
		pha
		bcc	dsfskip			;Skip if sound not activated.

		tya
		lsr	a
		lsr	a
		tax
		lda	sregtab,x		;Get bit mask.
		ora	REG4015
		sta	REG4015
		sta	$4015			;Enable voice.

		lda	SF_LIST,y
		sta	(NMI_PTR),y
		iny
		lda	SF_LIST,y
		sta	(NMI_PTR),y
		iny
		lda	SF_LIST,y
		sta	(NMI_PTR),y
		iny
		lda	SF_LIST,y
		sta	(NMI_PTR),y
dsfcont:	iny
		cpy	#$10
		bcs	dsfdone
		pla
		jmp	dsfloop

dsfskip:	iny
		iny
		iny
		jmp	dsfcont

dsfdone:	pla
		lda	#0
		sta	SF_FLAGS		;Reset sound effect flags.
		rts


;=============================================================================
; NMI interrupt service routine:
;
NMI_int:	pha			;Save registers.
		txa
		pha
		tya
		pha

		inc	NMI_TIME	;Increment 60Hz clock.

		lda	SCRN_REQ	;Check for screen request.
		beq	NMI_cnt		;Go if not one.
		cmp	#$ff		;Check if blank request.
		beq	NMI_blk		;Go if blank request.
		sta	NMI_MODE	;Set new NMI mode.
		ldx	#0
		stx	SCRN_REQ	;Clear flag.
		jmp	NMI_cnt2	;Continue.

NMI_blk:	lda	REG_2001
		and	#%11100111	;Disable background & sprites.
		sta	REG_2001
		sta	$2001
		lda	#0
		sta	SCRN_REQ	;Clear blank request flag.
		sta	NMI_MODE	;Set screen blanked mode.

NMI_blk2:	JSR	FEED_SOUND	;FEED THE SOUND CHIP.
		jsr	do_sf		;Process sound effects.
		jmp	NMI_done	;Continue (screen blanked).

NMI_cnt:	lda	NMI_MODE	;Check NMI mode.
		beq	NMI_blk2	;Go if screen blanked.

NMI_cnt2:	lda	REG_2000
		and	#%01111111	;Disable vertical retrace interrupts.
		sta	REG_2000
		sta	$2000		;Set register 2000.

		lda	REG_2001
		and	#%11100111	;Disable background & sprites.
		sta	REG_2001
		sta	$2001

		lda	NMI_MODE	;Check NMI mode.
		and	#NM_STAT	;Check if status needs updating.
		bne	NMI_stat	;Go if so.
		lda	NMI_MODE	;Check NMI mode.
		and	#NM_TITL	;Check for title screen mode.
		bne	NMI_titl	;Go if so.
		lda	NMI_MODE	;Check NMI mode.
		and	#NM_CONT	;Check for continue screen mode.
		bne	NMI_scnt	;Go if so.
		jmp	NMI_cnt3	;Continue if not.

NMI_titl:	;Display # of players selector.
		lda	TWO_PLAY	;Check selector position.
		bne	NMI_ttl2	;Go if two players.
		ldx	#ROCK_CH	;Set characters.
		ldy	#SPACE
		jmp	NMI_tlcn	;Continue.
NMI_ttl2:	ldx	#SPACE		;Set characters.
		ldy	#ROCK_CH
NMI_tlcn:	lda	#$22
		sta	$2006		;Write MSB.
		lda	#$6b
		sta	$2006		;Write LSB.
		stx	$2007		;Store first character.
		lda	#$22
		sta	$2006		;Write MSB.
		lda	#$8b
		sta	$2006		;Write LSB.
		sty	$2007		;Store second character.
		jmp	NMI_cnt3	;Continue.

NMI_scnt:	;Display continue/end selector.
		lda	CONTINUE	;Check selector position.
		beq	NMI_sct2	;Go if end.
		ldx	#ROCK_CH	;Set characters.
		ldy	#SPACE
		jmp	NMI_sctc	;Continue.
NMI_sct2:	ldx	#SPACE		;Set characters.
		ldy	#ROCK_CH
NMI_sctc:	lda	#$21
		sta	$2006		;Write MSB.
		lda	#$8b
		sta	$2006		;Write LSB.
		stx	$2007		;Store first character.
		lda	#$21
		sta	$2006		;Write MSB.
		lda	#$cb
		sta	$2006		;Write LSB.
		sty	$2007		;Store second character.
		jmp	NMI_cnt3	;Continue.

NMI_stat:	;Update the score lines.

		lda	$2002
		lda	CP_FLAG
		beq	NMI_sy2		;Go if not Creature-Proof.
		ldy	#$f0		;Get CP character.
		cmp	#22
		bcs	NMI_sy1s	;Continue if not < 2 seconds left.
		and	#%00000001
		beq	NMI_sy1s	;Continue if counter not odd.
		ldy	#SPACE		;Set to space character.
NMI_sy1s:	lda	#CPPOS >> 8
		sta	$2006		;Write MSB.
		lda	#CPPOS & $ff
		sta	$2006		;Write LSB.
		sty	$2007		;Store character.
NMI_sy2:
		lda	EP_FLAG
		beq	NMI_sy3		;Go if not Explosion-Proof.
		ldy	#$ed		;Get EP character.
		cmp	#22
		bcs	NMI_sy2s	;Continue if not < 2 seconds left.
		and	#%00000001
		beq	NMI_sy2s	;Continue if counter not odd.
		ldy	#SPACE		;Set to space character.
NMI_sy2s:	lda	#EPPOS >> 8
		sta	$2006		;Write MSB.
		lda	#EPPOS & $ff
		sta	$2006		;Write LSB.
		sty	$2007		;Store character.
NMI_sy3:
		lda	RP_FLAG
		beq	NMI_sy4		;Go if not Radiation-Proof.
		ldy	#$ef		;Get RP character.
		cmp	#22
		bcs	NMI_sy3s	;Continue if not < 2 seconds left.
		and	#%00000001
		beq	NMI_sy3s	;Continue if counter not odd.
		ldy	#SPACE		;Set to space character.
NMI_sy3s:	lda	#RPPOS >> 8
		sta	$2006		;Write MSB.
		lda	#RPPOS & $ff
		sta	$2006		;Write LSB.
		sty	$2007		;Store character.
NMI_sy4:
		lda	LP_FLAG
		beq	NMI_sy5		;Go if not Liquid-Proof.
		ldy	#$ee		;Get LP character.
		cmp	#22
		bcs	NMI_sy4s	;Continue if not < 2 seconds left.
		and	#%00000001
		beq	NMI_sy4s	;Continue if counter not odd.
		ldy	#SPACE		;Set to space character.
NMI_sy4s:	lda	#LPPOS >> 8
		sta	$2006		;Write MSB.
		lda	#LPPOS & $ff
		sta	$2006		;Write LSB.
		sty	$2007		;Store character.
NMI_sy5:

		lda	S_FLAG		;Get score flag.
		beq	NMI_sc2		;Go if no change.
		tax			;Get low RAM offset in X.
		ldy	#7		;Get length of string in Y.
		lda	#SPOS & $ff	;Get LSB of VRAM offset in A.
		jsr	dispnum		;Display string.
		lda	#0
		sta	S_FLAG		;Clear update flag.

NMI_sc2:	lda	R_FLAG		;Get # of lives flag.
		beq	NMI_sc3		;Go if no change.
		tax			;Get low RAM offset in X.
		ldy	#3		;Get length of string in Y.
		lda	#RPOS & $ff	;Get LSB of VRAM offset in A.
		jsr	dispnum		;Display string.
		lda	#0
		sta	R_FLAG		;Clear update flag.

NMI_sc3:	lda	L_FLAG		;Get level # flag.
		beq	NMI_sc4		;Go if no change.
		tax			;Get low RAM offset in X.
		ldy	#3		;Get length of string in Y.
		lda	#LPOS & $ff	;Get LSB of VRAM offset in A.
		jsr	dispnum		;Display string.
		lda	#0
		sta	L_FLAG		;Clear update flag.

NMI_sc4:	lda	B_FLAG		;Get # of bombs flag.
		beq	NMI_sc5		;Go if no change.
		tax			;Get low RAM offset in X.
		ldy	#3		;Get length of string in Y.
		lda	#BPOS & $ff	;Get LSB of VRAM offset in A.
		jsr	dispnum		;Display string.
		lda	#0
		sta	B_FLAG		;Clear update flag.

NMI_sc5:	lda	G_FLAG		;Get # of gems flag.
		beq	NMI_sc6		;Go if no change.
		tax			;Get low RAM offset in X.
		ldy	#7		;Get length of string in Y.
		lda	#GPOS & $ff	;Get LSB of VRAM offset in A.
		jsr	dispnum		;Display string.
		lda	#0
		sta	G_FLAG		;Clear update flag.

NMI_sc6:	lda	T_FLAG		;Get time flag.
		beq	NMI_sc7		;Go if no change.
		tax			;Get low RAM offset in X.
		ldy	#3		;Get length of string in Y.
		lda	#TPOS & $ff	;Get LSB of VRAM offset in A.
		jsr	dispnum		;Display string.
		lda	#0
		sta	T_FLAG		;Clear update flag.

NMI_sc7:	lda	PAUSED
		bne	NMI_cnt3	;Go if paused.
		lda	FT_FLAG
		bne	NMI_cnt3	;Go if timer frozen.
		lda	NMI_MODE	;Check NMI mode.
		and	#NM_PLAY	;Check if game in progress.
		beq	NMI_cnt3	;Go if not.

		dec	TL_SUBT		;Decrement sub-timer.
		bne	NMI_cnt3	;Go if not zero.
		lda	#TICKS
		sta	TL_SUBT		;Reset sub-timer.
		sta	TL_CHG		;Set time change flag.
		lda	TIMELEFT	;Get LSB time left.
		ora	TIMLEFT2	;Or in MSB.
		beq	NMI_cnt3	;Continue if already zero.
		lda	TIMELEFT	;Get LSB time left.
		bne	NMI_sc7b
		dec	TIMLEFT2	;Decrement MSB time left.
		dec	TIMELEFT	;Decrement LSB time left.
		jmp	NMI_cnt3	;Continue.

NMI_sc7b:	dec	TIMELEFT	;Decrement LSB time left.
		lda	TIMLEFT2
		bne	NMI_cnt3	;Go if MSB time non-zero.
		lda	TIMELEFT
		cmp	#31
		bcs	NMI_cnt3	;Go if time > 30.
		lda	#$ff
		sta	TIME_LOW	;Set time running out flag.
		lda	#0
		sta	MU_SLOW		;Clear slow-music flag.
		lda	$2002
		lda	#$23		;Write MSB of screen position.
		sta	$2006
		lda	#$c6		;Write LSB of screen position.
		sta	$2006
		lda	#%11000000	;Attribute data.
		sta	$2007		;Store attribute byte.
		lda	#%00110000	;Attribute data.
		sta	$2007		;Store attribute byte.
		
NMI_cnt3:
		;Load game grid squares from queue.
		lda	#NMI_BMAX
		sta	NT1		;Set maximum squares to update.

		lda	NMIBTAIL	;Get queue pointer.
NMI_ldlp:	cmp	NMIBHEAD	;Check for empty queue.
		beq	NMI_cnt4	;Go if empty.

		tay			;Get queue pointer in Y.
		lda	$2002		;Reset reg 2006.
		lda	NMI_BUF,y
		sta	$2006		;Write MSB.
		lda	NMI_BUF1,y
		sta	$2006		;Write LSB.
		ldx	NMI_BUF2,y	;Get object #.
		lda	objchr1,x	;Get first character.
		sta	$2007		;Store it.
		lda	objchr3,x	;Get second character.
		sta	$2007		;Store it.

		lda	NMI_BUF,y
		sta	$2006		;Write MSB.
		lda	NMI_BUF1,y
		ora	#%00100000	;Bump to next row.
		sta	$2006		;Write LSB.
		lda	objchr2,x	;Get third character.
		sta	$2007		;Store it.
		lda	objchr4,x	;Get fourth character.
		sta	$2007		;Store it.

		lda	NMI_BUF,y
		ora	#%00000011	;Point to palette area.
		tax			;Save for later.
		sta	$2006		;Write MSB.
		lda	NMI_BUF3,y
		sta	$2006		;Write LSB.

		lda	$2007
		lda	$2007		;Read palette assignment byte.
		and	NMI_BUF4,y	;Clear the 2 bits being changed.
		ora	NMI_BUF5,y	;Set palette number.
		pha			;Save new palette byte.
		
		stx	$2006		;Write MSB.
		lda	NMI_BUF3,y
		sta	$2006		;Write LSB.

		pla
		sta	$2007		;Write new palette byte.

		iny
		tya			;Get queue pointer in A.
		cmp	#NMI_BNUM
		bcc	NMI_ldnw	;Go if no wrap.
		lda	#0		;Reset pointer.
NMI_ldnw:	sta	NMIBTAIL	;Store new tail pointer.

		dec	NT1		;Decrement max squares to load.
		beq	NMI_cnt4	;Quit if already loaded maximum.
		jmp	NMI_ldlp	;Loop.

NMI_cnt4:	;Check screen flash flag.
		lda	SCR_FLSH
		beq	NMI_cnt5	;Go if not active.

		lda	$2002		;Reset reg 2006.
		lda	#$3f
		sta	$2006		;Write MSB.
		lda	#$00
		sta	$2006		;Write LSB.
		lda	#BG_NORM	;Get normal color.
		dec	SCR_FLSH	;Decrement counter.
		beq	NMI_sfcn	;Skip if flash done.
		lda	#BG_FLASH	;Get flash color.
NMI_sfcn:	sta	$2007		;Set background color.

NMI_cnt5:	;Update the flashing palette.
		lda	ROMPAGE		;Get page settings.
		and	#%01110000
		bne	NMI_cnt6	;Go if not using normal palette.

		dec	BPALCNT		;Decrement change counter.
		bne	NMI_cnt6	;Go if no change.
		lda	#BPALTIME
		sta	BPALCNT		;Reset counter.

		ldy	BPALOFF		;Get list offset.
		lda	$2002		;Reset reg 2006.
		lda	#$3f
		sta	$2006		;Write MSB.
		lda	#$0f
		sta	$2006		;Write LSB.
		lda	palblink,y	;Get palette byte.
		sta	$2007		;Change background palette.
		lda	#$3f
		sta	$2006		;Write MSB.
		lda	#$1f
		sta	$2006		;Write LSB.
		lda	palblink,y	;Get palette byte.
		sta	$2007		;Change sprite palette.
		iny			;Increment list pointer.
		cpy	#BPALNUM	;Check for wrap.
		bcc	NMI_pal2	;Go if not.
		ldy	#0
NMI_pal2:	sty	BPALOFF		;Reset list pointer.

NMI_cnt6:	lda	NMI_MODE
		and	#NM_HORZ	;Check if doing horizontal scroll.
		beq	NMI_dma		;Go if not.

		;Set up sprite 0 for screen scrolling routine.
		lda	#3*8-1		;Scan line to put it on.
		sta	SPR_DATA
		lda	#DOT_CHR	;Set to special "dot" character.
		sta	SPR_DATA+1
		lda	#$20		;Set to be behind background.
		sta	SPR_DATA+2
		lda	#$f8		;Column to put it on.
		sta	SPR_DATA+3

NMI_dma:	lda	#0
		sta	$2003		;Reset sprite index register.
		lda	#SPR_DATA >> 8
		sta	$4014		;Start sprite DMA process.

		lda	$2002		;Reset register 2005.
		lda	#0
		sta	$2005		;Reset horizontal scroll.
		sta	$2005		;Reset vertical scroll.

		lda	REG_2000
		and	#%11111110	;Clear page 2 bit of register 2000.
		sta	$2000

		lda	REG_2001
		ora	#%00011000	;Enable background & sprites.
		sta	REG_2001
		sta	$2001

		lda	NMI_MODE
		and	#NM_HORZ	;Check if doing horizontal scroll.
		bne	NMI_horz	;Go if so.
		lda	REG_2000
		and	#%11111110	;Clear page 2 bit of register 2000.
		sta	REG_2000

		JSR	FEED_SOUND	;FEED THE SOUND CHIP.
		jsr	do_sf		;Process sound effects.

		jmp	NMI_cnt7	;Continue.

NMI_horz:
		;Write out special "dot" character.
		lda	#$20
		sta	$2006		;Write MSB.
		lda	#$7f
		sta	$2006		;Write LSB.
		lda	#DOT_CHR
		sta	$2007		;Store "dot" character.

		lda	#$0		;Reset 2006 pointer.
		sta	$2006		;Write MSB.
		sta	$2006		;Write LSB.

		JSR	FEED_SOUND	;FEED THE SOUND CHIP.
		jsr	do_sf		;Process sound effects.

	 	;Wait for score information to be drawn.
NMI_hlp:	lda	$2002
		and	#$40		;Wait for sprite 0 collision bit off.
		bne	NMI_hlp
NMI_hlp2:	lda	$2002
		and	#$40		;Wait for sprite 0 collision bit on.
		beq	NMI_hlp2

		lda	$2002		;Reset register 2005.
		lda	H_SCROLL
		sta	$2005		;Set horizontal scroll.
		lda	#0
		sta	$2005		;Reset vertical scroll.

NMI_cnt7:	lda	REG_2000
		ora	#%10000000	;Enable vertical retrace interrupts.
		sta	REG_2000
		sta	$2000		;Set register 2000.

NMI_done:	pla			;Restore registers.
		tay
		pla
		tax
		pla
		rti			;Return to main loop.


;=============================================================================
; IRQ interrupt service routine:
;
IRQ_int:	rti			;Ignore if IRQ somehow occurs.


;=============================================================================
; Data shared by second ROM page:
;
;.ORG	$FF80 		;WORST CASE ORIGIN (FOR ROM VERSION).
;Padded by Evenball
.segment "COMMONCODE"
call_sul:	;Call the setup level routine in second page of the ROM.
		lda	#1
		jsr	selpage		;Swap to second ROM page.
		jsr	SETULEV2	;Call routine to setup level.
		lda	#0
		jsr	selpage		;Swap back to first ROM page.
		rts


.ifdef ROMVER;IFDEF( `ROMVER',`		;THIS CODE USED WHEN ROM VERSION.

;ENTER HERE WITH THE DESIRED PAGE COMBO IN A.  HIGH NIBBLE HAS VIDEO
;PAGE AND LOW BIT HAS ROM PAGE.  A IS CHANGED, DONT COUNT ON ITS VALUE.
;THE BITS USED BY THE PAGE CIRCUIT MUST NOT BE ON.  AT THE CURRENT TIME
;THEY ARE BITS 08 AND 04.  THIS ROUTINE ASSUMES A 512 x 512 MAX CARTRIDGE.

;THE TABLE IS NEEDED BECAUSE OUR ROM CARTRIDGE DOES NOT DECODE THE ROM AREA.
;ANY WRITE TO ROM TRIGGERS THE LS377 PAGING PORT.  SINCE A WRITE ALSO 
;TRIGGERS A ROM READ (WR DOES NOT QUALIFY ROM) WE NEED TO WRITE TO AN AREA
;OF ROM THAT RETURNS THE SAME VALUE WE ARE WRITING.

;THIS ROUTINE MUST SAVE THE X AND Y REGISTERS.

selpage:
		sta	ROMPAGE		;Set current page setting.
		STX	PAGETEMP	;SAVE USERS VALUE FOR X
		PHA			;SAVE VALUE TO WRITE OUT
		AND	#3		;SAVE ROM PAGE BITS
		STA	WORKINGPAGE	
		PLA
		PHA			;MAKE ANOTHER COPY, GET ONE BACK
		LSR	A
		LSR	A
		LSR	A		;MOVE HIGH BITS DOWN TO ADD IN LOWEST.
		ORA	WORKINGPAGE
		TAX			;MAKE IT INTO AN INDEX
		PLA			;GET ORIGINAL VALUE
		ORA	#12		;PUT IN THE KEY CIRCUIT BITS
		STA	PAGETAB,X	;AND SET OUT WITH THE USERS BITS
		LDX	PAGETEMP
		RTS

PAGETAB:	.byte 	12,13
		.byte 	28,29
		.byte  	44,45
		.byte 	60,61
		.byte 	76,77
		.byte 	92,93
		.byte 	108,109
		.byte 	124,125
.endif
;	',`			;THIS CODE USED WHEN NOT ROM VERSION.
.ifndef ROMVER
;ENTER HERE WITH THE DESIRED PAGE COMBO IN A.  HIGH NIBBLE HAS VIDEO
;PAGE AND LOW HAS ROM PAGE.

selpage:	
		sta	ROMPAGE		;Set current page setting.
		STA	253;-2
		RTS
.endif;	')


;THIS BOOT VECTOR IS NEEDED TO INSURE THAT WE DON'T CRASH IF WE 
;HAVE A PAGED VERSION.

PBOOT: 	
		sei			;Disable IRQ interrupts.
		cld			;Clear decimal mode flag.
		clv			;Clear overflow flag.
		clc			;Clear carry flag.
		ldx	#$ff
		txs			;Initialize stack pointer.

		lda	#0
		jsr	selpage		;Select first ROM page.
		jmp	boot_cod	;Continue boot process.


;=============================================================================
; CPU interrupt vectors:
;
;.ORG	$FFFA
.segment "VECTORS"
		.word  	NMI_int		;NMI interrupt vector.
		.word  	PBOOT		;CPU reset vector.
		.word  	IRQ_int		;IRQ interrupt vector.

		.end
