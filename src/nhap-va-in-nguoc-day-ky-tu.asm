;nhap day ky tu va in ra day vua nhap va in dao nguoc day

;y tuong
; nhap den khi co enter -> in dung vong lap -> in nguoc dung dec, in tiep khi i > 0 

.model small
.stack 100h
.data
    s1  db  "nhap day: $"
    s2  db  10, 13, "day vua nhap: $"
    s3  db  10, 13, "day dao nguoc: $"
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
        je in
        
        mov a(bx), al
        inc bx
        jmp nhap
   
    in:
        mov ah, 9
        lea dx, s2
        int 21h  
        
        mov cx, bx
        mov bx, 0
    
    lap:    
        mov ah, 2
        mov dl, a(bx) 
        int 21h   
        inc bx
        loop lap
        
        mov ah, 9
        lea dx, s3
        int 21h  
        
    in_nguoc:     
        mov ah, 2
        mov dl, a(bx)
        int 21h
        
        dec bx
        cmp bx, 0
        jge in_nguoc
        
        mov ah, 4ch
        int 21h
        main endp
    end main
