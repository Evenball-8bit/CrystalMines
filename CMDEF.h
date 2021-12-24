		.define	LAST_LEV 50		;Highest level in game.

;-----------------------------------------------------------------------------
		.define	MAXDEMOS 8		;Number of demo sequences.

; RAM address equates:
;
		.define	NT1   $00		;Temporary storage registers,
		.define	NT2   $01		;   for NMI code only!
		.define	NT3   $02
		.define	NT4   $03

		.define	JMP_VECT   $04		;Special 2-byte jump vector.

		.define	T1   $06			;Temporary registers    NOT for
		.define	T2   $07			;   use by NMI code!
		.define	T3   $08
		.define	T4   $09
		.define	T5   $0a
		.define	T6   $0b
		.define	T7   $0c
		.define	T8   $0d
		.define	T9   $0e
		.define	T10   $0f

		.define	H_SCROLL   $10		;Horizontal scroll offset.
		.define	REG_2000   $11		;Mirror of 2000 register.
		.define	REG_2001   $12		;Mirror of 2001 register.
		.define	NMI_TIME   $13		;60Hz counter.
		.define	NMI_MODE   $14		;Mode flag for NMI routine.
		.define	DEMOMODE   $15		;TRUE if running demo.
		.define	JOY1_VAL   $16		;Current joystick #1 value.
		.define	JOY2_VAL   $17		;Current joystick #2 value.
		.define	JOY1_CHG   $18		;Joystick #1 change status.
		.define	JOY2_CHG   $19		;Joystick #2 change status.
		.define	TMP_VAL   $1a		;Generic joystick value.
		.define	TMP_CHG   $1b		;Generic change status.
		.define	SCRN_REQ   $1c		;NMI screen request flag.
		.define	BPALOFF   $1d		;Blinking palette offset.
		.define	BPALCNT   $1e		;Blinking palette counter.
		.define	EB_KILL   $1f		;Special energy ball flag.

		.define	HSCORE   $20		;High score.
		.define	TWO_PLAY $28		;TRUE if 2 player game.
		.define	PLAYERUP $29		;Contains a 0 or 1.
		.define	LEVEL_P1 $2a		;Player 1 game level.
		.define	LEVEL_P2 $2b		;Player 2 game level.
		.define	LIVES_P1 $2c		;Player 1 lives remaining.
		.define	LIVES_P2 $2d		;Player 2 lives remaining.
		.define	SCORE_P1 $2e		;Player 1 score.
		.define	SCORE_P2 $36		;Player 2 score.
		.define	NUM_BOMB $3e		;Current player # of bombs.
		.define	NUM_GEMS $3f		;Current player # of gems.
		.define	QUOTA	 $40		;Current player gem quota.
		.define	TIMELEFT $41		;Time left to complete level.
		.define	TL_SUBT  $42		;# of 1/60s per timer tick.
		.define	TL_CHG   $43		;Time left change flag.
		.define	NUM_MON  $44		;Number of monsters on level.
		.define	RANGE_EB $45		;Range of energy balls.
		.define	NUM_EB   $46		;Maximum # of energy balls.
		.define	CUR_EB   $47		;Current # of active balls.
		.define	LP_FLAG $48		;Liquid-proof flag.
		.define	CP_FLAG $49		;Creature-proof flag.
		.define	FT_FLAG $4a		;Freeze timer flag.
		.define	EP_FLAG $4b		;Explosion-proof flag.
		.define	FR_FLAG $4c		;Freeze robot flag.
		.define	MV_FLAG $4d		;Special movement flag.
		.define	SPR_OFS $4e		;Sprite rotation offset.
		.define	TENTHSEC $4f		;1/10 second counter.

		.define	LEV_PTR $50		;Pointer to level data.
		.define	ROBOT_X $52		;Robot X position.
		.define	ROBOT_Y $54		;Robot Y position.
		.define	ROBOT_F $55		;Robot flags.
		.define	ROBOT_N $56		;Robot object number.
		.define	ROBOT_C $57		;Robot animation counter.
		.define	PAUSED $58		;Game paused flag.
		.define	EXIT_X $59		;Exit square X position.
		.define	EXIT_Y $5a		;Exit square Y position.
		.define	EXIT_ON $5b		;Exit square visible flag.
		.define	EXIT_ANC $5c		;Exit square animation count.
		.define	EXITED $5d		;Completed level flag.
		.define	NMIBHEAD $5e		;NMI queue head pointer.
		.define	NMIBTAIL $5f		;NMI queue tail pointer.

		.define	S_FLAG $60		;Score flag.
		.define	S_NSBUF $61		;Score buffer.
		.define	R_FLAG $69		;Robot number flag.
		.define	R_NSBUF $6a		;Robot # buffer.
		.define	L_FLAG $6d		;Level number flag.
		.define	L_NSBUF $6e		;Level # buffer.
		.define	B_FLAG $71		;Bomb number flag.
		.define	B_NSBUF $72		;Bomb # buffer.
		.define	G_FLAG $75		;Gem number/quota flag.
		.define	G_NSBUF $76		;Gem #/quota buffer.
		.define	T_FLAG $7d		;Timer flag.
		.define	T_NSBUF $7e		;Timer buffer.

		.define	SCR_FLSH $81		;Screen flash flag.
		.define	SCANNING $82		;Scanning level flag.
		.define	LMAX_MV $83		;Max. moving objects on level.
		.define	SCAN_X $84		;X position of scan.
		.define	SCAN_Y $85		;Y position of scan.
		.define	SL_CHKD $86		;# of objects checked counter.
		.define	PUSH_DIR $87		;Push rock direction.
		.define	PSHL_FLG $88		;Push left flag.
		.define	PSHR_FLG $89		;Push right flag.
		.define	PSHL_CNT $8a		;Push left counter.
		.define	PSHR_CNT $8b		;Push right counter.
		.define	ROBOT_A $8c		;Robot death animation ptr.
		.define	ROBOT_AC $8d		;Robot death animation count.
		.define	DIED $8e		;Robot died flag.
		.define	ROBRADIO $8f		;Robot radioactive flag.

		.define	T11 $90		;Temporary registers.
		.define	T12 $91		;Temporary registers.
		.define	TIMLEFT2 $92		;2nd byte of TIMELEFT.
		.define	CLSNSPRD $93		;Used by clsn_spr.
		.define	RNDNUM1 $94		;For random numbers.
		.define	RNDNUM2 $95		;For random numbers.
		.define	RNDNUM3 $96		;For random numbers.
		.define	FROBOT_X $97		;Freeze robot X location.
		.define	FROBOT_Y $98		;Freeze robot Y location.

		.define	REG4015 $99		;Voice enable register state.
		.define	SUBSVAR1 $9a		;Special vars for SUBS.ASM
		.define	SUBSVAR2 $9b		;   routines.
		.define	SUBSVAR3 $9c
		.define	SUBSVAR4 $9d
		.define	TMP_NMI1 $9e		;NMI vars for SUBS.ASM
		.define	TMP_NMI2 $9f		;   routines.
		.define	MATH1 $a0		;Math vars for SUBS.ASM
		.define	MATH2 $a1		;   routines.
		.define	MATH3 $a2
		.define	NMI_PTR $a3		;Special NMI 2-byte pointer.
		.define	MU_SLOW $a5		;Slow music flag.

		.define	MM_INDEX $a6		;Temporary storage.
		.define	TY1 $a7
		.define	TY2 $a8
		.define	TXL1 $a9
		.define	TXH1 $aa
		.define	TXL2 $ab
		.define	TXH2 $ac
		.define	TY3 $ad
		.define	TY4 $ae
		.define	TXL3 $af
		.define	TXH3 $b0
		.define	TXL4 $b1
		.define	TXH4 $b2
		.define	LAST_BLK $b3		;Last obj. from getbgblk.

		.define	EB_DELAY $b4		;Delay between energy balls.
		.define	MM_RADF $b5		;Monster radioactive flag.
		.define	ROB_MOV $b6		;Robot movement direction.
		.define	EB_BNCE $b7		;Energy ball bounce flag.
		.define	RP_FLAG $b8		;Radioactive-proof flag.
		.define	TIME_LOW $b9		;Time running out flag.
		.define	SUPERM $ba		;Super mode flag.

		.define	STMP1 $bb		;Special sound effect vars.
		.define	STMP2 $bc
		.define	STMP3 $bd
		.define	SF_FLAGS $be
		.define	MRR_LAST $bf		;Special hit radioactive
		.define	MRR_CNT $c0		;   rock variables.

		.define	OLD_EB1 $c1		;Temp vars for ebupdate.
		.define	OLD_EB2 $c2
		.define	OLD_EB3 $c3
		.define	GOTXR_P1 $c4		;Player 1 got EXTRA flag.
		.define	GOTXR_P2 $c5		;Player 2 got EXTRA flag.
		.define	WARPF_P1 $c6		;Player 1 warp flag.
		.define	WARPF_P2 $c7		;Player 2 warp flag.

		.define	CONTINUE $c8		;Continue game flag.
		.define	CONT_CNT $c9		;Continue game counter.

		.define	TY5 $ca		;Temporary variables.
		.define	TY6 $cb
		.define	TXL5 $cc
		.define	TXH5 $cd
		.define	TXL6 $ce
		.define	TXH6 $cf
		.define	TXL7 $d0
		.define	TXH7 $d1
		.define	TXL8 $d2
		.define	TXH8 $d3

		.define	DEMONUM $d4		;Keep track of demo number.
		.define	DEMOCNT $d5		;Demo mode counter/timer.
		.define	DEMOPTR $d6		;LSB of demo data pointer.
		.define	DEMOPTR2 $d7		;MSB of demo data pointer.
		.define	DEMOLAST $d8
		.define	DIFFLEV $d9		;Game difficulty level.

		.define	ROMPAGE $da		;BITS 03H = PROGRAM ROM PAGE.
				;BITS F0H = VIDEO ROM PAGE.
				;BITS 0CH SHOULD BE LEFT OFF AT ALL TIMES.
		.define	PAGETEMP $db		;Used by selpage routine.
		.define	WORKINGPAGE $dc

		.define	WIZTMP1 $dd		;Wizard mode variables.
		.define	WIZTMP2 $de
		.define	WIZARD $df		;Special wizard mode flag.

		.define	EB_LIST $e0		;Energy ball lists,
		.define	EB_LIST1 $e0+MAX_EB	;   one list for each
		.define	EB_LIST2 $e0+MAX_EB*2	;   attribute    each is
		.define	EB_LIST3 $e0+MAX_EB*3	;   MAX_EB in length.
		.define	EB_LIST4 $e0+MAX_EB*4
		.define	EB_LIST5 $e0+MAX_EB*5

		.define	HELPSCRN $fe		;Help screen number.
		.define	SUPERSPD $ff		;Super-speed mode flag.

		;Stack uses RAM from $100 to $1ff.

		.define	SPR_DATA $200		;Sprite data table address.

		.define	CUR_LEV $300		;Current level grid data.
						;Data is 1A0 in length.

		.define	MAX_HO   32		;Maximum hidden objects.
		.define	HO_LIST $4a0		;Hidden object lists (one for
		.define	HO_LIST1 $4a0+MAX_HO	;   each element, each is
		.define	HO_LIST2 $4a0+MAX_HO*2	;   MAX_HO bytes in length).

		.define	NMI_BMAX   6		;Max. process in 1 NMI.
		.define	NMI_BNUM   21		;Number of entries in queue.
		.define	NMI_BUF $500		;NMI background update queue.
		.define	NMI_BUF1 $500+NMI_BNUM	;Data is 21*6=7E in length.
		.define	NMI_BUF2 $500+NMI_BNUM*2
		.define	NMI_BUF3 $500+NMI_BNUM*3
		.define	NMI_BUF4 $500+NMI_BNUM*4
		.define	NMI_BUF5 $500+NMI_BNUM*5

		.define	LASTHOBJ $57e		;Used by addhobj() functions.
		.define	DEMO_TO $57f		;Demo mode time-out.

		.define	MAX_AN   32		;Maximum animations.
		.define	AN_LIST $580		;Animation lists (one list
		.define	AN_LIST1 $580+MAX_AN	;   for each element, each is
		.define	AN_LIST2 $580+MAX_AN*2	;   MAX_AN bytes in length).
		.define	AN_LIST3 $580+MAX_AN*3

		.define	MAX_BM   32		;Maximum explosions.
		.define	BM_LIST  $600		;Bomb lists (one list for
		.define	BM_LIST1 $600+MAX_BM	;   each element, each is
		.define	BM_LIST2 $600+MAX_BM*2	;   MAX_BM bytes in length).

		.define	MAX_MVCK 16		;Max. to check per 1/60th.
		.define	MAX_MV 27		;Maximum moving objects.
		.define	MV_LIST $660		;Moving object lists (one
		.define	MV_LIST1 $660+MAX_MV	;   list for each element,
		.define	MV_LIST2 $660+MAX_MV*2	;   each is MAX_MV bytes in
		.define	MV_LIST3 $660+MAX_MV*3	;   length).
		.define	MV_LIST4 $660+MAX_MV*4
		.define	MV_LIST5 $660+MAX_MV*5
		.define	MV_LIST6 $660+MAX_MV*6
		.define	MV_LIST7 $660+MAX_MV*7

