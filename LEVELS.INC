;-----MAIN LEVELS FILE (included by CMINES.ASM).

		

lev_list:	;List of pointers to level data.
		.word  	level01,level02,level03,level04,level05,level06
		.word  	level07,level08,level09,level10,level11,level12
		.word  	level13,level14,level15,level16,level17,level18
		.word  	level19,level20,level21,level22,level23,level24
		.word  	level25,level26,level27,level28,level29,level30
		.word  	level31,level32,level33,level34,level35,level36
		.word  	level37,level38,level39,level40,level41,level42
		.word  	level43,level44,level45,level46,level47,level48
		.word  	level49,level50


;-----START OF LEVEL (FROM "LEVEL11.LEV").
level01:
		;Difficulty level 1.
		.word  	275		;Time to complete.
		.byte 	25		;Gem quota.
		.byte 	2,8,RIGHT	;Robot start X,Y & direction.
		.byte 	29,8		;Exit square position.

		;Difficulty level 2.
		.word  	160		;Time to complete.
		.byte 	25		;Gem quota.
		.byte 	16,8,RIGHT	;Robot start X,Y & direction.
		.byte 	1,4		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	CRYSTAL ,DIRT    ,DIRT    ,DIRT    ,FTIMER  ,EMPTY
		.byte 	CRYSTAL ,IROCK   ,DIRT    ,EMPTY   ,DIRT    ,DIRT
		.byte 	DIRT    ,SROCK   ,DIRT    ,IROCK   ,DIRT    ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,IROCK   ,CPROOF  ,SROCK
		;Row 2
		.byte 	DIRT    ,CPROOF  ,IROCK   ,CRYSTAL ,EMPTY   ,DIRT
		.byte 	DIRT    ,IROCK   ,IROCK   ,DIRT    ,DIRT    ,EMPTY
		.byte 	DIRT    ,IROCK   ,EMPTY   ,DIRT    ,IROCK   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,DIRT
		.byte 	EMPTY   ,EMPTY   ,MONEY   ,DIRT    ,IROCK   ,EMPTY
		;Row 3
		.byte 	DIRT    ,EMPTY   ,SROCK   ,IROCK   ,SROCK   ,DIRT
		.byte 	SROCK   ,CRYSTAL ,IROCK   ,EMPTY   ,EMPTY   ,MONEY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,DIRT    ,EMPTY   ,EMPTY
		.byte 	CRYSTAL ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,PBOMB3
		.byte 	EMPTY   ,DIRT    ,DIRT    ,EMPTY   ,DIRT    ,DIRT
		;Row 4
		.byte 	DIRT    ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,CRYSTAL ,IROCK   ,EMPTY   ,DIRT    ,EMPTY
		.byte 	IROCK   ,IROCK   ,CRYSTAL ,EMPTY   ,IROCK   ,DIRT
		.byte 	IROCK   ,EMPTY   ,DIRT    ,IROCK   ,EMPTY   ,EMPTY
		.byte 	CRYSTAL ,EMPTY   ,CRYSTAL ,EMPTY   ,DIRT    ,DIRT
		;Row 5
		.byte 	DIRT    ,EMPTY   ,IROCK   ,IROCK   ,EMPTY   ,PBOMB3
		.byte 	IROCK   ,IROCK   ,EMPTY   ,EBRANGE ,EMPTY   ,EMPTY
		.byte 	DIRT    ,EMPTY   ,IROCK   ,EMPTY   ,DIRT    ,EMPTY
		.byte 	CRYSTAL ,EMPTY   ,IROCK   ,CRYSTAL ,DIRT    ,EMPTY
		.byte 	IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,DIRT    ,DIRT
		;Row 6
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	DIRT    ,DIRT    ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	EBNUM   ,EMPTY   ,IROCK   ,CRYSTAL ,IROCK   ,EMPTY
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT
		;Row 7
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,SROCK   ,EMPTY   ,EMPTY
		.byte 	SROCK   ,EMPTY   ,DIRT    ,EMPTY   ,IROCK   ,SROCK
		.byte 	IROCK   ,EMPTY   ,DIRT    ,EMPTY   ,DIRT    ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,CRYSTAL ,DIRT    ,EMPTY
		.byte 	DIRT    ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,DIRT
		;Row 8
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	DIRT    ,SROCK   ,DIRT    ,EMPTY   ,IROCK   ,DIRT
		.byte 	IROCK   ,EMPTY   ,DIRT    ,IROCK   ,EMPTY   ,EMPTY
		.byte 	DIRT    ,IROCK   ,CRYSTAL ,CRYSTAL ,MONEY   ,DIRT
		;Row 9
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,DIRT
		.byte 	IROCK   ,DIRT    ,SROCK   ,CRYSTAL ,DIRT    ,EMPTY
		.byte 	DIRT    ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,SROCK   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,CRYSTAL ,CRYSTAL ,CRYSTAL ,DIRT
		;Row 10
		.byte 	CRYSTAL ,EMPTY   ,EMPTY   ,CRYSTAL ,IROCK   ,DIRT
		.byte 	IROCK   ,DIRT    ,EMPTY   ,DIRT    ,MONEY   ,EMPTY
		.byte 	CRYSTAL ,IROCK   ,EMPTY   ,DIRT    ,EMPTY   ,IROCK
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,MONEY   ,IROCK   ,DIRT
		.byte 	EMPTY   ,IROCK   ,CRYSTAL ,CRYSTAL ,CRYSTAL ,PBOMB3
		;Row 11
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,IROCK   ,PBOMB3
		.byte 	SROCK   ,DIRT    ,MONEY   ,DIRT    ,DIRT    ,IROCK
		.byte 	EPROOF  ,DIRT    ,DIRT    ,IROCK   ,DIRT    ,DIRT
		.byte 	CPROOF  ,DIRT    ,DIRT    ,IROCK   ,DIRT    ,SROCK
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,SROCK
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0     		;Object #, X, Y.
		.byte 	MONEY,1,3
		.byte 	MONEY,10,3
		.byte 	MONEY,1,9
		.byte 	MONEY,16,3
		.byte 	MONEY,21,6
		.byte 	MONEY,30,12
		.byte 	MONEY,24,13
		.byte 	MONEY,20,3
		.byte 	MONEY,30,13

		.byte 	CONTLIST
		.byte 	PBOMB10,14,10
		.byte 	PBOMB10,1,6
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	SR_MON,16,11,LEFT
		.byte 	SR_MON,20,5,LEFT + CCW
		.byte 	SR_MON,9,7,RIGHT      
		.byte 	SR_MON,28,8,RIGHT + CCW
		.byte 	SR_MON,5,4,LEFT + CCW
		.byte 	SR_MON,12,8,DOWN + CCW
		.byte 	SR_MON,18,7,RIGHT 
		.byte 	SR_MON,25,12,RIGHT + CCW
		.byte 	NEWLIST
                .byte   	SR_MON,16,11,LEFT
		.byte 	HR_MON,20,5,LEFT + CCW
		.byte 	SR_MON,9,7,RIGHT      
		.byte 	SR_MON,28,8,RIGHT + CCW
		.byte 	HR_MON,5,4,LEFT + CCW
		.byte 	SR_MON,12,8,DOWN + CCW
		.byte 	HR_MON,18,7,RIGHT 
		.byte 	HR_MON,25,12,RIGHT + CCW
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL12.LEV").
level02:
		;Difficulty level 1.
		.word  	300		;Time to complete.
		.byte 	26		;Gem quota.
		.byte 	1,8,RIGHT	;Robot start X,Y & direction.
		.byte 	28,8		;Exit square position.

		;Difficulty level 2.
		.word      200		;Time to complete.
		.byte 	26		;Gem quota.
		.byte 	23,9,RIGHT	;Robot start X,Y & direction.
		.byte 	7,13		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	DIRT    ,HDIRT   ,DIRT    ,DIRT    ,HDIRT   ,IROCK
		.byte 	HDIRT   ,HDIRT   ,IROCK   ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,HDIRT   ,DIRT    ,DIRT    ,DIRT    ,SROCK
		.byte 	EMPTY   ,IROCK   ,DIRT    ,SROCK   ,DIRT    ,HDIRT
		.byte 	DIRT    ,CPROOF  ,IROCK   ,HDIRT   ,HDIRT   ,SROCK
		;Row 2
		.byte 	DIRT    ,CPROOF  ,IROCK   ,CRYSTAL ,HDIRT   ,IROCK
		.byte 	EMPTY   ,IROCK   ,DIRT    ,DIRT    ,DIRT    ,EMPTY
		.byte 	DIRT    ,PBOMB3  ,SROCK   ,EMPTY   ,HDIRT   ,IROCK
		.byte 	CRYSTAL ,IROCK   ,HDIRT   ,IROCK   ,IROCK   ,CRYSTAL
		.byte 	HDIRT   ,IROCK   ,HDIRT   ,PBOMB3  ,PBOMB3  ,HDIRT
		;Row 3
		.byte 	HDIRT   ,IROCK   ,HDIRT   ,IROCK   ,HDIRT   ,EMPTY
		.byte 	CRYSTAL ,HDIRT   ,DIRT    ,IROCK   ,CRYSTAL ,EMPTY
		.byte 	CRYSTAL ,HDIRT   ,IROCK   ,HDIRT   ,HDIRT   ,IROCK
		.byte 	HDIRT   ,HDIRT   ,DIRT    ,HDIRT   ,MONEY   ,IROCK
		.byte 	DIRT    ,IROCK   ,CRYSTAL ,PBOMB3  ,CRYSTAL ,HDIRT
		;Row 4
		.byte 	DIRT    ,EMPTY   ,SROCK   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	IROCK   ,HDIRT   ,IROCK   ,HDIRT   ,DIRT    ,EMPTY
		.byte 	DIRT    ,HDIRT   ,EMPTY   ,HDIRT   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,CRYSTAL ,HDIRT   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,DIRT    ,IROCK   ,EMPTY   ,IROCK   ,IROCK
		;Row 5
		.byte 	HDIRT   ,CRYSTAL ,IROCK   ,IROCK   ,EMPTY   ,SROCK
		.byte 	HDIRT   ,DIRT    ,EMPTY   ,MONEY   ,DIRT    ,EMPTY
		.byte 	IROCK   ,DIRT    ,CRYSTAL ,EMPTY   ,EMPTY   ,HDIRT
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,SROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,DIRT    ,HDIRT   ,EMPTY   ,CRYSTAL ,HDIRT
		;Row 6
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,DIRT    ,HDIRT   ,IROCK
		.byte 	EMPTY   ,EMPTY   ,SROCK   ,HDIRT   ,EMPTY   ,IROCK
		.byte 	DIRT    ,HDIRT   ,EMPTY   ,CRYSTAL ,IROCK   ,HDIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,DIRT    ,HDIRT   ,EMPTY   ,DIRT    ,DIRT
		;Row 7
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,CRYSTAL
		.byte 	EMPTY   ,HDIRT   ,IROCK   ,CRYSTAL ,EMPTY   ,IROCK
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,HDIRT   ,EMPTY   ,CRYSTAL
		.byte 	IROCK   ,HDIRT   ,SROCK   ,EMPTY   ,MONEY   ,HDIRT
		;Row 8
		.byte 	EMPTY   ,PBOMB3  ,IROCK   ,EMPTY   ,HDIRT   ,HDIRT
		.byte 	EMPTY   ,HDIRT   ,EBNUM   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,DIRT    ,CRYSTAL ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,HDIRT   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,HDIRT   ,IROCK   ,CRYSTAL ,IROCK   ,HDIRT
		;Row 9
		.byte 	HDIRT   ,IROCK   ,EMPTY   ,MONEY   ,EMPTY   ,SROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HDIRT   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,HDIRT
		.byte 	CRYSTAL ,IROCK   ,CRYSTAL ,HDIRT   ,CRYSTAL ,EMPTY
		.byte 	EMPTY   ,HDIRT   ,IROCK   ,CRYSTAL ,CRYSTAL ,IROCK
		;Row 10
		.byte 	HDIRT   ,EMPTY   ,EMPTY   ,HDIRT   ,EMPTY   ,IROCK
		.byte 	HDIRT   ,HDIRT   ,DIRT    ,IROCK   ,DIRT    ,PBOMB3
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,CPROOF  ,HDIRT   ,MONEY
		.byte 	IROCK   ,IROCK   ,HDIRT   ,DIRT    ,IROCK   ,HDIRT
		.byte 	IROCK   ,HDIRT   ,DIRT    ,IROCK   ,DIRT    ,IROCK
		;Row 11
		.byte 	HDIRT   ,DIRT    ,DIRT    ,EMPTY   ,CRYSTAL ,IROCK
		.byte 	DIRT    ,DIRT    ,CRYSTAL ,DIRT    ,DIRT    ,HDIRT
		.byte 	CRYSTAL ,HDIRT   ,EMPTY   ,DIRT    ,HDIRT   ,DIRT
		.byte 	DIRT    ,EMPTY   ,DIRT    ,HDIRT   ,IROCK   ,EBRANGE
		.byte 	HDIRT   ,DIRT    ,HDIRT   ,HDIRT   ,DIRT    ,HDIRT
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0     		;Object #, X, Y.
                .byte      MONEY,22,9
		.byte 	MONEY,2,3
                .byte      MONEY,9,4
                .byte      MONEY,5,8
                .byte      PBOMB3,10,3
                .byte      PBOMB3,8,6
                .byte      MONEY,14,12
                .byte      MONEY,20,5
                .byte      MONEY,27,13
                .byte      MONEY,30,10
		.byte 	CONTLIST
		.byte 	PBOMB10,7,13
		.byte 	EXTRA,7,3
		.byte 	EPROOF,14,3
		.byte 	EPROOF,30,10
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	SR_MON,7,11,LEFT + CCW
		.byte 	SR_MON,15,6,RIGHT
		.byte 	SR_MON,19,10,RIGHT + CCW
		.byte 	SR_MON,25,7,LEFT 	
		.byte 	HR_MON,28,9,RIGHT + CCW
		.byte 	SR_MON,23,6,LEFT
		.byte 	HR_MON,12,10,LEFT + CCW
		.byte 	HR_MON,25,11,LEFT
		.byte 	NEWLIST
		.byte 	HR_MON,7,11,LEFT + CCW
		.byte 	SR_MON,15,6,RIGHT
		.byte 	IR_MON,19,10,RIGHT + CCW
		.byte 	SR_MON,25,7,LEFT 	
		.byte 	MUD_MON,28,9,RIGHT + CCW
		.byte 	HR_MON,23,6,LEFT
		.byte 	SR_MON,12,10,LEFT + CCW
		.byte 	HR_MON,25,11,LEFT
		.byte 	$ff			;End of list marker.
;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL13.LEV").
level03:
		;Difficulty level 1.
		.word  	350     	;Time to complete.
		.byte 	26		;Gem quota.
		.byte 	1,8,RIGHT	;Robot start X,Y & direction.
		.byte 	21,3		;Exit square position.

		;Difficulty level 2.
		.word  	200		;Time to complete.
		.byte 	26		;Gem quota.
		.byte 	22,10,RIGHT	;Robot start X,Y & direction.
		.byte 	25,3 		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	EMPTY   ,EMPTY   ,HDIRT   ,EMPTY   ,HDIRT   ,EMPTY
		.byte 	CPROOF  ,DIRT    ,EMPTY   ,SROCK   ,MONEY   ,SROCK
		.byte 	EMPTY   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,SROCK
		.byte 	SROCK   ,EMPTY   ,EMPTY   ,IROCK   ,CRYSTAL ,SROCK
		.byte 	HDIRT   ,DIRT    ,EMPTY   ,EMPTY   ,DIRT    ,MONEY
		;Row 2
		.byte 	EMPTY   ,CRYSTAL ,SROCK   ,HDIRT   ,EMPTY   ,EMPTY
		.byte 	DIRT    ,IROCK   ,EMPTY   ,DIRT    ,DIRT    ,PBOMB3
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,MONEY   ,IROCK   ,DIRT
		.byte 	PBOMB3  ,SROCK   ,EMPTY   ,IROCK   ,DIRT    ,PBOMB3
		.byte 	SROCK   ,DIRT    ,EMPTY   ,SROCK   ,EMPTY   ,EMPTY
		;Row 3
		.byte 	SROCK   ,HDIRT   ,PBOMB3  ,EMPTY   ,IROCK   ,SROCK
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,DIRT    ,EMPTY   ,DIRT
		.byte 	IROCK   ,IROCK   ,CRYSTAL ,HDIRT   ,HDIRT   ,SROCK
		.byte 	DIRT    ,HDIRT   ,EMPTY   ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	CRYSTAL ,HDIRT   ,SROCK   ,HDIRT   ,CRYSTAL ,EMPTY
		;Row 4
		.byte 	HDIRT   ,IROCK   ,HDIRT   ,EMPTY   ,HDIRT   ,HDIRT
		.byte 	CRYSTAL ,EMPTY   ,IROCK   ,EMPTY   ,SROCK   ,HDIRT
		.byte 	SROCK   ,HDIRT   ,HDIRT   ,EMPTY   ,EMPTY   ,DIRT
		.byte 	HDIRT   ,SROCK   ,IROCK   ,EMPTY   ,SROCK   ,EMPTY
		.byte 	HDIRT   ,EMPTY   ,HDIRT   ,EMPTY   ,IROCK   ,EMPTY
		;Row 5
		.byte 	HDIRT   ,EMPTY   ,SROCK   ,EMPTY   ,IROCK   ,MONEY
		.byte 	HDIRT   ,EMPTY   ,EMPTY   ,IROCK   ,CRYSTAL ,IROCK
		.byte 	CRYSTAL ,HDIRT   ,SROCK   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	SROCK   ,CRYSTAL ,EMPTY   ,EMPTY   ,HDIRT   ,IROCK
		.byte 	HDIRT   ,EMPTY   ,EMPTY   ,IROCK   ,HDIRT   ,HDIRT
		;Row 6
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,EMPTY   ,SROCK   ,IROCK
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,DIRT    ,HDIRT   ,DIRT
		.byte 	HDIRT   ,DIRT    ,DIRT    ,EMPTY   ,IROCK   ,EMPTY
		.byte 	HDIRT   ,CRYSTAL ,IROCK   ,EMPTY   ,HDIRT   ,IROCK
		.byte 	HDIRT   ,EMPTY   ,MONEY   ,HDIRT   ,HDIRT   ,SROCK
		;Row 7
		.byte 	EMPTY   ,CRYSTAL ,HDIRT   ,IROCK   ,DIRT    ,EMPTY
		.byte 	EMPTY   ,PBOMB3  ,SROCK   ,DIRT    ,EMPTY   ,HDIRT
		.byte 	EMPTY   ,DIRT    ,DIRT    ,EMPTY   ,EMPTY   ,IROCK
		.byte 	IROCK   ,CRYSTAL ,IROCK   ,EMPTY   ,HDIRT   ,IROCK
		.byte 	HDIRT   ,EMPTY   ,IROCK   ,EMPTY   ,SROCK   ,CRYSTAL
		;Row 8
		.byte 	EMPTY   ,DIRT    ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	DIRT    ,DIRT    ,SROCK   ,EMPTY   ,DIRT    ,SROCK
		.byte 	IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,DIRT    ,EMPTY
		.byte 	IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,HDIRT   ,HDIRT
		.byte 	SROCK   ,EMPTY   ,IROCK   ,EMPTY   ,HDIRT   ,CRYSTAL
		;Row 9
		.byte 	EMPTY   ,EMPTY   ,SROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,SROCK   ,HDIRT   ,IROCK   ,DIRT    ,HDIRT
		.byte 	HDIRT   ,DIRT    ,IROCK   ,EMPTY   ,DIRT    ,EMPTY
		.byte 	IROCK   ,EMPTY   ,HDIRT   ,EMPTY   ,SROCK   ,EMPTY
		.byte 	HDIRT   ,CRYSTAL ,IROCK   ,EMPTY   ,SROCK   ,CRYSTAL
		;Row 10
		.byte 	EMPTY   ,IROCK   ,HDIRT   ,EMPTY   ,DIRT    ,IROCK
		.byte 	SROCK   ,HDIRT   ,CRYSTAL ,IROCK   ,DIRT    ,IROCK
		.byte 	SROCK   ,SROCK   ,CRYSTAL ,HDIRT   ,DIRT    ,HDIRT
		.byte 	IROCK   ,HDIRT   ,EMPTY   ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	EMPTY   ,HDIRT   ,EMPTY   ,IROCK   ,CRYSTAL ,CRYSTAL
		;Row 11
		.byte 	EMPTY   ,DIRT    ,CRYSTAL ,EMPTY   ,IROCK   ,HDIRT
		.byte 	PBOMB3  ,DIRT    ,CRYSTAL ,IROCK   ,DIRT    ,EMPTY
		.byte 	CRYSTAL ,CRYSTAL ,HDIRT   ,HDIRT   ,HDIRT   ,DIRT
		.byte 	HDIRT   ,DIRT    ,IROCK   ,DIRT    ,DIRT    ,EMPTY
		.byte 	HDIRT   ,HDIRT   ,HDIRT   ,IROCK   ,CRYSTAL ,CRYSTAL
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0     		;Object #, X, Y.
		.byte 	EPROOF,3,12
		.byte 	EBNUM,22,5
		.byte 	EBRANGE,8,3
		.byte 	CPROOF,15,13
		.byte 	MONEY,18,6
		.byte 	EPROOF,21,11
		.byte 	MONEY,23,12
		.byte 	MONEY,30,7
		.byte 	MONEY,27,13
        	.byte 	PBOMB3,25,3
		.byte 	PBOMB3,23,11
		.byte 	EXTRA,13,11
		.byte 	NEWLIST
		.byte 	EPROOF,22,12
		.byte 	EBNUM,3,12
		.byte 	EBRANGE,15,13
		.byte 	CPROOF,8,3
		.byte 	MONEY,21,11
		.byte 	EPROOF,18,6
		.byte 	MONEY,30,7
		.byte 	MONEY,23,12
		.byte 	MONEY,25,3
        	.byte 	PBOMB3,27,13
		.byte 	PBOMB3,13,11
		.byte 	EXTRA,23,11
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	SR_MON,5,4,RIGHT + CCW
		.byte 	SR_MON,4,13,LEFT 
		.byte 	SR_MON,8,5,RIGHT
		.byte 	SR_MON,16,11,RIGHT + CCW
		.byte 	HR_MON,22,6,RIGHT
		.byte 	HR_MON,26,10,RIGHT + CCW
		.byte 	HR_MON,30,8,RIGHT
		.byte 	HR_MON,28,11,LEFT + CCW
		.byte 	NEWLIST
		.byte 	HR_MON,5,4,RIGHT + CCW
		.byte 	IR_MON,4,13,LEFT 
		.byte 	HR_MON,8,5,RIGHT
		.byte 	SR_MON,16,11,RIGHT + CCW
		.byte 	IR_MON,22,6,RIGHT
		.byte 	HR_MON,26,10,RIGHT + CCW
		.byte 	IR_MON,30,8,RIGHT
		.byte 	SR_MON,28,11,LEFT + CCW
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL14.LEV").
level04:
		;Difficulty level 1.
		.word  	400		;Time to complete.
		.byte 	29		;Gem quota.
		.byte 	2,8,RIGHT	;Robot start X,Y & direction.
		.byte 	23,3		;Exit square position.

		;Difficulty level 2.
		.word  	290		;Time to complete.
		.byte 	29		;Gem quota.
		.byte 	21,6,RIGHT	;Robot start X,Y & direction.
		.byte 	28,5		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	PBOMB3  ,HROCK   ,EMPTY   ,EMPTY   ,SROCK   ,EMPTY
		.byte 	SROCK   ,EMPTY   ,SROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	SROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,HROCK   ,EMPTY
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HDIRT
		.byte 	EMPTY   ,EMPTY   ,HROCK   ,EMPTY   ,PBOMB3  ,DIRT
		;Row 2
		.byte 	HDIRT   ,HDIRT   ,EMPTY   ,HDIRT   ,CRYSTAL ,IROCK
		.byte 	CRYSTAL ,IROCK   ,HDIRT   ,HDIRT   ,EMPTY   ,EMPTY
		.byte 	HDIRT   ,EMPTY   ,HDIRT   ,HDIRT   ,CRYSTAL ,HDIRT
		.byte 	DIRT    ,DIRT    ,IROCK   ,HDIRT   ,HROCK   ,EMPTY
		.byte 	EMPTY   ,DIRT    ,DIRT    ,HROCK   ,DIRT    ,DIRT
		;Row 3
		.byte 	HDIRT   ,DIRT    ,HROCK   ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HDIRT
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,SROCK   ,DIRT    ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,HDIRT   ,HDIRT   ,CRYSTAL ,DIRT
		.byte 	DIRT    ,DIRT    ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT
		;Row 4
		.byte 	HDIRT   ,EMPTY   ,CRYSTAL ,EMPTY   ,HDIRT   ,IROCK
		.byte 	HDIRT   ,HDIRT   ,HDIRT   ,EMPTY   ,HDIRT   ,HROCK
		.byte 	HDIRT   ,HROCK   ,HDIRT   ,HDIRT   ,IROCK   ,EMPTY
		.byte 	IROCK   ,IROCK   ,EMPTY   ,EMPTY   ,DIRT    ,HROCK
		.byte 	IROCK   ,HROCK   ,HDIRT   ,HROCK   ,HDIRT   ,DIRT
		;Row 5
		.byte 	IROCK   ,HDIRT   ,HDIRT   ,DIRT    ,HDIRT   ,SROCK
		.byte 	HDIRT   ,SROCK   ,IROCK   ,HDIRT   ,EMPTY   ,PBOMB3
		.byte 	HROCK   ,CRYSTAL ,IROCK   ,HROCK   ,HDIRT   ,HROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,DIRT    ,HROCK   ,HDIRT
		.byte 	HDIRT   ,SROCK   ,IROCK   ,IROCK   ,EMPTY   ,IROCK
		;Row 6
		.byte 	HDIRT   ,EMPTY   ,EMPTY   ,HROCK   ,EMPTY   ,CRYSTAL
		.byte 	IROCK   ,CRYSTAL ,SROCK   ,SROCK   ,HDIRT   ,IROCK
		.byte 	HDIRT   ,HDIRT   ,HDIRT   ,DIRT    ,IROCK   ,HDIRT
		.byte 	IROCK   ,EMPTY   ,FROBOT  ,IROCK   ,HDIRT   ,SROCK
		.byte 	HDIRT   ,HDIRT   ,EMPTY   ,EMPTY   ,IROCK   ,CRYSTAL
		;Row 7
		.byte 	HDIRT   ,EMPTY   ,SROCK   ,HROCK   ,HDIRT   ,DIRT
		.byte 	HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,IROCK   ,SROCK
		.byte 	EMPTY   ,EMPTY   ,HROCK   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	HROCK   ,MONEY   ,DIRT    ,SROCK   ,HDIRT   ,HDIRT
		.byte 	DIRT    ,IROCK   ,MONEY   ,MONEY   ,SROCK   ,CRYSTAL
		;Row 8
		.byte 	IROCK   ,HDIRT   ,HDIRT   ,PBOMB1  ,HDIRT   ,SROCK
		.byte 	HDIRT   ,SROCK   ,HDIRT   ,HROCK   ,HDIRT   ,HROCK
		.byte 	HDIRT   ,IROCK   ,CRYSTAL ,HDIRT   ,EMPTY   ,HDIRT
		.byte 	CRYSTAL ,DIRT    ,IROCK   ,HDIRT   ,HROCK   ,HDIRT
		.byte 	IROCK   ,SROCK   ,EMPTY   ,EMPTY   ,CRYSTAL ,CRYSTAL
		;Row 9
		.byte 	HDIRT   ,HROCK   ,EMPTY   ,HROCK   ,HDIRT   ,CRYSTAL
		.byte 	IROCK   ,CRYSTAL ,IROCK   ,CRYSTAL ,SROCK   ,HDIRT
		.byte 	HDIRT   ,HDIRT   ,HROCK   ,EMPTY   ,HDIRT   ,IROCK
		.byte 	DIRT    ,HROCK   ,HDIRT   ,SROCK   ,HDIRT   ,DIRT
		.byte 	SROCK   ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		;Row 10
		.byte 	HDIRT   ,PBOMB3  ,EMPTY   ,PBOMB3  ,IROCK   ,DIRT
		.byte 	HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,IROCK   ,HROCK
		.byte 	HDIRT   ,IROCK   ,CRYSTAL ,DIRT    ,DIRT    ,HROCK
		.byte 	HDIRT   ,HDIRT   ,IROCK   ,HDIRT   ,HDIRT   ,DIRT
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		;Row 11
		.byte 	HDIRT   ,DIRT    ,IROCK   ,DIRT    ,HDIRT   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,DIRT    ,IROCK   ,MONEY
		.byte 	SROCK   ,EMPTY   ,HDIRT   ,DIRT    ,HROCK   ,HDIRT
		.byte 	SROCK   ,HDIRT   ,SROCK   ,HDIRT   ,DIRT    ,SROCK
		.byte 	SROCK   ,SROCK   ,SROCK   ,SROCK   ,SROCK   ,SROCK
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0           	;Object #, X, Y.
		.byte 	PBOMB3,7,6
		.byte 	EBRANGE,16,13
		.byte 	PBOMB3,9,3
		.byte  	EPROOF,1,6
		.byte 	PBOMB3,10,8
		.byte 	MONEY,15,9
		.byte 	CPROOF,17,3
                .byte      EBNUM,23,4
                .byte      EPROOF,22,11
                .byte      MONEY,28,6
                .byte      PBOMB3,17,13
                .byte      PBOMB3,12,10
		.byte 	NEWLIST
		.byte 	PBOMB3,16,13
		.byte 	EBRANGE,7,6
		.byte 	PBOMB3,1,6
		.byte  	EPROOF,9,3
		.byte 	PBOMB3,15,9
    		.byte 	MONEY,10,8
		.byte 	CPROOF,23,4
                .byte      EBNUM,17,3
                .byte      EPROOF,28,6
                .byte      MONEY,22,11
                .byte      PBOMB3,12,10
                .byte      PBOMB3,17,13
		.byte 	PBOMB10,10,10
		.byte 	CPROOF,10,4
                .byte      $ff		        ;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	HR_MON,11,4,RIGHT + CCW
		.byte 	SR_MON,3,3,RIGHT
		.byte 	HR_MON,3,11,LEFT + CCW
 		.byte 	SR_MON,16,3,LEFT + CCW
		.byte 	HR_MON,26,3,LEFT
		.byte 	SR_MON,20,3,RIGHT
		.byte 	HR_MON,27,8,RIGHT + CCW
		.byte 	HR_MON,27,8,LEFT 
		.byte 	NEWLIST
		.byte 	HR_MON,11,4,RIGHT + CCW
		.byte 	HR_MON,3,3,RIGHT
		.byte 	IR_MON,3,11,LEFT + CCW
 		.byte 	SR_MON,16,3,LEFT + CCW
		.byte 	HR_MON,26,3,LEFT
		.byte 	IR_MON,20,3,RIGHT
		.byte 	HR_MON,27,8,RIGHT + CCW
		.byte 	SR_MON,27,8,LEFT 
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL15.LEV").
level05:
		;Difficulty level 1.
		.word  	350		;Time to complete.
		.byte 	35		;Gem quota.
		.byte 	1,8,RIGHT	;Robot start X,Y & direction.
		.byte 	28,3		;Exit square position.

		;Difficulty level 2.
		.word  	275		;Time to complete.
		.byte 	40		;Gem quota.
		.byte 	22,8,RIGHT	;Robot start X,Y & direction.
		.byte 	26,10		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	MONEY   ,CRYSTAL ,MIROCK  ,EMPTY   ,SROCK   ,EMPTY
		.byte 	HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,CRYSTAL ,EMPTY   ,EMPTY   ,SROCK   ,EMPTY
		.byte 	HROCK   ,EMPTY   ,HDIRT   ,EMPTY   ,HROCK   ,HDIRT
		.byte 	HDIRT   ,EMPTY   ,HDIRT   ,EMPTY   ,SROCK   ,MONEY
		;Row 2
		.byte 	HDIRT   ,HDIRT   ,HDIRT   ,EMPTY   ,HDIRT   ,EMPTY
		.byte 	MIROCK  ,EMPTY   ,DIRT    ,DIRT    ,DIRT    ,EMPTY
		.byte 	HDIRT   ,MIROCK  ,HDIRT   ,EMPTY   ,DIRT    ,EMPTY
		.byte 	DIRT    ,EMPTY   ,CRYSTAL ,EMPTY   ,PBOMB3  ,SROCK
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,EMPTY   ,DIRT    ,EMPTY
		;Row 3
		.byte 	HDIRT   ,HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT
		.byte 	MIROCK  ,DIRT    ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,DIRT    ,CRYSTAL ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,SROCK   ,HDIRT   ,EMPTY   ,HDIRT   ,HDIRT
		.byte 	EMPTY   ,HDIRT   ,EMPTY   ,HDIRT   ,EMPTY   ,EMPTY
		;Row 4
		.byte 	HDIRT   ,EMPTY   ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	PBOMB3  ,DIRT    ,DIRT    ,EMPTY   ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,CRYSTAL ,HDIRT   ,DIRT    ,HDIRT   ,HDIRT
		.byte 	EMPTY   ,DIRT    ,DIRT    ,EMPTY   ,HDIRT   ,EMPTY
		.byte 	HROCK   ,HDIRT   ,EMPTY   ,SROCK   ,EMPTY   ,EMPTY
		;Row 5
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HDIRT   ,HDIRT
		.byte 	HROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,HDIRT   ,DIRT
		.byte 	HDIRT   ,CRYSTAL ,HDIRT   ,EMPTY   ,HDIRT   ,HDIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HDIRT   ,HDIRT   ,EMPTY   ,HDIRT   ,EMPTY   ,MIROCK
		;Row 6
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,MIROCK  ,HDIRT   ,DIRT
		.byte 	HDIRT   ,CRYSTAL ,HROCK   ,DIRT    ,DIRT    ,HDIRT
		.byte 	HDIRT   ,CRYSTAL ,HDIRT   ,EMPTY   ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,HDIRT   ,CRYSTAL ,EMPTY   ,HDIRT   ,CRYSTAL
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,CRYSTAL ,DIRT
		;Row 7
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,PBOMB3  ,EMPTY   ,HDIRT
		.byte 	HDIRT   ,CRYSTAL ,HDIRT   ,DIRT    ,DIRT    ,MIROCK
		.byte 	HDIRT   ,CRYSTAL ,HDIRT   ,DIRT    ,HDIRT   ,MIROCK
		.byte 	HDIRT   ,MIROCK  ,HDIRT   ,MIROCK  ,HDIRT   ,MIROCK
		.byte 	HDIRT   ,MIROCK  ,HDIRT   ,HDIRT   ,HROCK   ,CRYSTAL
		;Row 8
		.byte 	MIROCK  ,MIROCK  ,HDIRT   ,HDIRT   ,EMPTY   ,SROCK
		.byte 	HDIRT   ,CRYSTAL ,HROCK   ,DIRT    ,DIRT    ,DIRT
		.byte 	MONEY   ,HDIRT   ,HDIRT   ,EMPTY   ,PBOMB3  ,DIRT
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,DIRT    ,MONEY   ,DIRT
		.byte 	EMPTY   ,DIRT    ,PBOMB3  ,SROCK   ,HROCK   ,CRYSTAL
		;Row 9
		.byte 	HDIRT   ,HDIRT   ,HDIRT   ,EMPTY   ,EMPTY   ,HDIRT
		.byte 	EMPTY   ,HDIRT   ,HDIRT   ,EMPTY   ,HDIRT   ,CRYSTAL
		.byte 	EMPTY   ,HDIRT   ,EMPTY   ,DIRT    ,SROCK   ,CRYSTAL
		.byte 	SROCK   ,CRYSTAL ,HROCK   ,CRYSTAL ,HROCK   ,CRYSTAL
		.byte 	HROCK   ,CRYSTAL ,HROCK   ,SROCK   ,SROCK   ,CRYSTAL
		;Row 10
		.byte 	HDIRT   ,HDIRT   ,HDIRT   ,CRYSTAL ,CRYSTAL ,HDIRT
		.byte 	EMPTY   ,HDIRT   ,HDIRT   ,EMPTY   ,HDIRT   ,CRYSTAL
		.byte 	HDIRT   ,HDIRT   ,EMPTY   ,SROCK   ,SROCK   ,CRYSTAL
		.byte 	SROCK   ,CRYSTAL ,SROCK   ,CRYSTAL ,SROCK   ,CRYSTAL
		.byte 	SROCK   ,CRYSTAL ,SROCK   ,SROCK   ,SROCK   ,CRYSTAL
		;Row 11
		.byte 	MONEY   ,CRYSTAL ,MIROCK  ,CRYSTAL ,CRYSTAL ,HDIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HDIRT   ,CRYSTAL
		.byte 	HDIRT   ,EMPTY   ,SROCK   ,SROCK   ,SROCK   ,CRYSTAL
		.byte 	HROCK   ,CRYSTAL ,SROCK   ,CRYSTAL ,SROCK   ,CRYSTAL
		.byte 	SROCK   ,CRYSTAL ,SROCK   ,SROCK   ,SROCK   ,CRYSTAL
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0     		;Object #, X, Y.
		.byte 	EPROOF,3,11
		.byte  	PBOMB3,3,4
		.byte 	PBOMB3,7,7
		.byte 	EBNUM,9,8
		.byte 	PBOMB3,9,12
		.byte 	PBOMB3,13,7
		.byte 	EPROOF,17,6
		.byte 	PBOMB3,19,11
		.byte 	PBOMB10,23,11
		.byte 	MONEY,28,13
		.byte 	EBRANGE,25,3
		.byte 	CPROOF,19,10
		.byte 	MONEY,29,11
		.byte 	EXTRA,29,10
		.byte 	NEWLIST
		.byte 	EPROOF,3,4
		.byte  	PBOMB3,3,11
		.byte 	PBOMB3,9,8
		.byte 	EBNUM,7,7
		.byte 	PBOMB3,9,12
		.byte 	PBOMB3,13,7
		.byte 	EPROOF,19,11
		.byte 	PBOMB3,17,6
		.byte 	PBOMB10,23,11
		.byte 	MONEY,25,3
		.byte 	EBRANGE,28,13
		.byte 	CPROOF,29,10
		.byte 	MONEY,29,11 
		.byte 	PBOMB10,11,10
		.byte 	EXTRA,19,10
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	HR_MON,8,13,RIGHT + CCW
		.byte 	HR_MON,13,3,RIGHT
		.byte 	SR_MON,4,3,LEFT  
		.byte 	IR_MON,18,3,LEFT
		.byte 	SR_MON,15,12,RIGHT + CCW
		.byte 	IR_MON,30,3,LEFT + CCW
		.byte 	HR_MON,22,3,LEFT
		.byte 	SR_MON,30,4,RIGHT
		.byte 	NEWLIST
		.byte 	HR_MON,8,13,RIGHT + CCW
		.byte 	IR_MON,13,3,RIGHT
		.byte 	SR_MON,4,3,LEFT  
		.byte 	IR_MON,18,3,LEFT
		.byte 	SR_MON,15,12,RIGHT + CCW
		.byte 	IR_MON,30,3,LEFT + CCW
		.byte 	HR_MON,22,3,LEFT
		.byte 	IR_MON,30,4,RIGHT
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL16.LEV").
level06:
		;Difficulty level 1.
		.word  	400		;Time to complete.
		.byte 	20		;Gem quota.
		.byte 	1,11,RIGHT	;Robot start X,Y & direction.
		.byte 	12,7		;Exit square position.

		;Difficulty level 2.
		.word  	260		;Time to complete.
		.byte 	21		;Gem quota.
		.byte 	26,12,RIGHT	;Robot start X,Y & direction.
		.byte 	10,10		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	HDIRT   ,RROCK   ,EMPTY   ,HDIRT   ,HDIRT   ,EMPTY
		.byte 	HMUD    ,HDIRT   ,HDIRT   ,EMPTY   ,EMPTY   ,CRYSTAL
		.byte 	EMPTY   ,HDIRT   ,HDIRT   ,IROCK   ,FROBOT  ,DIRT
		.byte 	DIRT    ,DIRT    ,HROCK   ,DIRT    ,IROCK   ,HROCK
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 2
		.byte 	HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,SROCK
		.byte 	EMPTY   ,DIRT    ,HROCK   ,SROCK   ,EMPTY   ,HDIRT
		.byte 	RROCK   ,DIRT    ,EMPTY   ,DIRT    ,EMPTY   ,IROCK
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,EMPTY   ,DIRT    ,DIRT
		.byte 	IROCK   ,EMPTY   ,IROCK   ,IROCK   ,DIRT    ,EMPTY
		;Row 3
		.byte 	HDIRT   ,EMPTY   ,EMPTY   ,SROCK   ,HROCK   ,DIRT
		.byte 	DIRT    ,CRYSTAL ,HDIRT   ,HDIRT   ,CRYSTAL ,EMPTY
		.byte 	EMPTY   ,HDIRT   ,HDIRT   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,DIRT    ,DIRT    ,IROCK   ,EMPTY
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 4
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,DIRT    ,CRYSTAL ,EMPTY
		.byte 	DIRT    ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,EMPTY
		.byte 	RROCK   ,CRYSTAL ,HDIRT   ,DIRT    ,DIRT    ,HROCK
		.byte 	EMPTY   ,IROCK   ,HROCK   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	DIRT    ,EMPTY   ,IROCK   ,IROCK   ,IROCK   ,DIRT
		;Row 5
		.byte 	EMPTY   ,MIROCK  ,DIRT    ,EMPTY   ,HDIRT   ,EMPTY
		.byte 	HROCK   ,DIRT    ,SROCK   ,EROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,HDIRT   ,HDIRT   ,IROCK   ,EMPTY   ,HDIRT
		.byte 	EMPTY   ,DIRT    ,DIRT    ,EMPTY   ,DIRT    ,EMPTY
		.byte 	IROCK   ,EMPTY   ,IROCK   ,CRYSTAL ,CRYSTAL ,CRYSTAL
		;Row 6
		.byte 	EMPTY   ,HDIRT   ,DIRT    ,EMPTY   ,HROCK   ,HDIRT
		.byte 	HDIRT   ,CRYSTAL ,HDIRT   ,DIRT    ,DIRT    ,EMPTY
		.byte 	RROCK   ,CRYSTAL ,HDIRT   ,DIRT    ,HDIRT   ,IROCK
		.byte 	IROCK   ,HDIRT   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	DIRT    ,EMPTY   ,IROCK   ,CRYSTAL ,CRYSTAL ,CRYSTAL
		;Row 7
		.byte 	EMPTY   ,HDIRT   ,HROCK   ,EMPTY   ,HDIRT   ,DIRT
		.byte 	DIRT    ,HDIRT   ,HROCK   ,DIRT    ,DIRT    ,EMPTY
		.byte 	EMPTY   ,HDIRT   ,HDIRT   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT    ,EMPTY
		.byte 	IROCK   ,EMPTY   ,IROCK   ,CRYSTAL ,CRYSTAL ,CRYSTAL
		;Row 8
		.byte 	EMPTY   ,HDIRT   ,HDIRT   ,EMPTY   ,CRYSTAL ,DIRT
		.byte 	HROCK   ,EMPTY   ,CRYSTAL ,RROCK   ,DIRT    ,HDIRT
		.byte 	RROCK   ,CRYSTAL ,HDIRT   ,DIRT    ,EMPTY   ,DIRT
		.byte 	IROCK   ,IROCK   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	DIRT    ,DIRT    ,HROCK   ,DIRT    ,IROCK   ,IROCK
		;Row 9
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EROCK   ,DIRT    ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,EMPTY   ,DIRT    ,HDIRT
		.byte 	EMPTY   ,HDIRT   ,HDIRT   ,IROCK   ,EMPTY   ,HROCK
		.byte 	MONEY   ,MONEY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	DIRT    ,EMPTY   ,HROCK   ,HROCK   ,HROCK   ,EMPTY
		;Row 10
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,DIRT    ,DIRT    ,EMPTY
		.byte 	EMPTY   ,DIRT    ,MIROCK  ,EMPTY   ,DIRT    ,DIRT
		.byte 	RROCK   ,MONEY   ,HDIRT   ,DIRT    ,EMPTY   ,DIRT
		.byte 	IROCK   ,IROCK   ,IROCK   ,EMPTY   ,DIRT    ,MONEY
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,DIRT    ,DIRT    ,MONEY
		;Row 11
		.byte 	DIRT    ,RROCK   ,MONEY   ,DIRT    ,DIRT    ,HROCK
		.byte 	CRYSTAL ,HDIRT   ,HDIRT   ,CRYSTAL ,DIRT    ,DIRT
		.byte 	EMPTY   ,HDIRT   ,HDIRT   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,HDIRT
		.byte 	IROCK   ,IROCK   ,HDIRT   ,IROCK   ,IROCK   ,EMPTY
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0             	;Object #, X, Y.
		.byte 	PBOMB3,27,10
		.byte 	RPROOF,27,11
		.byte 	PBOMB3,29,4
		.byte 	CPROOF,21,7
		.byte 	EPROOF,28,10
		.byte 	PBOMB3,18,12
		.byte 	PBOMB3,16,4
		.byte 	PBOMB3,18,3
		.byte 	EBRANGE,9,9
		.byte 	PBOMB3,7,3
		.byte 	RPROOF,10,7
		.byte 	PBOMB10,3,9
		.byte 	EBNUM,6,13
		.byte 	PBOMB3,10,4
		.byte 	EPROOF,13,5
		.byte 	MONEY,13,9
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	HR_MON,17,3,RIGHT + CCW
		.byte 	HR_MON,28,3,LEFT 
		.byte 	RR_MON,22,6,LEFT + CCW
		.byte 	IR_MON,24,6,RIGHT
		.byte 	SR_MON,4,7,LEFT
		.byte 	SR_MON,6,6,RIGHT + CCW
		.byte 	SR_MON,10,3,LEFT
		.byte 	SR_MON,30,12,LEFT + CCW
		.byte 	NEWLIST
		.byte 	HR_MON,17,3,RIGHT + CCW
		.byte 	HR_MON,28,3,LEFT 
		.byte 	RR_MON,22,6,LEFT + CCW
		.byte 	SR_MON,22,6,RIGHT
		.byte 	SR_MON,28,3,RIGHT + CCW
		.byte 	IR_MON,24,6,RIGHT
		.byte 	RR_MON,4,7,LEFT
		.byte 	HR_MON,6,6,RIGHT + CCW
		.byte 	SR_MON,10,3,LEFT
		.byte 	RR_MON,30,12,LEFT + CCW
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL17.LEV").
level07:
		;Difficulty level 1.
		.word  	400		;Time to complete.
		.byte 	33		;Gem quota.
		.byte 	1,8,RIGHT	;Robot start X,Y & direction.
		.byte 	20,4		;Exit square position.

		;Difficulty level 2.
		.word  	280		;Time to complete.
		.byte 	35		;Gem quota.
		.byte 	12,7,RIGHT	;Robot start X,Y & direction.
		.byte 	2,13		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	HDIRT   ,HDIRT   ,CRYSTAL ,HDIRT   ,EMPTY   ,HDIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HDIRT   ,EMPTY   ,DIRT
		.byte 	HROCK   ,HDIRT   ,HDIRT   ,EMPTY   ,EROCK   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,HDIRT   ,MRROCK  ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HDIRT
		;Row 2
		.byte 	EMPTY   ,EMPTY   ,SROCK   ,CRYSTAL ,EMPTY   ,CRYSTAL
		.byte 	EMPTY   ,HDIRT   ,MIROCK  ,HDIRT   ,EMPTY   ,EMPTY
		.byte 	DIRT    ,EMPTY   ,HDIRT   ,EMPTY   ,DIRT    ,EMPTY
		.byte 	HROCK   ,EMPTY   ,EMPTY   ,DIRT    ,EMPTY   ,CRYSTAL
		.byte 	CRYSTAL ,EMPTY   ,HDIRT   ,CRYSTAL ,HDIRT   ,HDIRT
		;Row 3
		.byte 	HROCK   ,EMPTY   ,DIRT    ,HDIRT   ,MIROCK  ,MRROCK
		.byte 	DIRT    ,EMPTY   ,CRYSTAL ,EROCK   ,EMPTY   ,HDIRT
		.byte 	SROCK   ,DIRT    ,HROCK   ,DIRT    ,HROCK   ,DIRT
		.byte 	HDIRT   ,EMPTY   ,DIRT    ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	SROCK   ,EMPTY   ,HDIRT   ,EROCK   ,EMPTY   ,DIRT
		;Row 4
		.byte 	HDIRT   ,EMPTY   ,DIRT    ,CRYSTAL ,CRYSTAL ,HDIRT
		.byte 	EMPTY   ,DIRT    ,CRYSTAL ,DIRT    ,EMPTY   ,EMPTY
		.byte 	DIRT    ,DIRT    ,DIRT    ,EMPTY   ,DIRT    ,EMPTY
		.byte 	HDIRT   ,EMPTY   ,DIRT    ,CRYSTAL ,EMPTY   ,DIRT
		.byte 	DIRT    ,CRYSTAL ,HDIRT   ,DIRT    ,EMPTY   ,DIRT
		;Row 5
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,SROCK   ,CRYSTAL ,SROCK
		.byte 	EMPTY   ,DIRT    ,CRYSTAL ,DIRT    ,EMPTY   ,EMPTY
		.byte 	SROCK   ,CRYSTAL ,EMPTY   ,EMPTY   ,MIROCK  ,CRYSTAL
		.byte 	HDIRT   ,EMPTY   ,DIRT    ,SROCK   ,EMPTY   ,EMPTY
		.byte 	CRYSTAL ,HROCK   ,EMPTY   ,DIRT    ,EMPTY   ,CRYSTAL
		;Row 6
		.byte 	EMPTY   ,HDIRT   ,HDIRT   ,HROCK   ,CRYSTAL ,HDIRT
		.byte 	EMPTY   ,EMPTY   ,HROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HDIRT   ,HDIRT   ,EMPTY   ,HDIRT   ,CRYSTAL ,SROCK
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,HDIRT   ,EMPTY   ,HDIRT
		.byte 	HDIRT   ,HDIRT   ,EMPTY   ,DIRT    ,EMPTY   ,HDIRT
		;Row 7
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,DIRT    ,CRYSTAL ,HROCK
		.byte 	EMPTY   ,DIRT    ,DIRT    ,DIRT    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,SROCK   ,DIRT    ,DIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HROCK   ,EMPTY   ,HDIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HDIRT   ,EMPTY   ,CRYSTAL
		;Row 8
		.byte 	EMPTY   ,HDIRT   ,EMPTY   ,DIRT    ,HDIRT   ,HDIRT
		.byte 	EMPTY   ,HDIRT   ,CRYSTAL ,DIRT    ,EMPTY   ,SROCK
		.byte 	DIRT    ,DIRT    ,CRYSTAL ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	EMPTY   ,HDIRT   ,CRYSTAL ,HDIRT   ,EMPTY   ,HDIRT
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,EMPTY   ,EROCK   ,HDIRT
		;Row 9
		.byte 	EMPTY   ,HDIRT   ,EMPTY   ,SROCK   ,CRYSTAL ,EMPTY
		.byte 	EMPTY   ,CRYSTAL ,SROCK   ,EMPTY   ,EMPTY   ,DIRT
		.byte 	HROCK   ,HDIRT   ,EROCK   ,CRYSTAL ,EMPTY   ,EROCK
		.byte 	CRYSTAL ,RROCK   ,EROCK   ,EMPTY   ,SROCK   ,DIRT
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,EMPTY   ,HDIRT   ,DIRT
		;Row 10
		.byte 	EMPTY   ,HDIRT   ,CRYSTAL ,DIRT    ,DIRT    ,EMPTY
		.byte 	HROCK   ,DIRT    ,DIRT    ,EMPTY   ,HDIRT   ,MIROCK
		.byte 	HDIRT   ,EMPTY   ,HDIRT   ,HDIRT   ,EMPTY   ,HDIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,EMPTY   ,HDIRT   ,DIRT
		.byte 	EMPTY   ,HDIRT   ,HDIRT   ,EMPTY   ,CRYSTAL ,DIRT
		;Row 11
		.byte 	HDIRT   ,RROCK   ,EROCK   ,CRYSTAL ,HDIRT   ,EMPTY
		.byte 	HDIRT   ,CRYSTAL ,EMPTY   ,HDIRT   ,RROCK   ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT
		.byte 	EMPTY   ,CRYSTAL ,EROCK   ,CRYSTAL ,HDIRT   ,DIRT
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0    		;Object #, X, Y.
		.byte 	PBOMB3,2,10
		.byte 	EBNUM,2,3
		.byte 	PBOMB3,2,11
		.byte 	RPROOF,3,8
		.byte 	PBOMB3,1,3
		.byte 	CPROOF,1,13
		.byte 	EPROOF,9,8
		.byte 	PBOMB10,6,4
		.byte 	MONEY,15,5
		.byte 	PBOMB3,8,10
		.byte 	PBOMB3,13,6
		.byte 	CPROOF,16,10
		.byte 	EPROOF,22,9
		.byte 	PBOMB10,24,3
		.byte 	PBOMB10,16,9
		.byte 	EPROOF,1,5
		.byte 	MONEY,6,9
		.byte 	MONEY,13,3
		.byte 	EXTRA,12,12
		.byte 	RPROOF,20,11
		.byte 	EBRANGE,26,11
    		.byte 	CPROOF,30,5	
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
       		.byte 	SR_MON,7,6,RIGHT
		.byte 	IR_MON,27,9,RIGHT + CCW
		.byte 	HR_MON,11,3,RIGHT
		.byte 	HR_MON,19,10,RIGHT + CCW
		.byte 	SR_MON,9,3,LEFT
		.byte 	SR_MON,29,3,LEFT + CCW 
		.byte 	SR_MON,20,13,LEFT
		.byte 	IR_MON,16,13,LEFT + CCW
		.byte 	NEWLIST
       		.byte 	IR_MON,7,6,RIGHT
		.byte 	IR_MON,27,9,RIGHT + CCW
		.byte 	SR_MON,11,3,RIGHT
		.byte 	SR_MON,19,10,RIGHT + CCW
		.byte 	HR_MON,9,3,LEFT
		.byte 	HR_MON,29,3,LEFT + CCW 
		.byte 	HR_MON,20,13,LEFT
		.byte 	IR_MON,16,13,LEFT + CCW
		.byte 	$ff			;End of list marker.


