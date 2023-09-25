; COMP2660 Assignment 1 Section 2 Question 1

; Name: Chloe Abbruzzese
; Date: 09/22/2023
; ID: 110105377
; Description: Assembly code that is the same as sample C++ program

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

; these two lines are only necessary if you're not using Visual Studio
INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

.data
    
	; data declarations go here

	X DWORD ? 	; Declare X as a DWORD
	Y DWORD ? 	; Decalre Y as a DWORD

.code
main PROC
	
	; code goes here
	
	; Input: Enter the value of Y 
    ;myString BYTE "Enter a value for Y: ",0  ; Null-terminated string
	mov eax, offset Y
	call ReadInt;

	; Calculate X

	mov eax, [Y]	; Load Y into EAX
	add eax, 4		; Add 4 to EAX (Y + 4)
	imul eax, 3		; Multiply EAX by 3 ((Y + 4) * 3)
	mov [X], eax	; Store the result in X

	call DumpRegs 	; Displays registers in console

	exit

main ENDP
END main