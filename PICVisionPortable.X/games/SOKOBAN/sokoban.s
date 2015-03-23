code_000:
	HIGH
code_002:
	CALL code_01B ; initialisation
code_004:
	LD VE, 5
	CALL delay  ; d�lais
	SKNP VC
	JP code_037
	SKNP VD
	JP code_07F
	SNE VA, 50
	JP code_004
	SKNP VB
code_016:
	CALL code_03F
	JP code_004

data_01A:
	DB #80
code_01B: ; initialisation
	CLS
	LD I, data_288 ; initialisation V[0..VE] 
	LD VE, [I]     ; #FE, #01, #80, #06, #00, #00, #0F, #07, #02, #02, #00, #09, #07, #0A, #05 
	LD I, data_264 ; splash screen
	SNE VA, 0
	JP code_258  ; affiche mot sokoban avec effet d�roulant
;************************
; affichage no de grille
code_027:
	CALL code_069
	LD F, V6
	DRW V9, V9, 5
	RET
;***********
; pause	
delay:
	LD V1, DT
	SE V1, 0
	JP delay
	RET
code_037:
	SNE VA, 1
	JP code_004
	LD VE, 8
	JP code_016
code_03F:
	LD DT, V7
	LD V0, 1
	LD ST, V0
	LD I, data_DC8
	ADD I, VA
	LD V5, [I]
	LD I, data_0F3
	LD V1, [I]
	SNE VE, 5
	JP code_05F
	SUB V1, V3
	SNE VF, 0
	ADD V0, 255
	ADD VA, 255
	LD V5, V3
	JP code_065
code_05F:
	ADD V1, V4
	ADD V0, VF
	ADD VA, 1
code_065:
	LD [I], V1
	CALL code_06D
; **************************
; convertie no grille en BCD
code_069:
	LD I, BCD
	LD B, VA
;****************************
; affiche le no de grille	
code_06D:
	LD I, BCD
	LD V2, [I]
	LD F, V1
	DRW VD, V9, 5
	LD F, V2
	DRW V6, V9, 5
	LD I, data_288
	LD [I], VA  ; conserve V0..VA , VA=no de grille
	RET
code_07F:
	CALL code_01B
code_081:
	LD VD, 0
	LD VC, 0
	LD V2, 2
	LD ST, V2
	LD V1, 64
	CALL code_0D5
	LD V7, V6
	LD V1, 128
	CALL code_0D5
	LD V4, VE
	LD V1, VE
	ADD V1, V6
code_099:
	CALL code_0A7
	SNE VC, 0
	JP code_12D
	SNE V3, 24
	JP code_0BB
code_0A3:
	CALL code_10F
	JP code_099
code_0A7:
	LD VE, 0
	CALL code_101
	SNE VE, 1
	CALL code_101
	CALL code_101
	LD V3, VE
	XOR V3, V2
	SHL V3
	SHL V3
	RET
code_0BB:
	CALL code_0A7
	SNE V3, 24
	JP code_0CF
	CALL code_0E5
	ADD VE, 4
code_0C5:
	CALL code_10F
	ADD VE, 255
	SE VE, 0
	JP code_0C5
	JP code_099
code_0CF:
	LD I, data_285
	LD [I], V7
	JP code_0A3
code_0D5:
	CALL code_0E5
	ADD VE, 5
	SHL VE
	SHL VE
	LD V6, VE
	SUBN V6, V1
	SHR V6
	RET
code_0E5:
	LD VE, 0
	CALL code_101
	CALL code_101
	CALL code_101
	CALL code_101
	RET
code_0F1:
	LD VD, 8
	LD I, data_2B4
	ADD I, VC
	LD V0, [I]
	LD VB, V0
	SNE  VC, V5
	LD VC, 255
	ADD VC, 1
code_101:
	SNE VD, 0
	JP code_0F1
	ADD VD, 255
	SHL VE
	SHL VB
	OR VE, VF
	RET
code_10F:
	SNE V3, 16
	JP code_119
	SE V3, 20
	JP code_11B
	ADD V8, 1
code_119:
	ADD V9, 1
code_11B:
	LD I, data_294
	ADD I, V3
	DRW V6, V7, 4
	ADD V6, 4
	SE V6, V1
	RET
	SUB V6, V4
	ADD V7, 4
	RET
code_12D:
	LD I, data_285
	LD V7, [I]
	LD VA, 0
code_133:
	CALL delay
