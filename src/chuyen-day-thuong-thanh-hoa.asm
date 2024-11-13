;cong hai so

.model small
.stack 100h
.data
    s1  db  "nhap day ky tu: $"
    s2  db  10, 13, "In hoa: $"
    a   db  100 dup(?)
    
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
        je kt_nhap
        
        mov a(bx), al
        inc bx
        jmp nhap
        
    kt_nhap:
        mov ah, 9
        lea dx, s2
        int 21h
        
        mov cx, bx
        mov bx, 0      
        ;hmmm cai khuc lap hoi kho hieu
    lap:
        cmp a(bx), "a"
        jge chuyen
        inc bx 
    kt_lap:
        loop lap 
        mov cx, bx
        mov bx, 0
        jmp in
    
    chuyen:
        sub a(bx), 32
        inc bx
        jmp kt_lap        
    
    in:
        mov ah, 2
        mov dl, a(bx)
        int 21h
        inc bx
        loop in
               
        
        mov ah, 4ch
        int 21h
        main endp
    end main
        
        
