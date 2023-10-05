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
	val5 DWORD ?
	arrayW WORD 100h,200h,300h


.code
main PROC
	
	; code goes here

    call DumpRegs

    ; 2. Write an instruction that subtracts val3 from EAX
	SUB EAX, val3		; EAX - 0FFFFh = ?
 
    call DumpRegs

	exit

main ENDP
END main