;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL18.LEV").
level08:
		;Difficulty level 1.
		.word  	300		;Time to complete.
		.byte 	30		;Gem quota.
		.byte 	21,5,RIGHT	;Robot start X,Y & direction.
		.byte 	26,7		;Exit square position.

		;Difficulty level 2.
		.word  	250		;Time to complete.
		.byte 	75		;Gem quota.
		.byte 	1,6,RIGHT	;Robot start X,Y & direction.
		.byte 	17,13		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	MUD     ,MUD     ,MUD     ,MUD     ,MUD     ,MUD
		.byte 	MUD     ,MUD     ,MUD     ,MUD     ,MUD     ,MUD
		.byte 	MUD     ,EMPTY   ,EMPTY   ,MUD     ,MUD     ,MUD
		.byte 	HMUD    ,HMUD    ,HMUD    ,HMUD    ,MUD     ,HMUD
		.byte 	HMUD    ,MUD     ,HMUD    ,HMUD    ,HMUD    ,MUD
		;Row 2
		.byte 	MUD     ,EROCK   ,EROCK   ,EROCK   ,HROCK   ,MUD
		.byte 	MUD     ,MUD     ,EROCK   ,MUD     ,MUD     ,EROCK
		.byte 	MUD     ,EMPTY   ,MUD     ,EROCK   ,EROCK   ,MUD
		.byte 	EMPTY   ,HMUD    ,EMPTY   ,EMPTY   ,HMUD    ,PBOMB3
		.byte 	HMUD    ,SROCK   ,FROBOT  ,HMUD    ,PBOMB3  ,EMPTY
		;Row 3
		.byte 	PBOMB1  ,DIRT    ,MIROCK  ,DIRT    ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,DIRT    ,EROCK   ,EROCK   ,DIRT
		.byte 	EROCK   ,MUD     ,EROCK   ,MRROCK  ,EROCK   ,HMUD
		.byte 	EMPTY   ,MIROCK  ,EMPTY   ,SROCK   ,HMUD    ,EMPTY
		.byte 	HMUD    ,DIRT    ,EMPTY   ,HMUD    ,EROCK   ,CRYSTAL
		;Row 4
		.byte 	EMPTY   ,HDIRT   ,HROCK   ,MRROCK  ,DIRT    ,HROCK
		.byte 	DIRT    ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,CRYSTAL
		.byte 	DIRT    ,EROCK   ,HDIRT   ,HDIRT   ,EROCK   ,HMUD
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,PBOMB3  ,HMUD    ,EMPTY
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,HMUD    ,DIRT    ,HMUD
		;Row 5
		.byte 	EMPTY   ,HDIRT   ,HROCK   ,PBOMB3  ,DIRT    ,HDIRT
		.byte 	SROCK   ,DIRT    ,HDIRT   ,HROCK   ,SROCK   ,HDIRT
		.byte 	DIRT    ,HDIRT   ,SROCK   ,HDIRT   ,EROCK   ,HMUD
		.byte 	CRYSTAL ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,CRYSTAL
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HMUD
		;Row 6
		.byte 	EMPTY   ,HROCK   ,MRROCK  ,HDIRT   ,HDIRT   ,PBOMB3
		.byte 	HROCK   ,DIRT    ,SROCK   ,DIRT    ,PBOMB3  ,HDIRT
		.byte 	HROCK   ,HDIRT   ,HDIRT   ,HDIRT   ,EROCK   ,HROCK
		.byte 	DIRT    ,EMPTY   ,MUD     ,EMPTY   ,EMPTY   ,HMUD
		.byte 	EMPTY   ,DIRT    ,HMUD    ,EMPTY   ,EMPTY   ,HMUD
		;Row 7
		.byte 	EROCK   ,EROCK   ,HDIRT   ,SROCK   ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,HDIRT   ,MRROCK  ,DIRT    ,DIRT    ,HDIRT
		.byte 	PBOMB3  ,MIROCK  ,SROCK   ,HROCK   ,DIRT    ,DIRT
		.byte 	HMUD    ,EMPTY   ,HMUD    ,DIRT    ,MIROCK  ,HMUD
		.byte 	SROCK   ,SROCK   ,HMUD    ,EMPTY   ,CRYSTAL ,HMUD
		;Row 8
		.byte 	MUD     ,DIRT    ,EROCK   ,DIRT    ,HDIRT   ,EROCK
		.byte 	DIRT    ,EROCK   ,EROCK   ,EROCK   ,HDIRT   ,HDIRT
		.byte 	DIRT    ,HDIRT   ,HDIRT   ,HDIRT   ,DIRT    ,SROCK
		.byte 	HMUD    ,EMPTY   ,HMUD    ,EROCK   ,DIRT    ,HMUD
		.byte 	EMPTY   ,DIRT    ,HMUD    ,PBOMB3  ,DIRT    ,HMUD
		;Row 9
		.byte 	MUD     ,DIRT    ,DIRT    ,EROCK   ,EROCK   ,DIRT
		.byte 	EROCK   ,MUD     ,MUD     ,EROCK   ,DIRT    ,DIRT
		.byte 	MRROCK  ,DIRT    ,EROCK   ,HROCK   ,DIRT    ,EROCK
		.byte 	HMUD    ,EMPTY   ,HMUD    ,DIRT    ,PBOMB10 ,HMUD
		.byte 	DIRT    ,MONEY   ,HMUD    ,EROCK   ,MONEY   ,HMUD
		;Row 10
		.byte 	MUD     ,MUD     ,DIRT    ,DIRT    ,EROCK   ,DIRT
		.byte 	MUD     ,MUD     ,EMPTY   ,MUD     ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,DIRT    ,EROCK   ,DIRT    ,HROCK
		.byte 	HMUD    ,MONEY   ,HMUD    ,EMPTY   ,DIRT    ,HMUD
		.byte 	MIROCK  ,DIRT    ,HMUD    ,HMUD    ,HMUD    ,HMUD
		;Row 11
		.byte 	MUD     ,MUD     ,MUD     ,MUD     ,MUD     ,MUD
		.byte 	MUD     ,EMPTY   ,EMPTY   ,MUD     ,MUD     ,MUD
		.byte 	MUD     ,MUD     ,MIROCK  ,CRYSTAL ,MIROCK  ,HMUD
		.byte 	HMUD    ,MUD     ,HMUD    ,MUD     ,HMUD    ,HMUD
		.byte 	HMUD    ,MUD     ,HMUD    ,HMUD    ,HMUD    ,MUD
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0           	;Object #, X, Y.
		.byte 	PBOMB10,5,11
		.byte 	EBRANGE,6,9
		.byte 	PBOMB10,13,11
		.byte 	PBOMB3,9,13
		.byte 	PBOMB10,7,3
		.byte 	PBOMB10,14,3
		.byte 	EPROOF,4,10
		.byte 	CPROOF,12,5
		.byte 	RPROOF,10,8
		.byte 	LPROOF,16,10
		.byte 	EBNUM,16,11
		.byte 	PBOMB10,30,4
		.byte 	CPROOF,22,5
		.byte 	FTIMER,19,3
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	HR_MON,14,3,RIGHT + CCW
		.byte 	SR_MON,9,13,RIGHT
		.byte 	IR_MON,7,4,LEFT + CCW
 		.byte      MUD_MON,8,3,LEFT
		.byte 	MUD_MON,5,3,LEFT + CCW
		.byte 	MUD_MON,20,10,RIGHT
		.byte 	MUD_MON,24,4,RIGHT + CCW
		.byte 	MUD_MON,29,8,RIGHT
		.byte 	NEWLIST
		.byte 	IR_MON,14,3,RIGHT + CCW
		.byte 	IR_MON,9,13,RIGHT
		.byte 	IR_MON,7,4,LEFT + CCW
		.byte 	IR_MON,12,3,LEFT
 		.byte      MUD_MON,8,3,LEFT
		.byte 	MUD_MON,5,3,LEFT + CCW
		.byte 	MUD_MON,20,10,RIGHT
		.byte 	MUD_MON,24,4,RIGHT + CCW
		.byte 	MUD_MON,29,8,RIGHT
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL19.LEV").
level09:
		;Difficulty level 1.
		.word  	300		;Time to complete.
		.byte 	40		;Gem quota.
		.byte 	14,6,RIGHT	;Robot start X,Y & direction.
		.byte 	27,6		;Exit square position.

		;Difficulty level 2.
		.word  	250		;Time to complete.
		.byte 	65		;Gem quota.
		.byte 	28,4,RIGHT	;Robot start X,Y & direction.
		.byte 	23,13		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	LAVA    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,LAVA    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,LAVA
		;Row 2
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HDIRT   ,HMUD    ,EMPTY
		.byte 	HDIRT   ,HMUD    ,EMPTY   ,HMUD    ,EMPTY   ,HMUD
		.byte 	HMUD    ,HDIRT   ,EMPTY   ,EMPTY   ,PBOMB3  ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,SROCK   ,EMPTY   ,HMUD
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 3
		.byte 	EMPTY   ,HMUD    ,HMUD    ,EMPTY   ,EMPTY   ,HMUD
		.byte 	EMPTY   ,SROCK   ,HMUD    ,EMPTY   ,CRYSTAL ,MIROCK
		.byte 	EMPTY   ,EMPTY   ,HMUD    ,CRYSTAL ,HMUD    ,EMPTY
		.byte 	HMUD    ,CRYSTAL ,HMUD    ,CRYSTAL ,HMUD    ,HMUD
		.byte 	EMPTY   ,HMUD    ,HMUD    ,HMUD    ,EMPTY   ,EMPTY
		;Row 4
		.byte 	EMPTY   ,HMUD    ,EMPTY   ,CRYSTAL ,DIRT    ,SROCK
		.byte 	DIRT    ,CRYSTAL ,DIRT    ,DIRT    ,SROCK   ,DIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,DIRT    ,RROCK   ,CRYSTAL
		.byte 	EMPTY   ,HDIRT   ,SROCK   ,DIRT    ,PBOMB3  ,CRYSTAL
		.byte 	CRYSTAL ,MONEY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 5
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,HROCK   ,DIRT    ,EMPTY
		.byte 	SROCK   ,DIRT    ,HDIRT   ,HDIRT   ,DIRT    ,EMPTY
		.byte 	EROCK   ,MIROCK  ,MIROCK  ,MIROCK  ,MIROCK  ,MIROCK
		.byte 	MIROCK  ,MIROCK  ,MIROCK  ,MIROCK  ,MIROCK  ,MONEY
		.byte 	HMUD    ,CRYSTAL ,HROCK   ,PBOMB10 ,EMPTY   ,EMPTY
		;Row 6
		.byte 	EMPTY   ,EMPTY   ,MIROCK  ,HDIRT   ,HDIRT   ,CRYSTAL
		.byte 	DIRT    ,CRYSTAL ,HDIRT   ,HDIRT   ,MIROCK  ,SROCK
		.byte 	HROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	HROCK   ,EROCK   ,CRYSTAL ,EROCK   ,MIROCK  ,EMPTY
		;Row 7
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	DIRT    ,HMUD    ,DIRT    ,DIRT    ,SROCK   ,CRYSTAL
		.byte 	EROCK   ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,EROCK
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,HMUD
		;Row 8
		.byte 	EMPTY   ,EMPTY   ,CRYSTAL ,CRYSTAL ,EMPTY   ,DIRT
		.byte 	MIROCK  ,DIRT    ,EMPTY   ,SROCK   ,PBOMB10 ,DIRT
		.byte 	EROCK   ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,EROCK
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,RROCK   ,CRYSTAL ,HMUD
		;Row 9
		.byte 	EMPTY   ,EMPTY   ,HDIRT   ,HDIRT   ,EMPTY   ,HDIRT
		.byte 	HDIRT   ,DIRT    ,CRYSTAL ,DIRT    ,EMPTY   ,EMPTY
		.byte 	IROCK   ,RROCK   ,IROCK   ,RROCK   ,IROCK   ,HMUD
		.byte 	IROCK   ,RROCK   ,IROCK   ,RROCK   ,IROCK   ,HMUD
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,HMUD
		;Row 10
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,CRYSTAL
		.byte 	CRYSTAL ,EMPTY   ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	RROCK   ,EMPTY   ,MONEY   ,EMPTY   ,MONEY   ,EMPTY
		.byte 	MONEY   ,EMPTY   ,EMPTY   ,MONEY   ,RROCK   ,SROCK
		.byte 	HMUD    ,CRYSTAL ,CRYSTAL ,CRYSTAL ,HMUD    ,SROCK
		;Row 11
		.byte 	LAVA    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HMUD
		.byte 	HMUD    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	RROCK   ,MONEY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,MONEY   ,LAVA    ,RROCK   ,MUD
		.byte 	SROCK   ,HMUD    ,HMUD    ,HMUD    ,SROCK   ,MUD
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0            	;Object #, X, Y.
		.byte 	EBNUM,4,9
		.byte 	LPROOF,13,6
		.byte 	PBOMB10,5,7
		.byte 	PBOMB10,13,8
		.byte 	RPROOF,5,9
		.byte 	PBOMB3,9,8
		.byte 	EPROOF,8,9
		.byte 	CPROOF,4,7
		.byte 	PBOMB10,1,13
		.byte 	MONEY,3,7
		.byte 	PBOMB10,11,6
		.byte 	EPROOF,28,10
		.byte 	MONEY,30,13
		.byte 	LPROOF,7,6
		.byte 	EBRANGE,20,11
		.byte 	CPROOF,10,6
		.byte 	FTIMER,10,3
		.byte 	EXTRA,13,12
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	SR_MON,1,5,LEFT
		.byte 	LAVA_MON,5,5,RIGHT
		.byte 	LAVA_MON,13,3,UP + CCW
 		.byte 	LAVA_MON,20,13,DOWN
		.byte 	SR_MON,2,13,RIGHT + CCW
		.byte 	HR_MON,10,12,RIGHT + CCW
		.byte 	LAVA_MON,30,6,RIGHT
		.byte 	LAVA_MON,25,3,RIGHT + CCW
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL20.LEV").
level10:
		;Difficulty level 1.
		.word  	300		;Time to complete.
		.byte 	35		;Gem quota.
		.byte 	5,11,RIGHT	;Robot start X,Y & direction.
		.byte 	19,11		;Exit square position.

		;Difficulty level 2.
		.word  	250		;Time to complete.
		.byte 	41      	;Gem quota.
		.byte 	21,11,RIGHT	;Robot start X,Y & direction.
		.byte 	16,3		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	EMPTY   ,RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,RROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 2
		.byte 	EMPTY   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,MIROCK  ,IROCK   ,IROCK   ,EMPTY
		;Row 3
		.byte 	EMPTY   ,IROCK   ,DIRT    ,PBOMB10 ,CRYSTAL ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,FROBOT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,CRYSTAL
		.byte 	PBOMB10 ,EROCK   ,DIRT    ,SROCK   ,IROCK   ,EMPTY
		;Row 4
		.byte 	EMPTY   ,IROCK   ,RROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,RROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,SROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,RROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,RROCK   ,IROCK   ,IROCK   ,IROCK   ,EMPTY
		;Row 5
		.byte 	EMPTY   ,IROCK   ,DIRT    ,PBOMB3  ,CRYSTAL ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,DIRT    ,EMPTY   ,DIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,DIRT    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,DIRT    ,CRYSTAL ,PBOMB3  ,MIROCK  ,EMPTY
		;Row 6
		.byte 	EMPTY   ,IROCK   ,IROCK   ,SROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,RROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,RROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,EMPTY
		;Row 7
		.byte 	EMPTY   ,MIROCK  ,HROCK   ,DIRT    ,CRYSTAL ,PBOMB3
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,EMPTY   ,EMPTY   ,DIRT
		.byte 	CRYSTAL ,EMPTY   ,EMPTY   ,DIRT    ,CRYSTAL ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,CRYSTAL ,PBOMB3  ,IROCK   ,CRYSTAL
		;Row 8
		.byte 	EMPTY   ,IROCK   ,RROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,RROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,SROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,CRYSTAL
		;Row 9
		.byte 	CRYSTAL ,IROCK   ,DIRT    ,CRYSTAL ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT
		.byte 	CRYSTAL ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,PBOMB3
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,CRYSTAL ,DIRT    ,DIRT
		.byte 	RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK   ,CRYSTAL
		;Row 10
		.byte 	CRYSTAL ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,CRYSTAL
		;Row 11
		.byte 	CRYSTAL ,EXTRA   ,MONEY   ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,MONEY   ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	MONEY   ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	MONEY   ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,MONEY   ,CRYSTAL ,CRYSTAL ,CRYSTAL
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0   		;Object #, X, Y.
		.byte 	CPROOF,16,8
		.byte 	EBRANGE,24,11
		.byte 	FTIMER,22,6
		.byte 	PBOMB10,3,6
		.byte 	EBNUM,26,6
		.byte 	PBOMB10,12,6
		.byte 	FROBOT,3,11
		.byte 	EPROOF,9,8
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	SR_MON,11,11,RIGHT + CCW
		.byte 	SR_MON,17,11,RIGHT
		.byte 	RR_MON,7,5,RIGHT + CCW
		.byte 	RR_MON,22,5,RIGHT
		.byte 	LAVA_MON,26,9,RIGHT + CCW
		.byte 	MUD_MON,7,9,RIGHT
		.byte 	HR_MON,7,7,RIGHT + CCW
		.byte 	HR_MON,24,7,RIGHT
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL06.LEV").
level11:
		;Difficulty level 1.
		.word      350		;Time to complete.
		.byte 	30		;Gem quota.
		.byte 	15,8,RIGHT	;Robot start X,Y & direction.
		.byte 	6,8		;Exit square position.

		;Difficulty level 2.
		.word  	275		;Time to complete.
		.byte 	60		;Gem quota.
		.byte 	26,10,RIGHT	;Robot start X,Y & direction.
		.byte 	1,10		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	MUD     ,MUD     ,MUD     ,MUD     ,MUD     ,MUD
		.byte 	MUD     ,MUD     ,MUD     ,MUD     ,MUD     ,MUD
		.byte 	MUD     ,MUD     ,MUD     ,MUD     ,MUD     ,MUD
		.byte 	MUD     ,MUD     ,MUD     ,MUD     ,MUD     ,MUD
		.byte 	MUD     ,MUD     ,MUD     ,MUD     ,MUD     ,MUD
		;Row 2
		.byte 	MUD     ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	SROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,MUD     ,PBOMB10
		.byte 	MUD     ,EMPTY   ,EMPTY   ,EMPTY   ,PBOMB10 ,MUD
		;Row 3
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,DIRT    ,EMPTY   ,EMPTY
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,MUD
		;Row 4
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,MRROCK  ,SROCK
		.byte 	EMPTY   ,MONEY   ,EROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,MONEY   ,EMPTY   ,SROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,MUD
		;Row 5
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,EMPTY   ,DIRT    ,DIRT
		.byte 	EMPTY   ,DIRT    ,DIRT    ,EMPTY   ,DIRT    ,EMPTY
		.byte 	DIRT    ,HROCK   ,EMPTY   ,IROCK   ,DIRT    ,DIRT
		.byte 	EMPTY   ,DIRT    ,IROCK   ,EROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,MUD
		;Row 6
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EROCK   ,DIRT    ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,EMPTY   ,HROCK   ,EMPTY
		.byte 	DIRT    ,DIRT    ,EMPTY   ,DIRT    ,DIRT    ,DIRT
		.byte 	EMPTY   ,DIRT    ,MRROCK  ,DIRT    ,EMPTY   ,EROCK
		.byte 	EMPTY   ,EROCK   ,EMPTY   ,EROCK   ,EMPTY   ,MUD
		;Row 7
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,DIRT    ,DIRT    ,EMPTY
		.byte 	EROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT    ,EMPTY
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,DIRT    ,DIRT    ,EMPTY
		.byte 	EMPTY   ,HROCK   ,PBOMB10 ,DIRT    ,EMPTY   ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,EMPTY   ,DIRT
		;Row 8
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	DIRT    ,EMPTY   ,DIRT    ,DIRT    ,DIRT    ,EMPTY
		.byte 	DIRT    ,DIRT    ,EMPTY   ,DIRT    ,EMPTY   ,DIRT
		.byte 	EMPTY   ,DIRT    ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	DIRT    ,EMPTY   ,DIRT    ,EMPTY   ,EMPTY   ,DIRT
		;Row 9
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,MONEY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,MONEY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,IROCK   ,MIROCK  ,IROCK
		;Row 10
		.byte 	MUD     ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	MUD     ,EMPTY   ,EMPTY   ,EMPTY   ,MIROCK  ,MIROCK
		.byte 	IROCK   ,IROCK   ,MIROCK  ,IROCK   ,RROCK   ,IROCK
		;Row 11
		.byte 	MUD     ,MUD     ,MUD     ,MUD     ,MUD     ,MUD
		.byte 	MUD     ,MUD     ,MUD     ,MUD     ,MUD     ,MUD
		.byte 	MUD     ,MUD     ,MUD     ,MUD     ,MUD     ,MUD
		.byte 	MUD     ,MUD     ,MUD     ,DIRT    ,DIRT    ,DIRT
		.byte 	PBOMB10 ,PBOMB10 ,DIRT    ,PBOMB10 ,PBOMB10 ,MONEY
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0    		;Object #, X, Y.
		.byte 	RPROOF,1,13
		.byte 	LPROOF,1,3
		.byte 	PBOMB3,5,7
		.byte 	EPROOF,7,3
		.byte 	CPROOF,10,10
		.byte 	EBNUM,11,8
		.byte 	PBOMB3,17,8
		.byte 	EBRANGE,20,7
		.byte 	LPROOF,20,9
		.byte 	EPROOF,21,8
		.byte 	CPROOF,27,9
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
 ;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	MUD_MON,7,8,RIGHT + CCW
		.byte 	MUD_MON,9,4,LEFT 
		.byte 	MUD_MON,15,4,LEFT + CCW
		.byte 	MUD_MON,14,12,RIGHT
		.byte 	MUD_MON,21,6,RIGHT + CCW
		.byte 	MUD_MON,23,11,RIGHT
		.byte 	MUD_MON,27,5,LEFT + CCW
		.byte 	MUD_MON,29,10,LEFT
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL03.LEV").
level12:
		;Difficulty level 1.
		.word  	425		;Time to complete.
		.byte 	34		;Gem quota.
		.byte 	1,8,RIGHT	;Robot start X,Y & direction.
		.byte 	9,8		;Exit square position.

		;Difficulty level 2.
		.word  	300		;Time to complete.
		.byte 	39		;Gem quota.
		.byte 	24,10,RIGHT	;Robot start X,Y & direction.
		.byte 	29,3		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	SROCK   ,SROCK   ,CRYSTAL ,CRYSTAL ,CRYSTAL ,SROCK
		.byte 	SROCK   ,HDIRT   ,DIRT    ,SROCK   ,EROCK   ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,EROCK   ,SROCK   ,DIRT    ,DIRT
		.byte 	SROCK   ,HDIRT   ,EMPTY   ,EMPTY   ,CRYSTAL ,HDIRT
		.byte 	SROCK   ,DIRT    ,EMPTY   ,PBOMB10 ,MRROCK  ,MRROCK
		;Row 2
		.byte 	HDIRT   ,SROCK   ,SROCK   ,CRYSTAL ,SROCK   ,SROCK
		.byte 	HDIRT   ,EMPTY   ,PBOMB3  ,DIRT    ,HROCK   ,EROCK
		.byte 	CRYSTAL ,EROCK   ,HROCK   ,DIRT    ,EMPTY   ,EMPTY
		.byte 	DIRT    ,SROCK   ,HDIRT   ,CRYSTAL ,HDIRT   ,SROCK
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,MRROCK  ,MRROCK  ,RROCK
		;Row 3
		.byte 	EMPTY   ,HDIRT   ,SROCK   ,SROCK   ,SROCK   ,HDIRT
		.byte 	EMPTY   ,EMPTY   ,MIROCK  ,EMPTY   ,HMUD    ,HROCK
		.byte 	EROCK   ,HROCK   ,HMUD    ,EMPTY   ,EMPTY   ,PBOMB3
		.byte 	EMPTY   ,DIRT    ,SROCK   ,CRYSTAL ,SROCK   ,DIRT
		.byte 	EMPTY   ,EMPTY   ,MRROCK  ,MRROCK  ,RROCK   ,CRYSTAL
		;Row 4
		.byte 	EMPTY   ,EMPTY   ,HDIRT   ,SROCK   ,HDIRT   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EROCK
		.byte 	HROCK   ,EROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,EROCK   ,DIRT    ,EMPTY
		.byte 	PBOMB3  ,MRROCK  ,MRROCK  ,RROCK   ,CRYSTAL ,CRYSTAL
		;Row 5
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HDIRT   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,MIROCK  ,EMPTY   ,DIRT
		.byte 	EROCK   ,DIRT    ,EMPTY   ,HMUD    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,DIRT    ,EMPTY   ,EMPTY
		.byte 	MRROCK  ,MRROCK  ,RROCK   ,CRYSTAL ,CRYSTAL ,CRYSTAL
		;Row 6
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	MIROCK  ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,RROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,HDIRT   ,DIRT    ,DIRT
		.byte 	DIRT    ,SROCK   ,EMPTY   ,CRYSTAL ,CRYSTAL ,CRYSTAL
		;Row 7
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,SROCK   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HDIRT
		.byte 	HROCK   ,HDIRT   ,EMPTY   ,HMUD    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,MIROCK  ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,RROCK   ,RROCK   ,CRYSTAL ,CRYSTAL ,CRYSTAL
		;Row 8
		.byte 	EMPTY   ,EMPTY   ,SROCK   ,SROCK   ,SROCK   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,MIROCK  ,EMPTY   ,EMPTY   ,HROCK
		.byte 	HROCK   ,HROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,DIRT    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,RROCK   ,RROCK   ,CRYSTAL ,CRYSTAL
		;Row 9
		.byte 	PBOMB3  ,SROCK   ,SROCK   ,SROCK   ,SROCK   ,SROCK
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,PBOMB3  ,HROCK   ,HROCK
		.byte 	HROCK   ,HROCK   ,HROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,MIROCK  ,MIROCK  ,DIRT    ,MIROCK  ,MIROCK
		.byte 	PBOMB3  ,EMPTY   ,EMPTY   ,RROCK   ,RROCK   ,MRROCK
		;Row 10
		.byte 	SROCK   ,SROCK   ,SROCK   ,CRYSTAL ,SROCK   ,SROCK
		.byte 	SROCK   ,EMPTY   ,EMPTY   ,HROCK   ,HROCK   ,HROCK
		.byte 	CRYSTAL ,HROCK   ,HROCK   ,HROCK   ,EMPTY   ,MONEY
		.byte 	MIROCK  ,MIROCK  ,HMUD    ,PBOMB10 ,HMUD    ,MIROCK
		.byte 	MIROCK  ,CRYSTAL ,EMPTY   ,EMPTY   ,RROCK   ,RROCK
		;Row 11
		.byte 	SROCK   ,SROCK   ,CRYSTAL ,CRYSTAL ,CRYSTAL ,SROCK
		.byte 	SROCK   ,SROCK   ,HROCK   ,HROCK   ,HROCK   ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,HROCK   ,HROCK   ,HROCK   ,MIROCK
		.byte 	MIROCK  ,MIROCK  ,HMUD    ,HMUD    ,HMUD    ,MIROCK
		.byte 	MIROCK  ,EPROOF  ,MIROCK  ,PBOMB10 ,RROCK   ,RROCK
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0    		;Object #, X, Y.
                .byte      MONEY,5,11
		.byte 	EBNUM,5,5
		.byte 	EBRANGE,6,13
		.byte 	MONEY,7,4
		.byte 	EPROOF,14,11
		.byte 	RPROOF,17,13
		.byte 	CPROOF,18,10
		.byte 	EBRANGE,19,3
		.byte 	PBOMB10,21,4
		.byte 	FTIMER,29,13
		.byte 	RPROOF,30,8
		.byte 	EXTRA,18,8
		.byte 	EPROOF,23,12
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
                .byte 	IR_MON,9,8,LEFT
		.byte 	HR_MON,5,7,RIGHT + CCW
 		.byte 	MUD_MON,16,10,LEFT
		.byte 	MUD_MON,19,5,LEFT
		.byte 	SR_MON,21,3,RIGHT 
		.byte 	LAVA_MON,27,3,LEFT
		.byte 	LAVA_MON,28,12,LEFT
		.byte 	SR_MON,21,3,RIGHT + CCW
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL04.LEV").
level13:
		;Difficulty level 1.
		.word  	300		;Time to complete.
		.byte 	17		;Gem quota.
		.byte 	1,8,RIGHT	;Robot start X,Y & direction.
		.byte 	6,7		;Exit square position.

		;Difficulty level 2.
		.word  	170     	;Time to complete.
		.byte 	19		;Gem quota.
		.byte 	19,4,RIGHT	;Robot start X,Y & direction.
		.byte 	28,5		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	EMPTY   ,MIROCK  ,EMPTY   ,EROCK   ,EMPTY   ,CRYSTAL
		.byte 	EMPTY   ,MRROCK  ,EMPTY   ,CRYSTAL ,EMPTY   ,SROCK
		.byte 	EMPTY   ,CRYSTAL ,EMPTY   ,EROCK   ,EMPTY   ,MIROCK
		.byte 	EMPTY   ,MRROCK  ,EMPTY   ,EROCK   ,EMPTY   ,CRYSTAL
		.byte 	EMPTY   ,HROCK   ,EMPTY   ,CRYSTAL ,EMPTY   ,EMPTY
		;Row 2
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		;Row 3
		.byte 	EMPTY   ,HROCK   ,EMPTY   ,MIROCK  ,EMPTY   ,EROCK
		.byte 	EMPTY   ,MIROCK  ,EMPTY   ,HROCK   ,EMPTY   ,CRYSTAL
		.byte 	EMPTY   ,MIROCK  ,EMPTY   ,CRYSTAL ,EMPTY   ,HROCK
		.byte 	EMPTY   ,CRYSTAL ,EMPTY   ,EROCK   ,EMPTY   ,HROCK
		.byte 	EMPTY   ,MIROCK  ,EMPTY   ,MRROCK  ,EMPTY   ,EMPTY
		;Row 4
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		;Row 5
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,CRYSTAL ,EMPTY   ,MRROCK
		.byte 	EMPTY   ,CRYSTAL ,EMPTY   ,MIROCK  ,EMPTY   ,SROCK
		.byte 	EMPTY   ,EROCK   ,EMPTY   ,MRROCK  ,EMPTY   ,MIROCK
		.byte 	EMPTY   ,EROCK   ,EMPTY   ,MIROCK  ,EMPTY   ,CRYSTAL
		.byte 	EMPTY   ,EROCK   ,EMPTY   ,MIROCK  ,EMPTY   ,EMPTY
		;Row 6
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		;Row 7
		.byte 	EMPTY   ,EROCK   ,EMPTY   ,HROCK   ,EMPTY   ,SROCK
		.byte 	EMPTY   ,CRYSTAL ,EMPTY   ,CRYSTAL ,EMPTY   ,MRROCK
		.byte 	EMPTY   ,HROCK   ,EMPTY   ,MIROCK  ,EMPTY   ,CRYSTAL
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,MRROCK  ,EMPTY   ,CRYSTAL
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,HROCK   ,EMPTY   ,EMPTY
		;Row 8
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		;Row 9
		.byte 	EMPTY   ,MRROCK  ,EMPTY   ,SROCK   ,EMPTY   ,CRYSTAL
		.byte 	EMPTY   ,HROCK   ,EMPTY   ,CRYSTAL ,EMPTY   ,HROCK
		.byte 	EMPTY   ,CRYSTAL ,EMPTY   ,SROCK   ,EMPTY   ,SROCK
		.byte 	EMPTY   ,EROCK   ,EMPTY   ,MIROCK  ,EMPTY   ,EROCK
		.byte 	EMPTY   ,CRYSTAL ,EMPTY   ,SROCK   ,EMPTY   ,EMPTY
		;Row 10
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,PBOMB3
		;Row 11
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	FROBOT  ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	FROBOT  ,EMPTY   ,EMPTY   ,EMPTY   ,PBOMB3  ,PBOMB3
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0      		;Object #, X, Y.
		.byte 	EBNUM,4,11
		.byte 	RPROOF,12,3
		.byte 	MONEY,12,9
		.byte 	EBRANGE,18,5
		.byte 	MONEY,22,9
		.byte 	CPROOF,28,5
		.byte 	PBOMB3,28,11
		.byte 	PBOMB3,26,9
		.byte 	PBOMB10,20,3
		.byte 	FTIMER,2,11
		.byte 	PBOMB10,2,7
		.byte 	PBOMB3,6,9
		.byte 	EPROOF,6,5
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	MUD_MON,5,3,LEFT
		.byte 	LAVA_MON,11,5,LEFT
		.byte 	MUD_MON,17,4,LEFT + CCW
		.byte 	MUD_MON,7,10,RIGHT + CCW
		.byte 	GAS_MON,30,3,LEFT
		.byte 	IR_MON,30,7,LEFT
		.byte 	SR_MON,9,8,RIGHT + CCW
		.byte 	NEWLIST
		.byte 	MUD_MON,5,3,LEFT
		.byte 	LAVA_MON,11,5,LEFT
		.byte 	MUD_MON,17,4,LEFT + CCW
		.byte 	LAVA_MON,7,10,RIGHT + CCW
		.byte 	GAS_MON,30,3,LEFT
		.byte 	RR_MON,30,7,LEFT
		.byte 	RR_MON,9,8,RIGHT + CCW
    		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL07.LEV").
