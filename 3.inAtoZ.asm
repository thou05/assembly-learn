;in tu a -> z

.model small
.stack 100h
.data  

.code
;-----------dung loop
    main proc 
        mov bl, 'A'
        mov cx, 26 
             
    in:
        mov dl, bl
        mov ah, 2
        int 21h
        
        inc bl
        loop in
        
        mov ah, 4ch
        int 21h
        
        main endp
    end main
        
;--------------khong dubg loop
main proc 
        mov bl, 'A'
        mov cx, 26 
             
    in:
        mov dl, bl
        mov ah, 2
        int 21h 
        
        mov dl, 32
        int 21h
        
        inc bl
        loop in
        
        mov ah, 4ch
        int 21h
        
        main endp
    end main 
    
;code theo buingocdung
main proc
        mov ah, 2
        mov dl, 'A'   
        mov cx, 26
        
    back:
        int 21h 
        mov bl, dl 
        
        mov dl, 32
        int 21h
        
        mov dl, bl
        inc dl
        ;cmp dl, 'Z'
        ;jle back  
        loop back
        
        mov ah, 4ch
        int 21h
        main endp
    end main 
        
