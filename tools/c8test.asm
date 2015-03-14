	LOW
	HIGH
	CLS
	LD V4, 0
	LD V5, 0
	LD I, data_111
	PRT V4,V5
	CALL code_0FC
	CALL code_020
	CALL code_0FC
	CALL code_058
	CALL code_0FC
	CALL code_088
	CALL code_0FC
	CALL code_0A2
code_01E:
	JP code_01E
code_020:
	LD I, data_119
	LD V4, 0
	LD V5, 0
	PRT V4,V5
	LD V0, 2
	LD V1, 21
	ADD V0, V1
	CALL code_0C6
	LD V0, 128
	LD V1, V0
	ADD V0, V1
	CALL code_0C6
	LD V0, 128
	LD V1, 28
	SUB V0, V1
	CALL code_0C6
	LD V0, 10
	LD V1, 15
	SUB V0, V1
	CALL code_0C6
	LD V0, 45
	ADD V0, 10
	CALL code_0C6
	LD V0, 50
	LD V1, 40
	SUBN V0, V1
	CALL code_0C6
	RET
code_058:
	CLS
	LD I, data_129
	LD V4, 0
	LD V5, 0
	PRT V4,V5
	LD V0, 165
	LD V1, 90
	OR V0, V1
	CALL code_0C6
	LD V0, 255
	LD V1, 170
	XOR V0, V1
	CALL code_0C6
	LD V0, 85
	LD V1, 80
	AND V0, V1
	CALL code_0C6
	LD V0, 128
	SHR V0
	CALL code_0C6
	LD V0, 192
	SHL V0
	CALL code_0C6
	RET
code_088:
	CLS
	LD I, data_13A
	LD V4, 0
	LD V5, 0
	PRT V4,V5
	SCR
	SCR
	LD V0, 30
	CALL code_0F2
	SCL
	SCL
	SCD 15
	RET
code_0A2:
	CLS
	LD I, data_149
	LD V4, 0
	LD V5, 0
	PRT V4,V5
	LD V2, 0
	LD V1, 255
	TONE V2,V1, 1
	LD V2, 2
	LD V1, 255
	TONE V2,V1, 2
	CALL code_0FC
	LD I, data_152
	TONE [I]
	LD V0, 4
	ADD I, V0
	TONE [I]
	RET
code_0C6:
	LD VE, VF
	SCD 6
	LD V4, 0
	LD V5, 0
	CALL code_0D8
	ADD V4, 4
	LD V0, VE
	CALL code_0D8
	RET
code_0D8:
	LD I, data_10E
	LD B, V0
	LD V3, 0
code_0DE:
	LD I, data_10E
	ADD I, V3
	LD V0, [I]
	LD F, V0
	DRW V4, V5, 5
	ADD V4, 4
	ADD V3, 1
	SE V3, 3
	JP code_0DE
	RET
code_0F2:
	LD DT, V0
code_0F4:
	LD V0, DT
	SE V0, 0
	JP code_0F4
	RET
code_0FC:
	LD V0, 2
	SKP V0
	JP code_0FC
	LD V0, 2
	CALL code_0F2
	LD V0, 2
code_108:
	SKNP V0
	JP code_108
	RET

data_10E:
	DB #00, #00, #00
data_111:
	DB #56, #4D, #20, #74, #65, #73, #74, #00

data_119:
	DB #74, #65, #73, #74, #20, #6F, #70, #2E
	DB #20, #61, #72, #69, #74, #68, #2E, #00

data_129:
	DB #74, #65, #73, #74, #20, #6F, #70, #2E
	DB #20, #6C, #6F, #67, #69, #71, #75, #65
	DB #00
data_13A:
	DB #74, #65, #73, #74, #20, #73, #63, #72
	DB #6F, #6C, #6C, #69, #6E, #67, #00
data_149:
	DB #74, #65, #73, #74, #20, #73, #6F, #6E
	DB #00
data_152:
	DB #03, #E8, #64, #01, #05, #DC, #64, #02