level14:
		;Difficulty level 1.
		.word  	400		;Time to complete.
		.byte 	24		;Gem quota.
		.byte 	2,5,RIGHT	;Robot start X,Y & direction.
		.byte 	11,12		;Exit square position.

		;Difficulty level 2.
		.word  	300		;Time to complete.
		.byte 	40		;Gem quota.
		.byte 	5,8,RIGHT	;Robot start X,Y & direction.
		.byte 	23,6		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	LAVA    ,LAVA    ,MUD     ,MUD     ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,HROCK   ,EMPTY   ,MIROCK  ,HDIRT   ,EMPTY
		.byte 	EROCK   ,EMPTY   ,DIRT    ,EMPTY   ,DIRT    ,EMPTY
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,MONEY
		.byte 	EMPTY   ,PBOMB3  ,EMPTY   ,MUD     ,MUD     ,MUD
		;Row 2
		.byte 	LAVA    ,MUD     ,DIRT    ,EMPTY   ,HDIRT   ,SROCK
		.byte 	EMPTY   ,PBOMB10 ,EMPTY   ,HDIRT   ,HDIRT   ,EMPTY
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HDIRT
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	SROCK   ,SROCK   ,SROCK   ,EMPTY   ,EMPTY   ,MUD
		;Row 3
		.byte 	EMPTY   ,EMPTY   ,HROCK   ,EMPTY   ,EMPTY   ,HDIRT
		.byte 	EMPTY   ,HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EROCK   ,HDIRT   ,EMPTY   ,EMPTY
		.byte 	EROCK   ,EMPTY   ,EROCK   ,EMPTY   ,EROCK   ,EMPTY
		.byte 	DIRT    ,DIRT    ,DIRT    ,PBOMB3  ,EMPTY   ,SROCK
		;Row 4
		.byte 	EMPTY   ,DIRT    ,HROCK   ,DIRT    ,HDIRT   ,DIRT
		.byte 	EMPTY   ,EMPTY   ,RROCK   ,IROCK   ,RROCK   ,IROCK
		.byte 	RROCK   ,IROCK   ,RROCK   ,IROCK   ,RROCK   ,IROCK
		.byte 	RROCK   ,IROCK   ,RROCK   ,IROCK   ,RROCK   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT    ,DIRT
		;Row 5
		.byte 	MRROCK  ,DIRT    ,PBOMB10 ,DIRT    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,RROCK   ,IROCK   ,MIROCK
		.byte 	IROCK   ,HROCK   ,IROCK   ,HROCK   ,IROCK   ,HROCK
		.byte 	IROCK   ,HROCK   ,IROCK   ,RROCK   ,IROCK   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,MIROCK  ,EMPTY   ,PBOMB3
		;Row 6
		.byte 	MONEY   ,EMPTY   ,MRROCK  ,EMPTY   ,EMPTY   ,IROCK
		.byte 	RROCK   ,IROCK   ,RROCK   ,IROCK   ,HDIRT   ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,DIRT    ,HDIRT   ,IROCK   ,RROCK   ,IROCK
		.byte 	RROCK   ,IROCK   ,EROCK   ,DIRT    ,DIRT    ,DIRT
		;Row 7
		.byte 	DIRT    ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,RROCK
		.byte 	IROCK   ,RROCK   ,IROCK   ,RROCK   ,HDIRT   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,HDIRT   ,RROCK   ,IROCK   ,RROCK
		.byte 	IROCK   ,EROCK   ,IROCK   ,MIROCK  ,MIROCK  ,DIRT
		;Row 8
		.byte 	EMPTY   ,HROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	RROCK   ,HDIRT   ,DIRT    ,DIRT    ,HDIRT   ,IROCK
		.byte 	HROCK   ,HROCK   ,HROCK   ,CRYSTAL ,SROCK   ,SROCK
		.byte 	SROCK   ,IROCK   ,HDIRT   ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,DIRT    ,EROCK   ,IROCK   ,EROCK   ,CPROOF
		;Row 9
		.byte 	EMPTY   ,RROCK   ,IROCK   ,RROCK   ,IROCK   ,RROCK
		.byte 	IROCK   ,HDIRT   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,MRROCK
		.byte 	MIROCK  ,EROCK   ,IROCK   ,RROCK   ,EROCK   ,MRROCK
		;Row 10
		.byte 	EMPTY   ,IROCK   ,RROCK   ,IROCK   ,RROCK   ,IROCK
		.byte 	RROCK   ,HDIRT   ,IROCK   ,MONEY   ,EMPTY   ,IROCK
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,IROCK   ,MONEY   ,EMPTY   ,IROCK   ,DIRT
		.byte 	DIRT    ,DIRT    ,EROCK   ,IROCK   ,PBOMB10 ,IROCK
		;Row 11
		.byte 	RROCK   ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,HDIRT   ,IROCK   ,CRYSTAL ,CRYSTAL ,EROCK
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,EROCK   ,EMPTY   ,EMPTY   ,EROCK   ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,EROCK   ,MONEY   ,SROCK
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0     		;Object #, X, Y.
		.byte 	EPROOF,10,9
		.byte 	PBOMB10,13,4
		.byte 	PBOMB10,13,6
		.byte 	PBOMB10,14,7
		.byte 	FTIMER,16,7
		.byte 	EBNUM,18,7
		.byte 	EPROOF,20,7
		.byte 	LPROOF,21,6
		.byte 	MONEY,25,10
		.byte 	EBRANGE,26,4
		.byte 	PBOMB10,27,8
		.byte 	MONEY,30,3
		.byte 	RPROOF,30,9
		.byte 	CPROOF,3,7
		.byte 	EXTRA,11,6
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	LAVA_MON,5,7,RIGHT + CCW
		.byte 	HR_MON,12,3,RIGHT
		.byte 	SR_MON,22,5,LEFT + CCW   
		.byte 	MUD_MON,26,7,LEFT 
		.byte 	IR_MON,11,12,RIGHT + CCW
		.byte 	HR_MON,22,12,RIGHT
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL08.LEV").
level15:
		;Difficulty level 1.
		.word  	450		;Time to complete.
		.byte 	24		;Gem quota.
		.byte 	8,7,RIGHT	;Robot start X,Y & direction.
		.byte 	9,12		;Exit square position.

		;Difficulty level 2.
		.word  	285		;Time to complete.
		.byte 	47		;Gem quota.
		.byte 	1,9,RIGHT	;Robot start X,Y & direction.
		.byte 	30,3		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	EMPTY   ,EMPTY   ,LAVA    ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,LAVA    ,EMPTY   ,HDIRT   ,EMPTY   ,EMPTY
		.byte 	DIRT    ,MUD     ,LAVA    ,MUD     ,LAVA    ,EMPTY
		.byte 	DIRT    ,EMPTY   ,LAVA    ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,LAVA    ,EMPTY
		;Row 2
		.byte 	DIRT    ,DIRT    ,MUD     ,EROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,MUD     ,EMPTY   ,HDIRT   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HMUD
		.byte 	LAVA    ,HMUD    ,MUD     ,SROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 3
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,EMPTY
		.byte 	MIROCK  ,HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,SROCK   ,EMPTY   ,HMUD
		.byte 	EROCK   ,IROCK   ,MRROCK  ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,HDIRT   ,EMPTY   ,EMPTY   ,LAVA
		;Row 4
		.byte 	LAVA    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HROCK
		.byte 	SROCK   ,EMPTY   ,PBOMB3  ,EMPTY   ,EMPTY   ,MIROCK
		.byte 	DIRT    ,HROCK   ,EMPTY   ,DIRT    ,EMPTY   ,HMUD
		.byte 	IROCK   ,RROCK   ,MRROCK  ,RROCK   ,IROCK   ,MONEY
		.byte 	HDIRT   ,DIRT    ,HROCK   ,MIROCK  ,EMPTY   ,EMPTY
		;Row 5
		.byte 	HDIRT   ,IROCK   ,IROCK   ,SROCK   ,MRROCK  ,HROCK
		.byte 	HDIRT   ,EMPTY   ,HDIRT   ,HDIRT   ,EMPTY   ,DIRT
		.byte 	DIRT    ,DIRT    ,EMPTY   ,DIRT    ,EMPTY   ,EMPTY
		.byte 	IROCK   ,RROCK   ,MRROCK  ,RROCK   ,IROCK   ,HDIRT
		.byte 	PBOMB3  ,HDIRT   ,MUD     ,PBOMB3  ,EMPTY   ,HDIRT
		;Row 6
		.byte 	EMPTY   ,DIRT    ,DIRT    ,DIRT    ,HROCK   ,HDIRT
		.byte 	HDIRT   ,PBOMB3  ,HDIRT   ,EMPTY   ,EMPTY   ,DIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,RROCK   ,MRROCK  ,RROCK   ,IROCK   ,EMPTY
		.byte 	EMPTY   ,DIRT    ,HDIRT   ,HDIRT   ,EMPTY   ,EBNUM
		;Row 7
		.byte 	EMPTY   ,IROCK   ,MIROCK  ,DIRT    ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,RROCK   ,IROCK   ,SROCK   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HDIRT   ,CRYSTAL
		;Row 8
		.byte 	HDIRT   ,IROCK   ,DIRT    ,EMPTY   ,EMPTY   ,IROCK
		.byte 	CRYSTAL ,EMPTY   ,EMPTY   ,MIROCK  ,EMPTY   ,EMPTY
		.byte 	CRYSTAL ,IROCK   ,EMPTY   ,EMPTY   ,MIROCK  ,IROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,SROCK   ,DIRT
		.byte 	MIROCK  ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		;Row 9
		.byte 	SROCK   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	CRYSTAL ,IROCK   ,DIRT    ,IROCK   ,EMPTY   ,CRYSTAL
		.byte 	CRYSTAL ,IROCK   ,EMPTY   ,SROCK   ,SROCK   ,IROCK
		.byte 	PBOMB10 ,MONEY   ,PBOMB10 ,IROCK   ,MIROCK  ,DIRT
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,MONEY   ,PBOMB10 ,PBOMB10
		;Row 10
		.byte 	SROCK   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	CRYSTAL ,EMPTY   ,CRYSTAL ,IROCK   ,CRYSTAL ,RROCK
		.byte 	IROCK   ,IROCK   ,DIRT    ,HROCK   ,DIRT    ,IROCK
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,IROCK   ,HDIRT   ,HDIRT
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,CRYSTAL ,CRYSTAL ,CRYSTAL
		;Row 11
		.byte 	HDIRT   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EROCK
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,IROCK   ,CRYSTAL ,EMPTY
		.byte 	EMPTY   ,EROCK   ,EMPTY   ,HDIRT   ,EMPTY   ,SROCK
		.byte 	EROCK   ,CRYSTAL ,CRYSTAL ,IROCK   ,HDIRT   ,HDIRT
		.byte 	IROCK   ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0         		;Object #, X, Y.
		.byte 	PBOMB10,1,13
		.byte 	EBRANGE,6,7
		.byte 	PBOMB10,7,3
		.byte 	RPROOF,10,7
		.byte 	EPROOF,13,7
		.byte 	MONEY,16,6
		.byte 	EPROOF,16,7
		.byte 	CPROOF,23,13
		.byte 	FTIMER,29,3
		.byte 	LPROOF,8,5
		.byte 	CPROOF,12,3
		.byte 	LPROOF,29,9
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	LAVA_MON,3,6,RIGHT
		.byte 	IR_MON,5,10,LEFT + CCW
		.byte 	HR_MON,15,8,RIGHT
		.byte 	HR_MON,28,9,RIGHT + CCW
		.byte 	LAVA_MON,27,12,LEFT
		.byte 	MUD_MON,15,11,LEFT + CCW
		.byte 	NEWLIST
		.byte 	LAVA_MON,3,6,RIGHT
		.byte 	LAVA_MON,1,3,LEFT + CCW
		.byte 	RR_MON,5,10,LEFT + CCW
		.byte 	HR_MON,15,8,RIGHT
		.byte 	HR_MON,28,9,RIGHT + CCW
		.byte 	SR_MON,12,10,LEFT
		.byte 	SR_MON,11,4,LEFT
		.byte 	LAVA_MON,27,12,LEFT
		.byte 	MUD_MON,15,11,LEFT + CCW
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL05.LEV").
level16:
		;Difficulty level 1.
		.word  	400      	;Time to complete.
		.byte 	30		;Gem quota.
		.byte 	3,6,RIGHT	;Robot start X,Y & direction.
		.byte 	28,3		;Exit square position.

		;Difficulty level 2.
		.word  	300		;Time to complete.
		.byte 	40		;Gem quota.
		.byte 	1,10,RIGHT	;Robot start X,Y & direction.
		.byte 	29,13		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	MUD     ,MUD     ,MUD     ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,PBOMB3  ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,MIROCK  ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,SROCK   ,EMPTY   ,EMPTY   ,SROCK
		.byte 	EMPTY   ,MUD     ,MUD     ,MUD     ,MUD     ,MUD
		;Row 2
		.byte 	MUD     ,MUD     ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT
		.byte 	EMPTY   ,DIRT    ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,HMUD    ,HMUD    ,HMUD    ,EMPTY   ,EMPTY
		.byte 	HDIRT   ,PBOMB3  ,HDIRT   ,HDIRT   ,EMPTY   ,HDIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,MUD     ,MUD
		;Row 3
		.byte 	MUD     ,EMPTY   ,DIRT    ,EMPTY   ,DIRT    ,DIRT
		.byte 	DIRT    ,PBOMB3  ,EMPTY   ,DIRT    ,EMPTY   ,EMPTY
		.byte 	LAVA    ,HROCK   ,HMUD    ,HROCK   ,LAVA    ,EMPTY
		.byte 	EMPTY   ,HDIRT   ,HDIRT   ,EMPTY   ,SROCK   ,EMPTY
		.byte 	EMPTY   ,HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,MUD
		;Row 4
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT    ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,EMPTY   ,EMPTY   ,LAVA
		.byte 	MIROCK  ,MIROCK  ,EMPTY   ,MIROCK  ,MIROCK  ,LAVA
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HDIRT   ,HDIRT
		.byte 	EMPTY   ,SROCK   ,HDIRT   ,EMPTY   ,EMPTY   ,MUD
		;Row 5
		.byte 	MRROCK  ,MRROCK  ,MRROCK  ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,LAVA    ,HROCK
		.byte 	MIROCK  ,HMUD    ,EMPTY   ,HMUD    ,MIROCK  ,HROCK
		.byte 	EROCK   ,EROCK   ,EROCK   ,SROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,PBOMB3  ,EMPTY   ,SROCK   ,EMPTY   ,EMPTY
		;Row 6
		.byte 	LAVA    ,LAVA    ,LAVA    ,LAVA    ,DIRT    ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EROCK   ,EROCK   ,MIROCK  ,MIROCK
		.byte 	MIROCK  ,EMPTY   ,EMPTY   ,EMPTY   ,MIROCK  ,MIROCK
		.byte 	MIROCK  ,SROCK   ,SROCK   ,PBOMB10 ,EROCK   ,EMPTY
		.byte 	HDIRT   ,HDIRT   ,EMPTY   ,HDIRT   ,EMPTY   ,SROCK
		;Row 7
		.byte 	EMPTY   ,PBOMB1  ,LAVA    ,EROCK   ,LAVA    ,SROCK
		.byte 	PBOMB10 ,EROCK   ,SROCK   ,MIROCK  ,MIROCK  ,LAVA
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,LAVA
		.byte 	MIROCK  ,MIROCK  ,MIROCK  ,HROCK   ,HROCK   ,EROCK
		.byte 	PBOMB3  ,HDIRT   ,HDIRT   ,EMPTY   ,EMPTY   ,HDIRT
		;Row 8
		.byte 	EMPTY   ,MONEY   ,LAVA    ,EROCK   ,EROCK   ,SROCK
		.byte 	HROCK   ,HROCK   ,MIROCK  ,MIROCK  ,HMUD    ,MONEY
		.byte 	EMPTY   ,PBOMB10 ,EMPTY   ,PBOMB10 ,EMPTY   ,MONEY
		.byte 	HMUD    ,HMUD    ,MIROCK  ,MIROCK  ,MIROCK  ,MIROCK
		.byte 	HROCK   ,HROCK   ,EROCK   ,MONEY   ,EMPTY   ,PBOMB3
		;Row 9
		.byte 	EMPTY   ,LAVA    ,EROCK   ,HROCK   ,MIROCK  ,MIROCK
		.byte 	MIROCK  ,MIROCK  ,LAVA    ,HMUD    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,EXTRA
		.byte 	EMPTY   ,EMPTY   ,HMUD    ,HMUD    ,LAVA    ,MIROCK
		.byte 	MIROCK  ,MONEY   ,HROCK   ,HROCK   ,EROCK   ,MONEY
		;Row 10
		.byte 	EMPTY   ,HROCK   ,HROCK   ,HROCK   ,MIROCK  ,LAVA
		.byte 	LAVA    ,HMUD    ,MONEY   ,MONEY   ,EMPTY   ,MONEY
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	LPROOF  ,EMPTY   ,MONEY   ,MONEY   ,HMUD    ,LAVA
		.byte 	MIROCK  ,SROCK   ,SROCK   ,SROCK   ,SROCK   ,EROCK
		;Row 11
		.byte 	HROCK   ,HROCK   ,HROCK   ,HROCK   ,MIROCK  ,HROCK
		.byte 	HROCK   ,HROCK   ,HROCK   ,HROCK   ,EROCK   ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,HROCK   ,HROCK   ,HROCK   ,HROCK   ,HROCK
		.byte 	HROCK   ,MIROCK  ,HROCK   ,HROCK   ,HROCK   ,HROCK
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0    		;Object #, X, Y.
		.byte 	RPROOF,3,3
		.byte 	EBNUM,5,5
		.byte 	LPROOF,5,7
		.byte 	EBRANGE,24,4
		.byte 	CPROOF,30,9
		.byte 	EPROOF,8,10
		.byte 	EPROOF,22,9
		.byte 	EPROOF,19,13
		.byte 	NEWLIST
		.byte 	RPROOF,5,5
		.byte 	EBNUM,3,3
		.byte 	LPROOF,8,10
		.byte 	EBRANGE,24,4
		.byte 	CPROOF,30,9
		.byte 	EPROOF,5,7
		.byte 	EPROOF,22,9
		.byte 	EPROOF,19,13
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	LAVA_MON,9,3,RIGHT + CCW
		.byte 	LAVA_MON,8,6,LEFT 
		.byte 	LAVA_MON,13,10,RIGHT
		.byte 	HR_MON,29,10,LEFT + CCW
		.byte 	HR_MON,22,12,RIGHT
		.byte 	MUD_MON,30,3,LEFT + CCW
		.byte 	SR_MON,7,7,LEFT
		.byte 	SR_MON,28,4,LEFT + CCW
		.byte 	CONTLIST
		.byte 	MUD_MON,1,3,RIGHT

		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL58.LEV").
level17:
		;Difficulty level 1.
		.word  	210		;Time to complete.
		.byte 	14		;Gem quota.
		.byte 	1,3,DOWN	;Robot start X,Y & direction.
		.byte 	30,9		;Exit square position.

		;Difficulty level 2.
		.word  	120		;Time to complete.
		.byte 	17		;Gem quota.
		.byte 	1,3,RIGHT	;Robot start X,Y & direction.
		.byte 	30,9		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,HDIRT   ,DIRT    ,DIRT    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HDIRT
		.byte 	HMUD    ,HMUD    ,HMUD    ,PBOMB3  ,MRROCK  ,EMPTY
		;Row 2
		.byte 	EMPTY   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,HDIRT   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,EMPTY
		;Row 3
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,DIRT    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,CRYSTAL ,CRYSTAL ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 4
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,IROCK   ,IROCK
		.byte 	EROCK   ,IROCK   ,IROCK   ,IROCK   ,RROCK   ,RROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		;Row 5
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	DIRT    ,EROCK   ,EMPTY   ,PBOMB3  ,CRYSTAL ,CRYSTAL
		.byte 	HDIRT   ,IROCK   ,EMPTY   ,CRYSTAL ,CRYSTAL ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HROCK   ,EMPTY   ,HMUD
		.byte 	HMUD    ,HDIRT   ,HMUD    ,EMPTY   ,EMPTY   ,IROCK
		;Row 6
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,RROCK   ,EMPTY   ,IROCK
		.byte 	IROCK   ,EROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	MIROCK  ,IROCK   ,EMPTY   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		;Row 7
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,HDIRT   ,EROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,DIRT    ,DIRT    ,HDIRT
		;Row 8
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	EROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,HDIRT   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		;Row 9
		.byte 	DIRT    ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HMUD
		.byte 	HMUD    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,CRYSTAL ,MIROCK  ,EMPTY   ,EMPTY   ,EMPTY
		;Row 10
		.byte 	DIRT    ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,MIROCK  ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,EROCK   ,IROCK   ,IROCK   ,EMPTY
		;Row 11
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,BOMB    ,HDIRT   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,CRYSTAL ,CRYSTAL ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,HDIRT   ,EMPTY   ,EMPTY   ,EMPTY
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	PBOMB3,1,11
		.byte 	PBOMB10,10,3
		.byte 	EPROOF,11,6
		.byte 	PBOMB3,13,7
		.byte 	RPROOF,29,3
		.byte 	NEWLIST
		.byte 	PBOMB10,1,11
		.byte 	PBOMB3,10,3
		.byte 	EPROOF,12,6
		.byte 	PBOMB3,13,7
		.byte 	RPROOF,29,3

		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	SR_MON,21,3,LEFT
		.byte 	HR_MON,5,5,RIGHT
		.byte 	HR_MON,18,9,LEFT
		.byte 	SR_MON,19,13,RIGHT
		.byte 	CONTLIST
		.byte 	SR_MON,22,5,DOWN

		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL01.LEV").
