

; COMP2660 Lab 1 Section 2 Question 1

; Name: Chloe Abbruzzese
; Date: 09/22/2023
; Due Date: 09/26/2023 @ 11:59 PM
; ID: 110105377
; Description: Assembly code that adds two hexadecimal numbers (2000h + 3000h) and then subtracts 1000h.

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

; these two lines are only necessary if you're not using Visual Studio
INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

.data
    
	; data declarations go here

    Var1 DWORD 10000h
    Var2 DWORD 20000h
    Result DWORD ?


.code
main PROC
	
	; code goes here

    ; Load Var1 into EAX
    mov eax, Var1

    ; Add Var2 to EAX
    add eax, Var2

    ; Store the result in Result
    mov Result, eax

    ; displays registers in console
	call DumpRegs 

	exit

main ENDP
END main

; Questions:
; 1. What is the final value of the EAX register?
;   EAX = 30000h
; 2. Write a full Assembly program to verify your answer in (1)
;   = code above
