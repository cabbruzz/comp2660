; COMP2660 Assignment 1 Section 2 Question 1

; Name: Chloe Abbruzzese
; Date: 09/22/2023
; Due Date: 09/26/2023 @ 11:59 PM
; ID: 110105377
; Description: Assembly code that is the same as sample C++ program
	; Note: Since Y is not initializd to a number, the output will always be 'C' but has been tested (see program execution image for sample of Y = 32)

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

; these two lines are only necessary if you're not using Visual Studio
INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

.data
    
	; data declarations go here

	X DWORD ? 	; Declare X as a DWORD
	Y DWORD 32 	; Decalre Y as a DWORD

.code
main PROC
	
	; code goes here

	; Calculate X

	mov eax, [Y]	; Load Y into EAX
	add eax, 4		; Add 4 to EAX (Y + 4)
	imul eax, 3		; Multiply EAX by 3 ((Y + 4) * 3)
	mov [X], eax	; Store the result in X

	call DumpRegs 	; Displays registers in console

	exit

main ENDP
END main