code_135:
	LD VB, 1
	LD I, data_293
	LD V5, [I]
	SNE  V8, V9
	JP code_217
	SKNP V1
	JP code_23C
	SKNP V0
	JP code_240
	SKNP V3
	JP code_244
	SKNP V4
	JP code_248
	SKNP V5
	JP code_229
	SKP V2
	JP code_135
	SNE VC, 0
	JP code_135
	LD VB, 0
	ADD VC, 255
	LD I, data_2AC
	DRW V6, V7, 4
	ADD VD, 255
	SNE VD, 255
	LD VD, 56
	LD I, data_24C
	ADD I, VD
	LD V0, [I]
	LD VA, V0
code_171:
	LD DT, V4
	AND V1, VA
	LD I, data_293
	ADD I, V1
	LD V5, [I]
	SNE VB, 0
	CALL code_1F3
	LD V0, V6
	LD V1, V7
	ADD V0, V4
	ADD V1, V5
	SNE VB, 0
	JP code_193
	LD I, data_23A
	CALL code_207
	SNE VE, 1
	JP code_133
code_193:
	LD I, data_01A
	CALL code_207
	SNE VE, 0
	JP code_1C3
	LD V2, V0
	LD V3, V1
	ADD V2, V4
	ADD V3, V5
	SNE VB, 0
	JP code_1E5
	LD I, data_01A
	CALL code_20F
	SNE VE, 1
	JP code_133
	ADD VA, 128
code_1B1:
	LD I, data_2A4
	CALL code_207
	SUB V8, VE
	CALL code_20F
	ADD V8, VE
	LD I, data_2B0
	DRW V0, V1, 4
	LD ST, VB
	DRW V2, V3, 4
code_1C3:
	SNE VB, 0
	JP code_1EB
	SE VC, 57
	ADD VC, 1
	LD V0, VA
	LD I, data_24C
	ADD I, VD
	ADD VD, 1
	SNE VD, 57
	LD VD, 0
	LD [I], V0
	LD I, data_2AC
	DRW V6, V7, 4
code_1DD:
	ADD V6, V4
	ADD V7, V5
	DRW V6, V7, 4
	JP code_133
code_1E5:
	SHL VA
	SNE VF, 1
	JP code_1B1
code_1EB:
	LD I, data_285
	LD V7, [I]
	LD I, data_2AC
	JP code_1DD
code_1F3:
	LD I, data_285
	LD [I], V7
	ADD V6, V4
	ADD V7, V5
	ADD V6, V4
	ADD V7, V5
	SUBN V5, VB
	SUBN V4, VB
	LD [I], V5
	RET
code_207:
	DRW V0, V1, 2
	LD VE, VF
	DRW V0, V1, 2
	RET
code_20F:
	DRW V2, V3, 2
	LD VE, VF
	DRW V2, V3, 2
	RET
code_217:
	LD ST, V3
	LD V0, 50
	LD DT, V0
	CALL delay
	CALL code_01B
	SNE VA, 50
	JP code_002
	CALL code_03F
	JP code_081
code_229:
	LD ST, V1
	LD V0, 30
	LD DT, V0
	CALL delay
	SKP V5
	JP code_135
	SE VA, 0
	JP code_07F
	JP code_000
	DB #20
code_23C:
	LD VA, 2
	JP code_171
code_240:
	LD VA, 4
	JP code_171
code_244:
	LD VA, 1
	JP code_171
code_248:
	LD VA, 3
	JP code_171
	
;*********************	
; affichage intro
code_24C:
; ajout d�lais entre ligne
	LD V0, 10
	LD DT, 10
	LD V0, DT
	SE V0, 0
	JP .-2
	SCD 1
code_24E:
	DRW V5, V6, 1
	ADD I, V1
	ADD V5, 8
	SE V5, 88
	JP code_24E
code_258:  
	LD V5, 40
	SUB V3, V1
	SE V3, 254
	JP code_24C
	LD VA, 1
	JP code_027

data_264: ; splash screen
	DB #FE, #79, #99, #E7, #C7, #DB, #0E, #CD
	DB #F3, #36, #6C, #DB, #1C, #CD, #E3, #36
	DB #6C, #DB, #38, #CD, #B3, #36, #67, #DB
	DB #70, #CD, #9B, #37, #C0, #DB, #E0, #79
	DB #81
data_285:
	DB #E6, #07, #9E
data_288:
	DB #FE, #01, #80, #06, #00, #00, #0F, #07
	DB #02, #02, #00
data_293:
	DB #09
data_294:
	DB #07, #0A, #05, #08, #00, #FC, #00, #04
	DB #00, #00, #00, #00, #F0, #F0, #F0, #F0