;HERE ARE THE SOUND SLOTS.  (IMPORTED FROM SUBS.ASM)

.define	SNDSLOTS 5		;MAX ALLOWED ACTIVE SOUND STRUCTURES
.define	SND_WIDE 7		;WIDTH OF EACH ENTRY.  NOT USER CHANGABLE.
.define	SND_RAM $738		;BASE SLOT OF ANIMATION/SPRITE RAM
				;FORMAT:
.define	SF 0			;SOUND FLAG:  BIT 80H SET IF SLOT IN USE.
				;	      BIT 40H SET IF SOUND HAS NOT
				;             BEEN ASSIGNED TO A REGISTER SET.
				;	      BIT 20H SET IF SOUND SUSPENDED
				;	        BY ANOTHER VOICE.
				;             LOW BITS SPECIFY LOW BYTE OF
				;	      REGISTER SET BASE (0,4,8,ETC).
.define	ST 1			;SOUND TIMER.  LOADED WITH NOTE OR PAUSE
				;             DURATION IN 1/60 SECOND TICKS.
.define	SBL 2			;BASE POINTER (WORD) TO THE ORIGINAL SOUND
.define	SBH 3			;	      STRUCTURE PASSED IN CALL.
.define	SOL 4			;SOUND OFFSET OF CURRENT PLAY LOCATION.			
.define	SOH 5
.define	SI 6			;INSTRUMENT CURRENTLY ACTIVE.  USED TO 
				;	      RESTORE SOUND IF SUSPENDED.

