;loop in tu z ve a 
;or a to z
; in hoa thì thay chữ thường thành chữ hoa trong ngoặc kép

.model small
.stack 100h
.data 
    s   db  " $"

.code
    main proc 
        mov ax, @data
        mov ds, ax  
        
        mov bl, "z" ; "Z"
        ;mov bl, "a"  ; "A"
        mov cx, 26
        
    in:
        mov dl, bl
        mov ah, 2
        int 21h
        
        mov ah, 9
        lea dx, s
        int 21h
        
        dec bl   ;z->a
        ;inc bl  ;a->z
        loop in
        
        mov ah, 4ch
        int 21h
        main endp
    end main
         