level18:
		;Difficulty level 1.
		.word      350		;Time to complete.
		.byte 	35		;Gem quota.
		.byte 	1,8,RIGHT	;Robot start X,Y & direction.
		.byte 	11,7		;Exit square position.

		;Difficulty level 2.
		.word  	300		;Time to complete.
		.byte 	50		;Gem quota.
		.byte 	15,7,RIGHT	;Robot start X,Y & direction.
		.byte 	30,3		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	HMUD    ,LAVA    ,SROCK   ,SROCK   ,DIRT    ,DIRT
		.byte 	CRYSTAL ,EMPTY   ,PBOMB3  ,SROCK   ,CRYSTAL ,MONEY
		.byte 	IROCK   ,MUD     ,MUD     ,PBOMB3  ,RROCK   ,RROCK
		.byte 	RROCK   ,EMPTY   ,HROCK   ,CRYSTAL ,HDIRT   ,IROCK
		.byte 	HROCK   ,HROCK   ,HROCK   ,HMUD    ,HMUD    ,HMUD
		;Row 2
		.byte 	HMUD    ,HMUD    ,HROCK   ,CRYSTAL ,DIRT    ,DIRT
		.byte 	DIRT    ,EMPTY   ,HDIRT   ,SROCK   ,HDIRT   ,SROCK
		.byte 	IROCK   ,MUD     ,EMPTY   ,EMPTY   ,SROCK   ,HROCK
		.byte 	SROCK   ,EMPTY   ,HDIRT   ,SROCK   ,HMUD    ,IROCK
		.byte 	HMUD    ,HMUD    ,HMUD    ,MONEY   ,MONEY   ,MONEY
		;Row 3
		.byte 	HMUD    ,EMPTY   ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	PBOMB3  ,EMPTY   ,HDIRT   ,HDIRT   ,HDIRT   ,CRYSTAL
		.byte 	IROCK   ,MUD     ,EMPTY   ,EMPTY   ,DIRT    ,MONEY
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,HDIRT   ,HMUD    ,IROCK
		.byte 	DIRT    ,DIRT    ,DIRT    ,MONEY   ,CRYSTAL ,EMPTY
		;Row 4
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,CRYSTAL ,HROCK   ,SROCK
		.byte 	MIROCK  ,EMPTY   ,MIROCK  ,EMPTY   ,DIRT    ,DIRT
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,IROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HROCK   ,IROCK
		.byte 	DIRT    ,HROCK   ,HROCK   ,HROCK   ,IROCK   ,IROCK
		;Row 5
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,DIRT    ,DIRT    ,CRYSTAL
		.byte 	DIRT    ,EMPTY   ,DIRT    ,DIRT    ,EMPTY   ,EMPTY
		.byte 	RROCK   ,EMPTY   ,EMPTY   ,DIRT    ,HROCK   ,EMPTY
		.byte 	DIRT    ,DIRT    ,PBOMB3  ,DIRT    ,CRYSTAL ,IROCK
		.byte 	DIRT    ,HROCK   ,IROCK   ,IROCK   ,PBOMB10 ,EBRANGE
		;Row 6
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	MIROCK  ,EMPTY   ,SROCK   ,CRYSTAL ,DIRT    ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,CRYSTAL ,DIRT    ,DIRT
		.byte 	DIRT    ,HROCK   ,IROCK   ,IROCK   ,RROCK   ,CRYSTAL
		;Row 7
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,MIROCK  ,PBOMB3  ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	RROCK   ,EMPTY   ,DIRT    ,DIRT    ,DIRT    ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,DIRT    ,DIRT    ,SROCK
		.byte 	EROCK   ,HDIRT   ,HDIRT   ,HDIRT   ,CRYSTAL ,CRYSTAL
		;Row 8
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,DIRT    ,IROCK   ,CRYSTAL ,EMPTY   ,EMPTY
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,SROCK   ,EMPTY   ,MIROCK
		.byte 	HDIRT   ,EMPTY   ,SROCK   ,EMPTY   ,SROCK   ,HDIRT
		.byte 	HDIRT   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		;Row 9
		.byte 	EMPTY   ,DIRT    ,IROCK   ,CRYSTAL ,HDIRT   ,SROCK
		.byte 	SROCK   ,DIRT    ,IROCK   ,CRYSTAL ,CRYSTAL ,EMPTY
		.byte 	IROCK   ,EMPTY   ,HDIRT   ,HMUD    ,PBOMB3  ,HMUD
		.byte 	HDIRT   ,CRYSTAL ,HDIRT   ,MONEY   ,DIRT    ,DIRT
		.byte 	DIRT    ,IROCK   ,CRYSTAL ,SROCK   ,PBOMB10 ,MONEY
		;Row 10
		.byte 	RROCK   ,RROCK   ,IROCK   ,CRYSTAL ,HDIRT   ,MONEY
		.byte 	HDIRT   ,DIRT    ,IROCK   ,CRYSTAL ,DIRT    ,EROCK
		.byte 	IROCK   ,CRYSTAL ,HDIRT   ,HMUD    ,EROCK   ,HMUD
		.byte 	HDIRT   ,EROCK   ,HDIRT   ,EMPTY   ,PBOMB3  ,EROCK
		.byte 	HROCK   ,IROCK   ,DIRT    ,CRYSTAL ,CRYSTAL ,HROCK
		;Row 11
		.byte 	MONEY   ,MONEY   ,IROCK   ,CRYSTAL ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,CRYSTAL ,IROCK   ,CRYSTAL ,LAVA    ,LAVA
		.byte 	IROCK   ,CRYSTAL ,HDIRT   ,HMUD    ,HMUD    ,HMUD
		.byte 	HDIRT   ,MONEY   ,EMPTY   ,EROCK   ,EMPTY   ,DIRT
		.byte 	DIRT    ,DIRT    ,HDIRT   ,DIRT    ,CRYSTAL ,HMUD
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0    		;Object #, X, Y.
                .byte      CPROOF,1,12
		.byte 	EBNUM,2,3
                .byte      LPROOF,6,4
                .byte      RPROOF,22,5
                .byte      CPROOF,21,2
                .byte      CPROOF,28,4
		.byte      RPROOF,29,4
		.byte 	EPROOF,16,7
		.byte 	EPROOF,23,3
		.byte 	EPROOF,10,5
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	MUD_MON,8,3,LEFT
		.byte 	MUD_MON,12,7,LEFT + CCW
		.byte 	MUD_MON,15,4,LEFT
		.byte 	GAS_MON,30,10,LEFT
		.byte 	MUD_MON,19,6,RIGHT + CCW
		.byte 	LAVA_MON,23,8,RIGHT
		.byte 	LAVA_MON,30,5,LEFT
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL54.LEV").
level19:
		;Difficulty level 1.
		.word  	202		;Time to complete.
		.byte 	14		;Gem quota.
		.byte 	1,4,RIGHT	;Robot start X,Y & direction.
		.byte 	30,13		;Exit square position.

		;Difficulty level 2.
		.word  	142		;Time to complete.
		.byte 	28		;Gem quota.
		.byte 	1,4,RIGHT	;Robot start X,Y & direction.
		.byte 	4,13		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	MUD     ,MUD     ,MUD     ,MUD     ,RROCK   ,EMPTY
		.byte 	EMPTY   ,FROBOT  ,HDIRT   ,EMPTY   ,CRYSTAL ,CRYSTAL
		.byte 	EMPTY   ,HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,CRYSTAL ,EMPTY   ,EMPTY
		;Row 2
		.byte 	EMPTY   ,RROCK   ,RROCK   ,RROCK   ,DIRT    ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,HDIRT   ,EMPTY   ,CRYSTAL ,CRYSTAL
		.byte 	EMPTY   ,HDIRT   ,EMPTY   ,EMPTY   ,SROCK   ,DIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,DIRT    ,DIRT    ,IROCK   ,DIRT    ,IROCK
		;Row 3
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,HDIRT   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,HDIRT   ,EMPTY   ,EMPTY   ,DIRT    ,DIRT
		.byte 	DIRT    ,SROCK   ,SROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,FROBOT
		;Row 4
		.byte 	HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,SROCK
		.byte 	EMPTY   ,EMPTY   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,DIRT    ,DIRT    ,EMPTY   ,EMPTY   ,DIRT
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT
		;Row 5
		.byte 	CRYSTAL ,HDIRT   ,EMPTY   ,EMPTY   ,SROCK   ,DIRT
		.byte 	EMPTY   ,EMPTY   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,DIRT
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT    ,EMPTY
		;Row 6
		.byte 	SROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,HDIRT   ,EMPTY
		.byte 	EMPTY   ,HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,HDIRT   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	MUD     ,MUD     ,MUD     ,MUD     ,IROCK   ,DIRT
		.byte 	DIRT    ,IROCK   ,IROCK   ,IROCK   ,EMPTY   ,EMPTY
		;Row 7
		.byte 	SROCK   ,SROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,SROCK   ,HDIRT   ,EMPTY   ,IROCK
		.byte 	MUD     ,MUD     ,MUD     ,MUD     ,IROCK   ,DIRT
		.byte 	DIRT    ,IROCK   ,MUD     ,IROCK   ,IROCK   ,EMPTY
		;Row 8
		.byte 	SROCK   ,SROCK   ,SROCK   ,EMPTY   ,EMPTY   ,HDIRT
		.byte 	EMPTY   ,HDIRT   ,SROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,HDIRT   ,EMPTY   ,HDIRT   ,IROCK
		.byte 	MUD     ,MUD     ,MUD     ,MUD     ,SROCK   ,DIRT
		.byte 	DIRT    ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,HDIRT
		;Row 9
		.byte 	DIRT    ,DIRT    ,IROCK   ,EMPTY   ,HDIRT   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,HDIRT   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,DIRT
		;Row 10
		.byte 	DIRT    ,DIRT    ,IROCK   ,IROCK   ,HDIRT   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HDIRT   ,EMPTY   ,EMPTY
		.byte 	HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,CRYSTAL ,CRYSTAL ,HDIRT
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,HDIRT   ,HDIRT   ,DIRT
		;Row 11
		.byte 	EMPTY   ,EBNUM   ,DIRT    ,PBOMB10 ,IROCK   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HDIRT   ,HDIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,CRYSTAL ,HDIRT   ,CRYSTAL
		.byte 	HDIRT   ,CRYSTAL ,HDIRT   ,HDIRT   ,DIRT    ,DIRT
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	MONEY,1,5
		.byte 	MONEY,24,10
		.byte 	NEWLIST
		.byte 	MONEY,5,5
		.byte 	MONEY,24,8
		.byte 	PBOMB3,9,11

		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	SR_MON,10,3,RIGHT
		.byte 	SR_MON,13,3,LEFT + CCW
		.byte 	SR_MON,23,3,SR_MON + CCW
		.byte 	IR_MON,6,13,RIGHT + CCW
		.byte 	IR_MON,20,13,LEFT
		.byte 	NEWLIST
		.byte 	HR_MON,10,3,RIGHT
		.byte 	HR_MON,13,3,LEFT + CCW
		.byte 	SR_MON,27,10,RIGHT
		.byte 	SR_MON,23,3,DOWN + CCW
		.byte 	IR_MON,6,13,RIGHT + CCW
		.byte 	IR_MON,20,13,LEFT
		.byte 	HR_MON,14,8,LEFT + CCW

		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL02.LEV").
level20:
		;Difficulty level 1.
		.word  	325     	;Time to complete.
		.byte 	35		;Gem quota.
		.byte 	1,9,RIGHT	;Robot start X,Y & direction.
		.byte 	30,8		;Exit square position.

		;Difficulty level 2.
		.word  	300		;Time to complete.
		.byte 	60		;Gem quota.
		.byte 	3,8,RIGHT	;Robot start X,Y & direction.
		.byte 	30,3		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	HDIRT   ,CRYSTAL ,MIROCK  ,EMPTY   ,PBOMB3  ,EBNUM
		.byte 	IROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK   ,CRYSTAL
		.byte 	CRYSTAL ,IROCK   ,MUD     ,EMPTY   ,EMPTY   ,MUD
		.byte 	EMPTY   ,MUD     ,EMPTY   ,IROCK   ,LAVA    ,LAVA
		.byte 	EMPTY   ,DIRT    ,PBOMB10 ,MONEY   ,EMPTY   ,LAVA
		;Row 2
		.byte 	HDIRT   ,HDIRT   ,CRYSTAL ,MIROCK  ,DIRT    ,HDIRT
		.byte 	IROCK   ,HDIRT   ,DIRT    ,DIRT    ,RROCK   ,CRYSTAL
		.byte 	CRYSTAL ,IROCK   ,EMPTY   ,EMPTY   ,MUD     ,MIROCK
		.byte 	PBOMB3  ,FTIMER  ,MUD     ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 3
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,CRYSTAL ,MIROCK  ,HDIRT
		.byte 	IROCK   ,HDIRT   ,IROCK   ,DIRT    ,DIRT    ,DIRT
		.byte 	HDIRT   ,HROCK   ,EMPTY   ,HDIRT   ,EMPTY   ,HROCK
		.byte 	CRYSTAL ,EROCK   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 4
		.byte 	HROCK   ,EMPTY   ,DIRT    ,DIRT    ,DIRT    ,EMPTY
		.byte 	MIROCK  ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,HDIRT   ,EMPTY   ,DIRT
		.byte 	MIROCK  ,DIRT    ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,IROCK   ,IROCK   ,HMUD    ,IROCK   ,IROCK
		;Row 5
		.byte 	DIRT    ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,MIROCK  ,MIROCK  ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	DIRT    ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT
		.byte 	DIRT    ,DIRT    ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	CRYSTAL ,CRYSTAL ,EMPTY   ,MRROCK  ,CRYSTAL ,PBOMB10
		;Row 6
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,DIRT    ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	PBOMB3  ,IROCK   ,EMPTY   ,EROCK   ,EMPTY   ,EMPTY
		.byte 	EROCK   ,EMPTY   ,EMPTY   ,MIROCK  ,EMPTY   ,EMPTY
		.byte 	EROCK   ,CRYSTAL ,HDIRT   ,MRROCK  ,CRYSTAL ,CRYSTAL
		;Row 7
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,DIRT    ,DIRT    ,HROCK   ,EMPTY   ,EMPTY
		.byte 	DIRT    ,IROCK   ,EMPTY   ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	DIRT    ,PBOMB3  ,IROCK   ,IROCK   ,DIRT    ,DIRT
		.byte 	HDIRT   ,HDIRT   ,HDIRT   ,DIRT    ,MONEY   ,IROCK
		;Row 8
		.byte 	DIRT    ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,CRYSTAL
		.byte 	IROCK   ,DIRT    ,DIRT    ,DIRT    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,CRYSTAL ,HMUD    ,DIRT    ,MIROCK
		.byte 	CRYSTAL ,EMPTY   ,EMPTY   ,MIROCK  ,EMPTY   ,DIRT
		.byte 	SROCK   ,EMPTY   ,EMPTY   ,CRYSTAL ,HMUD    ,MONEY
		;Row 9
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,MIROCK
		.byte 	IROCK   ,DIRT    ,DIRT    ,DIRT    ,SROCK   ,EMPTY
		.byte 	IROCK   ,IROCK   ,CRYSTAL ,HMUD    ,EMPTY   ,EROCK
		.byte 	CRYSTAL ,DIRT    ,DIRT    ,IROCK   ,EMPTY   ,DIRT
		.byte 	HDIRT   ,DIRT    ,DIRT    ,CRYSTAL ,CRYSTAL ,IROCK
		;Row 10
		.byte 	LAVA    ,EMPTY   ,EMPTY   ,EMPTY   ,CRYSTAL ,MIROCK
		.byte 	IROCK   ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,CRYSTAL
		.byte 	DIRT    ,IROCK   ,HMUD    ,HMUD    ,DIRT    ,RROCK
		.byte 	CRYSTAL ,RROCK   ,HMUD    ,IROCK   ,CRYSTAL ,EMPTY
		.byte 	CRYSTAL ,EMPTY   ,DIRT    ,DIRT    ,DIRT    ,EMPTY
		;Row 11
		.byte 	LAVA    ,LAVA    ,CRYSTAL ,CRYSTAL ,MIROCK  ,MIROCK
		.byte 	IROCK   ,DIRT    ,IROCK   ,DIRT    ,DIRT    ,IROCK
		.byte 	MONEY   ,IROCK   ,HMUD    ,HMUD    ,DIRT    ,RROCK
		.byte 	CRYSTAL ,RROCK   ,HMUD    ,IROCK   ,CRYSTAL ,IROCK
		.byte 	CRYSTAL ,CRYSTAL ,EMPTY   ,EMPTY   ,LAVA    ,LAVA
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0         		;Object #, X, Y.
  		.byte 	PBOMB10,8,13
		.byte 	CPROOF,2,10
		.byte      EPROOF,8,9
		.byte 	MONEY,17,13
		.byte 	MONEY,17,3
		.byte 	EBRANGE,17,12
		.byte 	PBOMB3,18,9
		.byte 	RPROOF,20,3
		.byte 	CPROOF,24,9
		.byte 	LPROOF,24,13
		.byte 	MONEY,29,12
   		.byte 	RPROOF,26,11
		.byte 	RPROOF,10,13
		.byte 	EPROOF,29,13
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	HR_MON,6,8,LEFT + CCW
		.byte 	SR_MON,3,7,RIGHT
		.byte 	IR_MON,13,6,RIGHT
		.byte 	MUD_MON,17,7,RIGHT
		.byte 	LAVA_MON,30,3,RIGHT
		.byte 	LAVA_MON,30,13,LEFT + CCW
		.byte 	NEWLIST
		.byte 	IR_MON,6,8,LEFT + CCW
		.byte 	HR_MON,3,7,RIGHT
		.byte 	IR_MON,13,6,RIGHT
		.byte 	MUD_MON,17,7,RIGHT
		.byte 	LAVA_MON,30,3,RIGHT
		.byte 	LAVA_MON,30,13,LEFT + CCW
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL22.LEV").
level21:
		;Difficulty level 1.
		.word  	300		;Time to complete.
		.byte 	40		;Gem quota.
		.byte 	15,11,RIGHT	;Robot start X,Y & direction.
		.byte 	5,11		;Exit square position.

		;Difficulty level 2.
		.word  	245		;Time to complete.
		.byte 	50		;Gem quota.
		.byte 	15,6,RIGHT	;Robot start X,Y & direction.
		.byte 	1,13		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	SROCK   ,SROCK   ,SROCK   ,SROCK   ,HROCK   ,SROCK
		.byte 	SROCK   ,SROCK   ,HROCK   ,HROCK   ,MRROCK  ,LAVA
		.byte 	MRROCK  ,MIROCK  ,LAVA    ,MIROCK  ,MRROCK  ,LAVA
		.byte 	MRROCK  ,HROCK   ,SROCK   ,SROCK   ,HROCK   ,SROCK
		.byte 	HROCK   ,SROCK   ,SROCK   ,SROCK   ,HROCK   ,SROCK
		;Row 2
		.byte 	SROCK   ,HROCK   ,SROCK   ,SROCK   ,SROCK   ,HROCK
		.byte 	HROCK   ,SROCK   ,SROCK   ,HROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,HROCK   ,HROCK   ,SROCK   ,HROCK   ,SROCK
		.byte 	SROCK   ,SROCK   ,HROCK   ,SROCK   ,SROCK   ,HROCK
		;Row 3
		.byte 	SROCK   ,SROCK   ,HROCK   ,SROCK   ,HROCK   ,SROCK
		.byte 	SROCK   ,HROCK   ,SROCK   ,HROCK   ,HMUD    ,HMUD
		.byte 	HMUD    ,HMUD    ,HMUD    ,HMUD    ,HMUD    ,HMUD
		.byte 	HMUD    ,HROCK   ,HROCK   ,SROCK   ,SROCK   ,SROCK
		.byte 	HROCK   ,SROCK   ,HROCK   ,HROCK   ,HROCK   ,PBOMB10
		;Row 4
		.byte 	PBOMB10 ,SROCK   ,SROCK   ,HROCK   ,HROCK   ,HROCK
		.byte 	HMUD    ,HMUD    ,HMUD    ,HMUD    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,HMUD    ,HROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	HROCK   ,SROCK   ,HROCK   ,EROCK   ,HROCK   ,HROCK
		;Row 5
		.byte 	HMUD    ,HMUD    ,HMUD    ,HMUD    ,HMUD    ,LAVA
		.byte 	EROCK   ,EROCK   ,HMUD    ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,HMUD    ,HMUD    ,HMUD    ,HMUD
		.byte 	EROCK   ,LAVA    ,EROCK   ,HMUD    ,EROCK   ,HROCK
		;Row 6
		.byte 	EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	HMUD    ,HMUD    ,EMPTY   ,EMPTY   ,EMPTY   ,SROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,SROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HMUD    ,EROCK   ,EROCK   ,HMUD    ,EROCK   ,HROCK
		;Row 7
		.byte 	EROCK   ,HMUD    ,HMUD    ,HMUD    ,HMUD    ,HMUD
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,HMUD    ,HMUD    ,MONEY   ,HMUD    ,EROCK
		;Row 8
		.byte 	EROCK   ,HMUD    ,SROCK   ,SROCK   ,SROCK   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,RROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EROCK   ,EMPTY   ,SROCK   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,HROCK   ,HMUD    ,HMUD    ,EROCK
		;Row 9
		.byte 	EROCK   ,EROCK   ,HMUD    ,SROCK   ,HROCK   ,HROCK
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,EROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,MUD     ,HROCK   ,SROCK   ,HROCK
		.byte 	SROCK   ,SROCK   ,HROCK   ,EROCK   ,EROCK   ,EROCK
		;Row 10
		.byte 	HDIRT   ,HMUD    ,EROCK   ,HMUD    ,EROCK   ,MUD
		.byte 	MUD     ,EROCK   ,HMUD    ,HMUD    ,MUD     ,EROCK
		.byte 	DIRT    ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,HROCK
		.byte 	EROCK   ,MUD     ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	MUD     ,MUD     ,EROCK   ,HMUD    ,SROCK   ,HDIRT
		;Row 11
		.byte 	HROCK   ,HROCK   ,HMUD    ,EROCK   ,HMUD    ,EROCK
		.byte 	EROCK   ,HMUD    ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	EMPTY   ,PBOMB10 ,PBOMB10 ,PBOMB10 ,PBOMB10 ,HROCK
		.byte 	EROCK   ,EROCK   ,HMUD    ,HMUD    ,MUD     ,HMUD
		.byte 	EROCK   ,EROCK   ,HMUD    ,SROCK   ,SROCK   ,HROCK
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	EBRANGE,13,3
		.byte 	CPROOF,15,3
		.byte 	MONEY,17,3
		.byte 	FTIMER,30,3
		.byte 	FTIMER,14,3
		.byte 	CPROOF,1,13
		.byte 	FTIMER,30,13
		.byte 	EPROOF,28,9
		.byte 	MONEY,25,5
		.byte 	MONEY,23,6
		.byte 	EBNUM,26,11
		.byte 	EPROOF,3,3
		.byte 	MONEY,3,10
		.byte 	MONEY,8,5
		.byte 	MONEY,5,5
		.byte 	MONEY,2,13
		.byte 	NEWLIST
		.byte 	EBRANGE,17,3
		.byte 	CPROOF,15,3
		.byte 	MONEY,13,3
		.byte 	FTIMER,30,3
		.byte 	FTIMER,1,13
		.byte 	CPROOF,30,13
		.byte 	FTIMER,14,3
		.byte 	EPROOF,28,9
		.byte 	MONEY,25,5
		.byte 	MONEY,23,6
		.byte 	EBNUM,8,5
		.byte 	EPROOF,3,3
		.byte 	MONEY,3,10
		.byte 	MONEY,26,11
		.byte 	MONEY,5,5
		.byte 	MONEY,2,13
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	MUD_MON,12,6,LEFT
		.byte 	LAVA_MON,24,8,LEFT + CCW
 		.byte 	GAS_MON,30,3,LEFT
		.byte 	MUD_MON,19,6,LEFT
		.byte 	HR_MON,22,10,LEFT + CCW
		.byte 	HR_MON,6,10,RIGHT
                .byte      $ff                     ;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL57.LEV").
level22:
		;Difficulty level 1.
		.word  	191		;Time to complete.
		.byte 	18		;Gem quota.
		.byte 	15,7,DOWN 	;Robot start X,Y & direction.
		.byte 	30,7		;Exit square position.

		;Difficulty level 2.
		.word  	120		;Time to complete.
		.byte 	19		;Gem quota.
		.byte 	15,7,DOWN	;Robot start X,Y & direction.
		.byte 	8,3		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	PBOMB3  ,IROCK   ,EMPTY   ,EMPTY   ,EBRANGE ,IROCK
		.byte 	RROCK   ,CRYSTAL ,RROCK   ,RROCK   ,IROCK   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,DIRT    ,DIRT    ,DIRT    ,MONEY   ,IROCK
		.byte 	EMPTY   ,EMPTY   ,MIROCK  ,EMPTY   ,EMPTY   ,PBOMB3
		;Row 2
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,RROCK   ,RROCK   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,HROCK   ,EMPTY   ,MIROCK  ,EMPTY
		.byte 	EMPTY   ,IROCK   ,FROBOT  ,RPROOF  ,IROCK   ,EMPTY
		.byte 	EMPTY   ,CRYSTAL ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 3
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,HDIRT   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,EMPTY   ,DIRT    ,EMPTY   ,IROCK   ,EMPTY
		.byte 	EMPTY   ,MRROCK  ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,CRYSTAL ,IROCK
		;Row 4
		.byte 	CRYSTAL ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,HROCK
		.byte 	HROCK   ,HROCK   ,HROCK   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,CRYSTAL
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,HDIRT   ,IROCK   ,EMPTY
		;Row 5
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,IROCK   ,EMPTY
		.byte 	EMPTY   ,EROCK   ,EMPTY   ,EROCK   ,EMPTY   ,IROCK
		.byte 	IROCK   ,CRYSTAL ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	CRYSTAL ,EMPTY   ,EMPTY   ,HDIRT   ,MIROCK  ,EMPTY
		;Row 6
		.byte 	CRYSTAL ,HROCK   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,HDIRT   ,IROCK   ,EMPTY
		;Row 7
		.byte 	IROCK   ,EMPTY   ,RROCK   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	EMPTY   ,HDIRT   ,HDIRT   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,CRYSTAL ,EMPTY   ,EMPTY   ,IROCK
		;Row 8
		.byte 	EMPTY   ,RROCK   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	CRYSTAL ,IROCK   ,EMPTY   ,EMPTY   ,CRYSTAL ,IROCK
		.byte 	PBOMB3  ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 9
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,CRYSTAL
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,CRYSTAL ,EMPTY   ,EMPTY   ,PBOMB3  ,IROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 10
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,EMPTY   ,CRYSTAL ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,CRYSTAL ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,CRYSTAL ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HDIRT   ,HDIRT   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 11
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,CRYSTAL ,CRYSTAL ,CRYSTAL ,HDIRT   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,LAVA    ,EMPTY   ,EBNUM   ,IROCK
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	PBOMB10,26,12
		.byte 	MONEY,7,7
		.byte 	EXTRA,20,3
		.byte 	NEWLIST
		.byte 	PBOMB10,26,12
		.byte 	MONEY,10,7
		.byte 	EXTRA,27,13

		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	GAS_MON,1,13,UP
		.byte 	HR_MON,3,3,RIGHT
		.byte 	SR_MON,8,13,UP + CCW
		.byte 	HR_MON,15,10,UP
		.byte 	SR_MON,27,3,LEFT + CCW
		.byte 	NEWLIST
		.byte 	GAS_MON,6,13,UP
		.byte 	RR_MON,3,3,RIGHT
		.byte 	HR_MON,8,13,UP + CCW
		.byte 	HR_MON,15,10,UP
		.byte 	SR_MON,27,3,LEFT + CCW

		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL24.LEV").
level23:
		;Difficulty level 1.
		.word  	350		;Time to complete.
		.byte 	40		;Gem quota.
		.byte 	2,13,RIGHT	;Robot start X,Y & direction.
		.byte 	15,6 		;Exit square position.

		;Difficulty level 2.
		.word  	345		;Time to complete.
		.byte 	70		;Gem quota.
		.byte 	1,5,RIGHT	;Robot start X,Y & direction.
		.byte 	8,8 		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	MIROCK  ,PBOMB10 ,EMPTY   ,MRROCK  ,MIROCK  ,MRROCK
		.byte 	MIROCK  ,MRROCK  ,MIROCK  ,EMPTY   ,MIROCK  ,EMPTY
		.byte 	EMPTY   ,IROCK   ,MUD     ,EMPTY   ,EMPTY   ,HROCK
		.byte 	EMPTY   ,EMPTY   ,MUD     ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	MUD     ,EMPTY   ,EMPTY   ,EMPTY   ,MUD     ,MUD
		;Row 2
		.byte 	DIRT    ,EMPTY   ,SROCK   ,MRROCK  ,SROCK   ,MRROCK
		.byte 	SROCK   ,MRROCK  ,SROCK   ,IROCK   ,MIROCK  ,HMUD
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT
		.byte 	DIRT    ,SROCK   ,EMPTY   ,EMPTY   ,HROCK   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HROCK   ,EMPTY   ,EMPTY
		;Row 3
		.byte 	EMPTY   ,IROCK   ,CRYSTAL ,EMPTY   ,CRYSTAL ,EMPTY
		.byte 	CRYSTAL ,EMPTY   ,CRYSTAL ,IROCK   ,MIROCK  ,HMUD
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,HROCK   ,DIRT    ,HROCK
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,HROCK   ,DIRT    ,SROCK
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,DIRT    ,EMPTY   ,EMPTY
		;Row 4
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,MIROCK  ,HMUD
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,DIRT    ,DIRT    ,DIRT
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,DIRT    ,DIRT    ,DIRT
		.byte 	EMPTY   ,HDIRT   ,HROCK   ,HROCK   ,EMPTY   ,EMPTY
		;Row 5
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,MIROCK  ,HMUD
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,SROCK   ,SROCK   ,HROCK
		.byte 	EMPTY   ,EROCK   ,SROCK   ,HROCK   ,EMPTY   ,HROCK
		.byte 	EMPTY   ,HDIRT   ,HROCK   ,DIRT    ,EMPTY   ,HROCK
		;Row 6
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,MIROCK  ,EMPTY   ,MIROCK
		.byte 	EMPTY   ,MIROCK  ,EMPTY   ,IROCK   ,MIROCK  ,HMUD
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,EMPTY   ,DIRT
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,SROCK   ,EMPTY   ,MUD
		;Row 7
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EBRANGE ,IROCK   ,EMPTY   ,IROCK   ,MIROCK  ,HMUD
		.byte 	EMPTY   ,IROCK   ,MIROCK  ,EROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,EROCK   ,EROCK   ,DIRT    ,EMPTY
		.byte 	EMPTY   ,SROCK   ,HROCK   ,DIRT    ,EMPTY   ,EMPTY
		;Row 8
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,MIROCK  ,HMUD
		.byte 	EMPTY   ,IROCK   ,MIROCK  ,HMUD    ,HMUD    ,HMUD
		.byte 	HMUD    ,HMUD    ,HMUD    ,HMUD    ,EROCK   ,HMUD
		.byte 	EMPTY   ,DIRT    ,DIRT    ,EMPTY   ,HROCK   ,EMPTY
		;Row 9
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,SROCK   ,HMUD
		.byte 	SROCK   ,IROCK   ,MIROCK  ,HMUD    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HMUD    ,EROCK   ,HMUD
		.byte 	EMPTY   ,DIRT    ,DIRT    ,EMPTY   ,DIRT    ,EMPTY
		;Row 10
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,IROCK   ,EROCK
		.byte 	HROCK   ,HROCK   ,DIRT    ,EMPTY   ,EROCK   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EROCK   ,HMUD    ,EROCK   ,HMUD
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,MRROCK
		;Row 11
		.byte 	EMPTY   ,PBOMB3  ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	MIROCK  ,MIROCK  ,IROCK   ,SROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	HMUD    ,EMPTY   ,EMPTY   ,EMPTY   ,MUD     ,MUD
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	PBOMB10,30,12
		.byte 	PBOMB3,30,7
		.byte 	PBOMB3,28,4
		.byte 	EPROOF,30,3
		.byte 	EBNUM,12,11
		.byte 	PBOMB3,23,5
		.byte 	PBOMB3,20,5
		.byte 	PBOMB3,18,4
		.byte 	PBOMB3,22,6
		.byte 	PBOMB3,15,9
		.byte 	MONEY,25,3
		.byte 	MONEY,22,5
		.byte 	MONEY,18,5
		.byte 	MONEY,15,3
		.byte      CPROOF,4,8
		.byte 	CONTLIST
		.byte 	EPROOF,8,8
		.byte 	FROBOT,6,8
		.byte 	PBOMB10,15,9
		.byte 	PBOMB10,30,7
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	MUD_MON,21,5,LEFT
		.byte 	LAVA_MON,2,4,RIGHT
		.byte 	MUD_MON,2,4,LEFT + CCW
		.byte 	SR_MON,13,7,DOWN
		.byte 	LAVA_MON,25,8,LEFT
		.byte 	LAVA_MON,29,9,LEFT
		.byte 	MUD_MON,27,13,LEFT
		.byte 	CONTLIST
		.byte 	LAVA_MON,2,4,LEFT + CCW
		.byte 	MUD_MON,2,4,DOWN + CCW
		.byte 	HR_MON,13,7,UP
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL56.LEV").
level24:
		;Difficulty level 1.
		.word  	192		;Time to complete.
		.byte 	15		;Gem quota.
		.byte 	1,13,RIGHT	;Robot start X,Y & direction.
		.byte 	30,3		;Exit square position.

		;Difficulty level 2.
		.word  	110		;Time to complete.
		.byte 	21		;Gem quota.
		.byte 	1,13,LEFT	;Robot start X,Y & direction.
		.byte 	30,3		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	MUD     ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,MIROCK  ,LAVA
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,HMUD    ,HMUD    ,HMUD    ,HMUD
		.byte 	HMUD    ,HMUD    ,HMUD    ,HMUD    ,HMUD    ,EMPTY
		;Row 2
		.byte 	MUD     ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT    ,DIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,HMUD    ,HMUD
		.byte 	EMPTY   ,HMUD    ,HMUD    ,EMPTY   ,HMUD    ,EMPTY
		;Row 3
		.byte 	MUD     ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	HROCK   ,HROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,RROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 4
		.byte 	IROCK   ,IROCK   ,EMPTY   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,HROCK
		.byte 	HROCK   ,HROCK   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,HDIRT   ,EROCK
		.byte 	EMPTY   ,EMPTY   ,RROCK   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 5
		.byte 	HMUD    ,HMUD    ,HMUD    ,HMUD    ,HMUD    ,HMUD
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,HROCK
		.byte 	HROCK   ,HROCK   ,IROCK   ,EMPTY   ,EMPTY   ,HDIRT
		.byte 	DIRT    ,HDIRT   ,EMPTY   ,EMPTY   ,EROCK   ,IROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,RROCK   ,EMPTY   ,EMPTY
		;Row 6
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,HROCK
		.byte 	HROCK   ,HROCK   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HDIRT   ,EMPTY   ,EMPTY   ,EROCK   ,IROCK   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 7
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,PBOMB10 ,EMPTY
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,HROCK
		.byte 	HROCK   ,HROCK   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EROCK   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 8
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,IROCK
		.byte 	HDIRT   ,IROCK   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EROCK   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 9
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,EMPTY   ,LAVA    ,EMPTY   ,EMPTY   ,IROCK
		.byte 	BOMB    ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,HDIRT
		.byte 	EROCK   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 10
		.byte 	IROCK   ,IROCK   ,IROCK   ,EMPTY   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,HDIRT
		.byte 	HDIRT   ,HDIRT   ,IROCK   ,IROCK   ,MIROCK  ,IROCK
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	DIRT    ,EMPTY   ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY
		;Row 11
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HDIRT   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT
		.byte 	EMPTY   ,PBOMB3  ,EMPTY   ,DIRT    ,EMPTY   ,EMPTY
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	CPROOF,19,7
		.byte 	EBNUM,5,4
		.byte 	EBRANGE,26,9
		.byte 	NEWLIST
		.byte 	CPROOF,19,7
		.byte 	EBNUM,5,4
		.byte 	EBRANGE,26,9

		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	SR_MON,1,8,RIGHT
		.byte 	HR_MON,9,6,UP
		.byte 	LAVA_MON,12,5,RIGHT
		.byte 	HR_MON,17,6,DOWN + CCW
		.byte 	HR_MON,30,9,UP + CCW
		.byte 	CONTLIST
		.byte 	SR_MON,11,11,RIGHT
		.byte 	SR_MON,15,11,DOWN
		.byte 	SR_MON,26,12,LEFT
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL25.LEV").
level25:
		;Difficulty level 1.
		.word  	425		;Time to complete.
		.byte 	17		;Gem quota.
		.byte 	3,5,RIGHT	;Robot start X,Y & direction.
		.byte 	25,3		;Exit square position.

		;Difficulty level 2.
		.word  	325		;Time to complete.
		.byte 	19		;Gem quota.
		.byte 	8,7,RIGHT	;Robot start X,Y & direction.
		.byte 	21,11		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	BOMB    ,EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,MIROCK  ,DIRT    ,EROCK   ,EROCK
		.byte 	IROCK   ,EROCK   ,EROCK   ,EROCK   ,IROCK   ,SROCK
		.byte 	RROCK   ,MIROCK  ,IROCK   ,MIROCK  ,EXTRA   ,PBOMB10
		;Row 2
		.byte 	EMPTY   ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,DIRT    ,IROCK   ,EROCK   ,IROCK   ,EROCK
		.byte 	IROCK   ,SROCK   ,RROCK   ,HDIRT   ,IROCK   ,EROCK
		.byte 	IROCK   ,EROCK   ,IROCK   ,CRYSTAL ,IROCK   ,PBOMB10
		;Row 3
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,DIRT    ,IROCK   ,EROCK
		.byte 	IROCK   ,SROCK   ,EROCK   ,EMPTY   ,IROCK   ,EROCK
		.byte 	IROCK   ,EROCK   ,IROCK   ,CRYSTAL ,IROCK   ,CRYSTAL
		;Row 4
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,EROCK   ,DIRT    ,IROCK   ,EROCK
		.byte 	IROCK   ,SROCK   ,RROCK   ,EMPTY   ,RROCK   ,EROCK
		.byte 	IROCK   ,EROCK   ,MIROCK  ,CRYSTAL ,IROCK   ,CRYSTAL
		;Row 5
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,DIRT    ,IROCK   ,EROCK
		.byte 	IROCK   ,SROCK   ,EROCK   ,EMPTY   ,IROCK   ,EROCK
		.byte 	IROCK   ,EROCK   ,IROCK   ,CRYSTAL ,IROCK   ,CRYSTAL
		;Row 6
		.byte 	IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,IROCK   ,EROCK   ,DIRT    ,IROCK   ,EROCK
		.byte 	IROCK   ,EROCK   ,RROCK   ,EMPTY   ,IROCK   ,SROCK
		.byte 	RROCK   ,EROCK   ,IROCK   ,CRYSTAL ,MONEY   ,CRYSTAL
		;Row 7
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,DIRT    ,IROCK   ,EROCK
		.byte 	IROCK   ,SROCK   ,EROCK   ,EMPTY   ,IROCK   ,SROCK
		.byte 	IROCK   ,EROCK   ,IROCK   ,CRYSTAL ,IROCK   ,CRYSTAL
		;Row 8
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	IROCK   ,IROCK   ,EROCK   ,DIRT    ,IROCK   ,EROCK
		.byte 	IROCK   ,SROCK   ,RROCK   ,EMPTY   ,IROCK   ,SROCK
		.byte 	IROCK   ,EROCK   ,IROCK   ,CRYSTAL ,IROCK   ,CRYSTAL
		;Row 9
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,MIROCK  ,IROCK   ,DIRT    ,IROCK   ,EROCK
		.byte 	IROCK   ,SROCK   ,RROCK   ,EMPTY   ,EROCK   ,SROCK
		.byte 	IROCK   ,EROCK   ,IROCK   ,CRYSTAL ,IROCK   ,CRYSTAL
		;Row 10
		.byte 	IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,EROCK   ,DIRT    ,EROCK   ,EROCK
		.byte 	IROCK   ,SROCK   ,RROCK   ,EMPTY   ,IROCK   ,RROCK
		.byte 	IROCK   ,EROCK   ,IROCK   ,CRYSTAL ,IROCK   ,CRYSTAL
		;Row 11
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,DIRT    ,IROCK   ,RROCK
		.byte 	EROCK   ,SROCK   ,HROCK   ,DIRT    ,EMPTY   ,EROCK
		.byte 	IROCK   ,EROCK   ,HROCK   ,CRYSTAL ,IROCK   ,CRYSTAL
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	EBNUM,14,4
		.byte 	MONEY,8,10
		.byte 	MONEY,6,10
		.byte 	MONEY,2,12
		.byte 	FTIMER,13,10
		.byte 	FTIMER,11,10
		.byte 	MONEY,21,4
		.byte 	MONEY,21,8
		.byte 	MONEY,21,12
		.byte 	FTIMER,24,12
		.byte 	MONEY,27,12
		.byte 	EBRANGE,25,3
		.byte 	MONEY,28,3
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	GAS_MON,30,13,LEFT
		.byte 	HR_MON,4,13,LEFT 
		.byte 	LAVA_MON,6,13,UP   
		.byte 	MUD_MON,11,9,LEFT + CCW
		.byte 	MUD_MON,4,13,UP   
		.byte 	SR_MON,1,13,LEFT + CCW
		.byte 	SR_MON,13,11,RIGHT
		.byte 	HR_MON,14,7,LEFT + CCW
		.byte 	CONTLIST
		.byte 	SR_MON,1,9,RIGHT
		.byte 	SR_MON,14,9,LEFT 
		.byte 	SR_MON,5,11,UP + CCW

		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL21.LEV").