;		UNUSED: $75b-$75f

		.define	SF_LIST $760		;Sound effect list.

;		UNUSED: $770-$77f

		.define	MAX_MM 16		;Maximum monsters.
		.define	MM_LIST $780		;Monster sprite lists (one
		.define	MM_LIST1 $780+MAX_MM	;   list for each element,
		.define	MM_LIST2 $780+MAX_MM*2	;   each is MAX_MM bytes in
		.define	MM_LIST3 $780+MAX_MM*3	;   length).
		.define	MM_LIST4 $780+MAX_MM*4
		.define	MM_LIST5 $780+MAX_MM*5
		.define	MM_LIST6 $780+MAX_MM*6
		.define	MM_LIST7 $780+MAX_MM*7




;-----------------------------------------------------------------------------
; Program constants:
;
		.define	FALSE 0			;Logical false.
		.define	TRUE 1			;Logical true.
		;.define	VAL_2000 %10100000	;Default reg 2000 setting.
		;.define	VAL_2001 %00011110	;Default reg 2001 setting.
		.define	TICKS 60		;NMI's in a second.
		.define	MV_ADJ 4		;# of scans adj. on move.
		.define	PU_ADJ 4		;# pixels adj. on pickup.
		;.define	BPALTIME 6		;# 1/60s blink frequency.
		.define	BPALNUM 8		;# of frames in blink pal.

		.define	NUMROBOT 5		;Number of robots per game.
		.define	MAX_EB 5		;Maximum energy balls.
		.define	MAX_RGEB 32		;Maximum energy ball range.
		.define	EB_MOVE 2		;Energy ball movement inc.
		.define	EB_SIZE 4		;Energy ball pixel size.
		.define	BOMB_CNT 240+5		;Bomb countdown.
		.define	MON_STUN 30		;Monster stun countdown.
		.define	MON_STN2 6		;Monster stun countdown #2.
		.define	EB_TIME 4		;Inter-shot delay.
		.define	PSH_TIME 30		;Push rock delay in 1/60ths.

		;Following durations are in 1/10 seconds (1-255)!
		.define	LP_TIME 140		;Liquid-proof duration.
		.define	CP_TIME 140		;Creature-proof duration.
		.define	FT_TIME 140		;Freeze-timer duration.
		.define	EP_TIME 140		;Explosion-proof duration.
		.define	RP_TIME 140		;Radioactive-proof duration.
		.define	FR_TIME 40		;Freeze-robot duration.

		.define	LEFT 9			;Special directional flags
		.define	RIGHT 0			;   for level definition
		.define	UP 3			;   information in .LEV files.
		.define	DOWN 6
		.define	SRIGHT 1
		.define	SLEFT 8
		.define	CCW $10		;Counter clock-wise flag.
		.define	MAD $20		;Mad monster flag.
		.define	CHGDIR $40		;Changed direction flag.
		.define	MFLG $80		;Special movement flag.

		.define	CONTLIST $fd		;Constants for LEVELS.INC.
		.define	NEWLIST $fe
		.define	ENDLIST $ff

		.define	NM_NORM %00000001	;NMI flag - normal operation.
		.define	NM_STAT %00000010	;NMI flag - update status.
		.define	NM_HORZ %00000100	;NMI flag - horizontal scroll.
		.define	NM_PLAY %00001000	;NMI flag - game play mode.
		.define	NM_TITL %00010000	;NMI flag - title screen mode.
		.define	NM_CONT %00100000	;NMI flag - continue screen.

		.define	EQUALS $2a		;Equals character #.
		.define	SLASH $2b		;Slash character #.
		.define	DOT_CHR $f8		;Special dot character.
		.define	SPACE $fa		;Space character #.
		.define	CRYS_BR $44		;Bottom right crystal char.
		.define	CRYS_TR $45		;Top right crystal char.
		.define	CRYS_BL $46		;Bottom left crystal char.
		.define	CRYS_TL $47		;Top left crystal char.
		.define	CRYS_CH $2c		;Square crystal character.
		.define	ROCK_CH $2d		;Single character rock.
		.define	EBALL1 $f7		;Energy ball char #1.
		.define	EBALL2 $f9		;Energy ball char #2.

		.define	SPOS $2000+3*32+2	;score screen offset.
		.define	RPOS $2000+2*32+19	;# of robots screen offset.
		.define	LPOS $2000+2*32+14	;Level # screen offset.
		.define	BPOS $2000+3*32+14	;# of bombs screen offset.
		.define	GPOS $2000+3*32+19	;# of gems screen offset.
		.define	TPOS $2000+3*32+27	;Time left screen offset.

		.define	CPPOS $2000+2*32+10	;Creature-proof position.
		.define	EPPOS $2000+2*32+11	;Explosion-proof position.
		.define	RPPOS $2000+3*32+10	;Radiation-proof position.
		.define	LPPOS $2000+3*32+11	;Liquid-proof position.

		.define	J_A $80		;Joystick bit defs.
		.define	J_B $40
		.define	J_SELECT $20
		.define	J_START $10
		.define	J_UP $08
		.define	J_DOWN $04
		.define	J_LEFT $02
		.define	J_RIGHT $01

		.define	SREG0 $00		;Sound register offsets.
		.define	SREG1 $04
		.define	SREG2 $08
		.define	SREG3 $0c

		.define	DEMOTO1 10		;Demo mode timeout vars.
		.define	DEMOTO2 5

