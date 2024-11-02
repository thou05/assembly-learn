;nhap 2 so va tinh tong

.model small
.stack 100h
.data
    s1  db  "nhap so thu nhat: $"
    s2  db  10, 13, "nhap so thu hai: $"
    s3  db  10, 13, "tong = $"
.code
    main proc
        mov ax, @data
        mov ds, ax    
        
        mov ah, 9
        lea dx, s1
        int 21h
        
        mov ah, 1
        int 21h
        sub al, 48
        mov bl, al
        
        mov ah, 9 
        lea dx, s2
        int 21h
        
        mov ah, 1
        int 21h
        sub al, 48
        mov cl, al
        
        ;add bl, cl
        
        mov ah, 9
        lea dx, s3
        int 21h  
        
        add bl, cl   ;khong de o tren nhu kia, khong biet tai sao nua
        
        mov ah, 2
        mov dl, bl 
        add dl, 48
        int 21h
        
        mov ah, 4ch
        int 21h
        main endp
    end main 


;----------------------------------------------------------------------------
;nhap 2 so, so sanh va in ra so lon hon    
    
.model small
.stack 100h
.data 
    s1  db  "nhap so thu nhat (0-9): $"
    s2  db  10, 13, "nhap so thu hai (0-9): $"
    s3  db  10, 13, "so lon hon la: $"
.code
    main proc  
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, s1
        int 21h
        
        mov ah, 1
        int 21h
        ;sub al, 48
        mov bl, al
        
        mov ah, 9 
        lea dx, s2
        int 21h
        
        mov ah, 1
        int 21h
        ;sub al, 48
        mov cl, al 
        
        
        mov ah, 9 
        lea dx, s3
        int 21h
        
        cmp bl, cl
        jle so2
        jg so1  
    
    so1:
        mov ah, 2
        mov dl, bl
        ;add al, 48
        int 21h 
        jmp thoat
    
    so2:
        mov ah, 2
        mov dl, cl
        ;add al, 48
        int 21h 
        jmp thoat
        
        
    thoat:    
        mov ah, 4ch
        int 21h
        main endp
    end main
    
