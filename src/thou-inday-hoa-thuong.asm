.model small
.stack 100h
.data   
    s1  db  "nhap day: $"
    s2  db  10, 13, "day vua nhap: $"  
    s3  db  10, 13, "in hoa: $" 
    s4  db  10, 13, "in thuong: $"
    a   db  100 dup (?)

.code                  
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, s1
        int 21h
        
        mov bx, 0  
    nhap:
        mov ah, 1
        int 21h
        cmp al, 13
        je enter
        
        mov a(bx), al
        inc bx
        jmp nhap
    enter:
        mov ah, 9
        lea dx, s2
        int 21h
        
        mov a(bx), '$'
        lea dx, a
        int 21h   
        
        mov ah, 9
        lea dx, s3
        int 21h
        
        mov cx, bx
        mov bx, 0
    doi:     
        cmp a(bx), 'a'
        jl khongdoi
        sub a(bx), 32  
        
    khongdoi:
        inc bx
        loop doi 
        
        mov ah, 9
        mov a(bx), '$'
        lea dx, a
        int 21h   
        
        mov ah, 9
        lea dx, s4
        int 21h
        
        mov cx, bx
        mov bx, 0
    doi2:     
        cmp a(bx), "A"
        jl khongdoi2   
        cmp a(bx), "Z"
        jg khongdoi2
        add a(bx), 32
    khongdoi2:
        inc bx
        loop doi2  
        
        mov ah, 9
        mov a(bx), '$'
        lea dx, a
        int 21h
        
        
        
        mov ah, 4ch
        int 21h
        main endp
    end main
        
