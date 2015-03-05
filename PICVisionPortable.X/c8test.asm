	CALL code_00E
	CALL code_066
	CALL code_018
	CALL code_066
	CALL code_022
	CALL code_02C
code_00C:
	JP code_00C
code_00E:
	LD V0, 2
	LD V1, 21
	ADD V0, V1
	CALL code_030
	RET
code_018:
	LD V0, 23
	LD V1, 45
	SUB V0, V1
	CALL code_030
	RET
code_022:
	LD V0, 21
	LD V1, 10
	SUB V0, V1
	CALL code_030
	RET
code_02C:
	NOISE 4
	RET
code_030:
	CLS
	LD VE, VF
	LD V4, 0
	LD V5, 0
	CALL code_042
	ADD V4, 4
	LD V0, VE
	CALL code_042
	RET
code_042:
	LD I, data_078
	LD B, V0
	LD V3, 0
code_048:
	LD I, data_078
	ADD I, V3
	LD V0, [I]
	LD F, V0
	DRW V4, V5, 5
	ADD V4, 4
	ADD V3, 1
	SE V3, 3
	JP code_048
	RET
code_05C:
	LD DT, V0
code_05E:
	LD V0, DT
	SE V0, 0
	JP code_05E
	RET
code_066:
	LD V0, 2
	SKP V0
	JP code_066
	LD V0, 2
	CALL code_05C
	LD V0, 2
code_072:
	SKNP V0
	JP code_072
	RET

data_078:
	DB #00, #00, #00
