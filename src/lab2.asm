
; Title: COMP2660 Lab 2 Section 52
; Name: Chloe Abbruzzese
; Date: 09/28/2023 due at 5:30 PM
; ID: 110105377

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

; these two lines are only necessary if you're not using Visual Studio
INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

.data
    
	; data declarations go here
	Rval SDWORD 22
	Xval SDWORD 26
	Yval SDWORD 30
	Zval SDWORD 40

.code
main PROC
	
	; code goes here
	mov ax, 1000h
	inc ax
	dec ax

	mov eax, Xval
	neg eax

	mov ebx, Yval
	sub ebx, Zval
	add eax, ebx

	mov Rval, eax
	mov cx, 1
	sub cx, 1

	mov ax, 0FFFFh
	inc ax

	mov ecx, 0B9F6h
	sub ecx, 9874h


	; (A)
	mov cx, 0
	sub cx, 1
	; 0 - 1 = -1 ! SF = 1
	
	mov ax, 7FFFh
	add ax, 2	
	; 7FFFh + 2 = 8001 (out of range) ! OF = 1

	; displays registers in console
	call DumpRegs


	; (B)
	mov al, 0FFh
	add al, 1
	; 0FF + 1 = 100 (out of range) ! SF = 1
	
	mov al, +127
	add al, 1	
	; +127 + 1 = +128 ! OF = 1 

	; displays registers in console
	call DumpRegs


	; (C)
	mov al, -128
	sub al, 1
	; -128 - 1 = -129 (out of range) ! CF = 1
	
	mov al, 0DFh
	add al, 32h
	; 0DFh + 32h = 111

	;mov al, 720h 	; this line given in the lab file does not allow the code to run because the value is too large
	;mov al, 072h 	; sample value that allows the code to run, uncomment it to run
	sub al, 0E6h
	; 720h - 0EFh = 63A ! doesn't work 

	; displays registers in console
	call DumpRegs

	;(D)
	exit

main ENDP
END main


; Questions: 
; NOTE: The answers below are based on values run when the sample value in part (C) IS COMMENTED OUT

; 1.
; CF activated in part (C) due to -128 - = -129 being out of range (-128 to 127)
; OF activated in parts (A) and (B) due to additons being out of range (7FFFh + 2 = 8001 in A and +128 in B)
; SF activated in parts (A) and (B) due to calculations that result in a negative number (0 - 1 = -1 in A and 0FF + 1 = 100 in B)
; ZF activated in none of the parts result in a final value of 0 (no instance examples)


; 2.
; Final value of CX = -1
; 	In part (A) = 0 - 1 = -1

; Final value of AL = 0x111
; 	In part (B) = 0xFF + 1 = 0x00 (overflow)
; 	In part (B) = +127 + 1 = -128 (overflow)
;	In part (C) = -128 + 1 = 127 (overflow)
;	In part (C) = 0xDf + 32 = 0x111

