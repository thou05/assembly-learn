;phuong pap chuyen dia chi

;nhap 1 day, luu trong bien

.model small
.stack 100h
.data
    s1  db  "nhap day: $"
    s2  db  10, 13, "day vua nhap: $"
    s   db  100 dup(?)

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
        
        mov s[bx], al
        inc bx
        jmp nhap
    
    
    enter:
        mov ah, 9
        lea dx, s2
        int 21h
   
   ;cach 1     
        mov cx, bx
        mov bx, 0
    in:    
        mov ah, 2
        mov dl, s[bx]
        int 21h
        inc bx
        loop in
        ;neu khong dung loop:
        ;cmp bx, cx
        ;jl in
   
   ;cach 2
   	mov ah, 9
        mov s[bx], '$' 
        lea dx, s
        int 21h
        
        mov ah, 4ch
        int 21h
        main endp
    end main
