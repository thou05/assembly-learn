;cach nay hay hon bai kia, de hieu hon 

.model small
.stack 100h
.data
    s1  db  "nhap day: $"
    s2  db  10, 13, "in hoa: $"
    s3  db  10, 13, "in thuong: $"
    a   db  100 dup ('$')
    b   db  100 dup('$')
    
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
        
        sub al, 32 
        cmp al, 'A'
        jl khongdoi
        jmp chuyen
    khongdoi:
        add al, 32 
    chuyen:
        mov a(bx), al
        ;cmp al, 32
        ;je cach
        ;add al, 32
    ;cach:
        ;mov b(bx), al
        inc bx
        jmp nhap
    enter:
        mov ah, 9
        lea dx, s2
        int 21h
        lea dx, a
        int 21h  

        ;lea dx, s3
        ;int 21h
        ;lea dx, b
        ;int 21h
        
        
        
        mov ah, 4ch
        int 21h
        main endp
    end main
