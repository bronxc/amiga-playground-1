����  m   b   b   b   b   b   b   b   b   bWORKSPACE	= $1a0000

	bra	yop
	lea	Module(pc),a0
	lea	WORKSPACE,a1
	move.l	a0,a2	
	lea	256(a0),a3

	lea	8(a0),a0
	lea	42(a1),a1
	moveq	#30,d0
MoveLp1	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	lea	22(a1),a1
	dbf	d0,MoveLp1

	lea	512(a0),a0
	lea	-22(a1),a1
	move.w	(a0)+,(a1)+
	moveq	#127,d0
MoveLp2	move.b	(a0)+,(a1)+
	dbf	d0,MoveLp2
	move.l	#"M.K.",(a1)+

	move.l	(a3)+,d0
	beq	NMrePtn
	lea	(a2,d0),a0

	move.l	#(64*4)-1,d7
DatLoop	moveq	#0,d0
	move.b	(a0),d0
	cmp.b	#$64,d0
	beq	NextTrk
	lsl.l	#8,d0
	move.b	1(a0),d0
	lsl.l	#8,d0
	move.b	2(a0),d0


	move.l	d0,(a1)		;;;;;;


	addq.l	#2,a0
NextTrk	addq.l	#1,a0
	addq.l	#4,a1
	dbf	d7,DatLoop

NMrePtn	rts

KFLoop3	move.l	#0,(a1)
	moveq	#0,d0
	moveq	#0,d1
	moveq	#0,d2

	move.b	1(a0),d2
	and.b	#$f,d2
	lsl.w	#8,d2
	move.b	2(a0),d2

	move.b	(a0),d1
	and.b	#%111111,d1

	move.b	(a0),d0
	lsr.b	#2,d0
	and.b	#%110000,d0
	move.b	1(a0),d3
	lsr.b	#4,d3
	or.b	d3,d0

	move.w	d2,2(a1)

	lea	PerTble(pc),a3
	sub.b	#1,d1
	bmi	NoPriod
	add.w	d1,d1
	move.w	(a3,d1),d1
	move.w	d1,(a1)

NoPriod:move.b	d0,d1
	and.b	#$f0,d0
	or.b	d0,(a1)
	lsl.b	#4,d1
	or.b	d1,2(a1)

	addq.l	#3,a0
	addq.l	#4,a1
	rts

;Periodtable for Tuning 0, Normal
PerTble:dc.w	856,808,762,720,678,640,604,570,538,508,480,453
	dc.w	428,404,381,360,339,320,302,285,269,254,240,226
	dc.w	214,202,190,180,170,160,151,143,135,127,120,113

Module	incbin	"DH1:mod.Thingg"

	dc.b	$3f,$0a,$04

