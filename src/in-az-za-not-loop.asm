;in a to z not loop
;in z to a

.model small
.stack 100h
.data 
    s   db  " $"

.code
    main proc 
        mov ax, @data
        mov ds, ax  
        
        mov bl, "a" 
        ; mov bl, "z" 
        
    in:
        mov dl, bl
        mov ah, 2
        int 21h
        
        mov ah, 9
        lea dx, s
        int 21h
        
        inc bl  
        cmp bl, "z"
        jle in 
        
        ;dec bl
        ;cmp bl, "a"
        ;jge in
        
        mov ah, 4ch
        int 21h
        main endp
    end main
         
