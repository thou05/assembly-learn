; nhap so 16 bit

.model small
.stack 100h
.data
    s1  db  "nhap so: $"
    s2  db  10, 13, "so vua nhap: $"
    a   dw  0
.code
    main proc 
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, s1
        int 21h
        
        mov bx, 10
        mov cx, 0
    nhaptiep:                  ;789
        mov ah, 1               ;7    8      9 
        int 21h
        cmp al, 13
        je enter
        
        sub al, 48               ;7 <=> 055 - 48 -> 007  008     009
        mov cl, al
        mov ax, a                ;0-> ax      ax <- 7
        mul bx                   ;10 * 0   dich sang trai 1 vi tri <=> *10     7 * 10   78 * 10
        add ax, cx               ;0 + 7 = 7         70 + 8         780 + 9
        mov a, ax                ;a <- 7    a <- 78            a <- 789
        jmp nhaptiep
    
    enter:
        mov ah, 9
        lea dx, s2
        int 21h
                          ; so bi chia / so chia
        mov bx, 10       ;so de thuc hien phep chia, nguon - so chia 
        mov ax, a
        mov cx, 0        ; dem  
        
    chiatiep:
        mov dx, 0        ; dx luu phan du, mov ve 0 dam bao khong co gia tri ton dong tu truoc
        div bx           ;ax / 10
        cmp ax, 0        ; kiem tra con so de chia khong
        je end
        push dx
        inc cl           ; dem so chu so da duoc lay 
        jmp chiatiep
    
    end:
        push dx
        inc cl
   
    intiep:
        mov ah, 2
        pop dx
        add dl, 48
        int 21h
        loop intiep        ; cx giam gia tri, cx = 0 => ket thuc
        
        mov ah, 4ch
        int 21h
        main endp
    end main