yop	MOVEQ	#$00,D0
	MOVE.B	$0001(A5),D0
	LSR.W	#4,D0
	MOVE.B	(A5),D1
	ANDI.B	#$40,D1
	LSR.B	#2,D1
	OR.B	D1,D0
	TST.W	D0
	BEQ.B	LB_00AE
	MOVE.W	D0,$0012(A0)
	MOVE.W	D0,$0016(A0)
	SUBQ.W	#1,D0
	LSL.W	#4,D0
	MOVE.W	$0C(A3,D0.W),$001E(A0)
	MOVEQ	#$00,D1
	MOVE.W	$0E(A3,D0.W),D1
	LSL.W	#7,D1
	LEA	$001A07B4(PC),A4
	ADDA.L	D1,A4
	MOVE.L	A4,$0008(A0)
	MOVE.B	(A5),D1
	ANDI.W	#$003F,D1
	CMP.W	#$003F,D1
	BNE.B	LB_00AE
	MOVE.L	$0004(A0),A1
	MOVE.W	$0A(A3,D0.W),$0004(A1)
	MOVE.L	$06(A3,D0.W),(A1)




	END
	dc.b	$00,$00,$00,$b1
	dc.b	$00,$00,$01,$21
	dc.b	$00,$00,$01,$59
	dc.b	$64
	dc.b	$cf
	dc.b	$07
	dc.b	$3f,$0a,$04
	dc.b	$24,$0a,$04
	dc.b	$3f,$0a,$04
	dc.b	$64
	dc.b	$c7
	dc.b	$3f,$0a,$04
	dc.b	$24,$0a,$04
	dc.b	$3f,$0a,$04
	dc.b	$64
	dc.b	$c7
	dc.b	$3f,$0a,$04
	dc.b	$24,$0a,$04
	dc.b	$3f,$0a,$04
	dc.b	$64
	dc.b	$c7
	dc.b	$3f,$0a,$04
	dc.b	$24,$0a,$04
	dc.b	$3f,$0a,$04
	dc.b	$64
	dc.b	$c7
	dc.b	$3f,$0a,$04
	dc.b	$24,$0a
	dc.b	$04,$3f,$0a
	dc.b	$04,$64,$c7,$3f,$0a
	dc.b	$04,$24,$0a,$04,$3f,$0a,$04,$64
	dc.b	$c7,$3f,$0a,$04,$24,$0a,$04,$3f
	dc.b	$0a,$04,$64,$c7,$3f,$0a,$04,$24
	dc.b	$0a,$04,$3f,$0a,$04,$64,$c7,$3f
	dc.b	$0a,$04,$24,$0a,$04,$3f,$0a,$04
	dc.b	$64,$c7,$3f,$0a,$04,$24,$0a,$04
	dc.b	$3f,$0a,$04,$64,$c7,$3f,$0a,$04



LB_0000	MOVEQ	#$00,D0
	MOVE.W	D0,$0024(A0)
	MOVE.W	D0,$0026(A0)
	MOVE.W	D0,$002E(A0)
	MOVE.W	D0,$0038(A0)
	MOVE.W	D0,$0036(A0)
	MOVE.W	D0,$0020(A0)
	MOVE.W	D0,$0044(A0)
	MOVE.W	D0,$003E(A0)
	MOVE.W	D0,$0016(A0)
	MOVE.W	D0,$0018(A0)
	MOVE.W	D0,$001A(A0)
	SUBQ.W	#1,D0
	MOVE.W	D0,$0042(A0)
	MOVE.W	#$003F,$0014(A0)
	TST.W	$0046(A0)
	BNE.W	LB_0322
	MOVE.L	$0000(A0),A5
	MOVE.B	(A5),D0
	BTST	#$07,D0
	BNE.W	LB_033E
	MOVE.L	$0008(A0),A4
	MOVE.W	#$0003,$0032(A6)

	MOVEQ	#$00,D0
	MOVE.B	$0001(A5),D0
	LSR.W	#4,D0
	MOVE.B	(A5),D1
	ANDI.B	#$40,D1
	LSR.B	#2,D1
	OR.B	D1,D0
	TST.W	D0
	BEQ.B	LB_00AE
	MOVE.W	D0,$0012(A0)
	MOVE.W	D0,$0016(A0)
	SUBQ.W	#1,D0
	LSL.W	#4,D0
	MOVE.W	$0C(A3,D0.W),$001E(A0)
	MOVEQ	#$00,D1
	MOVE.W	$0E(A3,D0.W),D1
	LSL.W	#7,D1
	LEA	$001A07B4(PC),A4
	ADDA.L	D1,A4
	MOVE.L	A4,$0008(A0)
	MOVE.B	(A5),D1
	ANDI.W	#$003F,D1
	CMP.W	#$003F,D1
	BNE.B	LB_00AE
	MOVE.L	$0004(A0),A1
	MOVE.W	$0A(A3,D0.W),$0004(A1)
	MOVE.L	$06(A3,D0.W),(A1)
LB_00AE	MOVE.B	$0001(A5),D0
	ANDI.W	#$000F,D0
	MOVEQ	#$00,D1
	MOVE.B	$0002(A5),D1
	MOVE.W	D0,$0018(A0)
	MOVE.W	D1,$001A(A0)
	LEA	LB_00D0(PC),A1
	ADD.W	D0,D0
	ADD.W	D0,D0
	JMP	$00(A1,D0.W)
