## 🏗 Program Structure
```assembly
.model small
.stack 100h
.data

.code
	main proc
		; Load data segment
		mov ax, @data
		mov ds, ax

		; End program
		mov ah, 4ch
		int 21h
	main endp
end main
```
