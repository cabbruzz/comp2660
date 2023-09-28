

; Title: COMP2660 Lab 2 
; Name: Chloe Abbruzzese
; Date: 09/28/2023
; ID: 110105377
; Description: 

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
	mov ax, 10000h
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

	mov eax, 0B9F6H
	sub ecx, 9874h

	; (A)
	mov cx,0
	sub cx,1
	mov ax,7FFFh
	add ax,

	; displays registers in console
	call DumpRegs

	exit

main ENDP
END main