level26:
		;Difficulty level 1.
		.word  	350		;Time to complete.
		.byte 	38		;Gem quota.
		.byte 	3,9,RIGHT	;Robot start X,Y & direction.
		.byte 	22,4		;Exit square position.

		;Difficulty level 2.
		.word  	285		;Time to complete.
		.byte 	46		;Gem quota.
		.byte 	1,7,RIGHT	;Robot start X,Y & direction.
		.byte 	11,11		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	LAVA    ,EMPTY   ,EMPTY   ,EMPTY   ,EROCK   ,MRROCK
		.byte 	MRROCK  ,EROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,PBOMB1
		.byte 	SROCK   ,SROCK   ,EROCK   ,IROCK   ,MUD     ,EMPTY
		.byte 	EMPTY   ,PBOMB3  ,SROCK   ,HROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 2
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,MRROCK  ,DIRT
		.byte 	DIRT    ,DIRT    ,EMPTY   ,EMPTY   ,IROCK   ,HROCK
		.byte 	MIROCK  ,SROCK   ,SROCK   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	PBOMB3  ,SROCK   ,SROCK   ,SROCK   ,HROCK   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,LAVA
		;Row 3
		.byte 	SROCK   ,EMPTY   ,SROCK   ,IROCK   ,MIROCK  ,HROCK
		.byte 	HROCK   ,EROCK   ,EMPTY   ,IROCK   ,IROCK   ,SROCK
		.byte 	SROCK   ,SROCK   ,SROCK   ,IROCK   ,EMPTY   ,PBOMB3
		.byte 	HROCK   ,CRYSTAL ,EROCK   ,HROCK   ,SROCK   ,SROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 4
		.byte 	DIRT    ,EMPTY   ,DIRT    ,EMPTY   ,IROCK   ,SROCK
		.byte 	MIROCK  ,IROCK   ,EMPTY   ,IROCK   ,HMUD    ,IROCK
		.byte 	SROCK   ,SROCK   ,IROCK   ,DIRT    ,HROCK   ,SROCK
		.byte 	HROCK   ,SROCK   ,CRYSTAL ,CRYSTAL ,HROCK   ,SROCK
		.byte 	HROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 5
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,MONEY   ,IROCK   ,SROCK
		.byte 	IROCK   ,IROCK   ,LAVA    ,IROCK   ,HMUD    ,IROCK
		.byte 	SROCK   ,SROCK   ,IROCK   ,DIRT    ,HROCK   ,HROCK
		.byte 	CRYSTAL ,HROCK   ,CRYSTAL ,CRYSTAL ,SROCK   ,EROCK
		.byte 	SROCK   ,SROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 6
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,SROCK
		.byte 	IROCK   ,HMUD    ,IROCK   ,HMUD    ,HMUD    ,IROCK
		.byte 	SROCK   ,SROCK   ,IROCK   ,DIRT    ,SROCK   ,CRYSTAL
		.byte 	HROCK   ,SROCK   ,CRYSTAL ,CRYSTAL ,SROCK   ,EROCK
		.byte 	SROCK   ,EROCK   ,HROCK   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 7
		.byte 	PBOMB3  ,EMPTY   ,EMPTY   ,PBOMB1  ,IROCK   ,SROCK
		.byte 	IROCK   ,HMUD    ,HMUD    ,HMUD    ,EMPTY   ,IROCK
		.byte 	SROCK   ,SROCK   ,IROCK   ,DIRT    ,MIROCK  ,SROCK
		.byte 	HROCK   ,SROCK   ,CRYSTAL ,CRYSTAL ,HROCK   ,EROCK
		.byte 	EROCK   ,SROCK   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 8
		.byte 	RROCK   ,MIROCK  ,DIRT    ,IROCK   ,DIRT    ,EROCK
		.byte 	IROCK   ,HMUD    ,HMUD    ,EMPTY   ,EMPTY   ,IROCK
		.byte 	SROCK   ,SROCK   ,IROCK   ,DIRT    ,SROCK   ,MRROCK
		.byte 	CRYSTAL ,HROCK   ,CRYSTAL ,CRYSTAL ,CRYSTAL ,MRROCK
		.byte 	HROCK   ,CRYSTAL ,IROCK   ,EMPTY   ,MIROCK  ,EMPTY
		;Row 9
		.byte 	RROCK   ,MIROCK  ,EMPTY   ,EMPTY   ,EMPTY   ,SROCK
		.byte 	IROCK   ,FTIMER  ,PBOMB10 ,EMPTY   ,EMPTY   ,IROCK
		.byte 	SROCK   ,SROCK   ,IROCK   ,EMPTY   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,MIROCK  ,HDIRT
		;Row 10
		.byte 	RROCK   ,SROCK   ,MRROCK  ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,MONEY   ,MONEY   ,PBOMB10 ,EMPTY   ,IROCK
		.byte 	SROCK   ,SROCK   ,IROCK   ,EMPTY   ,IROCK   ,MIROCK
		.byte 	MRROCK  ,MIROCK  ,MRROCK  ,MIROCK  ,MRROCK  ,MIROCK
		.byte 	MRROCK  ,HROCK   ,HROCK   ,MIROCK  ,IROCK   ,EMPTY
		;Row 11
		.byte 	RROCK   ,RROCK   ,SROCK   ,SROCK   ,SROCK   ,SROCK
		.byte 	SROCK   ,MONEY   ,MONEY   ,FTIMER  ,EMPTY   ,MRROCK
		.byte 	SROCK   ,SROCK   ,EMPTY   ,EMPTY   ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,EMPTY
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0	                ;Object #, X, Y.
		.byte 	MONEY,4,7
		.byte 	MONEY,1,5
		.byte 	MONEY,3,8
		.byte 	PBOMB1,13,3
		.byte 	PBOMB10,20,12
		.byte 	FTIMER,21,12
		.byte 	MONEY,24,12
		.byte 	PBOMB3,22,12
		.byte 	PBOMB3,30,11
		.byte 	EBRANGE,18,12
		.byte 	MONEY,23,12
		.byte 	EBNUM,6,9
		.byte 	EXTRA,18,10
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	LAVA_MON,28,6,LEFT
		.byte 	MUD_MON,2,5,RIGHT
		.byte 	LAVA_MON,24,3,RIGHT
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL26.LEV").
level27:
		;Difficulty level 1.
		.word  	400		;Time to complete.
		.byte 	35		;Gem quota.
		.byte 	1,8,RIGHT	;Robot start X,Y & direction.
		.byte 	30,8		;Exit square position.

		;Difficulty level 2.
		.word  	300		;Time to complete.
		.byte 	44		;Gem quota.
		.byte 	30,5,RIGHT	;Robot start X,Y & direction.
		.byte 	21,7		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	EMPTY   ,SROCK   ,SROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,DIRT    ,SROCK   ,EMPTY   ,EMPTY   ,SROCK
		.byte 	EROCK   ,EMPTY   ,SROCK   ,EMPTY   ,EROCK   ,EMPTY
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	SROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EROCK   ,EMPTY
		;Row 2
		.byte 	EMPTY   ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,SROCK
		.byte 	EMPTY   ,DIRT    ,DIRT    ,EROCK   ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,HDIRT   ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,IROCK   ,MRROCK  ,IROCK   ,DIRT    ,SROCK
		.byte 	DIRT    ,EROCK   ,DIRT    ,DIRT    ,HDIRT   ,EMPTY
		;Row 3
		.byte 	EMPTY   ,EROCK   ,EMPTY   ,IROCK   ,MIROCK  ,DIRT
		.byte 	EMPTY   ,HROCK   ,EMPTY   ,DIRT    ,MRROCK  ,DIRT
		.byte 	EMPTY   ,SROCK   ,DIRT    ,EROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,HROCK   ,IROCK   ,DIRT    ,SROCK
		.byte 	DIRT    ,DIRT    ,SROCK   ,HDIRT   ,HDIRT   ,EMPTY
		;Row 4
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,MIROCK  ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,DIRT    ,SROCK   ,DIRT
		.byte 	EMPTY   ,IROCK   ,DIRT    ,DIRT    ,DIRT    ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,MRROCK  ,EMPTY   ,EMPTY   ,DIRT
		.byte 	EMPTY   ,EROCK   ,HDIRT   ,HDIRT   ,SROCK   ,EMPTY
		;Row 5
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,DIRT    ,SROCK   ,EMPTY
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,EMPTY   ,DIRT    ,EMPTY
		.byte 	EMPTY   ,DIRT    ,DIRT    ,DIRT    ,SROCK   ,IROCK
		.byte 	RROCK   ,DIRT    ,EROCK   ,DIRT    ,RROCK   ,EMPTY
		.byte 	HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,EMPTY
		;Row 6
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,DIRT    ,SROCK   ,DIRT
		.byte 	EMPTY   ,EMPTY   ,EROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EROCK   ,DIRT    ,EMPTY   ,EMPTY   ,DIRT    ,HDIRT
		.byte 	RROCK   ,CRYSTAL ,RROCK   ,CRYSTAL ,RROCK   ,EMPTY
		.byte 	HDIRT   ,DIRT    ,EROCK   ,EROCK   ,EROCK   ,EROCK
		;Row 7
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,SROCK   ,CRYSTAL
		.byte 	IROCK   ,EMPTY   ,HDIRT   ,EMPTY   ,HDIRT   ,EMPTY
		.byte 	DIRT    ,DIRT    ,EMPTY   ,HDIRT   ,DIRT    ,DIRT
		.byte 	RROCK   ,CRYSTAL ,RROCK   ,CRYSTAL ,RROCK   ,HDIRT
		.byte 	HDIRT   ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		;Row 8
		.byte 	MONEY   ,MONEY   ,CRYSTAL ,CRYSTAL ,IROCK   ,CRYSTAL
		.byte 	IROCK   ,IROCK   ,HDIRT   ,HDIRT   ,IROCK   ,SROCK
		.byte 	DIRT    ,EMPTY   ,DIRT    ,HDIRT   ,HDIRT   ,DIRT
		.byte 	RROCK   ,CRYSTAL ,RROCK   ,CRYSTAL ,RROCK   ,RROCK
		.byte 	HDIRT   ,EROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 9
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,IROCK   ,CRYSTAL
		.byte 	IROCK   ,EMPTY   ,EROCK   ,EROCK   ,EMPTY   ,DIRT
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,RROCK   ,RROCK   ,RROCK
		.byte 	RROCK   ,CRYSTAL ,RROCK   ,CRYSTAL ,RROCK   ,RROCK
		.byte 	RROCK   ,RROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 10
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,RROCK   ,CRYSTAL
		.byte 	IROCK   ,SROCK   ,HDIRT   ,HDIRT   ,EMPTY   ,EMPTY
		.byte 	EROCK   ,HDIRT   ,SROCK   ,RROCK   ,CRYSTAL ,CRYSTAL
		.byte 	RROCK   ,CRYSTAL ,RROCK   ,CRYSTAL ,RROCK   ,CRYSTAL
		.byte 	CRYSTAL ,RROCK   ,SROCK   ,SROCK   ,SROCK   ,SROCK
		;Row 11
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,IROCK   ,CRYSTAL
		.byte 	IROCK   ,MUD     ,SROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HDIRT   ,SROCK   ,MUD     ,RROCK   ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,MIROCK  ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,RROCK   ,MUD     ,MUD     ,MUD     ,MUD
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	EBRANGE,11,5
		.byte 	FTIMER,21,13
		.byte 	CPROOF,25,3
		.byte 	CPROOF,4,8
		.byte 	CPROOF,12,11
		.byte 	MONEY,29,3
		.byte 	RPROOF,29,6
		.byte 	EBNUM,27,5
		.byte 	EPROOF,14,13
		.byte 	FTIMER,30,13
		.byte 	MONEY,21,6
		.byte 	EXTRA,30,12
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	SR_MON,7,3,LEFT + CCW
		.byte 	HR_MON,11,8,LEFT
		.byte 	IR_MON,13,5,RIGHT + CCW
		.byte 	HR_MON,12,12,LEFT
		.byte 	RR_MON,27,10,RIGHT + CCW
		.byte 	SR_MON,1,3,LEFT
		.byte 	SR_MON,4,3,RIGHT
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL10.LEV").
level28:
		;Difficulty level 1.
		.word  	400     	;Time to complete.
		.byte 	24		;Gem quota.
		.byte 	5,8,RIGHT	;Robot start X,Y & direction.
		.byte 	22,9		;Exit square position.

		;Difficulty level 2.
		.word  	300		;Time to complete.
		.byte 	40		;Gem quota.
		.byte 	9,11,RIGHT	;Robot start X,Y & direction.
		.byte 	12,13		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	PBOMB10 ,RROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,CRYSTAL
		.byte 	IROCK   ,PBOMB10 ,MIROCK  ,MRROCK  ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,MIROCK  ,EMPTY   ,EMPTY   ,MIROCK
		.byte 	LAVA    ,LAVA    ,IROCK   ,HROCK   ,HROCK   ,HROCK
		.byte 	IROCK   ,HDIRT   ,EMPTY   ,SROCK   ,EMPTY   ,MONEY
		;Row 2
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,CRYSTAL ,IROCK
		.byte 	EMPTY   ,IROCK   ,MRROCK  ,MRROCK  ,MRROCK  ,IROCK
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,IROCK   ,EMPTY   ,IROCK
		.byte 	MONEY   ,EMPTY   ,EMPTY   ,EROCK   ,MRROCK  ,PBOMB10
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,HDIRT   ,EMPTY   ,PBOMB3
		;Row 3
		.byte 	EMPTY   ,EMPTY   ,CRYSTAL ,CRYSTAL ,IROCK   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,DIRT    ,EROCK   ,DIRT    ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,IROCK   ,EMPTY   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,MRROCK  ,EROCK   ,MRROCK
		.byte 	IROCK   ,EMPTY   ,HROCK   ,EMPTY   ,HROCK   ,HDIRT
		;Row 4
		.byte 	EMPTY   ,CRYSTAL ,CRYSTAL ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,LAVA    ,MIROCK  ,LAVA    ,EMPTY
		.byte 	IROCK   ,MRROCK  ,DIRT    ,IROCK   ,EMPTY   ,IROCK
		.byte 	IROCK   ,MIROCK  ,IROCK   ,DIRT    ,DIRT    ,DIRT
		.byte 	IROCK   ,EMPTY   ,HDIRT   ,PBOMB3  ,HDIRT   ,DIRT
		;Row 5
		.byte 	DIRT    ,MIROCK  ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,LAVA    ,LAVA    ,LAVA    ,IROCK
		.byte 	DIRT    ,MIROCK  ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,EROCK   ,HDIRT   ,PBOMB3  ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,MIROCK  ,HDIRT   ,MIROCK  ,SROCK
		;Row 6
		.byte 	DIRT    ,SROCK   ,SROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,IROCK   ,IROCK   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,IROCK   ,RROCK   ,EMPTY   ,RROCK
		.byte 	EMPTY   ,IROCK   ,DIRT    ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,SROCK   ,SROCK   ,DIRT    ,HROCK   ,EROCK
		;Row 7
		.byte 	DIRT    ,IROCK   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,CRYSTAL ,CRYSTAL
		.byte 	EMPTY   ,CRYSTAL ,IROCK   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,IROCK   ,IROCK
		.byte 	EMPTY   ,DIRT    ,HROCK   ,MRROCK  ,EROCK   ,CRYSTAL
		;Row 8
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	FROBOT  ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,CRYSTAL
		.byte 	DIRT    ,CRYSTAL ,IROCK   ,RROCK   ,EMPTY   ,RROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	EMPTY   ,MIROCK  ,EROCK   ,EROCK   ,CRYSTAL ,CRYSTAL
		;Row 9
		.byte 	PBOMB10 ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,MUD     ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,IROCK   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,IROCK   ,PBOMB10
		.byte 	SROCK   ,EROCK   ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		;Row 10
		.byte 	CRYSTAL ,CRYSTAL ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,IROCK   ,MUD     ,SROCK
		.byte 	SROCK   ,CRYSTAL ,IROCK   ,RROCK   ,EMPTY   ,RROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,IROCK   ,SROCK
		.byte 	EROCK   ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		;Row 11
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,EMPTY   ,EMPTY   ,RROCK
		.byte 	IROCK   ,EMPTY   ,DIRT    ,IROCK   ,MONEY   ,MONEY
		.byte 	CRYSTAL ,CRYSTAL ,IROCK   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,IROCK   ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0     		;Object #, X, Y.
		.byte 	LPROOF,6,13
		.byte 	CPROOF,2,3
		.byte 	RPROOF,26,3
		.byte 	EBRANGE,27,5
		.byte 	MONEY,27,9
		.byte 	EPROOF,30,3
		.byte 	EXTRA,30,6
		.byte 	MONEY,30,8
		.byte    	EBNUM,10,6
		.byte 	MONEY,9,13
		.byte 	CPROOF,21,10
		.byte 	EPROOF,22,13
		.byte 	CONTLIST
		.byte 	CPROOF,1,7
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	MUD_MON,1,6,RIGHT + CCW
		.byte 	LAVA_MON,2,11,RIGHT
		.byte 	SR_MON,7,4,RIGHT + CCW
		.byte 	SR_MON,8,13,RIGHT
		.byte 	RR_MON,21,12,RIGHT + CCW
		.byte 	SR_MON,21,12,RIGHT 
		.byte 	SR_MON,21,12,RIGHT + CCW
		.byte 	CONTLIST
		.byte 	LAVA_MON,2,11,LEFT
		.byte 	MUD_MON,1,6,LEFT + CCW
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL23.LEV").
level29:
		;Difficulty level 1.
		.word  	300     	;Time to complete.
		.byte 	35		;Gem quota.
		.byte      12,9,LEFT 	;Robot start X,Y & direction.
		.byte 	30,7		;Exit square position.

		;Difficulty level 2.
		.word   	200		;Time to complete.
		.byte 	45		;Gem quota.
		.byte 	2,13,RIGHT	;Robot start X,Y & direction.
		.byte 	6,13		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	EROCK   ,MIROCK  ,MIROCK  ,HROCK   ,HROCK   ,HROCK
		.byte 	HROCK   ,HROCK   ,MRROCK  ,HROCK   ,HROCK   ,HROCK
		.byte 	SROCK   ,HROCK   ,HROCK   ,MRROCK  ,HROCK   ,HROCK
		.byte 	HROCK   ,EROCK   ,HROCK   ,DIRT    ,HROCK   ,HROCK
		.byte 	SROCK   ,EROCK   ,SROCK   ,HMUD    ,HMUD    ,HMUD
		;Row 2
		.byte 	EROCK   ,LAVA    ,LAVA    ,LAVA    ,LAVA    ,HMUD
		.byte 	HMUD    ,HMUD    ,HMUD    ,HMUD    ,HMUD    ,HMUD
		.byte 	HMUD    ,HMUD    ,HMUD    ,HMUD    ,HMUD    ,HMUD
		.byte 	HMUD    ,HMUD    ,HMUD    ,DIRT    ,SROCK   ,SROCK
		.byte 	SROCK   ,SROCK   ,HROCK   ,HMUD    ,EROCK   ,HMUD
		;Row 3
		.byte 	EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,DIRT    ,EROCK   ,HROCK   ,SROCK
		.byte 	HROCK   ,HROCK   ,MRROCK  ,EROCK   ,HMUD    ,HROCK
		;Row 4
		.byte 	EROCK   ,HDIRT   ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,EROCK   ,DIRT
		.byte 	DIRT    ,DIRT    ,EROCK   ,HMUD    ,HROCK   ,SROCK
		;Row 5
		.byte 	EROCK   ,HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,HMUD    ,EROCK   ,HROCK   ,HROCK
		;Row 6
		.byte 	EROCK   ,HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HMUD    ,EROCK   ,HMUD
		.byte 	HMUD    ,HMUD    ,SROCK   ,EROCK   ,HROCK   ,EROCK
		;Row 7
		.byte 	EROCK   ,HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HMUD    ,EROCK   ,SROCK
		.byte 	EROCK   ,HMUD    ,EROCK   ,HMUD    ,HROCK   ,HROCK
		;Row 8
		.byte 	EROCK   ,HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HMUD    ,EROCK   ,MIROCK
		.byte 	SROCK   ,HMUD    ,EROCK   ,HMUD    ,HROCK   ,SROCK
		;Row 9
		.byte 	DIRT    ,EROCK   ,EROCK   ,EROCK   ,EROCK   ,HDIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HMUD    ,EROCK   ,SROCK
		.byte 	SROCK   ,HMUD    ,EROCK   ,HMUD    ,SROCK   ,HROCK
		;Row 10
		.byte 	DIRT    ,HMUD    ,HMUD    ,HMUD    ,EROCK   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HMUD    ,EROCK   ,MIROCK
		.byte 	EROCK   ,HMUD    ,EROCK   ,HMUD    ,HROCK   ,EROCK
		;Row 11
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,HMUD    ,HMUD    ,EMPTY
		.byte 	PBOMB3  ,EMPTY   ,MONEY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	MONEY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,MONEY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EROCK   ,DIRT
		.byte 	SROCK   ,HMUD    ,HMUD    ,HMUD    ,SROCK   ,HROCK
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	EBNUM,25,10
		.byte 	PBOMB10,30,13
		.byte 	MONEY,29,12
		.byte 	PBOMB10,30,3
		.byte 	PBOMB10,29,13
		.byte 	EBRANGE,4,3
		.byte 	RPROOF,12,3
		.byte 	FTIMER,16,3
		.byte 	EPROOF,30,7
		.byte 	MONEY,25,13
		.byte 	EXTRA,24,3
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	HR_MON,11,7,LEFT   
		.byte 	IR_MON,22,7,LEFT + CCW
		.byte 	MUD_MON,16,7,LEFT
		.byte 	LAVA_MON,14,10,UP + CCW
		.byte 	LAVA_MON,9,7,RIGHT
		.byte 	GAS_MON,30,3,UP + CCW
		.byte 	MUD_MON,5,9,UP + CCW
		.byte 	RR_MON,3,7,RIGHT + CCW
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL27.LEV").
level30:
		;Difficulty level 1.
		.word  	500		;Time to complete.
		.byte 	60		;Gem quota.
		.byte 	3,12,RIGHT	;Robot start X,Y & direction.
		.byte 	7,4		;Exit square position.

		;Difficulty level 2.
		.word  	325		;Time to complete.
		.byte 	70		;Gem quota.
        	.byte 	8,8,RIGHT	;Robot start X,Y & direction.
		.byte 	17,3		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	EROCK   ,DIRT    ,EROCK   ,HDIRT   ,DIRT    ,EROCK
		.byte 	HDIRT   ,HDIRT   ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,EROCK   ,HDIRT   ,HDIRT   ,EROCK
		.byte 	DIRT    ,EMPTY   ,HMUD    ,EROCK   ,HMUD    ,HMUD
		.byte 	HMUD    ,HMUD    ,HMUD    ,HMUD    ,HMUD    ,HMUD
		;Row 2
		.byte 	HDIRT   ,EROCK   ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,DIRT    ,DIRT    ,EROCK   ,IROCK   ,DIRT
		.byte 	EROCK   ,EMPTY   ,EMPTY   ,HMUD    ,EROCK   ,HMUD
		.byte 	EROCK   ,HMUD    ,EROCK   ,HMUD    ,EROCK   ,HMUD
		;Row 3
		.byte 	EMPTY   ,IROCK   ,EROCK   ,EMPTY   ,EMPTY   ,EROCK
		.byte 	EROCK   ,IROCK   ,DIRT    ,DIRT    ,DIRT    ,MIROCK
		.byte 	EMPTY   ,HDIRT   ,HDIRT   ,DIRT    ,EROCK   ,DIRT
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,HMUD    ,EROCK
		.byte 	HMUD    ,HMUD    ,HMUD    ,EROCK   ,HMUD    ,HMUD
		;Row 4
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,EMPTY   ,EMPTY   ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,EMPTY   ,MIROCK  ,EROCK
		.byte 	MRROCK  ,EMPTY   ,EMPTY   ,HDIRT   ,HDIRT   ,EROCK
		.byte 	DIRT    ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,HMUD
		.byte 	EROCK   ,HMUD    ,EROCK   ,HMUD    ,EROCK   ,HMUD
		;Row 5
		.byte 	HDIRT   ,EROCK   ,HDIRT   ,EROCK   ,HDIRT   ,HDIRT
		.byte 	EROCK   ,DIRT    ,EMPTY   ,EMPTY   ,EROCK   ,RROCK
		.byte 	EROCK   ,EMPTY   ,EMPTY   ,IROCK   ,DIRT    ,DIRT
		.byte 	DIRT    ,EROCK   ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HMUD    ,EROCK   ,HMUD    ,HMUD    ,HMUD    ,HMUD
		;Row 6
		.byte 	HDIRT   ,DIRT    ,DIRT    ,DIRT    ,IROCK   ,EROCK
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,EROCK   ,IROCK   ,MRROCK
		.byte 	IROCK   ,EROCK   ,EMPTY   ,EMPTY   ,DIRT    ,EROCK
		.byte 	HDIRT   ,IROCK   ,DIRT    ,DIRT    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,HMUD    ,EROCK   ,HMUD    ,EROCK   ,HMUD
		;Row 7
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	EMPTY   ,EMPTY   ,EROCK   ,IROCK   ,HMUD    ,HMUD
		.byte 	HMUD    ,IROCK   ,EROCK   ,EMPTY   ,EMPTY   ,DIRT
		.byte 	HDIRT   ,EROCK   ,DIRT    ,DIRT    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,HMUD    ,EROCK   ,HMUD    ,HMUD
		;Row 8
		.byte 	DIRT    ,EROCK   ,DIRT    ,EROCK   ,HDIRT   ,EMPTY
		.byte 	EMPTY   ,EROCK   ,IROCK   ,HMUD    ,HMUD    ,HMUD
		.byte 	HMUD    ,HMUD    ,IROCK   ,EROCK   ,EMPTY   ,EMPTY
		.byte 	HDIRT   ,DIRT    ,HDIRT   ,EROCK   ,IROCK   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HMUD    ,EROCK   ,HMUD
		;Row 9
		.byte 	DIRT    ,SROCK   ,DIRT    ,HDIRT   ,HDIRT   ,EMPTY
		.byte 	EROCK   ,IROCK   ,HMUD    ,HMUD    ,HMUD    ,HMUD
		.byte 	HMUD    ,HMUD    ,HMUD    ,IROCK   ,EROCK   ,EMPTY
		.byte 	HDIRT   ,EROCK   ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HMUD    ,HMUD
		;Row 10
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,HMUD    ,HMUD    ,HMUD    ,HMUD    ,EMPTY
		.byte 	HMUD    ,HMUD    ,HMUD    ,HMUD    ,IROCK   ,EMPTY
		.byte 	EMPTY   ,DIRT    ,DIRT    ,HDIRT   ,EROCK   ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY
		;Row 11
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,EMPTY   ,SROCK   ,EMPTY
		.byte 	HROCK   ,CRYSTAL ,HMUD    ,HMUD    ,HMUD    ,IROCK
		.byte 	HMUD    ,HMUD    ,HMUD    ,CRYSTAL ,HROCK   ,EMPTY
		.byte 	EMPTY   ,HDIRT   ,EROCK   ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	IROCK   ,HDIRT   ,HDIRT   ,HDIRT   ,IROCK   ,HDIRT
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	EBNUM,4,8
		.byte 	EPROOF,7,11
		.byte 	MONEY,5,4
		.byte 	CPROOF,5,7
		.byte 	MONEY,10,4
		.byte 	MONEY,16,4
		.byte 	FTIMER,18,3
		.byte 	FTIMER,25,12
		.byte 	MONEY,29,3
		.byte 	EBRANGE,17,7
		.byte 	CPROOF,22,8
		.byte 	PBOMB3,30,3
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	MUD_MON,26,10,LEFT + CCW
		.byte 	MUD_MON,12,12,LEFT
		.byte 	HR_MON,4,6,RIGHT + CCW
		.byte 	HR_MON,2,6,RIGHT
		.byte 	MUD_MON,30,12,RIGHT + CCW
		.byte 	SR_MON,11,5,RIGHT
		.byte 	SR_MON,22,7,RIGHT + CCW
		.byte 	CONTLIST
		.byte 	SR_MON,22,7,LEFT
		.byte 	SR_MON,2,6,LEFT
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL52.LEV").
level31:
		;Difficulty level 1.
		.word  	155  	     	;Time to complete.
		.byte 	9		;Gem quota.
		.byte 	29,6,LEFT	;Robot start X,Y & direction.
		.byte 	1,4		;Exit square position.

		;Difficulty level 2.
		.word  	115		;Time to complete.
		.byte 	12		;Gem quota.
		.byte 	29,6,LEFT	;Robot start X,Y & direction.
		.byte 	1,13		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	CRYSTAL ,EMPTY   ,EMPTY   ,LAVA    ,CRYSTAL ,LAVA
		.byte 	CRYSTAL ,EMPTY   ,MUD     ,LAVA    ,PBOMB3  ,LAVA
		.byte 	LAVA    ,LAVA    ,LAVA    ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,LAVA    ,LAVA    ,EMPTY   ,EMPTY   ,LAVA
		.byte 	LAVA    ,LAVA    ,LAVA    ,LAVA    ,EMPTY   ,EMPTY
		;Row 2
		.byte 	EMPTY   ,RROCK   ,RROCK   ,DIRT    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,MUD     ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	EBRANGE ,RROCK   ,RROCK   ,RROCK   ,RROCK   ,EMPTY
		;Row 3
		.byte 	EMPTY   ,RROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HDIRT   ,EMPTY   ,EMPTY   ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EBNUM   ,RROCK   ,DIRT    ,RPROOF  ,RROCK   ,LAVA
		;Row 4
		.byte 	LAVA    ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,SROCK   ,SROCK   ,SROCK
		.byte 	SROCK   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,MRROCK  ,EMPTY   ,LAVA
		;Row 5
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,IROCK   ,EMPTY   ,EMPTY   ,HDIRT   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,LAVA
		;Row 6
		.byte 	LAVA    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,EMPTY   ,DIRT    ,DIRT
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,IROCK   ,EMPTY   ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	EMPTY   ,HDIRT   ,HDIRT   ,EMPTY   ,HDIRT   ,LAVA
		;Row 7
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	PBOMB3  ,IROCK   ,PBOMB3  ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HDIRT   ,EMPTY
		.byte 	EMPTY   ,HDIRT   ,HDIRT   ,HDIRT   ,CRYSTAL ,LAVA
		;Row 8
		.byte 	EMPTY   ,RROCK   ,DIRT    ,DIRT    ,EMPTY   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,EMPTY   ,DIRT    ,DIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,HDIRT   ,EMPTY   ,HDIRT   ,RROCK   ,LAVA
		;Row 9
		.byte 	EMPTY   ,RROCK   ,EROCK   ,DIRT    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,CRYSTAL ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	EMPTY   ,EMPTY   ,HDIRT   ,EROCK   ,RROCK   ,EMPTY
		;Row 10
		.byte 	LAVA    ,RROCK   ,RROCK   ,RROCK   ,DIRT    ,LPROOF
		.byte 	EMPTY   ,EMPTY   ,MUD     ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	IROCK   ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,RROCK   ,RROCK   ,RROCK   ,EMPTY
		;Row 11
		.byte 	CRYSTAL ,LAVA    ,LPROOF  ,LAVA    ,CRYSTAL ,LAVA
		.byte 	CRYSTAL ,EMPTY   ,MUD     ,LAVA    ,EMPTY   ,EMPTY
		.byte 	IROCK   ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	IROCK   ,LAVA    ,LAVA    ,LAVA    ,LAVA    ,EMPTY
		.byte 	LAVA    ,LAVA    ,LAVA    ,LAVA    ,EMPTY   ,EMPTY
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	MONEY,27,5
		.byte 	FROBOT,27,5
		.byte 	LPROOF,23,8
		.byte 	PBOMB10,8,3
		.byte 	NEWLIST
		.byte 	MONEY,23,8
		.byte 	LPROOF,27,5
		.byte 	FROBOT,23,8
		.byte 	PBOMB10,3,12
						
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	SR_MON,3,5,LEFT
		.byte 	SR_MON,7,11,RIGHT + CCW
		.byte 	SR_MON,19,5,DOWN
		.byte 	SR_MON,28,8,DOWN
		.byte 	SR_MON,27,10,UP
		.byte 	LAVA_MON,1,5,DOWN + CCW
		.byte 	CONTLIST
		.byte 	SR_MON,1,7,RIGHT
		.byte 	SR_MON,24,7,RIGHT
 
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL09.LEV").
level32:
		;Difficulty level 1.
		.word  	350     	;Time to complete.
		.byte 	22		;Gem quota.
		.byte 	1,11,RIGHT	;Robot start X,Y & direction.
		.byte 	22,5		;Exit square position.

		;Difficulty level 2.
		.word  	225		;Time to complete.
		.byte 	25		;Gem quota.
		.byte 	10,13,RIGHT	;Robot start X,Y & direction.
		.byte 	13,9		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	MIROCK  ,EROCK   ,EMPTY   ,LAVA    ,EMPTY   ,MIROCK
		.byte 	IROCK   ,LAVA    ,EMPTY   ,LAVA    ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EROCK   ,EMPTY
		.byte 	HROCK   ,EMPTY   ,EMPTY   ,MIROCK  ,EMPTY   ,EMPTY
		.byte 	HROCK   ,EMPTY   ,EROCK   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 2
		.byte 	DIRT    ,MIROCK  ,IROCK   ,MIROCK  ,IROCK   ,DIRT
		.byte 	EROCK   ,EMPTY   ,IROCK   ,EMPTY   ,MIROCK  ,EMPTY
		.byte 	MRROCK  ,IROCK   ,EMPTY   ,EMPTY   ,PBOMB10 ,EMPTY
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,DIRT    ,EMPTY   ,EMPTY
		.byte 	DIRT    ,EMPTY   ,PBOMB10 ,EMPTY   ,EMPTY   ,EMPTY
		;Row 3
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,DIRT    ,IROCK   ,PBOMB10
		.byte 	IROCK   ,EROCK   ,IROCK   ,MONEY   ,IROCK   ,MRROCK
		.byte 	MRROCK  ,IROCK   ,EMPTY   ,EMPTY   ,DIRT    ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY
		;Row 4
		.byte 	EMPTY   ,IROCK   ,IROCK   ,EMPTY   ,IROCK   ,FROBOT
		.byte 	IROCK   ,EROCK   ,IROCK   ,EROCK   ,DIRT    ,MRROCK
		.byte 	MRROCK  ,DIRT    ,EMPTY   ,SROCK   ,EMPTY   ,MIROCK
		.byte 	EMPTY   ,EROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,HROCK
		.byte 	EMPTY   ,EROCK   ,EMPTY   ,MIROCK  ,EMPTY   ,EMPTY
		;Row 5
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,IROCK   ,HDIRT
		.byte 	MIROCK  ,EROCK   ,EMPTY   ,HDIRT   ,EMPTY   ,DIRT
		.byte 	HDIRT   ,IROCK   ,EMPTY   ,DIRT    ,EMPTY   ,DIRT
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,DIRT    ,EMPTY   ,EMPTY
		;Row 6
		.byte 	MIROCK  ,IROCK   ,EMPTY   ,IROCK   ,MIROCK  ,DIRT
		.byte 	IROCK   ,DIRT    ,IROCK   ,IROCK   ,HROCK   ,MIROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,SROCK   ,EMPTY   ,EROCK
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,EROCK   ,EMPTY   ,SROCK
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,SROCK   ,EMPTY   ,EMPTY
		;Row 7
		.byte 	DIRT    ,IROCK   ,EMPTY   ,EMPTY   ,HDIRT   ,EMPTY
		.byte 	MIROCK  ,EROCK   ,MIROCK  ,MIROCK  ,HROCK   ,DIRT
		.byte 	SROCK   ,IROCK   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT
		;Row 8
		.byte 	EMPTY   ,IROCK   ,IROCK   ,IROCK   ,MIROCK  ,IROCK
		.byte 	MIROCK  ,HDIRT   ,DIRT    ,MIROCK  ,EMPTY   ,MIROCK
		.byte 	IROCK   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 9
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT    ,EMPTY
		.byte 	DIRT    ,EMPTY   ,IROCK   ,MIROCK  ,EXTRA   ,MIROCK
		.byte 	HDIRT   ,IROCK   ,CRYSTAL ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,CRYSTAL
		;Row 10
		.byte 	EMPTY   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,DIRT    ,EROCK   ,MIROCK
		.byte 	HDIRT   ,IROCK   ,CRYSTAL ,CRYSTAL ,EMPTY   ,CRYSTAL
		.byte 	EMPTY   ,CRYSTAL ,EMPTY   ,CRYSTAL ,EMPTY   ,CRYSTAL
		.byte 	EMPTY   ,EMPTY   ,CRYSTAL ,EMPTY   ,CRYSTAL ,CRYSTAL
		;Row 11
		.byte 	EMPTY   ,EMPTY   ,PBOMB1  ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,FROBOT  ,EMPTY   ,EMPTY   ,DIRT    ,DIRT
		.byte 	MONEY   ,IROCK   ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0      		;Object #, X, Y.
		.byte 	PBOMB10,6,4
		.byte 	MONEY,10,5
		.byte 	EBRANGE,11,5
		.byte 	EBNUM,30,8
		.byte 	MONEY,30,9
		.byte 	CPROOF,28,7
		.byte 	MONEY,26,9
		.byte 	MONEY,17,9
		.byte 	MONEY,22,5
		.byte 	FROBOT,13,13
		.byte 	FROBOT,12,13
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	IR_MON,17,12,RIGHT + CCW
		.byte 	GAS_MON,30,3,LEFT + CCW
		.byte 	HR_MON,19,12,RIGHT  
		.byte 	IR_MON,21,12,RIGHT + CCW
		.byte 	MUD_MON,23,12,LEFT 
		.byte 	IR_MON,30,10,RIGHT         
		.byte 	RR_MON,28,12,RIGHT
		.byte 	SR_MON,30,10,LEFT + CCW	
		.byte 	NEWLIST
		.byte 	IR_MON,17,12,RIGHT + CCW
		.byte 	GAS_MON,30,3,LEFT + CCW
		.byte 	HR_MON,19,12,RIGHT  
		.byte 	IR_MON,21,12,RIGHT + CCW
		.byte 	MUD_MON,23,12,LEFT 
		.byte 	IR_MON,30,10,RIGHT         
		.byte 	RR_MON,28,12,RIGHT
		.byte 	SR_MON,30,10,LEFT + CCW	
		.byte 	SR_MON,30,10,RIGHT
		.byte 	SR_MON,28,12,LEFT
		.byte 	HR_MON,21,12,LEFT + CCW
		.byte 	SR_MON,17,12,LEFT + CCW
		.byte 	SR_MON,15,3,RIGHT
		.byte 	SR_MON,25,3,LEFT + CCW
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL28.LEV").
level33:
		;Difficulty level 1.
		.word  	450		;Time to complete.
		.byte 	30	        ;Gem quota.
		.byte 	3,11,RIGHT	;Robot start X,Y & direction.
		.byte 	3,3		;Exit square position.

		;Difficulty level 2.
		.word  	315		;Time to complete.
		.byte 	40		;Gem quota.
		.byte 	29,10,RIGHT	;Robot start X,Y & direction.
		.byte 	29,3		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	MIROCK  ,EROCK   ,EMPTY   ,EMPTY   ,EROCK   ,MONEY
		.byte 	MIROCK  ,DIRT    ,DIRT    ,MONEY   ,HROCK   ,IROCK
		.byte 	EROCK   ,MONEY   ,EROCK   ,MONEY   ,MRROCK  ,EMPTY
		.byte 	EMPTY   ,EROCK   ,HROCK   ,EROCK   ,MONEY   ,MIROCK
		.byte 	DIRT    ,SROCK   ,HDIRT   ,IROCK   ,MIROCK  ,EMPTY
		;Row 2
		.byte 	DIRT    ,IROCK   ,EMPTY   ,SROCK   ,DIRT    ,DIRT
		.byte 	DIRT    ,DIRT    ,SROCK   ,DIRT    ,HDIRT   ,SROCK
		.byte 	DIRT    ,EROCK   ,SROCK   ,IROCK   ,HDIRT   ,EMPTY
		.byte 	EMPTY   ,DIRT    ,MONEY   ,DIRT    ,IROCK   ,EROCK
		.byte 	DIRT    ,DIRT    ,HDIRT   ,EROCK   ,HDIRT   ,SROCK
		;Row 3
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,HDIRT
		.byte 	HDIRT   ,IROCK   ,HDIRT   ,HDIRT   ,HDIRT   ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,HDIRT   ,HDIRT   ,DIRT
		.byte 	HDIRT   ,IROCK   ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,IROCK   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT
		;Row 4
		.byte 	DIRT    ,EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK
		;Row 5
		.byte 	DIRT    ,HDIRT   ,IROCK   ,HDIRT   ,IROCK   ,HDIRT
		.byte 	IROCK   ,HDIRT   ,IROCK   ,HDIRT   ,IROCK   ,HDIRT
		.byte 	IROCK   ,HDIRT   ,IROCK   ,HDIRT   ,IROCK   ,HDIRT
		.byte 	IROCK   ,HDIRT   ,IROCK   ,HDIRT   ,IROCK   ,HDIRT
		.byte 	IROCK   ,HDIRT   ,IROCK   ,HDIRT   ,IROCK   ,HDIRT
		;Row 6
		.byte 	DIRT    ,EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,EROCK   ,SROCK   ,EROCK   ,EROCK
		;Row 7
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,DIRT    ,HDIRT   ,DIRT    ,DIRT    ,DIRT
		;Row 8
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 9
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 10
		.byte 	MUD     ,EMPTY   ,EMPTY   ,MUD     ,EMPTY   ,MUD
		.byte 	EMPTY   ,EMPTY   ,MUD     ,MUD     ,MUD     ,EMPTY
		.byte 	EMPTY   ,MUD     ,EMPTY   ,EMPTY   ,MUD     ,EMPTY
		.byte 	EMPTY   ,MUD     ,EMPTY   ,EMPTY   ,MUD     ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,MUD     ,EMPTY   ,EMPTY   ,EMPTY
		;Row 11
		.byte 	MUD     ,MUD     ,MUD     ,MUD     ,MUD     ,MRROCK
		.byte 	MUD     ,MUD     ,MUD     ,LAVA    ,MRROCK  ,MUD
		.byte 	MUD     ,MUD     ,MUD     ,MUD     ,MRROCK  ,MUD
		.byte 	MUD     ,MUD     ,MUD     ,MUD     ,MRROCK  ,MUD
		.byte 	MUD     ,MUD     ,MUD     ,MUD     ,MUD     ,MUD
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	EBNUM,2,9
		.byte 	CPROOF,29,4
		.byte 	LPROOF,7,4
		.byte 	FTIMER,25,3
		.byte 	FTIMER,21,4
		.byte 	LPROOF,18,6
		.byte 	EPROOF,3,3
		.byte 	CPROOF,10,4
		.byte 	PBOMB10,6,13
		.byte 	EXTRA,23,13
		.byte 	MONEY,5,4
		.byte 	CPROOF,1,6
		.byte 	MONEY,11,8
		.byte 	RPROOF,17,3
		.byte 	EBRANGE,21,3
		.byte 	LPROOF,24,5
		.byte 	EPROOF,30,4
		.byte      MONEY,17,13
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	HR_MON,3,3,LEFT + CCW
		.byte 	SR_MON,19,3,LEFT              
		.byte 	IR_MON,30,3,RIGHT + CCW
		.byte 	MUD_MON,25,10,LEFT
		.byte 	MUD_MON,19,10,RIGHT + CCW
		.byte 	MUD_MON,20,13,LEFT + CCW
		.byte      LAVA_MON,15,10,RIGHT
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL35.LEV").
level34:
		;Difficulty level 1.
		.word  	350		;Time to complete.
		.byte 	50		;Gem quota.
		.byte 	1,8,RIGHT	;Robot start X,Y & direction.
		.byte 	25,7		;Exit square position.

		;Difficulty level 2.
		.word  	250		;Time to complete.
		.byte 	65		;Gem quota.
		.byte 	29,7,RIGHT	;Robot start X,Y & direction.
		.byte 	25,13		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	HMUD    ,EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,EMPTY
		.byte 	MIROCK  ,EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,EMPTY
		.byte 	MIROCK  ,EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,EMPTY
		.byte 	MIROCK  ,EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,EMPTY
		.byte 	MIROCK  ,EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,HMUD
		;Row 2
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HMUD    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HMUD    ,EMPTY   ,SROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HMUD    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HMUD    ,EMPTY   ,EMPTY   ,EMPTY   ,SROCK   ,EMPTY
		;Row 3
		.byte 	EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,HMUD    ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,HMUD    ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,HMUD    ,EMPTY
		.byte 	SROCK   ,EMPTY   ,HMUD    ,EMPTY   ,HMUD    ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,HMUD    ,EMPTY
		;Row 4
		.byte 	HMUD    ,EMPTY   ,EMPTY   ,SROCK   ,EMPTY   ,EMPTY
		.byte 	HMUD    ,EMPTY   ,EMPTY   ,SROCK   ,EMPTY   ,EMPTY
		.byte 	HMUD    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HMUD    ,EMPTY   ,EMPTY   ,SROCK   ,EMPTY   ,EMPTY
		.byte 	HMUD    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 5
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,HMUD    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,HMUD    ,EMPTY   ,SROCK
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,HMUD    ,EMPTY   ,SROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,HMUD    ,EMPTY   ,EMPTY
		;Row 6
		.byte 	EMPTY   ,HMUD    ,EMPTY   ,EMPTY   ,EMPTY   ,HMUD
		.byte 	EMPTY   ,HMUD    ,EMPTY   ,EMPTY   ,EMPTY   ,HMUD
		.byte 	EMPTY   ,HMUD    ,EMPTY   ,EMPTY   ,EMPTY   ,HMUD
		.byte 	EMPTY   ,HMUD    ,EMPTY   ,SROCK   ,EMPTY   ,HMUD
		.byte 	EMPTY   ,HMUD    ,EMPTY   ,EMPTY   ,EMPTY   ,HMUD
		;Row 7
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,EMPTY
		.byte 	SROCK   ,EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,EMPTY
		;Row 8
		.byte 	HMUD    ,EMPTY   ,EMPTY   ,EMPTY   ,SROCK   ,EMPTY
		.byte 	HMUD    ,EMPTY   ,SROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HMUD    ,EMPTY   ,SROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HMUD    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HMUD    ,EMPTY   ,EMPTY   ,EMPTY   ,SROCK   ,EMPTY
		;Row 9
		.byte 	EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,HMUD    ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,HMUD    ,EMPTY
		.byte 	SROCK   ,EMPTY   ,HMUD    ,EMPTY   ,HMUD    ,EMPTY
		.byte 	SROCK   ,EMPTY   ,HMUD    ,EMPTY   ,HMUD    ,EMPTY
		.byte 	SROCK   ,EMPTY   ,HMUD    ,EMPTY   ,HMUD    ,EMPTY
		;Row 10
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HMUD    ,EMPTY   ,EMPTY   ,SROCK   ,EMPTY   ,EMPTY
		.byte 	HMUD    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HMUD    ,EMPTY   ,EMPTY   ,SROCK   ,EMPTY   ,EMPTY
		.byte 	HMUD    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 11
		.byte 	HMUD    ,EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,HMUD
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	EBNUM,5,10
		.byte 	EBRANGE,10,12
		.byte 	CPROOF,1,3
		.byte 	EPROOF,7,3
		.byte 	CPROOF,18,8
		.byte 	EPROOF,21,11
		.byte 	CPROOF,25,3
		.byte 	EPROOF,28,13
		.byte 	PBOMB10,2,7
		.byte 	PBOMB3,4,3
		.byte 	PBOMB3,5,8
		.byte 	PBOMB3,3,11
		.byte 	PBOMB3,9,5
		.byte 	PBOMB3,13,10
		.byte 	PBOMB10,15,5
		.byte 	PBOMB3,19,6
		.byte 	PBOMB3,22,9
		.byte 	PBOMB10,25,10
		.byte 	PBOMB3,29,10
		.byte 	PBOMB3,30,8
		.byte 	PBOMB10,30,13
		.byte 	MONEY,26,7
		.byte 	MONEY,22,12
		.byte 	MONEY,15,10
		.byte 	MONEY,8,7
		.byte 	MONEY,4,6
		.byte 	EXTRA,7,13
		.byte 	$ff