LB_00D0	BRA.W	LB_0110
	BRA.W	LB_0134
	BRA.W	LB_013E
	BRA.W	LB_0146
	BRA.W	LB_018C
	BRA.W	LB_01BE
	BRA.W	LB_01C6
	BRA.W	LB_01CE
	BRA.W	LB_01DC
	BRA.W	LB_0302
	BRA.W	LB_01E4
	BRA.W	LB_0206
	BRA.W	LB_0218
	BRA.W	LB_022A
	BRA.W	LB_024C
	BRA.W	LB_0234
LB_0110	TST.W	D1
	BEQ.W	LB_0302
	MOVE.W	D1,D2
	ANDI.W	#$000F,D1
	LSR.W	#4,D2
	MOVE.W	D1,$0028(A0)
	MOVE.W	D2,$002A(A0)
	MOVE.W	#$FFFF,$0026(A0)
	CLR.W	$002C(A0)
	BRA.W	LB_0302
LB_0134	NEG.W	D1
	MOVE.W	D1,$0024(A0)
	BRA.W	LB_0302
LB_013E	MOVE.W	D1,$0024(A0)
	BRA.W	LB_0302
LB_0146	MOVE.B	(A5),D0
	ANDI.W	#$003F,D0
	CMP.W	#$003F,D0
	BEQ.B	LB_0176
	MOVE.W	D0,$0010(A0)
	MOVE.W	D0,$0014(A0)
	ADD.W	D0,D0
	MOVE.W	$00(A4,D0.W),D0
	MOVE.W	D0,$003C(A0)
	TST.W	D1
	BEQ.B	LB_0182
	SUB.W	$001C(A0),D0
	BPL.B	LB_0170
	NEG.W	D1
LB_0170	MOVE.W	D1,$003A(A0)
	BRA.B	LB_0182
LB_0176	TST.W	$003A(A0)
	BPL.B	LB_017E
	NEG.W	D1
LB_017E	MOVE.W	D1,$003A(A0)
LB_0182	MOVE.W	#$FFFF,$0038(A0)
	BRA.W	LB_0314
LB_018C	MOVE.W	#$FFFF,$002E(A0)
	TST.W	D1
	BEQ.W	LB_0302
	MOVE.W	D1,D2
	ANDI.W	#$00F0,D2
	LSR.W	#4,D2
	ANDI.W	#$000F,D1
	LEA	$001A0FD4(PC),A1
	ADD.W	D1,D1
	MOVE.W	$00(A1,D1.W),D1
	MOVE.W	D1,$0034(A0)
	MOVE.W	D2,$0032(A0)
	CLR.W	$0030(A0)
	BRA.W	LB_0302
LB_01BE	MOVE.W	#$FFFF,$0038(A0)
	BRA.B	LB_01E4
LB_01C6	MOVE.W	#$FFFF,$002E(A0)
	BRA.B	LB_01E4
LB_01CE	MOVE.W	#$0002,$0032(A6)
	CLR.W	$001A(A0)
	BRA.W	LB_0302
LB_01DC	BSR.W	$0019FDBA
	BRA.W	LB_0302
LB_01E4	MOVE.W	#$FFFF,D7
	CMP.W	#$0010,D1
	BLT.B	LB_01F6
	MOVE.W	#$0001,D7
	LSR.W	#4,D1
	BRA.B	LB_01FA
LB_01F6	ANDI.W	#$000F,D1
LB_01FA	MOVE.W	D1,$0022(A0)
	MOVE.W	D7,$0020(A0)
	BRA.W	LB_0302
LB_0206	MOVE.W	#$FFFF,$0028(A6)
	MOVE.W	D1,$002A(A6)
	ADDQ.W	#1,$0036(A6)
	BRA.W	LB_0302
LB_0218	CMP.W	#$0040,D1
	BLE.B	LB_0222
	MOVE.W	#$0040,D1
LB_0222	MOVE.W	D1,$001E(A0)
	BRA.W	LB_0302
LB_022A	MOVE.W	#$FFFF,$0028(A6)
	BRA.W	LB_0302
