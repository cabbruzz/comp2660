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
	Nal DWORD ?
	arrayD DWORD 10000h,20000h


.code
main PROC
	
	; code goes here

	; 1. Write an instruction that increments val2
	INC val2			; val2 = 8000h + 1 = 8001h
                        ; SF = 1
 

	; 2. Write an instruction that subtracts val3 from EAX
	SUB EAX, val3		; EAX - 0FFFFh = ?


	; 3. Write instructions that adds val4 from val2
	MOV AX, val4		; AX = 7FFFh
	ADD val2, AX		; AX = 8001h + 7FFFh = 10000h
                        ; OF = 1


	; 4. Implement the following expression: Nval = -val1 - (val2 + val4).

	MOVZX EAX, val1			; Load val1 into EAX, EAX = 10h
	NEG EAX					; EAX = -10h
	MOVZX EBX, val2			; Load val2 into EBX, EBX = 8001h
	MOVZX ECX, val4			; Load val4 into ECX, ECX = 7FFFh
	ADD EBX, ECX			; Add val2 + val4, EBX = 8001h + 7FFFh = 10000h
	NEG EBX					; EBX = -10000h
	ADD EAX, EBX			; EAX = -10h + -10000h = -10010h
	MOV Nval, EAX			; Store the result in Nval

                            ; CF = 1
                            ; SF = 1


	; 5. If val2 is incremented by 1 using the ADD instruction, what will be the values of the Carry and Sign flags?
	ADD val2, 1 		; val2 = 8000h + 1 = 8001h 
								;or
						; val2 = 8001h + 2 = 8002h 

	; CF = 0,	no significant bits were carried out 
	; SF = 1,	adding a value of 1 in either case does not result in a negative value
	

    ; 6. If val4 is decremented by 1 using the SUB instruction, what will be the values of the Overflow and Sign flags?
	SUB val4, 1			; val4 = 7FFFh - 1 = 7FFEh

	; OF = 0,	no overflow occurring as it would if val4 was being increased, not decreased
	; SF = 0,	subtracting a value of 1 in this case does not result in a negative value, the sign isn't changing


    ; 7. Add the second element of the array to val3

	MOV EAX, val3	    		; Load the val3 into EAX: EAX = 0FFFFh
	ADD EAX, [arrayD+4]			; Add the second element of the array (20000h) to EAX: EAX = 0FFFFh + 20000h = 2FFFFh
                                ; SF = 1
                                ; OF = 1

    ; 8. Write down the values of the Carry, Sign, Zero, and Overflow flags after each instruction has executed, if possible.

	;MOV EIP, 7FF0h             ; when ran, it says "unidentified symbol: EIP" on this line and the rest of 8. section
                                ; this question does not seem possible but ANSWERED THEORETICALLY: 
    
    ;ADD EIP, 10h 	            ; a. CF = 1 SF = 0 ZF = 1 OF = 0
                                    ; EIP = 7FF0h + 10h = 8000h
	;ADD EIP, 1 	            ; b. CF = 1 SF = 1 ZF = 0 OF = 1
                                    ; EIP = 8000h + 1 = 8001h
	;ADD EIP, 2	 	            ; c. CF = 0 SF = 0 ZF = 0 OF = 0
                                    ; EIP = 8001h + 2 = 8003h 

            ; in reality, this is overall NOT POSSIBLE because using EIP is for tracking the addresses, not the values
            ; the code is incorrect and would rather require moving the values into a register such as EAX, EBX and so on in order to run




    ; 9. What is the value of the EAX after the following segment of code is executed?

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


			; Therefore, the final value of EAX after executing is 30000h


    call DumpRegs



	exit

main ENDP
END main