;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte   	RR_MON,23,8,LEFT
		.byte 	RR_MON,27,3,LEFT + CCW
		.byte 	IR_MON,19,13,RIGHT
		.byte 	IR_MON,18,3,LEFT + CCW
		.byte 	MUD_MON,21,8,UP
		.byte 	LAVA_MON,26,13,LEFT
		.byte 	GAS_MON,30,3,RIGHT
		.byte 	SR_MON,24,10,RIGHT
		.byte 	SR_MON,25,5,LEFT + CCW
		.byte 	SR_MON,16,4,LEFT
		.byte 	MUD_MON,15,6,DOWN
		.byte 	SR_MON,14,9,RIGHT + CCW
		.byte 	HR_MON,13,5,LEFT + CCW
		.byte 	HR_MON,7,13,LEFT
		.byte 	SR_MON,2,3,LEFT + CCW
		.byte 	SR_MON,3,13,LEFT
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL51.LEV").
level35:
		;Difficulty level 1.
		.word  	264		;Time to complete.
		.byte 	10		;Gem quota.
		.byte 	15,8,UP		;Robot start X,Y & direction.
		.byte 	4,8		;Exit square position.

		;Difficulty level 2.
		.word  	144		;Time to complete.
		.byte 	19		;Gem quota.
		.byte 	15,8,RIGHT	;Robot start X,Y & direction.
		.byte 	4,8		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	SROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HMUD    ,HMUD    ,HMUD
		;Row 2
		.byte 	DIRT    ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,MIROCK
		.byte 	IROCK   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HMUD    ,HMUD    ,HMUD
		;Row 3
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,SROCK   ,SROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HDIRT
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HMUD    ,HMUD    ,HMUD
		;Row 4
		.byte 	EMPTY   ,EMPTY   ,MONEY   ,IROCK   ,SROCK   ,SROCK
		.byte 	SROCK   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,MIROCK  ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,SROCK   ,PBOMB10 ,DIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 5
		.byte 	DIRT    ,DIRT    ,IROCK   ,RROCK   ,HDIRT   ,SROCK
		.byte 	DIRT    ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	HMUD    ,HMUD    ,EPROOF  ,LAVA    ,SROCK   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,DIRT    ,DIRT    ,DIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 6
		.byte 	IROCK   ,EMPTY   ,RROCK   ,EMPTY   ,RROCK   ,CRYSTAL
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	HMUD    ,HMUD    ,EMPTY   ,EROCK   ,SROCK   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		;Row 7
		.byte 	IROCK   ,EMPTY   ,IROCK   ,RROCK   ,HDIRT   ,DIRT
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	HMUD    ,HMUD    ,EMPTY   ,LAVA    ,SROCK   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 8
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,MONEY   ,IROCK   ,EBRANGE
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,CRYSTAL ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT
		;Row 9
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,CRYSTAL ,IROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,SROCK   ,EMPTY   ,CRYSTAL
		;Row 10
		.byte 	HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,EMPTY   ,IROCK   ,CRYSTAL ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		;Row 11
		.byte 	FROBOT  ,FROBOT  ,FROBOT  ,FROBOT  ,FROBOT  ,FROBOT
		.byte 	FROBOT  ,IROCK   ,EMPTY   ,CRYSTAL ,EBNUM   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,MONEY   ,EMPTY   ,EMPTY
		.byte 	MONEY   ,EMPTY   ,EMPTY   ,CPROOF  ,DIRT    ,EMPTY
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	PBOMB3,5,7
		.byte 	PBOMB3,5,9
		.byte 	EXTRA,24,8
		.byte 	NEWLIST			;List for 2nd difficulty
		.byte 	PBOMB1,5,7
		.byte 	PBOMB1,5,9
		.byte 	EXTRA,1,12
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
		.byte 	IR_MON,27,4,DOWN + CCW	;Creature #, X, Y, direction.
		.byte 	RR_MON,29,11,LEFT
		.byte 	HR_MON,30,13,DOWN
		.byte 	SR_MON,3,5,DOWN
		.byte 	CONTLIST		;Additional for 2nd difficulty
		.byte 	HR_MON,7,5,DOWN
		.byte 	SR_MON,1,10,RIGHT
		.byte 	IR_MON,9,5,DOWN + CCW
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL31.LEV").
level36:
		;Difficulty level 1.
		.word  	250		;Time to complete.
		.byte 	15		;Gem quota.
		.byte 	15,7,RIGHT	;Robot start X,Y & direction.
		.byte 	5,8		;Exit square position.

		;Difficulty level 2.
		.word  	150		;Time to complete.
		.byte 	24		;Gem quota.
		.byte 	15,7,RIGHT	;Robot start X,Y & direction.
		.byte 	1,3		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	LAVA    ,EMPTY   ,EMPTY   ,EMPTY   ,EROCK   ,LAVA
		.byte 	EROCK   ,LAVA    ,EROCK   ,MONEY   ,MIROCK  ,MIROCK
		.byte 	CRYSTAL ,CRYSTAL ,LAVA    ,CRYSTAL ,EROCK   ,MIROCK
		.byte 	EROCK   ,MIROCK  ,EROCK   ,MIROCK  ,EROCK   ,MIROCK
		.byte 	EROCK   ,MIROCK  ,EROCK   ,EMPTY   ,EROCK   ,EMPTY
		;Row 2
		.byte 	PBOMB10 ,LAVA    ,EROCK   ,MIROCK  ,MIROCK  ,MIROCK
		.byte 	MIROCK  ,MIROCK  ,MIROCK  ,MIROCK  ,EROCK   ,LAVA
		.byte 	EROCK   ,LAVA    ,CRYSTAL ,LAVA    ,MIROCK  ,LAVA
		.byte 	MIROCK  ,LAVA    ,MIROCK  ,LAVA    ,MIROCK  ,LAVA
		.byte 	MIROCK  ,LAVA    ,MIROCK  ,LAVA    ,EMPTY   ,CRYSTAL
		;Row 3
		.byte 	MIROCK  ,CRYSTAL ,LAVA    ,LAVA    ,EROCK   ,LAVA
		.byte 	EROCK   ,LAVA    ,EROCK   ,LAVA    ,LAVA    ,MONEY
		.byte 	LAVA    ,LAVA    ,EROCK   ,LAVA    ,EROCK   ,LAVA
		.byte 	EROCK   ,LAVA    ,EROCK   ,LAVA    ,EROCK   ,LAVA
		.byte 	EROCK   ,LAVA    ,EROCK   ,LAVA    ,EROCK   ,LAVA
		;Row 4
		.byte 	EROCK   ,LAVA    ,LAVA    ,EMPTY   ,LAVA    ,CRYSTAL
		.byte 	LAVA    ,MONEY   ,LAVA    ,LAVA    ,EROCK   ,LAVA
		.byte 	CRYSTAL ,PBOMB3  ,LAVA    ,PBOMB3  ,LAVA    ,CRYSTAL
		.byte 	LAVA    ,CRYSTAL ,LAVA    ,MONEY   ,LAVA    ,MONEY
		.byte 	LAVA    ,CRYSTAL ,LAVA    ,EMPTY   ,LAVA    ,LAVA
		;Row 5
		.byte 	LAVA    ,LAVA    ,EROCK   ,LAVA    ,EROCK   ,LAVA
		.byte 	EROCK   ,LAVA    ,EROCK   ,MONEY   ,LAVA    ,CRYSTAL
		.byte 	LAVA    ,EMPTY   ,EMPTY   ,EMPTY   ,EROCK   ,LAVA
		.byte 	EROCK   ,LAVA    ,EROCK   ,LAVA    ,LAVA    ,LAVA
		.byte 	EROCK   ,LAVA    ,EROCK   ,LAVA    ,EROCK   ,LAVA
		;Row 6
		.byte 	LAVA    ,CRYSTAL ,LAVA    ,CRYSTAL ,LAVA    ,CRYSTAL
		.byte 	LAVA    ,CRYSTAL ,LAVA    ,CRYSTAL ,LAVA    ,LAVA
		.byte 	MIROCK  ,EBNUM   ,EMPTY   ,EBRANGE ,LAVA    ,MONEY
		.byte 	LAVA    ,CRYSTAL ,LAVA    ,CRYSTAL ,LAVA    ,CRYSTAL
		.byte 	LAVA    ,EMPTY   ,LAVA    ,CRYSTAL ,LAVA    ,EMPTY
		;Row 7
		.byte 	EROCK   ,LAVA    ,EROCK   ,LAVA    ,EROCK   ,LAVA
		.byte 	LAVA    ,LAVA    ,EROCK   ,LAVA    ,EROCK   ,LAVA
		.byte 	LAVA    ,LAVA    ,EROCK   ,LAVA    ,EROCK   ,LAVA
		.byte 	EROCK   ,LAVA    ,EROCK   ,LAVA    ,EROCK   ,LAVA
		.byte 	LAVA    ,LAVA    ,EROCK   ,LAVA    ,LAVA    ,PBOMB10
		;Row 8
		.byte 	LAVA    ,CRYSTAL ,LAVA    ,CRYSTAL ,LAVA    ,LAVA
		.byte 	EROCK   ,CRYSTAL ,LAVA    ,MONEY   ,LAVA    ,CRYSTAL
		.byte 	LAVA    ,LAVA    ,LAVA    ,CRYSTAL ,LAVA    ,CRYSTAL
		.byte 	LAVA    ,MONEY   ,LAVA    ,CRYSTAL ,LAVA    ,MONEY
		.byte 	LAVA    ,CRYSTAL ,LAVA    ,CRYSTAL ,LAVA    ,CRYSTAL
		;Row 9
		.byte 	PBOMB10 ,LAVA    ,EROCK   ,LAVA    ,LAVA    ,CRYSTAL
		.byte 	LAVA    ,CRYSTAL ,EROCK   ,CRYSTAL ,LAVA    ,LAVA
		.byte 	EROCK   ,MONEY   ,LAVA    ,LAVA    ,EROCK   ,LAVA
		.byte 	EROCK   ,LAVA    ,EROCK   ,LAVA    ,EROCK   ,LAVA
		.byte 	EROCK   ,LAVA    ,EROCK   ,LAVA    ,EROCK   ,LAVA
		;Row 10
		.byte 	LAVA    ,CRYSTAL ,LAVA    ,LAVA    ,EROCK   ,LAVA
		.byte 	EROCK   ,CRYSTAL ,LAVA    ,LAVA    ,EROCK   ,LAVA
		.byte 	LAVA    ,CRYSTAL ,LAVA    ,CRYSTAL ,LAVA    ,CRYSTAL
		.byte 	LAVA    ,CRYSTAL ,LAVA    ,CRYSTAL ,LAVA    ,CRYSTAL
		.byte 	LAVA    ,CRYSTAL ,LAVA    ,CRYSTAL ,LAVA    ,CRYSTAL
		;Row 11
		.byte 	EROCK   ,LAVA    ,EROCK   ,CRYSTAL ,LAVA    ,CRYSTAL
		.byte 	LAVA    ,LAVA    ,EROCK   ,LAVA    ,LAVA    ,CRYSTAL
		.byte 	EROCK   ,LAVA    ,EROCK   ,LAVA    ,EROCK   ,LAVA
		.byte 	EROCK   ,LAVA    ,EROCK   ,LAVA    ,EROCK   ,LAVA
		.byte 	EROCK   ,LAVA    ,EROCK   ,LAVA    ,EROCK   ,CRYSTAL
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte  	EPROOF,7,8
		.byte 	EPROOF,26,12
		.byte 	EPROOF,15,9
		.byte 	CPROOF,12,4
		.byte 	CPROOF,28,5
		.byte 	CPROOF,17,8
		.byte  	LPROOF,3,7
		.byte 	LPROOF,13,10
		.byte 	LPROOF,25,5
		.byte 	LPROOF,17,7	
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	LAVA_MON,3,8,RIGHT
		.byte  	LAVA_MON,7,12,LEFT + CCW
		.byte 	LAVA_MON,10,6,UP
		.byte  	LAVA_MON,19,13,DOWN      
		.byte 	LAVA_MON,23,7,RIGHT + CCW
		.byte 	LAVA_MON,26,13,LEFT 
		.byte   	LAVA_MON,29,5,UP + CCW
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL60.LEV").
level37:
		;Difficulty level 1.
		.word  	265		;Time to complete.
		.byte 	32		;Gem quota.
		.byte 	12,8,RIGHT	;Robot start X,Y & direction.
		.byte 	3,13		;Exit square position.

		;Difficulty level 2.
		.word  	175		;Time to complete.
		.byte 	33		;Gem quota.
		.byte 	12,8,LEFT	;Robot start X,Y & direction.
		.byte 	10,5		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	HMUD    ,EMPTY   ,HMUD    ,HMUD    ,HMUD    ,EROCK
		.byte 	HROCK   ,SROCK   ,HROCK   ,IROCK   ,MRROCK  ,MRROCK
		.byte 	MRROCK  ,CRYSTAL ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,MRROCK  ,FROBOT  ,RPROOF  ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		;Row 2
		.byte 	HMUD    ,HMUD    ,HMUD    ,HMUD    ,HMUD    ,IROCK
		.byte 	MRROCK  ,EROCK   ,MIROCK  ,IROCK   ,MRROCK  ,MRROCK
		.byte 	MRROCK  ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,DIRT
		;Row 3
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	CRYSTAL ,SROCK   ,HDIRT   ,HDIRT   ,IROCK   ,MRROCK
		.byte 	IROCK   ,PBOMB10 ,CRYSTAL ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,EMPTY   ,MRROCK  ,IROCK   ,MRROCK  ,PBOMB3
		.byte 	HMUD    ,HMUD    ,HMUD    ,HMUD    ,HMUD    ,DIRT
		;Row 4
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,IROCK
		.byte 	HROCK   ,HDIRT   ,IROCK   ,IROCK   ,IROCK   ,EROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,EMPTY   ,HDIRT   ,CRYSTAL ,HDIRT   ,HDIRT
		.byte 	HMUD    ,HMUD    ,HMUD    ,HMUD    ,HMUD    ,DIRT
		;Row 5
		.byte 	DIRT    ,IROCK   ,EMPTY   ,IROCK   ,DIRT    ,IROCK
		.byte 	MIROCK  ,HDIRT   ,IROCK   ,DIRT    ,EROCK   ,DIRT
		.byte 	EROCK   ,DIRT    ,IROCK   ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,EROCK   ,DIRT    ,DIRT    ,EROCK   ,DIRT
		.byte 	HROCK   ,DIRT    ,DIRT    ,MONEY   ,HROCK   ,DIRT
		;Row 6
		.byte 	DIRT    ,EMPTY   ,HDIRT   ,EMPTY   ,DIRT    ,IROCK
		.byte 	SROCK   ,HDIRT   ,IROCK   ,EROCK   ,DIRT    ,EMPTY
		.byte 	DIRT    ,EROCK   ,IROCK   ,LAVA    ,LAVA    ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 7
		.byte 	DIRT    ,IROCK   ,DIRT    ,IROCK   ,DIRT    ,IROCK
		.byte 	SROCK   ,HDIRT   ,IROCK   ,DIRT    ,EROCK   ,DIRT
		.byte 	EROCK   ,DIRT    ,IROCK   ,DIRT    ,EROCK   ,DIRT
		.byte 	DIRT    ,DIRT    ,EROCK   ,EROCK   ,DIRT    ,DIRT
		.byte 	EROCK   ,EROCK   ,DIRT    ,DIRT    ,DIRT    ,EROCK
		;Row 8
		.byte 	IROCK   ,EMPTY   ,DIRT    ,DIRT    ,IROCK   ,IROCK
		.byte 	EROCK   ,EROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,DIRT    ,DIRT    ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT
		;Row 9
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,DIRT    ,MONEY   ,IROCK
		.byte 	DIRT    ,IROCK   ,DIRT    ,DIRT    ,DIRT    ,IROCK
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	EROCK   ,DIRT    ,EMPTY   ,EMPTY   ,DIRT    ,DIRT
		.byte 	DIRT    ,EMPTY   ,DIRT    ,EROCK   ,DIRT    ,DIRT
		;Row 10
		.byte 	EMPTY   ,IROCK   ,IROCK   ,IROCK   ,DIRT    ,IROCK
		.byte 	DIRT    ,IROCK   ,HMUD    ,IROCK   ,HMUD    ,IROCK
		.byte 	HMUD    ,IROCK   ,DIRT    ,DIRT    ,EROCK   ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,EROCK
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,EROCK
		;Row 11
		.byte 	HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,IROCK
		.byte 	DIRT    ,DIRT    ,DIRT    ,IROCK   ,DIRT    ,DIRT
		.byte 	DIRT    ,IROCK   ,DIRT    ,DIRT    ,LAVA    ,LAVA
		.byte 	LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA    ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	EPROOF,9,13
		.byte 	EPROOF,13,8
		.byte 	EXTRA,30,4
		.byte 	CPROOF,1,4
		.byte 	NEWLIST
		.byte 	EPROOF,9,13
		.byte 	EPROOF,11,8
		.byte 	EXTRA,30,4
		.byte 	CPROOF,1,4
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	HR_MON,2,2,DOWN
		.byte 	HR_MON,1,8,RIGHT + CCW
		.byte 	IR_MON,5,8,RIGHT
		.byte 	SR_MON,20,6,DOWN
		.byte 	LAVA_MON,21,11,RIGHT
		.byte 	IR_MON,26,11,LEFT

		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL32.LEV").
