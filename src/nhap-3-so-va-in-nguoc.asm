;nhap 3 so va in theo thu tu nguoc lai

.model small
.stack 100h
.data   
    s1  db  "nhap so 1: $"
    s2  db  10, 13, "nhap so 2: $"
    s3  db  10, 13, "nhap so 3: $"
    s4  db  10, 13, "hien nguoc lai: $"

.code
    main proc 
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, s1
        int 21h
        
        mov ah, 1
        int 21h
        push ax     ;cat vao stack ah 1
        
        mov ah, 9
        lea dx, s2
        int 21h
        
        mov ah, 1
        int 21h
        push ax 
        
        mov ah, 9
        lea dx, s3
        int 21h
        
        mov ah, 1
        int 21h
        push ax
        
        mov ah, 9
        lea dx, s4
        int 21h
        
        mov ah, 2
        pop dx
        int 21h
        
        pop dx
        int 21h
        
        pop dx
        int 21h    
        
        mov ah, 4ch
        int 21h
        main endp
    end main
