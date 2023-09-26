; COMP2660 Assignment 1 Section 2 Question 2

; Name: Chloe Abbruzzese
; Date: 09/22/2023
; Due Date: 09/26/2023 @ 11:59 PM
; ID: 110105377
; Description: Assembly code that is the same as sample C++ program

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

; these two lines are only necessary if you're not using Visual Studio
INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

.data
    
	; data declarations go here

	X DWORD 2000h 	; Declare X as a DWORD
	Y DWORD 3000h 	; Decalre Y as a DWORD 
	Z DWORD 1000h	; Declare Z as a DWORD



.code
main PROC
	
	; code goes here

	mov eax, X		; EAX = 2000h
	add eax, Y		; EAX = 5000h
	sub eax, Z		; EAX = 4000h


	call DumpRegs 	; Displays registers in console

	exit

main ENDP
END main