level38:
		;Difficulty level 1.
		.word  	350		;Time to complete.
		.byte 	15		;Gem quota.
		.byte 	3,7,RIGHT	;Robot start X,Y & direction.
		.byte 	22,7		;Exit square position.

		;Difficulty level 2.
		.word  	275		;Time to complete.
		.byte 	25		;Gem quota.
		.byte 	9,12,RIGHT	;Robot start X,Y & direction.
		.byte 	20,10		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK
		.byte 	RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK
		.byte 	RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK
		.byte 	RROCK   ,IROCK   ,IROCK   ,LAVA    ,LAVA    ,LAVA
		.byte 	LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA
		;Row 2
		.byte 	RROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,SROCK   ,EMPTY   ,RROCK
		.byte 	PBOMB10 ,PBOMB10 ,MONEY   ,MUD     ,MUD     ,MUD
		.byte 	MUD     ,MUD     ,MUD     ,MUD     ,MUD     ,LAVA
		;Row 3
		.byte 	RROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,RROCK
		.byte 	RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK
		.byte 	RROCK   ,SROCK   ,RROCK   ,RROCK   ,EMPTY   ,RROCK
		.byte 	RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK
		.byte 	RROCK   ,RROCK   ,RROCK   ,RROCK   ,MUD     ,LAVA
		;Row 4
		.byte 	RROCK   ,EBNUM   ,EBRANGE ,EBNUM   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,RROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,RROCK   ,EROCK   ,SROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,EROCK   ,RROCK   ,MUD     ,LAVA
		;Row 5
		.byte 	RROCK   ,EBRANGE ,EMPTY   ,EBRANGE ,EMPTY   ,RROCK
		.byte 	RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK
		.byte 	RROCK   ,EMPTY   ,EMPTY   ,RROCK   ,EMPTY   ,RROCK
		.byte 	EMPTY   ,RROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,RROCK   ,EROCK   ,RROCK   ,MUD     ,LAVA
		;Row 6
		.byte 	RROCK   ,EBNUM   ,EBRANGE ,EBNUM   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,RROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK
		.byte 	RROCK   ,RROCK   ,EROCK   ,EROCK   ,RROCK   ,RROCK
		;Row 7
		.byte 	RROCK   ,EMPTY   ,EBRANGE ,EBNUM   ,EMPTY   ,RROCK
		.byte 	RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK
		.byte 	RROCK   ,CPROOF  ,EMPTY   ,RROCK   ,EMPTY   ,RROCK
		.byte 	EMPTY   ,RROCK   ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,DIRT    ,RROCK   ,EROCK   ,RROCK   ,MUD
		;Row 8
		.byte 	RROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,RROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,RROCK   ,DIRT    ,RROCK   ,RROCK   ,RROCK
		.byte 	RROCK   ,RROCK   ,RROCK   ,EROCK   ,RROCK   ,MUD
		;Row 9
		.byte 	RROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,RROCK
		.byte 	RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK
		.byte 	RROCK   ,EMPTY   ,EMPTY   ,RROCK   ,EMPTY   ,RROCK
		.byte 	EMPTY   ,RROCK   ,SROCK   ,RROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,EROCK   ,EROCK   ,RROCK   ,MUD
		;Row 10
		.byte 	RROCK   ,SROCK   ,SROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,RROCK   ,LPROOF  ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,SROCK   ,MUD     ,RROCK   ,RROCK   ,RROCK
		.byte 	RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK   ,MUD
		;Row 11
		.byte 	RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK
		.byte 	RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK
		.byte 	RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK
		.byte 	RROCK   ,RROCK   ,MUD     ,MUD     ,MUD     ,MUD
		.byte 	SROCK   ,PBOMB1  ,SROCK   ,MUD     ,MUD     ,MUD
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	LPROOF,24,7
		.byte 	RPROOF,14,5
		.byte 	EPROOF,24,9
		.byte 	CPROOF,2,12
		.byte 	RPROOF,20,12
		.byte 	PBOMB10,27,4
		.byte 	PBOMB10,29,8
		.byte 	PBOMB1,3,12
		.byte 	FTIMER,23,10
		.byte 	MONEY,28,13
		.byte 	MONEY,21,3
		.byte 	PBOMB10,24,4
		.byte 	PBOMB3,30,13
		.byte 	MONEY,25,3
		.byte 	MONEY,21,13
		.byte 	EXTRA,18,9
		.byte 	NEWLIST
		.byte 	LPROOF,24,7
		.byte 	RPROOF,16,4
		.byte 	EPROOF,24,9
		.byte 	CPROOF,2,12
		.byte 	RPROOF,20,12
		.byte 	PBOMB10,27,4
		.byte 	PBOMB10,29,8
		.byte 	PBOMB1,14,5
		.byte 	FTIMER,23,10
		.byte 	MONEY,28,13
		.byte 	MONEY,21,3
		.byte 	PBOMB10,24,4
		.byte 	PBOMB3,30,13
		.byte 	MONEY,25,3
		.byte 	MONEY,21,13
		.byte 	EXTRA,18,9
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	SR_MON,13,6,LEFT 
		.byte 	SR_MON,13,8,LEFT + CCW
		.byte 	SR_MON,13,10,LEFT 
		.byte 	SR_MON,13,12,LEFT + CCW
		.byte 	RR_MON,18,8,RIGHT + CCW
		.byte 	RR_MON,18,10,LEFT   
                .byte 	RR_MON,16,8,LEFT 
		.byte 	GAS_MON,30,7,RIGHT
		.byte 	LAVA_MON,21,3,RIGHT
		.byte 	LAVA_MON,25,3,LEFT + CCW
		.byte 	MUD_MON,22,4,LEFT
		.byte 	MUD_MON,29,13,RIGHT + CCW	
		.byte 	NEWLIST
		.byte 	HR_MON,13,6,LEFT 
		.byte 	HR_MON,13,8,LEFT + CCW
		.byte 	HR_MON,13,10,LEFT 
		.byte 	HR_MON,13,12,LEFT + CCW
		.byte 	RR_MON,18,8,RIGHT + CCW
		.byte 	RR_MON,18,10,LEFT   
                .byte 	RR_MON,16,8,LEFT 
		.byte 	GAS_MON,15,7,RIGHT
		.byte 	LAVA_MON,21,3,RIGHT
		.byte 	LAVA_MON,25,3,LEFT + CCW
		.byte 	MUD_MON,22,4,LEFT
		.byte 	MUD_MON,29,13,RIGHT + CCW	
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL33.LEV").
level39:
		;Difficulty level 1.
		.word  	350		;Time to complete.
		.byte 	30		;Gem quota.
		.byte 	5,3,LEFT	;Robot start X,Y & direction.
		.byte 	15,5		;Exit square position.

		;Difficulty level 2.
		.word  	300		;Time to complete.
		.byte 	38		;Gem quota.
		.byte 	5,3,RIGHT	;Robot start X,Y & direction.
		.byte 	27,4		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	HDIRT   ,HROCK   ,EROCK   ,EMPTY   ,EMPTY   ,HMUD
		.byte 	EMPTY   ,LPROOF  ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	IROCK   ,EMPTY   ,IROCK   ,IROCK   ,SROCK   ,SROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,LAVA    ,LAVA    ,LAVA
		;Row 2
		.byte 	HDIRT   ,EROCK   ,IROCK   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,MIROCK  ,MIROCK  ,IROCK   ,EMPTY
		.byte 	IROCK   ,IROCK   ,IROCK   ,RROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,EMPTY   ,SROCK   ,EMPTY   ,HDIRT   ,DIRT
		.byte 	EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,IROCK   ,EMPTY
		;Row 3
		.byte 	EMPTY   ,IROCK   ,EROCK   ,IROCK   ,MIROCK  ,IROCK
		.byte 	EMPTY   ,IROCK   ,CRYSTAL ,CRYSTAL ,IROCK   ,EMPTY
		.byte 	HROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HMUD    ,LAVA    ,IROCK   ,HROCK   ,IROCK   ,MIROCK
		.byte 	IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,HMUD    ,EMPTY
		;Row 4
		.byte 	EMPTY   ,IROCK   ,IROCK   ,EROCK   ,DIRT    ,IROCK
		.byte 	EMPTY   ,IROCK   ,CRYSTAL ,CRYSTAL ,IROCK   ,EMPTY
		.byte 	LAVA    ,EMPTY   ,IROCK   ,HMUD    ,IROCK   ,EMPTY
		.byte 	IROCK   ,LAVA    ,HMUD    ,DIRT    ,EMPTY   ,HDIRT
		.byte 	IROCK   ,EMPTY   ,HMUD    ,EMPTY   ,IROCK   ,EMPTY
		;Row 5
		.byte 	EMPTY   ,HMUD    ,EMPTY   ,DIRT    ,EMPTY   ,MRROCK
		.byte 	EMPTY   ,IROCK   ,CRYSTAL ,SROCK   ,MIROCK  ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,LPROOF  ,EMPTY   ,EMPTY
		.byte 	HMUD    ,EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	MRROCK  ,EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY
		;Row 6
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,HROCK   ,IROCK
		.byte 	EMPTY   ,IROCK   ,CRYSTAL ,DIRT    ,IROCK   ,IROCK
		.byte 	HMUD    ,IROCK   ,IROCK   ,EMPTY   ,IROCK   ,HMUD
		.byte 	IROCK   ,LAVA    ,MRROCK  ,EMPTY   ,IROCK   ,EMPTY
		.byte 	IROCK   ,EMPTY   ,HMUD    ,EMPTY   ,MRROCK  ,EMPTY
		;Row 7
		.byte 	EMPTY   ,MRROCK  ,EMPTY   ,EMPTY   ,DIRT    ,EMPTY
		.byte 	EMPTY   ,IROCK   ,CRYSTAL ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,HMUD    ,HMUD    ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	SROCK   ,LAVA    ,IROCK   ,EMPTY   ,HMUD    ,EMPTY
		.byte 	IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY
		;Row 8
		.byte 	EMPTY   ,IROCK   ,SROCK   ,IROCK   ,IROCK   ,HMUD
		.byte 	IROCK   ,IROCK   ,CRYSTAL ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,IROCK   ,HROCK   ,IROCK   ,HROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	HMUD    ,EMPTY   ,EMPTY   ,EMPTY   ,HMUD    ,EMPTY
		;Row 9
		.byte 	EMPTY   ,IROCK   ,HDIRT   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,LAVA    ,CRYSTAL ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,LAVA    ,LAVA    ,EMPTY   ,LAVA
		.byte 	EMPTY   ,EMPTY   ,HROCK   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	IROCK   ,IROCK   ,HROCK   ,IROCK   ,IROCK   ,EMPTY
		;Row 10
		.byte 	EMPTY   ,SROCK   ,IROCK   ,IROCK   ,IROCK   ,RROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,HMUD    ,EMPTY   ,HMUD
		.byte 	EMPTY   ,SROCK   ,MUD     ,DIRT    ,IROCK   ,RROCK
		.byte 	IROCK   ,DIRT    ,IROCK   ,EMPTY   ,HMUD    ,CRYSTAL
		.byte 	EMPTY   ,EMPTY   ,HDIRT   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 11
		.byte 	EMPTY   ,HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	CRYSTAL ,IROCK   ,IROCK   ,CRYSTAL ,CRYSTAL ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,CRYSTAL
		.byte 	CRYSTAL ,HMUD    ,LPROOF  ,IROCK   ,MUD     ,MUD
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	PBOMB10,1,3		
		.byte 	PBOMB10,27,11
		.byte 	PBOMB10,29,8
		.byte 	PBOMB10,6,3
		.byte 	PBOMB10,21,8
		.byte 	PBOMB10,10,8
		.byte 	EPROOF,10,7
		.byte 	RPROOF,27,8
		.byte 	CPROOF,23,9
		.byte 	EPROOF,24,3
		.byte 	RPROOF,18,8
		.byte 	EBNUM,3,10
		.byte 	EBRANGE,5,8
		.byte 	RPROOF,5,9
		.byte 	CPROOF,6,7
		.byte 	MONEY,18,12
		.byte 	MONEY,21,8
		.byte  	EXTRA,30,3
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	SR_MON,12,7,RIGHT
		.byte  	SR_MON,7,7,LEFT
		.byte 	HR_MON,8,11,LEFT + CCW
		.byte 	SR_MON,1,6,UP
		.byte 	HR_MON,1,11,DOWN
		.byte 	MUD_MON,9,13,RIGHT
		.byte 	MUD_MON,20,13,LEFT
		.byte 	HR_MON,22,8,UP
		.byte 	IR_MON,24,8,DOWN + CCW
		.byte 	LAVA_MON,26,5,UP
		.byte 	LAVA_MON,30,11,LEFT 
		.byte 	LAVA_MON,30,3,DOWN + CCW
		.byte 	HR_MON,28,10,LEFT + CCW
		.byte 	GAS_MON,30,3,RIGHT
		.byte 	MUD_MON,13,7,LEFT
		.byte 	SR_MON,5,13,RIGHT + CCW
		.byte 	NEWLIST
		.byte 	SR_MON,12,7,RIGHT
		.byte  	SR_MON,7,7,LEFT
		.byte 	MUD_MON,8,11,LEFT + CCW
		.byte 	SR_MON,1,6,UP
		.byte 	RR_MON,1,11,DOWN
		.byte 	LAVA_MON,9,13,RIGHT
		.byte 	MUD_MON,20,13,LEFT
		.byte 	HR_MON,22,8,UP
		.byte 	IR_MON,24,8,DOWN + CCW
		.byte 	LAVA_MON,26,5,UP
		.byte 	MUD_MON,30,11,LEFT 
		.byte 	LAVA_MON,30,3,DOWN + CCW
		.byte 	HR_MON,28,10,LEFT + CCW
		.byte 	GAS_MON,15,11,RIGHT
		.byte 	MUD_MON,13,7,LEFT
		.byte 	SR_MON,5,13,RIGHT + CCW
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL55.LEV").
level40:
		;Difficulty level 1.
		.word  	212		;Time to complete.
		.byte 	19		;Gem quota.
		.byte 	15,11,LEFT	;Robot start X,Y & direction.
		.byte 	30,7		;Exit square position.

		;Difficulty level 2.
		.word  	150		;Time to complete.
		.byte 	23		;Gem quota.
		.byte 	10,8,DOWN	;Robot start X,Y & direction.
		.byte 	1,11		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	EMPTY   ,HROCK   ,EMPTY   ,HDIRT   ,EMPTY   ,HDIRT
		.byte 	EMPTY   ,HDIRT   ,IROCK   ,MONEY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,RPROOF  ,EMPTY   ,MRROCK  ,HMUD    ,HMUD
		.byte 	HMUD    ,HMUD    ,HMUD    ,IROCK   ,MRROCK  ,CRYSTAL
		.byte 	MRROCK  ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,RPROOF
		;Row 2
		.byte 	IROCK   ,LAVA    ,IROCK   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	IROCK   ,PBOMB3  ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,HROCK   ,HROCK
		.byte 	HROCK   ,HROCK   ,HROCK   ,IROCK   ,MRROCK  ,MRROCK
		.byte 	MRROCK  ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 3
		.byte 	EROCK   ,HDIRT   ,CRYSTAL ,HDIRT   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,HDIRT   ,IROCK   ,MUD     ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,CRYSTAL ,IROCK   ,HROCK   ,HROCK
		.byte 	HROCK   ,HROCK   ,HROCK   ,IROCK   ,MRROCK  ,MRROCK
		.byte 	MRROCK  ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 4
		.byte 	IROCK   ,CRYSTAL ,HDIRT   ,CRYSTAL ,IROCK   ,EMPTY
		.byte 	IROCK   ,EMPTY   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,HROCK   ,HROCK
		.byte 	HROCK   ,HROCK   ,HROCK   ,IROCK   ,IROCK   ,MRROCK
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,IROCK
		;Row 5
		.byte 	EMPTY   ,HDIRT   ,LAVA    ,HDIRT   ,EMPTY   ,HDIRT
		.byte 	EMPTY   ,HDIRT   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	PBOMB3  ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,IROCK
		.byte 	CRYSTAL ,EROCK   ,EROCK   ,EMPTY   ,EMPTY   ,HDIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EROCK   ,EMPTY
		;Row 6
		.byte 	LPROOF  ,CRYSTAL ,IROCK   ,MONEY   ,IROCK   ,EMPTY
		.byte 	IROCK   ,EMPTY   ,SROCK   ,BOMB    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HDIRT
		.byte 	HDIRT   ,IROCK   ,IROCK   ,EROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HDIRT   ,DIRT    ,EROCK
		;Row 7
		.byte 	EMPTY   ,HDIRT   ,LAVA    ,HDIRT   ,EMPTY   ,HDIRT
		.byte 	EMPTY   ,HDIRT   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,PBOMB3  ,IROCK   ,EROCK   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,IROCK   ,CRYSTAL ,DIRT
		;Row 8
		.byte 	IROCK   ,CRYSTAL ,HDIRT   ,CRYSTAL ,IROCK   ,EMPTY
		.byte 	IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,IROCK   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,IROCK   ,EROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,IROCK
		;Row 9
		.byte 	EROCK   ,HDIRT   ,CRYSTAL ,HDIRT   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,HDIRT   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	EROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 10
		.byte 	IROCK   ,LAVA    ,IROCK   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	IROCK   ,PBOMB3  ,IROCK   ,RROCK   ,RROCK   ,RROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,EROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 11
		.byte 	EMPTY   ,HDIRT   ,EMPTY   ,HDIRT   ,EMPTY   ,HDIRT
		.byte 	EMPTY   ,HDIRT   ,IROCK   ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,HROCK   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	FTIMER,18,5
		.byte 	EXTRA,18,8
		.byte 	NEWLIST
		.byte 	FTIMER,23,4
		.byte 	EXTRA,15,5
		.byte 	PBOMB10,10,5
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	MUD_MON,5,5,DOWN
		.byte 	MUD_MON,5,11,UP
		.byte 	SR_MON,17,11,UP
		.byte 	HR_MON,25,13,LEFT
		.byte 	RR_MON,29,3,LEFT
		.byte 	NEWLIST
		.byte 	LAVA_MON,5,5,DOWN
		.byte 	LAVA_MON,5,11,UP
		.byte 	SR_MON,17,11,UP
		.byte 	HR_MON,25,13,LEFT
		.byte 	RR_MON,29,3,LEFT
		.byte 	SR_MON,13,5,DOWN
		.byte 	HR_MON,30,7,RIGHT

		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL61.LEV").
level41:
		;Difficulty level 1.
		.word  	162		;Time to complete.
		.byte 	17		;Gem quota.
		.byte 	1,8,RIGHT	;Robot start X,Y & direction.
		.byte 	19,3		;Exit square position.

		;Difficulty level 2.
		.word  	120		;Time to complete.
		.byte 	28		;Gem quota.
		.byte 	1,8,RIGHT	;Robot start X,Y & direction.
		.byte 	4,8		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	HMUD    ,HMUD    ,HMUD    ,IROCK   ,DIRT    ,DIRT
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT
		;Row 2
		.byte 	EMPTY   ,IROCK   ,HDIRT   ,IROCK   ,IROCK   ,EMPTY
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,EMPTY   ,IROCK
		.byte 	IROCK   ,CRYSTAL ,IROCK   ,IROCK   ,EMPTY   ,IROCK
		.byte 	HMUD    ,HMUD    ,HMUD    ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,EMPTY   ,IROCK   ,IROCK   ,EMPTY   ,DIRT
		;Row 3
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,HDIRT   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	HMUD    ,HMUD    ,HMUD    ,IROCK   ,DIRT    ,DIRT
		.byte 	DIRT    ,EMPTY   ,CRYSTAL ,EMPTY   ,EMPTY   ,EMPTY
		;Row 4
		.byte 	EMPTY   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,EMPTY
		.byte 	IROCK   ,IROCK   ,EMPTY   ,HDIRT   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY
		;Row 5
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,CRYSTAL ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,CRYSTAL ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HDIRT
		.byte 	EMPTY   ,IROCK   ,HDIRT   ,EMPTY   ,CRYSTAL ,EMPTY
		;Row 6
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HDIRT   ,IROCK   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,HDIRT
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HDIRT   ,IROCK   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,HDIRT   ,CRYSTAL
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY
		;Row 7
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,CRYSTAL
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,CRYSTAL
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,HDIRT   ,EMPTY
		;Row 8
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,IROCK   ,EMPTY   ,CRYSTAL ,EMPTY   ,IROCK
		.byte 	EMPTY   ,HDIRT   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,HDIRT   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 9
		.byte 	EMPTY   ,CRYSTAL ,EMPTY   ,CRYSTAL ,IROCK   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,HDIRT   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,IROCK   ,EMPTY   ,DIRT
		;Row 10
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,IROCK   ,HDIRT   ,IROCK   ,EMPTY   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,HDIRT   ,EMPTY   ,IROCK   ,IROCK   ,HDIRT
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,DIRT
		;Row 11
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,PBOMB10
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,DIRT
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	MONEY,22,4
		.byte 	EBNUM,30,3
		.byte 	EBRANGE,30,4
		.byte 	EXTRA,23,8
		.byte 	NEWLIST
		.byte 	MONEY,22,3
		.byte 	EBNUM,20,11
		.byte 	EBRANGE,20,12
		.byte 	EXTRA,27,10

		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	IR_MON,1,4,UP + CCW
		.byte 	IR_MON,1,6,UP + CCW
		.byte 	IR_MON,3,11,DOWN + CCW
		.byte 	IR_MON,5,12,DOWN + CCW
		.byte 	IR_MON,9,10,UP
		.byte 	IR_MON,11,9,DOWN
		.byte 	IR_MON,11,12,UP + CCW
		.byte 	IR_MON,16,5,LEFT + CCW
		.byte 	IR_MON,17,7,UP
		.byte 	IR_MON,19,9,UP + CCW
		.byte 	IR_MON,21,12,DOWN + CCW
		.byte 	IR_MON,23,13,LEFT + CCW
		.byte 	IR_MON,25,7,UP
		.byte 	IR_MON,27,3,RIGHT + CCW
		.byte 	IR_MON,30,9,DOWN + CCW
		.byte 	IR_MON,28,13,RIGHT
		.byte 	NEWLIST
		.byte 	RR_MON,1,4,DOWN
		.byte 	IR_MON,1,6,DOWN
		.byte 	IR_MON,3,11,UP
		.byte 	RR_MON,5,12,UP
		.byte 	IR_MON,9,10,DOWN + CCW
		.byte 	IR_MON,11,9,UP + CCW
		.byte 	RR_MON,11,12,DOWN
		.byte 	IR_MON,16,5,RIGHT
		.byte 	IR_MON,17,7,DOWN + CCW
		.byte 	RR_MON,19,9,DOWN
		.byte 	IR_MON,21,12,UP
		.byte 	IR_MON,23,13,RIGHT
		.byte 	RR_MON,25,7,DOWN + CCW
		.byte 	IR_MON,27,3,LEFT
		.byte 	IR_MON,30,9,UP
		.byte 	RR_MON,28,13,LEFT + CCW

		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL29.LEV").