;;		.define	WIZVAL1,$81		;Wizard mode code (EASY).
;;		.define	WIZVAL2,$00		;RIGHT-A

		.define	WIZVAL1 $68		;Wizard mode code (HARD).
		.define	WIZVAL2 $06		;LEFT-A RIGHT-B UP-A DOWN-B.
                  
;-----------------------------------------------------------------------------
; Sprite allocation:
;
		.define	S_OBJS $02		;Objects use $02 & below.
		.define	S_MONS $36		;Monsters use $36 & above.
		.define	S_PLAYER $38		;Player sprites.
		.define	S_EBALL $3a		;Energy ball sprites.
		.define	S_EBALL2 $3b
		.define	S_EBALL3 $3c
		.define	S_EBALL4 $3d
		.define	S_EBALL5 $3e
		.define	S_UNUSED $3f


;-----------------------------------------------------------------------------
; Game grid object equates:
;
		.define	EMPTY 0
		.define	EXIT1 1
		.define	EXIT2 2

		.define	PBOMB1 3
		.define	PBOMB3 4
		.define	PBOMB10 5
		.define	MONEY 6
		.define	EBNUM 7
		.define	EBRANGE 8
		.define	LPROOF 9
		.define	CPROOF 10
		.define	FTIMER 11
		.define	FROBOT 12
		.define	EPROOF 13
		.define	RPROOF 14
		.define	EXTRA 15

		.define	SMOKE1 16
		.define	SMOKE2 17
		.define	SMOKE3 18
		.define	SMOKE4 19
		.define	ACRYS1 20
		.define	ACRYS2 21
		.define	ACRYS3 22
		.define	WHITEOUT 23

		.define	CRYSTAL 24
		.define	SROCK 25
		.define	SROCK2 26
		.define	SROCK3 27
		.define	HROCK 28
		.define	HROCK2 29
		.define	EROCK 30
		.define	MIROCK 31
		.define	MRROCK 32
		.define	MRROCK2 33
		.define	MRROCK3 34
		.define	RROCK 35
		.define	RROCK2 36
		.define	RROCK3 37
		.define	IROCK 38

		.define	BOMB 39
		.define	DIRT 40
		.define	HDIRT 41
		.define	HDIRT2 42
		.define	HMUD 43
		.define	MUDU1 44
		.define	MUDU2 45
		.define	MUDD1 46
		.define	MUDD2 47
		.define	MUDL1 48
		.define	MUDL2 49
		.define	MUDR1 50
		.define	MUDR2 51
		.define	MUD 52
		.define	LAVAU1 53
		.define	LAVAU2 54
		.define	LAVAD1 55
		.define	LAVAD2 56
		.define	LAVAL1 57
		.define	LAVAL2 58
		.define	LAVAR1 59
		.define	LAVAR2 60
		.define	LAVA 61

		.define	NUM_OBJ 62		;Total # of objects.

		.define	SPEHO $fd		;Special hidden object code.
		.define	FLASH $fe		;Special flash code.
		.define	UPDATE $ff		;Special update code.

		;Sprite object equates:
		.define	R_SIDE 64		;64-66
		.define	R_UP 67			;67-69
		.define	R_DOWN 70		;70-72

		.define	RDEATH1 73
		.define	RDEATH2 74
		.define	RDEATH3 75
		.define	RDEATH4 76
		.define	RDEATH5 77
		.define	RDEATH6 78
		.define	RDEATH7 79
		.define	RDEATH8 80

		.define	SR_MON 81		;81-89
		.define	SR_MON2 90		;90-98
		.define	SR_MON3 99		;99-107
		.define	HR_MON 108		;108-116
		.define	HR_MON2 117		;117-125
		.define	IR_MON 126		;126-134
		.define	RR_MON 135		;135-143
		.define	RR_MON2 144		;144-152
		.define	RR_MON3 153		;153-161
		.define	LAVA_MON 162		;162-164
		.define	MUD_MON 165		;165-167
		.define	GAS_MON 168		;168-170