data_2A4:
	DB #00, #40, #20, #00, #F0, #D0, #B0, #F0

data_2AC:
	DB #60, #F0, #F0, #60 ; croix
data_2B0:
	DB #F0, #90, #90, #F0 ; boite vide
data_2B4:
	DB #6E, #00, #88, #C2, #90, #18, #53, #41
	DB #84, #2A, #15, #60, #E8, #52, #8C, #15
	DB #51, #14, #40, #89, #80, #8A, #44, #43
	DB #65, #28, #58, #36, #D1, #21, #51, #91
	DB #43, #64, #01, #80, #C5, #40, #22, #60
	DB #59, #8C, #03, #B0, #30, #15, #5D, #81
	DB #28, #50, #5D, #81, #AA, #A0, #BB, #00
	DB #48, #28, #2E, #C0, #88, #52, #28, #2D
	DB #28, #82, #50, #A5, #28, #82, #00, #C0
	DB #50, #8C, #00, #5C, #82, #45, #20, #AC
	DB #06, #46, #0A, #95, #A2, #C1, #52, #85
	DB #60, #CB, #4A, #21, #15, #28, #8A, #B3
	DB #00, #29, #42, #82, #BB, #60, #0A, #14
	DB #05, #98, #02, #3C, #9E, #83, #C5, #20
	DB #E8, #4C, #11, #90, #98, #14, #01, #0A
	DB #50, #26, #05, #2D, #AD, #0A, #21, #30
	DB #28, #58, #0D, #10, #98, #14, #B4, #69
	DB #4B, #15, #0A, #30, #16, #06, #A4, #56
	DB #06, #80, #20, #0B, #03, #60, #34, #05
	DB #81, #A1, #6B, #68, #48, #C0, #D0, #04
	DB #01, #60, #71, #70, #8C, #82, #44, #61
	DB #08, #11, #18, #22, #35, #41, #82, #30
	DB #1A, #45, #85, #40, #59, #80, #14, #A1
	DB #55, #66, #00, #0A, #5A, #28, #CC, #00
	DB #B4, #29, #22, #45, #42, #82, #C1, #52
	DB #94, #18, #2A, #A2, #8C, #1D, #00, #60
	DB #F1, #20, #67, #89, #02, #A3, #B0, #22
	DB #C8, #AE, #C0, #A8, #0B, #B4, #06, #D1
	DB #76, #04, #4A, #2E, #CA, #89, #48, #89
	DB #46, #82, #02, #15, #28, #80, #94, #28
	DB #20, #20, #A0, #20, #45, #40, #78, #81
	DB #C4, #42, #26, #02, #A8, #92, #29, #68
	DB #A0, #16, #04, #A1, #41, #50, #15, #48
	DB #8D, #55, #28, #2A, #6C, #89, #4A, #53
	DB #6C, #88, #02, #BB, #64, #4B, #44, #76
	DB #C8, #82, #A4, #44, #55, #00, #BB, #05
	DB #58, #42, #11, #70, #40, #28, #14, #A2
	DB #09, #52, #88, #50, #41, #0A, #50, #40
	DB #15, #4A, #88, #2A, #8B, #23, #4A, #50
	DB #50, #14, #02, #8D, #40, #45, #02, #80
	DB #52, #94, #89, #04, #54, #18, #13, #04
	DB #60, #4C, #11, #98, #98, #23, #31, #30
	DB #46, #62, #60, #91, #40, #9C, #83, #44
	DB #E0, #C8, #6D, #98, #14, #44, #36, #CC
	DB #09, #81, #63, #30, #24, #14, #36, #CC
	DB #09, #45, #0D, #B3, #01, #54, #8A, #40
	DB #52, #DA, #2C, #06, #22, #14, #A4, #4C
	DB #06, #94, #04, #05, #90, #A1, #40, #28
	DB #52, #26, #5A, #52, #23, #01, #60, #4C
	DB #16, #28, #BE, #15, #08, #DC, #8A, #B0
	DB #34, #05, #2D, #02, #D0, #A5, #36, #CA
	DB #16, #D4, #02, #83, #B6, #52, #80, #96
	DB #96, #8E, #D9, #54, #04, #28, #03, #B6
	DB #58, #0A, #52, #94, #76, #CA, #01, #12
	DB #15, #DB, #2A, #20, #85, #28, #3B, #65
	DB #05, #12, #D2, #95, #76, #53, #64, #42
	DB #C0, #9C, #A6, #C8, #96, #D2, #DA, #3A
	DB #24, #30, #34, #72, #00, #91, #51, #C8
	DB #03, #07, #72, #01, #1B, #00, #AE, #83
	DB #2A, #C1, #95, #44, #18, #22, #A0, #AD
	DB #18, #1A, #81, #20, #50, #60, #4A, #14
	DB #B5, #45, #81, #20, #D5, #80, #B0, #24
	DB #4A, #5A, #22, #B0, #14, #0A, #20, #94
	DB #8A, #80, #21, #68, #81, #11, #14, #B0
	DB #55, #C0, #0A, #84, #57, #63, #64, #55
	DB #81, #BB, #67, #30, #86, #61, #61, #11
	DB #30, #8C, #8E, #0C, #29, #11, #22, #50
	DB #14, #44, #29, #4A, #54, #11, #10, #2C
	DB #94, #05, #15, #11, #A5, #2A, #BB, #65
	DB #10, #29, #41, #76, #CA, #2B, #6D, #28
	DB #BB, #65, #80, #A2, #8B, #B6, #89, #00
	DB #A2, #ED, #90, #08, #8C, #05, #58, #23
	DB #01, #60, #D1, #30, #8E, #02, #2B, #05
	DB #50, #14, #22, #40, #AC, #05, #04, #01
	DB #54, #28, #D1, #04, #36, #C2, #89, #59
	DB #2A, #88, #E7, #0A, #08, #D0, #40, #31
	DB #85, #28, #05, #11, #1C, #E1, #40, #50
	DB #5A, #53, #18, #52, #88, #08, #35, #CE
	DB #15, #28, #50, #28, #5D, #B0, #8D, #22
	DB #40, #0A, #08, #82, #01, #16, #15, #40
	DB #BD, #81, #C4, #E0, #31, #38, #0B, #01
	DB #60, #29, #64, #A3, #01, #6D, #10, #22
	DB #A2, #2B, #31, #28, #08, #81, #66, #25
	DB #11, #11, #59, #8A, #02, #A8, #0A, #A2
	DB #A3, #55, #06, #80, #85, #04, #44, #29
	DB #6D, #04, #AA, #22, #05, #28, #AD, #A2
	DB #24, #46, #03, #40, #46, #02, #A8, #A8
	DB #08, #C0, #D8, #0A, #03, #03, #8A, #03
	DB #0A, #55, #00, #BC, #02, #29, #05, #40
	DB #41, #82, #A1, #40, #60, #6A, #8D, #01
	DB #54, #01, #0A, #0B, #40, #40, #10, #49
	DB #0A, #25, #40, #10, #60, #54, #55, #14
	DB #55, #AB, #01, #44, #AC, #C2, #88, #08
	DB #85, #DB, #FC, #54, #88, #83, #30, #A0
	DB #20, #80, #A9, #13, #04, #B4, #10, #60
	DB #68, #30, #16, #07, #12, #01, #84, #44
	DB #40, #A9, #88, #C1, #50, #16, #08, #80
	DB #20, #AA, #09, #41, #54, #10, #42, #D2
	DB #81, #50, #56, #41, #A0, #0A, #08, #28
	DB #52, #8A, #25, #05, #14, #C8, #83, #56
	DB #83, #91, #50, #2E, #CB, #90, #40, #1D
	DB #F6, #C8, #25, #A3, #30, #A0, #84, #54
	DB #10, #60, #CA, #A0, #9B, #02, #2D, #02
	DB #76, #04, #06, #04, #ED, #02, #60, #4E
	DB #C0, #82, #A8, #11, #30, #41, #41, #84
	DB #20, #82, #0A, #08, #44, #45, #05, #51
	DB #50, #A1, #11, #10, #51, #28, #50, #4A
	DB #0A, #49, #42, #80, #81, #12, #14, #89
	DB #80, #20, #0C, #1A, #24, #8E, #80, #C5
	DB #E0, #88, #60, #40, #60, #88, #E0, #09
	DB #04, #02, #22, #2E, #C8, #AA, #0A, #09
	DB #B2, #B0, #15, #52, #8E, #D8, #0A, #21
	DB #45, #00, #D8, #50, #51, #48, #8D, #5A
	DB #94, #40, #44, #14, #40, #1A, #5A, #22
	DB #08, #51, #10, #4A, #A2, #0C, #2D, #04
	DB #22, #E0, #82, #AC, #15, #54, #BE, #08
	DB #94, #25, #02, #45, #58, #24, #44, #A0
	DB #30, #44, #05, #00, #55, #80, #A5, #10
	DB #50, #06, #02, #94, #42, #22, #30, #15
	DB #28, #50, #04, #60, #2A, #52, #8A, #88
	DB #C0, #54, #42, #82, #23, #01, #51, #1A
	DB #80, #8C, #05, #45, #40, #44, #89, #85
	DB #05, #51, #19, #81, #40, #28, #05, #03
	DB #67, #44, #68, #54, #A0, #4C, #0B, #03
	DB #41, #49, #81, #8F, #80, #BE, #00, #8B
	DB #40, #62, #30, #45, #50, #60, #28, #14
	DB #19, #04, #12, #27, #55, #41, #54, #40
	DB #14, #41, #A6, #CA, #25, #0A, #08, #20
	DB #E5, #12, #83, #01, #69, #B2, #88, #2A
	DB #2C, #05, #CA, #2A, #08, #20, #D3, #65
	DB #10, #04, #AA, #A0, #E5, #1A, #05, #0A
	DB #0F, #36, #50, #0A, #25, #28, #83, #A2
	DB #25, #54, #01, #E6, #C8, #08, #05, #A2
	DB #B3, #02, #03, #02, #52, #24, #04, #50
	DB #AA, #8A, #C0, #98, #1B, #02, #60, #6A
	DB #A0, #28, #AA, #20, #80, #A3, #22, #80
	DB #20, #25, #B4, #A1, #6A, #02, #08, #A5
	DB #04, #04, #11, #42, #91, #40, #B6, #95
	DB #04, #40, #50, #26, #04, #44, #04, #76
	DB #32, #20, #22, #2E, #D9, #22, #25, #07
	DB #6C, #C0, #54, #08, #8C, #0A, #22, #BE
	DB #89, #40, #55, #40, #10, #08, #98, #44
	DB #80, #A8, #21, #41, #01, #42, #85, #0A
	DB #25, #28, #2B, #4A, #02, #48, #94, #01
	DB #42, #91, #71, #51, #01, #98, #D2, #A2
	DB #28, #24, #C4, #82, #22, #05, #99, #28
	DB #88, #94, #66, #03, #64, #11, #0A, #55
	DB #5A, #AA, #54, #4A, #02, #A5, #02, #82
	DB #A5, #80, #D2, #85, #00, #54, #89, #14
	DB #88, #8B, #05, #60, #6C, #7C, #9E, #00
	DB #89, #C2, #10, #41, #56, #03, #11, #2B
	DB #44, #14, #01, #D8, #41, #04, #04, #01
	DB #D8, #4A, #D1, #0A, #AA, #38, #18, #0B
	DB #41, #04, #76, #02, #A0, #94, #01, #1D
	DB #A4, #41, #A3, #41, #04, #76, #12, #B0
	DB #1A, #82, #3B, #08, #36, #B4, #10, #57
	DB #61, #2A, #08, #56, #82, #EC, #20, #82
	DB #02, #02, #B8, #55, #08, #88, #08, #AA
	DB #0A, #A0, #44, #40, #BE, #8D, #80, #33
	DB #30, #65, #51, #99, #AD, #C8, #24, #5E
	DB #88, #0A, #C0, #A8, #58, #0D, #15, #15
	DB #40, #42, #88, #2C, #09, #01, #41, #15
	DB #0A, #82, #28, #2A, #2A, #51, #AA, #80
	DB #2A, #44, #42, #88, #20, #A9, #11, #00
	DB #A2, #88, #22, #89, #41, #0A, #14, #A0
	DB #22, #14, #2B, #6D, #04, #04, #41, #0B
	DB #02, #88, #89, #22, #82, #08, #30, #18
	DB #D0, #BE, #55, #85, #A1, #1A, #04, #10
	DB #36, #66, #24, #10, #44, #88, #9B, #64
	DB #16, #A0, #13, #22, #08, #0B, #62, #41
	DB #11, #28, #C0, #62, #52, #0A, #D1, #28
	DB #11, #20, #50, #A3, #6D, #58, #1A, #C0
	DB #90, #06, #B5, #54, #55, #19, #44, #01
	DB #11, #00, #B0, #14, #04, #44, #05, #16
	DB #02, #AA, #44, #AC, #48, #A2, #C1, #10
	DB #04, #08, #B8, #04, #44, #7A, #22, #70
	DB #44, #10, #88, #80, #A0, #83, #B6, #54
	DB #42, #A0, #ED, #81, #12, #8D, #A6, #D8
	DB #11, #0A, #83, #B6, #32, #20, #25, #8B
	DB #58, #1D, #28, #A8, #21, #68, #80, #91
	DB #20, #5B, #64, #60, #4C, #09, #60, #51
	DB #40, #8E, #23, #A0, #ED, #80, #40, #10
	DB #15, #66, #10, #AA, #23, #45, #98, #90
	DB #A0, #80, #2C, #C4, #82, #08, #84, #58
	DB #A1, #4A, #08, #30, #16, #AD, #16, #A8
	DB #A0, #50, #04, #A0, #08, #82, #8A, #88
	DB #2D, #11, #29, #6C, #06, #85, #04, #4A
	DB #01, #56, #91, #22, #26, #12, #0B, #08
	DB #89, #00, #AC, #82, #C4, #60, #91, #10
	DB #18, #1A, #94, #28, #45, #4A, #14, #A2
	DB #E5, #81, #DA, #0B, #B2, #84, #48, #57
	DB #61, #51, #04, #01, #DB, #0A, #50, #10
	DB #07, #6C, #2C, #83, #45, #15, #76, #D1
	DB #10, #A5, #A0, #BB, #20, #28, #52, #85
	DB #DB, #20, #09, #68, #51, #0C, #80, #20
	DB #52, #82, #A8, #04, #48, #06, #11, #11
	DB #00, #8E, #88, #C2, #90, #16, #12, #94
	DB #22, #B0, #15, #11, #81, #C5, #04, #0A
	DB #D6, #40, #40, #50, #60, #54, #40, #A2
	DB #82, #A4, #54, #54, #14, #DB, #CC, #22
	DB #2A, #8A, #7D, #F6, #FB, #88, #A9, #62
	DB #C2, #D1, #42, #81, #42, #80, #50, #50
	DB #40, #40, #40, #41, #8F, #80, #9E, #81
	DB #C5, #E0, #88, #0C, #05, #22, #20, #C0
	DB #69, #44, #40, #88, #95, #44, #51, #28
	DB #A0, #22, #94, #11, #28, #49, #68, #8B
	DB #6D, #11, #45, #40, #45, #00, #45, #10
	DB #15, #22, #35, #14, #60, #34, #19, #81
	DB #10, #54, #52, #8C, #C0, #A9, #40, #A2
	DB #03, #B5, #C2, #82, #94, #41, #66, #02
	DB #24, #04, #4B, #6C, #A0, #11, #10, #08
	DB #88, #BD, #05, #58, #52, #11, #58, #0A
	DB #82, #82, #03, #01, #42, #A5, #92, #80
	DB #AA, #0D, #0A, #09, #4A, #82, #A8, #55
	DB #1A, #58, #0A, #82, #08, #81, #6D, #05
	DB #28, #05, #0A, #A4, #44, #A5, #1A, #82
	DB #08, #0A, #0A, #82, #B4, #40, #10, #66
	DB #08, #0A, #00, #AB, #31, #2A, #C0, #99
	DB #81, #56, #0A, #ED, #96, #10, #ED, #98
	DB #4C, #44, #A8, #81, #2A, #C0, #62, #20
	DB #80, #2C, #06, #A0, #29, #41, #45, #46
	DB #4A, #51, #28, #22, #A8, #A0, #54, #19
	DB #81, #A5, #10, #66, #04, #0A, #83, #30
	DB #05, #A2, #8E, #D8, #4A, #02, #44, #A9
	DB #41, #81, #20, #2B, #02, #68, #AC, #0D
	DB #06, #0A, #AA, #A7, #8D, #40, #54, #15
	DB #02, #81, #48, #88, #A5, #A2, #81, #44
	DB #01, #4B, #68, #91, #10, #11, #28, #A8
	DB #20, #85, #14, #A9, #50, #05, #03, #64
	DB #8A, #6C, #51, #91, #66, #14, #A8, #AC
	DB #C0, #85, #15, #76, #50, #08, #C8, #A9
	DB #22, #B0, #16, #60, #01, #40, #1C, #E4
	DB #28, #A0, #B3, #02, #24, #8A, #24, #C0
	DB #82, #0A, #C0, #5A, #2D, #15, #15, #0A
	DB #00, #8D, #0A, #52, #A0, #88, #85, #28
	DB #A2, #20, #A8, #28, #22, #00, #A2, #8A
	DB #21, #44, #28, #20, #AD, #28, #0A, #80
	DB #21, #11, #81, #2A, #80, #BE, #8C, #11
	DB #30, #10, #04, #56, #60, #50, #2D, #40
	DB #90, #26, #15, #01, #15, #01, #26, #05
	DB #45, #15, #04, #26, #04, #4A, #58, #0A
	DB #22, #A8, #85, #2A, #83, #02, #88, #88
	DB #2A, #88, #A2, #82, #34, #05, #10, #05
	DB #28, #50, #45, #10, #15, #12, #94, #01
	DB #10, #11, #0A, #28, #A2, #44, #44, #B6
	DB #03, #68, #30, #15, #14, #54, #A0, #C0
	DB #90, #04, #40, #18, #14, #48, #89, #00
	DB #BE, #84, #44, #42, #22, #11, #20, #10
	DB #40, #55, #0A, #52, #88, #25, #01, #45
	DB #14, #14, #40, #A5, #80, #D0, #A2, #2A
	DB #50, #51, #60, #2A, #09, #11, #22, #36
	DB #88, #B6, #22, #48, #B0, #14, #4A, #0A
	DB #D5, #4A, #0A, #25, #04, #05, #41, #50
	DB #4B, #4A, #20, #5A, #20, #0C, #05, #01
	DB #41, #00, #89, #EC, #65, #58, #1B, #32
	DB #B0, #46, #65, #60, #91, #70, #AE, #8B
	DB #C1, #19, #88, #08, #B4, #C4, #02, #0A
	DB #02, #EC, #A9, #40, #2C, #05, #76, #C5
	DB #28, #80, #A0, #2E, #D9, #B1, #10, #04
	DB #15, #40, #10, #1A, #0D, #10, #42, #D2
	DB #94, #2A, #82, #08, #50, #1A, #D1, #68
	DB #82, #A2, #88, #02, #82, #02, #14, #A2
	DB #91, #20, #10, #0A, #14, #18, #1A, #80
	DB #88, #0C, #12, #23, #24, #46, #10, #A8
	DB #66, #81, #2A, #91, #32, #44, #60, #34
	DB #11, #02, #A9, #51, #6B, #B6, #44, #12
	DB #ED, #81, #04, #71, #91, #44, #04, #68
	DB #8D, #0A, #00, #88, #44, #C5, #50, #BE
	DB #84, #C4, #88, #CC, #C0, #A8, #0B, #01
	DB #59, #81, #42, #D5, #0A, #48, #B3, #02
	DB #C0, #AD, #2A, #13, #02, #85, #14, #B4
	DB #44, #DB, #28, #51, #4A, #08, #4C, #0A
	DB #91, #11, #51, #74, #44, #0A, #14, #50
	DB #30, #29, #55, #04, #88, #8A, #A0, #50
	DB #18, #1A, #08, #51, #A5, #2A, #A0, #82
	DB #5B, #52, #80, #8A, #A0, #80, #21, #68
	DB #C0, #E2, #40, #2B, #08, #88, #80, #BC
	DB #00, #8C, #40, #58, #32, #80, #20, #8D
	DB #A5, #04, #01, #A3, #50, #52, #44, #05
	DB #14, #4A, #22, #80, #81, #46, #82, #20
	DB #08, #09, #40, #44, #01, #4A, #50, #14
	DB #40, #10, #41, #42, #88, #02, #00, #A5
	DB #A8, #91, #2B, #40, #40, #46, #60, #42
	DB #28, #39, #DB, #0B, #04, #66, #00, #18
	DB #23, #30, #00, #C1, #22, #A0, #AE, #83
	DB #C4, #61, #2A, #02, #C1, #D6, #02, #C1
	DB #94, #2D, #06, #0A, #A5, #A1, #46, #0A
	DB #94, #02, #88, #2A, #80, #81, #69, #12
	DB #08, #A0, #A0, #0B, #A1, #16, #D9, #17
	DB #24, #4C, #50, #15, #C9, #13, #C3, #4A
	DB #AC, #CE, #20, #11, #B0, #A3, #09, #50
	DB #58, #52, #A8, #8D, #80, #C5, #20, #6A
	DB #B0, #28, #90, #20, #0A, #52, #81, #22
	DB #08, #A2, #D6, #94, #B1, #12, #62, #42
	DB #D1, #50, #26, #24, #10, #14, #49, #89
	DB #A1, #41, #46, #CC, #45, #A9, #45, #01
	DB #51, #5A, #14, #88, #85, #0A, #14, #28
	DB #80, #85, #0A, #14, #28, #81, #12, #02
	DB #25, #04, #88, #80, #6E, #82, #44, #E0
	DB #91, #10, #41, #56, #02, #80, #81, #40
	DB #10, #55, #1B, #45, #14, #11, #60, #48
	DB #82, #8A, #A0, #A9, #5A, #14, #28, #2E
	DB #D8, #01, #14, #10, #17, #6C, #80, #48
	DB #22, #A2, #BB, #64, #15, #0A, #14, #22
	DB #A2, #80, #80, #C1, #A2, #A0, #AE, #22
	DB #30, #A4, #06, #14, #89, #13, #82, #30
	DB #2B, #24, #48, #01, #28, #B4, #54, #04
	DB #01, #15, #4A, #01, #44, #01, #22, #22
	DB #0D, #22, #40, #AA, #2D, #81, #28, #54
	DB #28, #22, #8A, #2C, #15, #1D, #B2, #44
	DB #C1, #50, #DB, #03, #01, #55, #11, #DB
	DB #23, #06, #45, #44, #60, #CC, #0D, #83
	DB #45, #40, #9B, #88, #8A, #B0, #27, #6C
	DB #88, #2A, #80, #ED, #95, #0A, #08, #0C
	DB #C0, #A5, #0A, #A8, #B3, #02, #81, #41
	DB #15, #DB, #0A, #52, #88, #8A, #00, #85
	DB #04, #41, #44, #54, #88, #94, #46, #85
	DB #00, #50, #A4, #85, #00, #A0, #A0, #25
	DB #2D, #28, #AA, #11, #20, #54, #11, #40
	DB #15, #40, #15, #00, #B9, #8B, #00, #30
	DB #45, #51, #22, #42, #0A, #89, #4A, #50
	DB #A2, #C0, #DA, #02, #AD, #0B, #50, #54
	DB #10, #51, #2A, #80, #B5, #02, #92, #20
	DB #08, #52, #8A, #80, #22, #05, #04, #01
	DB #14, #04, #40, #50, #88, #88, #0C, #15
	DB #01, #98, #D5, #01, #98, #D8, #0C, #54
	DB #6D, #82, #AA, #C0, #A2, #A0, #A0, #0A
	DB #16, #05, #48, #90, #0A, #28, #0B, #B6
	DB #51, #B4, #A5, #AD, #5D, #B2, #88, #04
	DB #80, #81, #B6, #50, #A8, #AD, #A0, #6D
	DB #94, #A1, #68, #51, #66, #05, #5B, #03
	DB #89, #82, #11, #38, #22, #A8, #B8, #08
	DB #A8, #03, #F7, #7E, #E8, #03, #BE, #FB
	DB #E4, #01, #FB, #EF, #BA, #00, #EF, #BE
	DB #F9, #00, #7E, #FB, #EE, #80, #2A, #02
	DB #B0, #24, #04, #02, #24, #44, #E0, #EA
	DB #52, #94, #A5, #15, #29, #4A, #51, #46
	DB #94, #A5, #2A, #08, #16, #4A, #02, #08
	DB #44, #41, #05, #50, #15, #40, #AB, #81
	DB #AA, #C2, #10, #58, #3A, #02, #C1, #92
	DB #D1, #60, #6A, #D0, #A2, #80, #AA, #01
	DB #40, #45, #41, #22, #20, #88, #02, #33
	DB #05, #11, #10, #29, #30, #22, #21, #44
	DB #77, #D9, #11, #50, #55, #15, #10, #15
	DB #49, #28, #2D, #58, #0A, #A5, #80, #B0
	DB #34, #14, #06, #07, #15, #00, #BE, #81
	DB #46, #20, #4B, #B0, #02, #03, #01, #5D
	DB #B9, #40, #28, #80, #2E, #DF, #22, #34
	DB #50, #07, #6F, #91, #12, #82, #2A, #ED
	DB #90, #40, #11, #10, #51, #83, #22, #49
	DB #4A, #2A, #08, #8A, #25, #02, #80, #88
	DB #08, #2B, #68, #08, #88, #88, #02, #05
	DB #01, #12, #22, #09, #52, #23, #02, #41
	DB #A0, #20, #20, #20, #82, #0A, #80, #B0
	DB #14, #10, #60, #48
data_DC8:
	DB #02, #82, #AC, #0A, #24, #28, #23, #21
	DB #38, #2E, #24, #28, #37, #35, #4C, #3B
	DB #33, #3C, #43, #3E, #33, #31, #39, #47
	DB #4B, #37, #47, #46, #45, #44, #2C, #39
	DB #3F, #35, #43, #41, #31, #2C, #36, #4B
	DB #46, #42, #1F, #48, #3F, #35, #39, #32
	DB #3C, #3A, #34, #2E, #38, #38, #4B

BCD:
	DB 0,0,0