level42:
		;Difficulty level 1.
		.word  	350		;Time to complete.
		.byte 	35		;Gem quota.
		.byte 	9,10,RIGHT	;Robot start X,Y & direction.
		.byte 	27,4		;Exit square position.

		;Difficulty level 2.
		.word  	270		;Time to complete.
		.byte 	70		;Gem quota.
		.byte 	8,8,RIGHT	;Robot start X,Y & direction.
		.byte 	17,13		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	PBOMB10 ,EMPTY   ,EMPTY   ,PBOMB10 ,EMPTY   ,LAVA
		.byte 	EMPTY   ,MUD     ,MUD     ,MUD     ,MUD     ,MUD
		.byte 	MUD     ,MUD     ,MUD     ,MUD     ,MUD     ,MUD
		.byte 	MUD     ,MUD     ,MUD     ,MUD     ,LAVA    ,LAVA
		.byte 	EMPTY   ,PBOMB10 ,EMPTY   ,LAVA    ,LAVA    ,EMPTY
		;Row 2
		.byte 	EMPTY   ,LAVA    ,LAVA    ,EMPTY   ,LAVA    ,LAVA
		.byte 	EMPTY   ,MRROCK  ,MUD     ,HROCK   ,MUD     ,MRROCK
		.byte 	MUD     ,HROCK   ,MUD     ,MRROCK  ,MUD     ,HROCK
		.byte 	MUD     ,MRROCK  ,MUD     ,HROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 3
		.byte 	MUD     ,MUD     ,MUD     ,MUD     ,MUD     ,MUD
		.byte 	EMPTY   ,EMPTY   ,LAVA    ,LAVA    ,LAVA    ,LAVA
		.byte 	LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA
		.byte 	EMPTY   ,LAVA    ,EMPTY   ,LAVA    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,MUD     ,MUD     ,MUD     ,MUD
		;Row 4
		.byte 	MUD     ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	LAVA    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	PBOMB10 ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,MUD
		;Row 5
		.byte 	MUD     ,EMPTY   ,EMPTY   ,LAVA    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,PBOMB10 ,MUD
		;Row 6
		.byte 	MUD     ,EMPTY   ,PBOMB10 ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,PBOMB10 ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,MUD
		;Row 7
		.byte 	MUD     ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,MUD
		;Row 8
		.byte 	MUD     ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	PBOMB10 ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,MUD
		;Row 9
		.byte 	MUD     ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,MUD
		;Row 10
		.byte 	EMPTY   ,LAVA    ,LAVA    ,EMPTY   ,LAVA    ,LAVA
		.byte 	LAVA    ,EMPTY   ,EMPTY   ,EMPTY   ,LAVA    ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,PBOMB10 ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,PBOMB10 ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 11
		.byte 	LAVA    ,MIROCK  ,EMPTY   ,PBOMB10 ,EMPTY   ,LAVA
		.byte 	LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA    ,MIROCK
		.byte 	LAVA    ,LAVA    ,LAVA    ,LAVA    ,MIROCK  ,PBOMB10
		.byte 	EMPTY   ,EMPTY   ,LAVA    ,LAVA    ,MIROCK  ,LAVA
		.byte 	EMPTY   ,LAVA    ,EMPTY   ,PBOMB10 ,EMPTY   ,LAVA
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	EPROOF,14,12
		.byte 	EBNUM,3,5
		.byte 	EPROOF,4,3
		.byte 	PBOMB10,26,3
		.byte 	PBOMB10,12,4
		.byte 	PBOMB3,18,4
		.byte 	CPROOF,4,7
		.byte 	FTIMER,30,3
		.byte 	FTIMER,30,13
		.byte 	FTIMER,8,13
		.byte 	CPROOF,24,4
		.byte 	LPROOF,21,13
		.byte 	LPROOF,2,13
		.byte 	MONEY,8,13
		.byte 	LPROOF,12,13
		.byte 	RPROOF,16,13
		.byte 	EBRANGE,20,13
		.byte 	EPROOF,26,8
		.byte 	NEWLIST
		.byte 	EPROOF,3,5
		.byte 	EBNUM,14,12
		.byte 	EPROOF,26,3
		.byte 	PBOMB10,4,3
		.byte 	PBOMB10,12,4
		.byte 	CPROOF,30,3
		.byte 	FTIMER,4,7
		.byte 	FTIMER,30,13
		.byte 	FTIMER,8,13
		.byte 	CPROOF,24,4
		.byte 	LPROOF,21,13
		.byte 	LPROOF,2,13
		.byte 	MONEY,16,13
		.byte 	LPROOF,12,13
		.byte 	RPROOF,8,13
		.byte 	EBRANGE,20,13
		.byte 	EPROOF,26,8
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	LAVA_MON,25,13,RIGHT
		.byte 	LAVA_MON,15,8,LEFT + CCW
		.byte 	LAVA_MON,30,3,LEFT
		.byte 	LAVA_MON,30,13,RIGHT + CCW
		.byte 	LAVA_MON,15,13,LEFT
		.byte 	LAVA_MON,1,3,RIGHT + CCW
		.byte 	LAVA_MON,11,3,RIGHT + CCW
		.byte 	LAVA_MON,18,3,LEFT
		.byte 	CONTLIST
		.byte 	LAVA_MON,2,8,DOWN
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL53.LEV").
level43:
		;Difficulty level 1.
		.word  	210		;Time to complete.
		.byte 	2		;Gem quota.
		.byte 	15,13,UP	;Robot start X,Y & direction.
		.byte 	14,3		;Exit square position.

		;Difficulty level 2.
		.word  	140		;Time to complete.
		.byte 	2		;Gem quota.
		.byte 	15,13,DOWN	;Robot start X,Y & direction.
		.byte 	15,13		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	MONEY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,IROCK
		.byte 	IROCK   ,DIRT    ,IROCK   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,PBOMB3  ,IROCK   ,IROCK   ,EBRANGE
		.byte 	IROCK   ,IROCK   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 2
		.byte 	FROBOT  ,IROCK   ,EMPTY   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,SROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,DIRT    ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY
		;Row 3
		.byte 	HDIRT   ,HDIRT   ,EMPTY   ,EMPTY   ,EROCK   ,EMPTY
		.byte 	IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,IROCK
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,IROCK
		.byte 	IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY
		;Row 4
		.byte 	IROCK   ,EMPTY   ,IROCK   ,IROCK   ,IROCK   ,EMPTY
		.byte 	EROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	EMPTY   ,HROCK   ,HROCK   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,SROCK   ,EMPTY
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY
		;Row 5
		.byte 	IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,HDIRT   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,HDIRT   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,EMPTY
		.byte 	IROCK   ,EMPTY   ,IROCK   ,IROCK   ,IROCK   ,MRROCK
		;Row 6
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY
		.byte 	IROCK   ,HDIRT   ,HDIRT   ,HDIRT   ,EMPTY   ,IROCK
		.byte 	IROCK   ,IROCK   ,EMPTY   ,IROCK   ,IROCK   ,IROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,DIRT
		;Row 7
		.byte 	IROCK   ,IROCK   ,IROCK   ,DIRT    ,IROCK   ,EMPTY
		.byte 	IROCK   ,IROCK   ,IROCK   ,IROCK   ,EMPTY   ,IROCK
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,PBOMB3  ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	IROCK   ,DIRT    ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY
		;Row 8
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,DIRT    ,IROCK   ,EMPTY
		.byte 	RROCK   ,EROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,IROCK   ,IROCK
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY
		;Row 9
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,IROCK   ,IROCK   ,IROCK
		.byte 	DIRT    ,IROCK   ,EMPTY   ,IROCK   ,EMPTY   ,IROCK
		.byte 	RROCK   ,DIRT    ,RROCK   ,DIRT    ,RROCK   ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,IROCK   ,EMPTY   ,IROCK   ,EMPTY
		;Row 10
		.byte 	EMPTY   ,IROCK   ,IROCK   ,IROCK   ,EMPTY   ,DIRT
		.byte 	DIRT    ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,IROCK
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,IROCK   ,IROCK
		.byte 	HDIRT   ,IROCK   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY
		;Row 11
		.byte 	CRYSTAL ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	DIRT    ,IROCK   ,IROCK   ,IROCK   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,DIRT    ,EMPTY   ,IROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,MONEY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,IROCK   ,IROCK   ,CRYSTAL
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	CPROOF,6,12
		.byte 	EBNUM,13,9
		.byte 	FROBOT,14,13
		.byte 	FROBOT,16,13
		.byte 	EPROOF,14,3
		.byte 	EXTRA,2,5
		.byte 	NEWLIST
		.byte 	CPROOF,7,13
		.byte 	EBNUM,15,7
		.byte 	FROBOT,14,13
		.byte 	FROBOT,15,12
		.byte 	EPROOF,14,3
		.byte 	EXTRA,25,12
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	IR_MON,1,8,RIGHT
		.byte 	IR_MON,1,11,UP
		.byte 	IR_MON,1,12,UP
		.byte 	IR_MON,4,13,RIGHT
		.byte 	IR_MON,3,13,RIGHT
		.byte 	HR_MON,14,4,LEFT
		.byte 	SR_MON,13,13,UP
		.byte 	SR_MON,17,13,UP
		.byte 	LAVA_MON,20,8,RIGHT
		.byte 	HR_MON,24,13,RIGHT
		.byte 	SR_MON,21,4,UP
		.byte 	IR_MON,27,13,UP
		.byte 	GAS_MON,30,3,DOWN
		.byte 	NEWLIST
		.byte 	RR_MON,1,8,RIGHT
		.byte 	RR_MON,1,11,UP
		.byte 	RR_MON,1,12,UP
		.byte 	RR_MON,4,13,RIGHT
		.byte 	RR_MON,3,13,RIGHT
		.byte 	MUD_MON,14,4,LEFT
		.byte 	HR_MON,13,13,UP
		.byte 	SR_MON,17,13,UP
		.byte 	LAVA_MON,20,8,RIGHT
		.byte 	HR_MON,24,13,RIGHT
		.byte 	SR_MON,21,4,UP
		.byte 	HR_MON,27,13,UP
		.byte 	GAS_MON,30,3,DOWN
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL34.LEV").
level44:
		;Difficulty level 1.
		.word  	400		;Time to complete.
		.byte 	30		;Gem quota.
		.byte 	11,7,RIGHT	;Robot start X,Y & direction.
		.byte 	11,8		;Exit square position.

		;Difficulty level 2.
		.word  	280		;Time to complete.
		.byte 	36		;Gem quota.
		.byte 	14,8,RIGHT	;Robot start X,Y & direction.
		.byte 	21,13		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	IROCK   ,EROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EROCK   ,RROCK   ,DIRT
		.byte 	DIRT    ,EMPTY   ,EMPTY   ,EROCK   ,EMPTY   ,EMPTY
		.byte 	EROCK   ,SROCK   ,IROCK   ,EMPTY   ,EMPTY   ,HMUD
		.byte 	EMPTY   ,HMUD    ,EMPTY   ,HMUD    ,EMPTY   ,SROCK
		;Row 2
		.byte 	EROCK   ,IROCK   ,HMUD    ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EROCK   ,IROCK   ,EROCK   ,IROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,HDIRT   ,EMPTY   ,DIRT
		.byte 	HROCK   ,MIROCK  ,EROCK   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		;Row 3
		.byte 	DIRT    ,SROCK   ,IROCK   ,HMUD    ,EMPTY   ,EMPTY
		.byte 	MRROCK  ,EROCK   ,IROCK   ,DIRT    ,DIRT    ,DIRT
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HROCK
		.byte 	IROCK   ,EROCK   ,HMUD    ,EMPTY   ,IROCK   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,HMUD
		;Row 4
		.byte 	EMPTY   ,DIRT    ,EROCK   ,IROCK   ,HMUD    ,EMPTY
		.byte 	EROCK   ,IROCK   ,HMUD    ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	HMUD    ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	EROCK   ,HMUD    ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,DIRT    ,EMPTY   ,IROCK   ,HMUD    ,HMUD
		;Row 5
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,EMPTY   ,IROCK   ,EROCK
		.byte 	IROCK   ,HMUD    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,HROCK   ,IROCK   ,EROCK
		.byte 	HMUD    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,MRROCK  ,IROCK   ,HMUD    ,HMUD    ,HMUD
		;Row 6
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HDIRT   ,MIROCK
		.byte 	SROCK   ,EMPTY   ,EMPTY   ,HMUD    ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,EMPTY   ,HMUD
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,DIRT    ,EMPTY   ,EMPTY
		.byte 	EROCK   ,RROCK   ,MIROCK  ,DIRT    ,EMPTY   ,EMPTY
		;Row 7
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,IROCK
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,HMUD    ,IROCK   ,EMPTY   ,IROCK   ,EROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	IROCK   ,EROCK   ,IROCK   ,EROCK   ,EMPTY   ,PBOMB10
		;Row 8
		.byte 	EMPTY   ,EMPTY   ,DIRT    ,EMPTY   ,HMUD    ,EROCK
		.byte 	HMUD    ,IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,EMPTY   ,EMPTY   ,EROCK   ,MRROCK
		.byte 	HMUD    ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK
		.byte 	EMPTY   ,HMUD    ,EMPTY   ,IROCK   ,EMPTY   ,PBOMB10
		;Row 9
		.byte 	EMPTY   ,SROCK   ,IROCK   ,IROCK   ,EMPTY   ,HDIRT
		.byte 	EMPTY   ,EMPTY   ,IROCK   ,HMUD    ,CRYSTAL ,HMUD
		.byte 	IROCK   ,HMUD    ,EMPTY   ,HMUD    ,HMUD    ,IROCK
		.byte 	IROCK   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,HMUD
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,IROCK   ,PBOMB10
		;Row 10
		.byte 	EMPTY   ,HMUD    ,EROCK   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EROCK   ,IROCK   ,HMUD    ,IROCK
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,IROCK   ,EROCK   ,IROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,HROCK   ,IROCK
		;Row 11
		.byte 	IROCK   ,EMPTY   ,HDIRT   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,HDIRT   ,HROCK   ,IROCK   ,EMPTY
		.byte 	EMPTY   ,HMUD    ,HMUD    ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,SROCK   ,MIROCK  ,SROCK   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,HMUD    ,HMUD    ,EMPTY   ,DIRT    ,PBOMB1
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	RPROOF,10,13
		.byte 	RPROOF,25,8
		.byte 	PBOMB1,2,3
		.byte 	PBOMB1,12,11
		.byte 	PBOMB3,30,3
		.byte 	MONEY,28,8
		.byte 	CPROOF,24,3
		.byte 	MONEY,5,10
		.byte 	MONEY,6,10
		.byte 	MONEY,7,10
		.byte 	MONEY,26,13
		.byte 	MONEY,28,3
		.byte 	MONEY,20,6
		.byte 	MONEY,16,11
		.byte 	CPROOF,16,4
		.byte 	EPROOF,12,5
		.byte 	EPROOF,10,8
		.byte 	EPROOF,22,8
		.byte 	CPROOF,7,8
		.byte 	EBRANGE,2,5
		.byte 	EBNUM,3,10
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	SR_MON,17,11,LEFT + CCW 
        	.byte 	SR_MON,12,6,RIGHT
		.byte 	SR_MON,5,13,RIGHT + CCW
		.byte 	SR_MON,7,11,LEFT
		.byte 	HR_MON,4,9,LEFT + CCW
		.byte 	SR_MON,1,6,RIGHT
		.byte 	MUD_MON,5,3,RIGHT
		.byte 	SR_MON,5,4,RIGHT
		.byte 	SR_MON,14,3,RIGHT + CCW
		.byte 	SR_MON,18,4,LEFT
		.byte 	MUD_MON,16,13,LEFT
		.byte 	SR_MON,25,3,LEFT
		.byte 	MUD_MON,22,6,LEFT
		.byte 	RR_MON,30,9,RIGHT + CCW
		.byte 	SR_MON,27,3,RIGHT 
		.byte 	SR_MON,25,13,LEFT + CCW
		.byte 	NEWLIST
		.byte 	SR_MON,17,11,LEFT + CCW 
        	.byte 	SR_MON,12,6,RIGHT
		.byte 	SR_MON,5,13,RIGHT + CCW
		.byte 	HR_MON,7,11,LEFT
		.byte 	HR_MON,4,9,LEFT + CCW
		.byte 	HR_MON,1,6,RIGHT
		.byte 	LAVA_MON,5,3,RIGHT
		.byte 	HR_MON,5,4,RIGHT
		.byte 	SR_MON,14,3,RIGHT + CCW
		.byte 	SR_MON,18,4,LEFT
		.byte 	MUD_MON,16,13,LEFT
		.byte 	SR_MON,25,3,LEFT
		.byte 	MUD_MON,22,6,LEFT
		.byte 	RR_MON,30,9,RIGHT + CCW
		.byte 	SR_MON,27,3,RIGHT 
		.byte 	SR_MON,25,13,LEFT + CCW
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL59.LEV").
level45:
		;Difficulty level 1.
		.word  	117		;Time to complete.
		.byte 	12		;Gem quota.
		.byte 	1,12,RIGHT	;Robot start X,Y & direction.
		.byte 	1,7		;Exit square position.

		;Difficulty level 2.
		.word  	30		;Time to complete.
		.byte 	7		;Gem quota.
		.byte 	1,12,RIGHT	;Robot start X,Y & direction.
		.byte 	1,7		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA
		.byte 	LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA
		.byte 	LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA
		.byte 	LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA
		.byte 	LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA
		;Row 2
		.byte 	DIRT    ,IROCK   ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		;Row 3
		.byte 	DIRT    ,IROCK   ,IROCK   ,IROCK   ,IROCK   ,DIRT
		.byte 	IROCK   ,IROCK   ,IROCK   ,DIRT    ,IROCK   ,IROCK
		.byte 	IROCK   ,DIRT    ,IROCK   ,IROCK   ,IROCK   ,DIRT
		.byte 	IROCK   ,IROCK   ,IROCK   ,DIRT    ,IROCK   ,IROCK
		.byte 	IROCK   ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		;Row 4
		.byte 	DIRT    ,IROCK   ,IROCK   ,LPROOF  ,IROCK   ,CRYSTAL
		.byte 	IROCK   ,CPROOF  ,IROCK   ,CRYSTAL ,IROCK   ,EXTRA
		.byte 	IROCK   ,CRYSTAL ,IROCK   ,MONEY   ,IROCK   ,CRYSTAL
		.byte 	IROCK   ,MRROCK  ,IROCK   ,CRYSTAL ,IROCK   ,RPROOF
		.byte 	IROCK   ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		;Row 5
		.byte 	EROCK   ,IROCK   ,EROCK   ,EROCK   ,EROCK   ,DIRT
		.byte 	EROCK   ,EROCK   ,EROCK   ,EMPTY   ,EROCK   ,EROCK
		.byte 	EROCK   ,EMPTY   ,EROCK   ,EROCK   ,EROCK   ,EMPTY
		.byte 	EROCK   ,EROCK   ,EROCK   ,EMPTY   ,EROCK   ,EROCK
		.byte 	EROCK   ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		;Row 6
		.byte 	IROCK   ,IROCK   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT
		;Row 7
		.byte 	HDIRT   ,IROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK
		.byte 	RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK
		.byte 	RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK
		.byte 	RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK   ,RROCK
		.byte 	RROCK   ,IROCK   ,HDIRT   ,MIROCK  ,HDIRT   ,HDIRT
		;Row 8
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,MIROCK  ,CRYSTAL ,HDIRT
		;Row 9
		.byte 	EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK   ,EROCK
		.byte 	EROCK   ,EROCK   ,EMPTY   ,HDIRT   ,HDIRT   ,HDIRT
		;Row 10
		.byte 	EMPTY   ,DIRT    ,DIRT    ,CRYSTAL ,DIRT    ,DIRT
		.byte 	DIRT    ,CRYSTAL ,DIRT    ,DIRT    ,DIRT    ,CRYSTAL
		.byte 	DIRT    ,DIRT    ,DIRT    ,CRYSTAL ,DIRT    ,DIRT
		.byte 	DIRT    ,CRYSTAL ,DIRT    ,DIRT    ,DIRT    ,CRYSTAL
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		;Row 11
		.byte 	LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA
		.byte 	LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA
		.byte 	LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA
		.byte 	LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA
		.byte 	LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA    ,LAVA
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	FROBOT,12,7
		.byte 	CONTLIST
		.byte 	MONEY,1,9
		.byte 	FTIMER,28,5
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	IR_MON,1,10,RIGHT + CCW
		.byte 	IR_MON,24,10,LEFT + CCW
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL36.LEV").
level46:
		;Difficulty level 1.
		.word  	425		;Time to complete.
		.byte 	35		;Gem quota.
		.byte 	14,13,RIGHT	;Robot start X,Y & direction.
		.byte 	3,4		;Exit square position.

		;Difficulty level 2.
		.word  	375		;Time to complete.
		.byte 	45		;Gem quota.
		.byte 	15,13,RIGHT	;Robot start X,Y & direction.
		.byte 	16,12		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	EMPTY   ,CRYSTAL ,HROCK   ,EMPTY   ,CRYSTAL ,SROCK
		.byte 	EMPTY   ,CRYSTAL ,SROCK   ,SROCK   ,HROCK   ,SROCK
		.byte 	EMPTY   ,CRYSTAL ,SROCK   ,SROCK   ,CRYSTAL ,SROCK
		.byte 	SROCK   ,EMPTY   ,HROCK   ,CRYSTAL ,EMPTY   ,SROCK
		.byte 	CRYSTAL ,EMPTY   ,SROCK   ,SROCK   ,CRYSTAL ,EMPTY
		;Row 2
		.byte 	SROCK   ,SROCK   ,SROCK   ,SROCK   ,SROCK   ,HROCK
		.byte 	SROCK   ,SROCK   ,HROCK   ,SROCK   ,SROCK   ,CRYSTAL
		.byte 	SROCK   ,SROCK   ,SROCK   ,SROCK   ,HROCK   ,SROCK
		.byte 	SROCK   ,SROCK   ,CRYSTAL ,SROCK   ,HROCK   ,SROCK
		.byte 	SROCK   ,SROCK   ,SROCK   ,HROCK   ,SROCK   ,SROCK
		;Row 3
		.byte 	MIROCK  ,HROCK   ,CRYSTAL ,MIROCK  ,SROCK   ,CRYSTAL
		.byte 	SROCK   ,SROCK   ,CRYSTAL ,HROCK   ,SROCK   ,HROCK
		.byte 	MIROCK  ,CRYSTAL ,HROCK   ,SROCK   ,SROCK   ,CRYSTAL
		.byte 	SROCK   ,HROCK   ,HROCK   ,SROCK   ,CRYSTAL ,HROCK
		.byte 	EROCK   ,HROCK   ,CRYSTAL ,MIROCK  ,HROCK   ,HROCK
		;Row 4
		.byte 	SROCK   ,SROCK   ,EROCK   ,HROCK   ,SROCK   ,EROCK
		.byte 	HROCK   ,SROCK   ,HROCK   ,SROCK   ,EROCK   ,SROCK
		.byte 	SROCK   ,SROCK   ,HROCK   ,SROCK   ,HROCK   ,SROCK
		.byte 	EROCK   ,HROCK   ,SROCK   ,CRYSTAL ,EROCK   ,SROCK
		.byte 	SROCK   ,SROCK   ,HROCK   ,EROCK   ,HROCK   ,EROCK
		;Row 5
		.byte 	EROCK   ,HROCK   ,SROCK   ,SROCK   ,SROCK   ,CRYSTAL
		.byte 	MIROCK  ,HROCK   ,SROCK   ,CRYSTAL ,HROCK   ,SROCK
		.byte 	SROCK   ,HROCK   ,SROCK   ,CRYSTAL ,SROCK   ,EROCK
		.byte 	SROCK   ,CRYSTAL ,HROCK   ,EROCK   ,CRYSTAL ,HROCK
		.byte 	CRYSTAL ,SROCK   ,EROCK   ,SROCK   ,EROCK   ,EROCK
		;Row 6
		.byte 	MRROCK  ,CRYSTAL ,SROCK   ,SROCK   ,HROCK   ,SROCK
		.byte 	SROCK   ,SROCK   ,SROCK   ,SROCK   ,SROCK   ,SROCK
		.byte 	HROCK   ,CRYSTAL ,SROCK   ,HROCK   ,HROCK   ,SROCK
		.byte 	EROCK   ,SROCK   ,SROCK   ,EROCK   ,SROCK   ,SROCK
		.byte 	HROCK   ,SROCK   ,SROCK   ,MRROCK  ,HROCK   ,SROCK
		;Row 7
		.byte 	SROCK   ,SROCK   ,CRYSTAL ,SROCK   ,EROCK   ,SROCK
		.byte 	HROCK   ,CRYSTAL ,HROCK   ,SROCK   ,SROCK   ,SROCK
		.byte 	SROCK   ,HROCK   ,MRROCK  ,SROCK   ,CRYSTAL ,MIROCK
		.byte 	SROCK   ,SROCK   ,SROCK   ,CRYSTAL ,EROCK   ,CRYSTAL
		.byte 	EROCK   ,HROCK   ,SROCK   ,CRYSTAL ,EROCK   ,CRYSTAL
		;Row 8
		.byte 	HROCK   ,EROCK   ,HROCK   ,SROCK   ,CRYSTAL ,HROCK
		.byte 	SROCK   ,HROCK   ,SROCK   ,CRYSTAL ,HROCK   ,SROCK
		.byte 	SROCK   ,MIROCK  ,HROCK   ,SROCK   ,SROCK   ,SROCK
		.byte 	EROCK   ,CRYSTAL ,SROCK   ,EROCK   ,MIROCK  ,HROCK
		.byte 	HROCK   ,EROCK   ,SROCK   ,SROCK   ,SROCK   ,EROCK
		;Row 9
		.byte 	SROCK   ,MIROCK  ,SROCK   ,EROCK   ,SROCK   ,SROCK
		.byte 	CRYSTAL ,SROCK   ,HROCK   ,SROCK   ,SROCK   ,HROCK
		.byte 	CRYSTAL ,HROCK   ,SROCK   ,SROCK   ,HROCK   ,SROCK
		.byte 	HROCK   ,EROCK   ,SROCK   ,SROCK   ,HROCK   ,EROCK
		.byte 	SROCK   ,CRYSTAL ,EROCK   ,SROCK   ,EROCK   ,EROCK
		;Row 10
		.byte 	CRYSTAL ,SROCK   ,HROCK   ,MIROCK  ,CRYSTAL ,HROCK
		.byte 	SROCK   ,HROCK   ,SROCK   ,HROCK   ,CRYSTAL ,SROCK
		.byte 	HROCK   ,DIRT    ,DIRT    ,CRYSTAL ,SROCK   ,CRYSTAL
		.byte 	SROCK   ,HROCK   ,SROCK   ,HROCK   ,EROCK   ,SROCK
		.byte 	EROCK   ,HROCK   ,EROCK   ,SROCK   ,HROCK   ,EROCK
		;Row 11
		.byte 	SROCK   ,CRYSTAL ,HROCK   ,SROCK   ,HROCK   ,HROCK
		.byte 	SROCK   ,CRYSTAL ,SROCK   ,HROCK   ,SROCK   ,SROCK
		.byte 	SROCK   ,EMPTY   ,EMPTY   ,SROCK   ,SROCK   ,HROCK
		.byte 	HROCK   ,CRYSTAL ,SROCK   ,SROCK   ,HROCK   ,SROCK
		.byte 	CRYSTAL ,EROCK   ,SROCK   ,CRYSTAL ,CRYSTAL ,SROCK
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	PBOMB10,13,13
		.byte 	EBNUM,1,5
		.byte 	EBNUM,25,5
		.byte 	EBRANGE,4,5
		.byte 	EBRANGE,28,5
		.byte  	PBOMB10,13,5
		.byte 	PBOMB10,7,9
		.byte 	PBOMB10,16,7
		.byte 	PBOMB10,20,8
		.byte 	PBOMB10,29,7
		.byte 	PBOMB3,5,8
		.byte 	EPROOF,8,6
		.byte 	EPROOF,15,7
		.byte 	EPROOF,28,5
		.byte 	EPROOF,20,8
		.byte 	EPROOF,9,9
		.byte 	PBOMB10,1,4
		.byte 	EBNUM,4,4
		.byte 	PBOMB3,7,4
		.byte 	PBOMB10,10,4
		.byte 	PBOMB3,13,4
		.byte 	PBOMB3,15,4
		.byte 	EBRANGE,18,4
		.byte 	PBOMB3,20,4
		.byte 	PBOMB10,23,4
		.byte 	PBOMB3,26,4
		.byte 	PBOMB10,30,4
		.byte 	EXTRA,2,12
		.byte 	NEWLIST
		.byte 	PBOMB10,13,13
		.byte 	EBNUM,1,5
		.byte 	EBNUM,25,5
		.byte 	EBRANGE,4,5
		.byte 	EBRANGE,16,7
		.byte  	PBOMB10,13,5
		.byte 	PBOMB10,7,9
		.byte 	PBOMB10,28,9
		.byte 	PBOMB10,20,5
		.byte 	PBOMB10,29,10
		.byte 	PBOMB3,15,5
		.byte 	EPROOF,8,6
		.byte 	EPROOF,5,5
		.byte 	EPROOF,28,5
		.byte 	EPROOF,20,8
		.byte 	EPROOF,9,9
		.byte 	PBOMB10,1,4
		.byte 	EBNUM,4,4
		.byte 	PBOMB3,7,4
		.byte 	PBOMB10,10,4
		.byte 	PBOMB3,13,4
		.byte 	PBOMB3,15,4
		.byte 	EBRANGE,18,4
		.byte 	PBOMB3,20,4
		.byte 	PBOMB10,23,4
		.byte 	PBOMB3,26,4
		.byte 	PBOMB10,30,4
		.byte 	EXTRA,29,11
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	SR_MON,1,3,RIGHT
		.byte 	HR_MON,7,3,LEFT
		.byte 	IR_MON,13,3,RIGHT + CCW
		.byte 	SR_MON,20,3,LEFT + CCW
		.byte 	SR_MON,26,3,RIGHT
		.byte  	HR_MON,30,3,RIGHT + CCW
		.byte 	LAVA_MON,23,3,LEFT
		.byte 	MUD_MON,4,3,RIGHT
		.byte 	NEWLIST
		.byte 	RR_MON,1,3,RIGHT
		.byte 	RR_MON,7,3,LEFT
		.byte 	SR_MON,13,3,RIGHT + CCW
		.byte 	SR_MON,20,3,LEFT + CCW
		.byte 	SR_MON,26,3,RIGHT
		.byte  	RR_MON,30,3,RIGHT + CCW
		.byte 	LAVA_MON,23,3,LEFT
		.byte 	MUD_MON,4,3,RIGHT
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL62.LEV").
level47:
		;Difficulty level 1.
		.word  	210		;Time to complete.
		.byte 	21		;Gem quota.
		.byte 	2,13,RIGHT	;Robot start X,Y & direction.
		.byte 	1,13		;Exit square position.

		;Difficulty level 2.
		.word  	150		;Time to complete.
		.byte 	25		;Gem quota.
		.byte 	2,13,RIGHT	;Robot start X,Y & direction.
		.byte 	1,13		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	EROCK   ,MUD     ,LAVA    ,MRROCK  ,LAVA    ,MUD
		.byte 	LAVA    ,MUD     ,LAVA    ,MIROCK  ,LAVA    ,HMUD
		.byte 	EROCK   ,MUD     ,LAVA    ,MUD     ,LAVA    ,MUD
		.byte 	LAVA    ,MIROCK  ,LAVA    ,MUD     ,LAVA    ,MRROCK
		.byte 	LAVA    ,MUD     ,EROCK   ,MUD     ,LAVA    ,MUD
		;Row 2
		.byte 	HMUD    ,LAVA    ,MUD     ,LAVA    ,MUD     ,LAVA
		.byte 	HMUD    ,EROCK   ,MUD     ,LAVA    ,MUD     ,LAVA
		.byte 	MUD     ,LAVA    ,MUD     ,LAVA    ,MUD     ,LAVA
		.byte 	MUD     ,LAVA    ,MUD     ,LAVA    ,MUD     ,LAVA
		.byte 	MUD     ,LAVA    ,HMUD    ,LAVA    ,MUD     ,LAVA
		;Row 3
		.byte 	LAVA    ,MUD     ,LAVA    ,MUD     ,LAVA    ,MUD
		.byte 	LAVA    ,MUD     ,LAVA    ,MUD     ,LAVA    ,MUD
		.byte 	LAVA    ,MUD     ,LAVA    ,HMUD    ,EROCK   ,MUD
		.byte 	LAVA    ,MUD     ,LAVA    ,HMUD    ,LAVA    ,MUD
		.byte 	LAVA    ,EROCK   ,LAVA    ,MUD     ,LAVA    ,MUD
		;Row 4
		.byte 	MUD     ,EROCK   ,HMUD    ,LAVA    ,MUD     ,LAVA
		.byte 	MUD     ,LAVA    ,MUD     ,LAVA    ,HMUD    ,LAVA
		.byte 	MUD     ,LAVA    ,HMUD    ,LAVA    ,MUD     ,LAVA
		.byte 	MUD     ,LAVA    ,MUD     ,LAVA    ,EROCK   ,LAVA
		.byte 	MUD     ,LAVA    ,HMUD    ,LAVA    ,HMUD    ,LAVA
		;Row 5
		.byte 	LAVA    ,MUD     ,LAVA    ,MUD     ,LAVA    ,EROCK
		.byte 	LAVA    ,MUD     ,LAVA    ,EROCK   ,LAVA    ,MUD
		.byte 	LAVA    ,MUD     ,EROCK   ,MUD     ,LAVA    ,MUD
		.byte 	LAVA    ,MUD     ,LAVA    ,MUD     ,LAVA    ,MUD
		.byte 	LAVA    ,MUD     ,LAVA    ,MUD     ,EROCK   ,MUD
		;Row 6
		.byte 	MUD     ,LAVA    ,MUD     ,LAVA    ,MUD     ,EMPTY
		.byte 	HMUD    ,LAVA    ,MUD     ,LAVA    ,MUD     ,LAVA
		.byte 	MUD     ,LAVA    ,MUD     ,LAVA    ,MUD     ,LAVA
		.byte 	MUD     ,LAVA    ,MUD     ,LAVA    ,MUD     ,LAVA
		.byte 	MUD     ,LAVA    ,MUD     ,LAVA    ,MUD     ,LAVA
		;Row 7
		.byte 	LAVA    ,MUD     ,LAVA    ,MUD     ,LAVA    ,MUD
		.byte 	LAVA    ,MUD     ,LAVA    ,MUD     ,LAVA    ,MUD
		.byte 	LAVA    ,MUD     ,LAVA    ,MUD     ,LAVA    ,MUD
		.byte 	LAVA    ,MUD     ,LAVA    ,MUD     ,LAVA    ,MUD
		.byte 	LAVA    ,MUD     ,LAVA    ,MUD     ,LAVA    ,MUD
		;Row 8
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 9
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		;Row 10
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,PBOMB10 ,EMPTY
		.byte 	PBOMB3  ,EMPTY   ,PBOMB3  ,EMPTY   ,PBOMB3  ,MONEY
		.byte 	PBOMB3  ,EMPTY   ,PBOMB3  ,EMPTY   ,PBOMB3  ,EPROOF
		;Row 11
		.byte 	FROBOT  ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,CRYSTAL ,MONEY   ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,EMPTY   ,PBOMB1  ,EMPTY   ,EPROOF  ,EMPTY
		.byte 	EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,EMPTY   ,CRYSTAL
		.byte 	CRYSTAL ,EMPTY   ,EMPTY   ,EMPTY   ,CRYSTAL ,CRYSTAL
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	PBOMB10,6,7
		.byte 	PBOMB10,23,6
		.byte 	PBOMB10,30,3
		.byte 	PBOMB10,10,3

		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	GAS_MON,2,1,DOWN
		.byte 	NEWLIST
		.byte 	GAS_MON,10,11,LEFT

		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL63.LEV").
level48:
		;Difficulty level 1.
		.word  	470		;Time to complete.
		.byte 	42		;Gem quota.
		.byte 	1,13,RIGHT	;Robot start X,Y & direction.
		.byte 	30,3		;Exit square position.

		;Difficulty level 2.
		.word  	340		;Time to complete.
		.byte 	52		;Gem quota.
		.byte 	1,13,RIGHT	;Robot start X,Y & direction.
		.byte 	1,3		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	EMPTY   ,CRYSTAL ,EMPTY   ,SROCK   ,EMPTY   ,CRYSTAL
		.byte 	EMPTY   ,HROCK   ,EMPTY   ,HROCK   ,EMPTY   ,HROCK
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,CRYSTAL ,EMPTY   ,SROCK
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,CRYSTAL ,EMPTY   ,HROCK
		.byte 	EMPTY   ,SROCK   ,MONEY   ,CRYSTAL ,EMPTY   ,EMPTY
		;Row 2
		.byte 	IROCK   ,CRYSTAL ,IROCK   ,HROCK   ,IROCK   ,HROCK
		.byte 	IROCK   ,SROCK   ,IROCK   ,HROCK   ,IROCK   ,HROCK
		.byte 	IROCK   ,SROCK   ,IROCK   ,CRYSTAL ,IROCK   ,CRYSTAL
		.byte 	IROCK   ,HROCK   ,IROCK   ,CRYSTAL ,IROCK   ,SROCK
		.byte 	IROCK   ,HROCK   ,IROCK   ,CRYSTAL ,IROCK   ,EMPTY
		;Row 3
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,SROCK   ,EMPTY   ,HROCK
		.byte 	MONEY   ,SROCK   ,EMPTY   ,CRYSTAL ,EMPTY   ,SROCK
		.byte 	EMPTY   ,CRYSTAL ,EMPTY   ,CRYSTAL ,EMPTY   ,HROCK
		.byte 	EMPTY   ,HROCK   ,EMPTY   ,CRYSTAL ,EMPTY   ,HROCK
		.byte 	EMPTY   ,HROCK   ,EMPTY   ,HROCK   ,EMPTY   ,EMPTY
		;Row 4
		.byte 	IROCK   ,HROCK   ,IROCK   ,CRYSTAL ,IROCK   ,SROCK
		.byte 	IROCK   ,HROCK   ,IROCK   ,HROCK   ,IROCK   ,SROCK
		.byte 	IROCK   ,SROCK   ,IROCK   ,HROCK   ,IROCK   ,HROCK
		.byte 	IROCK   ,HROCK   ,IROCK   ,CRYSTAL ,IROCK   ,HROCK
		.byte 	IROCK   ,CRYSTAL ,IROCK   ,SROCK   ,IROCK   ,EMPTY
		;Row 5
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,CRYSTAL ,EMPTY   ,HROCK
		.byte 	EMPTY   ,HROCK   ,EMPTY   ,HROCK   ,EMPTY   ,SROCK
		.byte 	EMPTY   ,CRYSTAL ,EMPTY   ,HROCK   ,MONEY   ,HROCK
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,CRYSTAL ,EMPTY   ,SROCK
		.byte 	EMPTY   ,HROCK   ,EMPTY   ,HROCK   ,EMPTY   ,EMPTY
		;Row 6
		.byte 	IROCK   ,CRYSTAL ,IROCK   ,CRYSTAL ,IROCK   ,HROCK
		.byte 	IROCK   ,SROCK   ,IROCK   ,CRYSTAL ,IROCK   ,HROCK
		.byte 	IROCK   ,HROCK   ,IROCK   ,CRYSTAL ,IROCK   ,CRYSTAL
		.byte 	IROCK   ,HROCK   ,IROCK   ,CRYSTAL ,IROCK   ,CRYSTAL
		.byte 	IROCK   ,SROCK   ,IROCK   ,SROCK   ,IROCK   ,EMPTY
		;Row 7
		.byte 	MONEY   ,HROCK   ,EMPTY   ,CRYSTAL ,EMPTY   ,SROCK
		.byte 	EMPTY   ,HROCK   ,EMPTY   ,CRYSTAL ,EMPTY   ,HROCK
		.byte 	EMPTY   ,CRYSTAL ,EMPTY   ,HROCK   ,EMPTY   ,SROCK
		.byte 	EMPTY   ,HROCK   ,EMPTY   ,CRYSTAL ,EMPTY   ,SROCK
		.byte 	MONEY   ,SROCK   ,EMPTY   ,HROCK   ,EMPTY   ,EMPTY
		;Row 8
		.byte 	IROCK   ,CRYSTAL ,IROCK   ,HROCK   ,IROCK   ,SROCK
		.byte 	IROCK   ,CRYSTAL ,IROCK   ,SROCK   ,IROCK   ,HROCK
		.byte 	IROCK   ,SROCK   ,IROCK   ,SROCK   ,IROCK   ,HROCK
		.byte 	IROCK   ,HROCK   ,IROCK   ,CRYSTAL ,IROCK   ,HROCK
		.byte 	IROCK   ,CRYSTAL ,IROCK   ,SROCK   ,IROCK   ,EMPTY
		;Row 9
		.byte 	EMPTY   ,CRYSTAL ,EMPTY   ,HROCK   ,EMPTY   ,HROCK
		.byte 	EMPTY   ,CRYSTAL ,EMPTY   ,HROCK   ,MONEY   ,SROCK
		.byte 	EMPTY   ,CRYSTAL ,EMPTY   ,HROCK   ,EMPTY   ,SROCK
		.byte 	EMPTY   ,HROCK   ,EMPTY   ,CRYSTAL ,EMPTY   ,HROCK
		.byte 	EMPTY   ,HROCK   ,EMPTY   ,HROCK   ,EMPTY   ,EMPTY
		;Row 10
		.byte 	IROCK   ,HROCK   ,IROCK   ,CRYSTAL ,IROCK   ,HROCK
		.byte 	IROCK   ,CRYSTAL ,IROCK   ,HROCK   ,IROCK   ,HROCK
		.byte 	IROCK   ,HROCK   ,IROCK   ,HROCK   ,IROCK   ,CRYSTAL
		.byte 	IROCK   ,SROCK   ,IROCK   ,CRYSTAL ,IROCK   ,HROCK
		.byte 	IROCK   ,SROCK   ,IROCK   ,CRYSTAL ,IROCK   ,EMPTY
		;Row 11
		.byte 	EMPTY   ,CRYSTAL ,EBRANGE ,CRYSTAL ,EBNUM   ,CRYSTAL
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,CRYSTAL ,EMPTY   ,SROCK
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,CRYSTAL ,EMPTY   ,SROCK
		.byte 	EMPTY   ,SROCK   ,EMPTY   ,CRYSTAL ,EMPTY   ,SROCK
		.byte 	EMPTY   ,CRYSTAL ,EMPTY   ,CRYSTAL ,EMPTY   ,EMPTY
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
		.byte 	EXTRA,26,9
		.byte 	NEWLIST
		.byte 	EXTRA,26,10

		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.

		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL64.LEV").
level49:
		;Difficulty level 1.
		.word  	369		;Time to complete.
		.byte 	14		;Gem quota.
		.byte 	30,3,LEFT	;Robot start X,Y & direction.
		.byte 	1,13		;Exit square position.

		;Difficulty level 2.
		.word  	239		;Time to complete.
		.byte 	31		;Gem quota.
		.byte 	1,13,RIGHT	;Robot start X,Y & direction.
		.byte 	30,3		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	LAVA    ,LAVA    ,HMUD    ,HMUD    ,HMUD    ,EBRANGE
		.byte 	DIRT    ,DIRT    ,HMUD    ,HMUD    ,LAVA    ,HDIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,HDIRT   ,LAVA
		.byte 	HDIRT   ,HDIRT   ,HDIRT   ,DIRT    ,EBRANGE ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,DIRT    ,PBOMB3  ,EMPTY
		;Row 2
		.byte 	LAVA    ,LAVA    ,HDIRT   ,HDIRT   ,HDIRT   ,DIRT
		.byte 	DIRT    ,PBOMB10 ,HDIRT   ,MONEY   ,LAVA    ,HDIRT
		.byte 	DIRT    ,EMPTY   ,DIRT    ,DIRT    ,HDIRT   ,LAVA
		.byte 	LAVA    ,LAVA    ,HDIRT   ,HDIRT   ,DIRT    ,DIRT
		.byte 	DIRT    ,EMPTY   ,CRYSTAL ,DIRT    ,DIRT    ,PBOMB3
		;Row 3
		.byte 	LPROOF  ,LAVA    ,LAVA    ,LAVA    ,HDIRT   ,DIRT
		.byte 	DIRT    ,DIRT    ,HDIRT   ,LAVA    ,LAVA    ,HDIRT
		.byte 	DIRT    ,CRYSTAL ,DIRT    ,HDIRT   ,HDIRT   ,LAVA
		.byte 	MONEY   ,LAVA    ,LAVA    ,HDIRT   ,DIRT    ,DIRT
		.byte 	PBOMB10 ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,MUD
		;Row 4
		.byte 	HDIRT   ,HDIRT   ,PBOMB3  ,LAVA    ,HDIRT   ,DIRT
		.byte 	DIRT    ,DIRT    ,HDIRT   ,LAVA    ,HDIRT   ,HDIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,HDIRT   ,LAVA    ,LAVA
		.byte 	HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,LAVA    ,LAVA    ,LAVA    ,HDIRT   ,MUD
		;Row 5
		.byte 	HMUD    ,HMUD    ,HDIRT   ,HDIRT   ,MONEY   ,DIRT
		.byte 	DIRT    ,DIRT    ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,HDIRT   ,MUD     ,HDIRT   ,LAVA    ,HDIRT
		.byte 	HDIRT   ,LPROOF  ,HDIRT   ,HDIRT   ,HDIRT   ,LAVA
		.byte 	LAVA    ,LAVA    ,HDIRT   ,HDIRT   ,HDIRT   ,MUD
		;Row 6
		.byte 	MUD     ,MUD     ,MUD     ,MUD     ,MUD     ,DIRT
		.byte 	EMPTY   ,DIRT    ,DIRT    ,DIRT    ,PBOMB10 ,HDIRT
		.byte 	LAVA    ,MONEY   ,LPROOF  ,HMUD    ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,EMPTY   ,CRYSTAL ,HDIRT   ,LAVA    ,LAVA
		.byte 	HDIRT   ,HDIRT   ,HDIRT   ,MUD     ,MUD     ,MUD
		;Row 7
		.byte 	MUD     ,DIRT    ,DIRT    ,DIRT    ,DIRT    ,DIRT
		.byte 	CRYSTAL ,DIRT    ,DIRT    ,DIRT    ,HDIRT   ,LAVA
		.byte 	LAVA    ,HMUD    ,MUD     ,MUD     ,HDIRT   ,PBOMB3
		.byte 	HDIRT   ,HDIRT   ,EMPTY   ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,MUD     ,MUD     ,MUD     ,MONEY   ,HMUD
		;Row 8
		.byte 	DIRT    ,HDIRT   ,HDIRT   ,HDIRT   ,DIRT    ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,HDIRT   ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,HDIRT   ,MUD     ,HMUD    ,HDIRT   ,HDIRT
		.byte 	HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,DIRT    ,DIRT
		.byte 	DIRT    ,EMPTY   ,DIRT    ,HMUD    ,HDIRT   ,HDIRT
		;Row 9
		.byte 	DIRT    ,HDIRT   ,LAVA    ,HDIRT   ,MUD     ,HDIRT
		.byte 	HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,HDIRT   ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,HDIRT   ,LAVA    ,LAVA
		.byte 	LAVA    ,LAVA    ,HDIRT   ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,HDIRT   ,HDIRT   ,LAVA
		;Row 10
		.byte 	PBOMB3  ,HDIRT   ,HDIRT   ,HDIRT   ,MUD     ,HDIRT
		.byte 	LAVA    ,LAVA    ,LAVA    ,HDIRT   ,DIRT    ,DIRT
		.byte 	EMPTY   ,CRYSTAL ,DIRT    ,HDIRT   ,LAVA    ,LPROOF
		.byte 	FTIMER  ,LAVA    ,HDIRT   ,DIRT    ,CRYSTAL ,EMPTY
		.byte 	PBOMB10 ,DIRT    ,HDIRT   ,HDIRT   ,LAVA    ,LAVA
		;Row 11
		.byte 	EMPTY   ,PBOMB3  ,DIRT    ,DIRT    ,MUD     ,HMUD
		.byte 	PBOMB10 ,LAVA    ,EMPTY   ,EMPTY   ,MONEY   ,DIRT
		.byte 	DIRT    ,DIRT    ,DIRT    ,HDIRT   ,LAVA    ,EPROOF
		.byte 	CPROOF  ,LAVA    ,HDIRT   ,DIRT    ,DIRT    ,DIRT
		.byte 	DIRT    ,DIRT    ,HDIRT   ,LAVA    ,LAVA    ,LAVA
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.

		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	LAVA_MON,6,8,UP
		.byte 	LAVA_MON,12,12,DOWN
		.byte 	LAVA_MON,13,4,LEFT
		.byte 	LAVA_MON,19,8,RIGHT
		.byte 	LAVA_MON,23,12,UP
		.byte 	LAVA_MON,26,4,DOWN
		.byte 	CONTLIST
		.byte 	GAS_MON,60,8,LEFT
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.


;-----START OF LEVEL (FROM "LEVEL30.LEV").
level50:
		;Difficulty level 1.
		.word  	300     	;Time to complete.
		.byte 	190		;Gem quota.
		.byte 	15,13,RIGHT	;Robot start X,Y & direction.
		.byte 	15,3		;Exit square position.

		;Difficulty level 2.
		.word  	265		;Time to complete.
		.byte 	215 		;Gem quota.
		.byte 	16,13,RIGHT	;Robot start X,Y & direction.
		.byte 	30,5		;Exit square position.

;-----START OF BACKGROUND DATA (inserted by GETLEV).
		;Row 1
		.byte 	MONEY   ,PBOMB10 ,EMPTY   ,EMPTY   ,PBOMB3  ,EMPTY
		.byte 	EMPTY   ,MONEY   ,PBOMB3  ,EMPTY   ,EMPTY   ,PBOMB3
		.byte 	EMPTY   ,PBOMB10 ,MONEY   ,EMPTY   ,EMPTY   ,PBOMB3
		.byte 	EMPTY   ,EMPTY   ,PBOMB3  ,MONEY   ,EMPTY   ,EMPTY
		.byte 	PBOMB3  ,EMPTY   ,EMPTY   ,PBOMB10 ,MONEY   ,EXTRA
		;Row 2
		.byte 	MIROCK  ,EMPTY   ,MIROCK  ,EMPTY   ,MIROCK  ,EMPTY
		.byte 	MIROCK  ,EMPTY   ,MIROCK  ,EMPTY   ,MIROCK  ,MRROCK
		.byte 	MIROCK  ,MRROCK  ,MIROCK  ,MRROCK  ,MIROCK  ,MRROCK
		.byte 	MIROCK  ,EMPTY   ,MIROCK  ,EMPTY   ,MIROCK  ,EMPTY
		.byte 	MIROCK  ,EMPTY   ,MIROCK  ,EMPTY   ,MIROCK  ,EMPTY
		;Row 3
		.byte 	CRYSTAL ,MUD     ,CRYSTAL ,MUD     ,CRYSTAL ,MUD
		.byte 	CRYSTAL ,MUD     ,CRYSTAL ,MUD     ,CRYSTAL ,MUD
		.byte 	CRYSTAL ,MUD     ,CRYSTAL ,MUD     ,CRYSTAL ,MUD
		.byte 	CRYSTAL ,MUD     ,CRYSTAL ,MUD     ,CRYSTAL ,MUD
		.byte 	CRYSTAL ,MUD     ,CRYSTAL ,MUD     ,CRYSTAL ,MUD
		;Row 4
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		;Row 5
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,SROCK   ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	SROCK   ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	SROCK   ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		;Row 6
		.byte 	CRYSTAL ,SROCK   ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,SROCK   ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		;Row 7
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,IROCK   ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,SROCK   ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,IROCK   ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		;Row 8
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,HROCK   ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,HROCK   ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,SROCK   ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,SROCK   ,CRYSTAL ,CRYSTAL
		;Row 9
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		;Row 10
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,IROCK   ,IROCK   ,IROCK   ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		;Row 11
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,EMPTY   ,EMPTY   ,EMPTY   ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
		.byte 	CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL ,CRYSTAL
;-----END OF BACKGROUND.

;-----HIDDEN OBJECTS LIST.
;Format:	.byte 	0,0,0			;Object #, X, Y.
                .byte 	LPROOF,14,5
		.byte 	LPROOF,20,5
		.byte 	CPROOF,10,5
		.byte 	CPROOF,22,5
                .byte 	EBRANGE,4,5
		.byte 	EBNUM,18,5
		.byte 	EPROOF,30,5
		.byte 	EPROOF,2,5
		.byte 	RPROOF,8,5
		.byte 	NEWLIST
                .byte 	LPROOF,20,5
		.byte 	LPROOF,14,5
		.byte 	CPROOF,22,5
		.byte 	CPROOF,10,5
                .byte 	EBRANGE,4,5
		.byte 	EBNUM,30,5
		.byte 	EPROOF,18,5
		.byte 	EPROOF,8,5
		.byte 	RPROOF,2,5
		.byte 	$ff			;End of list marker.

;-----CREATURE LIST.
;Format:	.byte 	0,0,0,0			;Creature #, X, Y, direction.
		.byte 	HR_MON,9,3,LEFT + CCW
		.byte 	RR_MON,30,3,RIGHT
		.byte 	HR_MON,6,3,RIGHT
		.byte 	RR_MON,15,3,LEFT + CCW
		.byte 	GAS_MON,30,3,LEFT 
		.byte 	LAVA_MON,21,3,RIGHT + CCW
  		.byte 	LAVA_MON,30,5,LEFT       
		.byte 	$ff			;End of list marker.

;-----END OF LEVEL.
