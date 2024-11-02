; phan biet nam nu
; nhap gioi tinh (0-nam, 1-nu) -> in ra gioi tinh -> neu khong phai 0 1 in ra khong phai nam nu

.model small
.stack 100h 
.data
    s1  db  "Nhap gioi tinh (0-nam, 1-nu): $"
    s2  db  10, 13, "NAM$"
    s3  db  10, 13, "NU$"
    s4  db  10, 13, "LGBT$"
.code 
    main proc 
        mov ax, @data
        mov ds, ax  
        
        mov ah, 9
        lea dx, s1
        int 21h
        
        mov ah, 1
        int 21h
        
        cmp al, "0"
        je nam
        cmp al, "1"
        je nu
        
        mov ah, 9
        lea dx, s4
        int 21h
        jmp thoat
        
     nam:
        mov ah, 9
        lea dx, s2
        int 21h
        jmp thoat
     
      nu:
        mov ah, 9
        lea dx, s3
        int 21h
        jmp thoat
      
     thoat:   
        mov ah, 4ch
        int 21h
        main endp 
    
    end main
