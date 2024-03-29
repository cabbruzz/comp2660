; Title: COMP2660 Lab 3 Section 52
; Name: Chloe Abbruzzese
; Date: 10/05/2023 due at 5:30 PM
; ID: 110105377

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

; these two lines are only necessary if you're not using Visual Studio
INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

.data
    
	; data declarations go here
	val1 BYTE 10h
	val2 WORD 8000h
	val3 DWORD 0FFFFh
	val4 WORD 7FFFh
	Nval DWORD ?
	arrayD DWORD 10000h,20000h


.code
main PROC
	
	; code goes here

	; 1. Write an instruction that increments val2
	
		INC val2			; val2 = 8000h + 1 = 8001h
                        	; SF = 1
 

	; 2. Write an instruction that subtracts val3 from EAX
	
		SUB EAX, val3		; EAX - 0FFFFh = 3FFE8001


	; 3. Write instructions that adds val4 from val2
	
		MOV AX, val4		; AX = 7FFFh
		ADD val2, AX		; AX = 8001h + 7FFFh = 10000h
							; CF = 1


	; 4. Implement the following expression: Nval = -val1 - (val2 + val4).

		MOVZX EAX, val1			; Load val1 into EAX, EAX = 10h
		NEG EAX					; EAX = -10h
		MOVZX EBX, val2			; Load val2 into EBX, EBX = 8001h
		MOVZX ECX, val4			; Load val4 into ECX, ECX = 7FFFh
		ADD EBX, ECX			; Add val2 + val4, EBX = 8001h + 7FFFh = 10000h
		NEG EBX					; EBX = -10000h
		ADD EAX, EBX			; EAX = -10h + -10000h = -10010h
		MOV Nval, EAX			; Store the result in Nval


	; 5. If val2 is incremented by 1 using the ADD instruction, what will be the values of the Carry and Sign flags?
	
		ADD val2, 1 		; val2 = 8000h + 1 = 8001h 
									;or
							; val2 = 8001h + 2 = 8002h 

		; CF = 0,	no significant bits were carried out 
		; SF = 0,	adding a value of 1 does not change the value of the front number (8), therefore not affecting the sign


    ; 6. If val4 is decremented by 1 using the SUB instruction, what will be the values of the Overflow and Sign flags?
		
		SUB val4, 1			; val4 = 7FFFh - 1 = 7FFEh

		; OF = 0,	no overflow occurring as it would if val4 was being increased, not decreased
		; SF = 0,	subtracting a value of 1 in this case does not result in a negative value


    ; 7. Add the second element of the array to val3?

		MOV EAX, val3	    		; Load the val3 into EAX: EAX = 0FFFFh
		ADD EAX, [arrayD+4]			; Add the second element of the array (20000h) to EAX: EAX = 0FFFFh + 20000h = 2FFFFh


    ; 8. Write down the values of the Carry, Sign, Zero, and Overflow flags after each instruction has executed, if possible.
		; assuming in this case, val2 is starts at: 8000h

		mov val2, 7FF0h				; val2 = 8000h + 7FF0h = FFF0h
		add val2, 10h				; val2 = FFF0h + 10h = 10000h
										; a. CF = 1, SF = 1, ZF = 0, OF = 0

		add val2, 1					; val2 = 10000h + 1 = 10001h	
										; b. CF = 0, SF = 1, ZF = 0, OF = 0

		add val2, 2					; val2 = 10001h + 2 = 10003h
										; c. CF = 0, SF = 1, ZF = 0, OF = 0	


    ; 9. In your own language describe the function for the following segment of the code

        ; Note: all code commented out so it is not affected by the rest of the assignment

        ;	INCLUDE Irvine32.inc
        ;	.data
        ;	val1 DWORD 10000h
        ;	val2 DWORD 40000h
        ;	val3 DWORD 20000h
        ;	finalVal DWORD ?

        ;	.code
        ;	main PROC
        ;		mov eax,val1			; EAX = 10000h
        ;		add eax,val2			; EAX = 10000h + 40000h = 50000h
        ;		sub eax,val3			; EAX = 50000h - 20000h = 30000h
        ;		mov finalVal,eax		; finalVal = EAX = 30000h
        ;		call DumpRegs
        ;		exit
        ;	main ENDP
        ;	END main


			; In the .data part, the code is declaring variables as double word values, each val1, val2, and val3 being initialized to hexadecimal values.
			; The double work value finalVal is being declared and stored with no value
			; In .code 'main PROC' marks the beginning of the program's code
			; The first line is moving the value of val1 into eax, EAX = 10000h
			; The second line is moving/adding the value of val2 into eax, EAX = 10000h + 40000h = 50000h
			; The third line is moving/adding the value of val3 into eax, EAX = 50000h - 20000h = 30000h
			; The fourth line is moving/setting the value of eax to the finalVal variable, finalVal = EAX = 30000h
			; The fifth line calling DumpRegs wil output the values of all registers to the user in the terminal
			; The sixth line 'exit' is the end of the coding part
			; 'main ENDP' marks the end of the main procedure
			; 'END main' is the final end of the program


    call DumpRegs


	exit

main ENDP
END main
