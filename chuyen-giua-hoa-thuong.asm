;chuyen doi giua hoa va thuong va nguoc lai

.model small
.stack 100h
.data   
    s1  db  "nhap ky tu: $"
    s2  db  10, 13, "chuyen ky tu: $"

.code
    main proc 
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, s1
        int 21h
        
        mov ah, 1
        int 21h
        mov bl, al
        
        cmp bl, 90
        jle hoaThanhThuong
        
        sub bl, 32
        jmp in
        
    hoaThanhThuong:
        add bl, 32
        jmp in
   
    in:
        mov ah, 9
        lea dx, s2
        int 21h
        
        mov ah, 2
        mov dl, bl
        int 21h
        
        mov ah, 4ch
        int 21h
        main endp
    end main