LB_0234	CMP.W	#$0001,D1
	BGT.B	LB_0244
	TST.W	D1
	BEQ.W	LB_0302
	MOVE.W	#$0002,D1
LB_0244	MOVE.W	D1,$001A(A6)
	BRA.W	LB_0302
LB_024C	MOVE.W	D1,D0
	ANDI.W	#$000F,D1
	LSR.W	#4,D0
	LEA	LB_0260(PC),A1
	ADD.W	D0,D0
	ADD.W	D0,D0
	JMP	$00(A1,D0.W)
LB_0260	BRA.W	LB_02A0
	BRA.W	LB_02B8
	BRA.W	LB_02C6
	BRA.W	LB_0302
	BRA.W	LB_0302
	BRA.W	LB_0302
	BRA.W	LB_0302
	BRA.W	LB_0302
	BRA.W	LB_0302
	BRA.W	LB_02D2
	BRA.W	LB_02E0
	BRA.W	LB_02F2
	BRA.W	LB_0302
	BRA.W	LB_0302
	BRA.W	LB_0302
	BRA.W	LB_0302
LB_02A0	TST.W	D1
	BNE.B	LB_02AE
	BCLR	#$01,$00BFE001
	BRA.B	LB_0302
LB_02AE	BSET	#$01,$00BFE001
	BRA.B	LB_0302
LB_02B8	NEG.W	D1
	MOVE.W	D1,$0024(A0)
	MOVE.W	#$FFFF,$0044(A0)
	BRA.B	LB_0302
LB_02C6	MOVE.W	D1,$0024(A0)
	MOVE.W	#$FFFF,$0044(A0)
	BRA.B	LB_0302
LB_02D2	TST.W	D1
	BEQ.B	LB_0302
	MOVE.W	D1,$003E(A0)
	MOVE.W	D1,$0040(A0)
	BRA.B	LB_0302
LB_02E0	MOVE.W	D1,$0022(A0)
	MOVE.W	#$0001,$0020(A0)
	MOVE.W	#$FFFF,$0044(A0)
	BRA.B	LB_0302
LB_02F2	MOVE.W	D1,$0022(A0)
	MOVE.W	#$FFFF,$0020(A0)
	MOVE.W	#$FFFF,$0044(A0)
LB_0302	MOVE.B	(A5),D0
	ANDI.W	#$003F,D0
	MOVE.W	D0,$0014(A0)
	CMP.W	#$003F,D0
	BEQ.B	LB_0314
	BSR.B	LB_035C
LB_0314	MOVEQ	#$00,D0
	MOVE.W	$0032(A6),D0
	ADDA.L	D0,A5
	MOVE.L	A5,$0000(A0)
	RTS	
LB_0322	MOVE.W	$0048(A0),D0
	CMP.W	#$0001,D0
	BNE.B	LB_0336
	CLR.W	$0048(A0)
	CLR.W	$0046(A0)
	BRA.B	LB_033C
LB_0336	SUBQ.L	#1,D0
	MOVE.W	D0,$0048(A0)
LB_033C	RTS	
LB_033E	ANDI.W	#$007F,D0
	CMP.W	#$0001,D0
	BEQ.B	LB_0354
	SUBQ.L	#1,D0
	MOVE.W	D0,$0048(A0)
	MOVE.W	#$FFFF,$0046(A0)
LB_0354	ADDQ.L	#1,A5
	MOVE.L	A5,$0000(A0)
	RTS	
LB_035C	MOVE.W	D0,$0010(A0)
	ADD.W	D0,D0
	MOVE.W	$00(A4,D0.W),D0
	MOVE.W	D0,$001C(A0)
	MOVE.W	$000C(A0),D0
	AND.W	$002C(A6),D0
	BEQ.B	LB_03A0
	MOVE.W	$0012(A0),D0
	SUBQ.W	#1,D0
	LSL.W	#4,D0
	MOVE.W	$000C(A0),D1
	OR.W	D1,$0026(A6)
	MOVEQ	#$00,D1
	MOVE.W	$000E(A0),D1
	LEA	$001A0FF4(PC),A1
	ADDA.L	D1,A1
	MOVE.L	$00(A3,D0.W),(A1)+
	MOVE.W	$04(A3,D0.W),(A1)+
	MOVE.L	$06(A3,D0.W),(A1)+
	MOVE.W	$0A(A3,D0.W),(A1)+
