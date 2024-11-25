				TITLE	Programa para evaluar la suma los elementos de un arreglo (restar pares, sumar impares) usando procedimientos

Include Macros.inc

; Prototipos de llamadas al sistema
GetStdHandle	PROTO	:QWORD
WriteConsoleW	PROTO	:QWORD,	:QWORD,	:QWORD,	:QWORD,	:QWORD
ExitProcess		PROTO	codigoSalida:QWORD

				.DATA
Arreglo1		QWORD	1, 2, 3, 4, 5
Arreglo2		QWORD	1, 2, 3, 4, 5, 6, 7, 8, 9, 10
Suma			QWORD	?
StrArr01		WORD	'A', 'r', 'r', 'e', 'g', 'l', 'o', ' ', '1'
StrArr02		WORD	'A', 'r', 'r', 'e', 'g', 'l', 'o', ' ', '2'
MenSal01		WORD	'L', 'a', ' ', 's', 'u', 'm', 'a', ' ', 'e', 's', ':', ' '

; Variables usadas con las funciones del sistema
STD_OUTPUT		EQU		-11
ManejadorS		QWORD	?
Caracteres		QWORD	?
Texto			WORD	13 DUP ( ? )
SaltoLinea		WORD	13, 10

				.CODE
Principal		PROC

				; Alinear espacio en la pila
				SUB		RSP, 40

				; Obtener manejador est�ndar de salida
				MOV		RCX, STD_OUTPUT
				CALL	GetStdHandle
				MOV		ManejadorS, RAX

				; Obtener la suma de los elementos (restar pares, sumar impares) de Arreglo1

				; Llamar al m�todo RestaSuma
				; Pasando los datos de Arreglo1
				; Poner en RCX la direcci�n de Arrreglo1
				; Poner en RDX el n�mero de elementos de Arreglo1
				; Llamar al procedimiento
				; Guardar en la variable Suma el valor de retorno del procedimiento

				; Mostrar nombre del Arreglo1
				MOV		RCX, ManejadorS
				LEA		RDX, StrArr01
				MOV		R8, LENGTHOF StrArr01
				LEA		R9, Caracteres
				MOV		R10, 0
				CALL	WriteConsoleW

				; Salto de l�nea
				MOV		RCX, ManejadorS
				LEA		RDX, SaltoLinea
				MOV		R8, LENGTHOF SaltoLinea
				LEA		R9, Caracteres
				MOV		R10, 0
				CALL	WriteConsoleW

				; Mostrar la suma de Arreglo1
				; Mostrar salto de l�nea

				; Llamar al m�todo RestaSuma
				; Pasando los datos de Arreglo2
				; Poner en RCX la direcci�n de Arrreglo2
				; Poner en RDX el n�mero de elementos de Arreglo2
				; Llamar al procedimiento
				; Guardar en la variable Suma el valor de retorno del procedimiento

				; Mostrar nombre del Arreglo2
				MOV		RCX, ManejadorS
				LEA		RDX, StrArr02
				MOV		R8, LENGTHOF StrArr02
				LEA		R9, Caracteres
				MOV		R10, 0
				CALL	WriteConsoleW

				; Salto de l�nea
				MOV		RCX, ManejadorS
				LEA		RDX, SaltoLinea
				MOV		R8, LENGTHOF SaltoLinea
				LEA		R9, Caracteres
				MOV		R10, 0
				CALL	WriteConsoleW

				; Mostrar la suma de Arreglo2
				; Mostrar salto de l�nea

				; Terminar y regresar al sistema operativo
				MOV		RCX, 0
				CALL	ExitProcess
Principal		ENDP

; Procedimiento RestaSuma
; Este procedimiento recibe como argumentos la direcci�n de inicio del
; arreglo y el n�mero de elementos del arreglo.
; RCX = Direcci�n de inicio del arreglo
; RDX = N�mero de elementos del arreglo
; Regresa el resultado en el registro RAX

RestaSuma		PROC
				; PROLOGO
				; Marco de pila. Guardar registro RBP y hacer RBP = RSP

				; Marco de pila. Dejar espacio para las variables locales
				; La variable local es de 8 bytes, por lo que se resta 8 al registro RSP

				; Marco de pila. Guardar los registro a utilizar en el procedimiento
				
				; 
				; Ciclo para sumar los elementos del arreglo (restar pares, sumar impares)
				MOV		RSI, RCX			; Primer argumento
				MOV		RCX, RDX			; Segundo aegumento

				; Inicializar en 0 la variable local
Ciclo:
				LOOP	Ciclo

				; Poner valor de retorno en el registro RAX

				; EPILOGO
				; Marco de pila. Recuperar registros almacenados

				; Marco de pila. Eliminar variable local
				
				; Marco de pila. Restaurar el registro RBP

				; Marco de pila. Sacar direcci�n de retorno y argumentos
				RET
RestaSuma		ENDP
				END