LB_03A0	RTS	
	MOVE.W	$002E(A6),D6
	CLR.W	$002E(A6)
	MOVE.W	D6,D7
	ORI.W	#$8000,D7
	MOVE.W	D6,$00DFF096
	MOVE.W	#$0006,D1
LB_03BA	BSR.W	LB_0494
	DBF	D1,LB_03BA
	LEA	$001A0FF4(PC),A1
	BTST	#$00,D6
	BEQ.B	LB_03DA
	MOVE.W	$0004(A1),$00DFF0A4
	MOVE.L	(A1),$00DFF0A0
LB_03DA	LEA	$000C(A1),A1
	BTST	#$01,D6
	BEQ.B	LB_03F2
	MOVE.W	$0004(A1),$00DFF0B4
	MOVE.L	(A1),$00DFF0B0
LB_03F2	LEA	$000C(A1),A1
	BTST	#$02,D6
	BEQ.B	LB_040A
	MOVE.W	$0004(A1),$00DFF0C4
	MOVE.L	(A1),$00DFF0C0
LB_040A	LEA	$000C(A1),A1
	BTST	#$03,D6
	BEQ.B	LB_0422
	MOVE.W	$0004(A1),$00DFF0D4
	MOVE.L	(A1),$00DFF0D0
LB_0422	NOP	
	BSR.B	LB_0494
	MOVE.W	D7,$00DFF096
	BSR.B	LB_0494
	LEA	$001A0FF4(PC),A1
	LEA	$0006(A1),A1
	BTST	#$00,D6
	BEQ.B	LB_044A
	MOVE.W	$0004(A1),$00DFF0A4
	MOVE.L	(A1),$00DFF0A0
LB_044A	LEA	$000C(A1),A1
	BTST	#$01,D6
	BEQ.B	LB_0462
	MOVE.W	$0004(A1),$00DFF0B4
	MOVE.L	(A1),$00DFF0B0
LB_0462	LEA	$000C(A1),A1
	BTST	#$02,D6
	BEQ.B	LB_047A
	MOVE.W	$0004(A1),$00DFF0C4
	MOVE.L	(A1),$00DFF0C0
LB_047A	LEA	$000C(A1),A1
	BTST	#$03,D6
	BEQ.B	LB_0492
	MOVE.W	$0004(A1),$00DFF0D4
	MOVE.L	(A1),$00DFF0D0
LB_0492	RTS	
LB_0494	MOVE.B	$00DFF006,D0
LB_049A	CMP.B	$00DFF006,D0
	BEQ.B	LB_049A
	RTS	
	MOVE.L	$0008(A0),A4
	TST.W	$0042(A0)
	BEQ.B	LB_04B6
	CLR.W	$0042(A0)
	BRA.W	LB_0552
LB_04B6	TST.W	$0024(A0)
	BEQ.B	LB_04D2
	MOVE.W	$001C(A0),D0
	ADD.W	$0024(A0),D0
	MOVE.W	D0,$001C(A0)
	TST.W	$0044(A0)
	BEQ.B	LB_04D2
	CLR.W	$0024(A0)
LB_04D2	TST.W	$0038(A0)
	BEQ.B	LB_050C
	MOVE.W	$001C(A0),D0
	ADD.W	$003A(A0),D0
	MOVE.W	D0,$001C(A0)
	MOVE.W	$003C(A0),D0
	TST.W	$003A(A0)
	BMI.B	LB_04FE
	CMP.W	$001C(A0),D0
	BGE.B	LB_050C
	MOVE.W	D0,$001C(A0)
	CLR.W	$0038(A0)
	BRA.B	LB_050C
LB_04FE	CMP.W	$001C(A0),D0
	BLE.B	LB_050C
	MOVE.W	D0,$001C(A0)
	CLR.W	$0038(A0)
LB_050C	TST.W	$0020(A0)
	BEQ.B	LB_0552
	TST.W	$0020(A0)
	BMI.B	LB_0532
	MOVE.W	$001E(A0),D0
	MOVE.W	$0022(A0),D1
	ADD.W	D1,D0
	CMP.W	#$0040,D0
	BLE.B	LB_052C
	MOVE.W	#$0040,D0
LB_052C	MOVE.W	D0,$001E(A0)
	BRA.B	LB_0548
LB_0532	MOVE.W	$001E(A0),D0
	MOVE.W	$0022(A0),D1
	SUB.W	D1,D0
	BPL.B	LB_0544
	CLR.W	D0
	MOVE.W	#$0000,D0
LB_0544	MOVE.W	D0,$001E(A0)
LB_0548	TST.W	$0044(A0)
	BEQ.B	LB_0552
	CLR.W	$0020(A0)
LB_0552	TST.W	$0026(A0)
	BEQ.B	LB_058A
	MOVE.W	$002C(A0),D0
	ADDQ.W	#1,D0
	MOVE.W	D0,$002C(A0)
	CMP.W	#$0003,D0
	BNE.B	LB_0570
	MOVEQ	#$00,D0
	MOVE.W	D0,$002C(A0)
	BRA.B	LB_058A
LB_0570	MOVE.L	$0028(A0),D1
	MOVE.W	D1,D0
	SWAP	D1
	MOVE.L	D1,$0028(A0)
	ADD.W	$0010(A0),D0
	ADD.W	D0,D0
	MOVE.W	$00(A4,D0.W),D0
	MOVE.W	D0,$001C(A0)
LB_058A	TST.W	$002E(A0)
	BEQ.B	LB_05BE
	MOVE.W	$0034(A0),D2
	BEQ.B	LB_05BE
	MOVE.W	$0030(A0),D0
	LEA	$001A0F94(PC),A1
	MOVE.B	$00(A1,D0.W),D1
	EXT.W	D1
	EXT.L	D1
	DIVS.W	D2,D1
	NEG.W	D1
	MOVE.W	D1,$0036(A0)
	ADD.W	$0032(A0),D0
	CMP.W	#$003F,D0
	BLE.B	LB_05BA
	MOVEQ	#$00,D0
LB_05BA	MOVE.W	D0,$0030(A0)
LB_05BE	TST.W	$003E(A0)
	BEQ.B	LB_05E8
	SUBQ.W	#1,$0040(A0)
	TST.W	$0040(A0)
	BNE.B	LB_05E8
	MOVE.W	$003E(A0),$0040(A0)
	TST.W	$001C(A6)
	BEQ.B	LB_05E8
	MOVE.W	$000C(A0),D0
	OR.W	D0,$002E(A6)
	MOVE.W	#$FFFF,$0030(A6)
LB_05E8	MOVE.L	$0004(A0),A1
	MOVE.W	$001E(A0),D0
	MOVE.W	$0020(A6),D1
	SUB.W	D1,D0
	BPL.B	LB_05FA
	CLR.W	D0
LB_05FA	MOVE.W	D0,$0008(A1)
	MOVE.W	$001C(A0),D0
	ADD.W	$0036(A0),D0
	MOVE.W	D0,$0006(A1)
	RTS	
	TST.W	$0024(A6)
	BNE.B	LB_064E
	MOVE.W	$0022(A6),$0024(A6)
	ADDQ.W	#1,$0020(A6)
	CMPI.W	#$0041,$0020(A6)
	BNE.B	LB_0652
	MOVE.W	#$000F,$00DFF096
	MOVEQ	#$00,D0
	MOVE.W	D0,$00DFF0A8
	MOVE.W	D0,$00DFF0B8
	MOVE.W	D0,$00DFF0C8
	MOVE.W	D0,$00DFF0D8
	MOVE.W	D0,$001E(A6)
	MOVE.W	D0,$0034(A6)
LB_064E	SUBQ.W	#1,$0024(A6)
LB_0652	RTS	
