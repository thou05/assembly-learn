;nhap day ki tu va ki tu -> dem so lan xuat hien

.model small
.stack 100h
.data  
    s1  db  "nhap day ky tu: $"
    s2  db  10, 13, "nhap 1 ky tu: $"
    s3  db  10, 13, "so lan ky tu xuat hien: $"
    s4  db  10, 13, "ky tu khong xuat hien$"
    a   db  100 dup(?)   ; tao ra 1 mang co 100 byte, moi phan tu chua co gia tri ban dau xac dinh  
; db: define byte
; 100 dup(?): sao chep 100 lan dau ?
; ?: moi byte trong mang chua duoc khoi tao, gia tri ban dau gan tai thoi diem su dung
.code
    main proc 
        mov ax, @data
        mov ds, ax   
        
        mov ah, 9
        lea dx, s1
        int 21h
        
        mov bx, 0    ;dem chinh xac tu dau cua mang
        
    nhap:
        mov ah, 1
        int 21h
        
        cmp al, 13   ;13 là mã ASCII phim enter
        je in_s2
        mov a(bx), al   ;luu gia tri trong thanh al vao mang a tai vi tri chi dinh boi bx   
                        ; bx dóng vai trò là chi so (index) truy cap cac phan tu trong mang a
        inc bx
        jmp nhap
    
    in_s2:
        mov ah, 9
        lea dx, s2
        int 21h
        
        mov ah, 1
        int 21h
        
        mov cx, bx
        mov bx, 0
        mov dl, 48   ; 48 là mã ASCII cua ký tu '0'

    dem:
        cmp a(bx), al
        je tang_n
    
    dem_tiep:
        inc bx
        loop dem
        
        jmp in_kq 
        
    tang_n:
        inc dl
        jmp dem_tiep
    
    in_kq:
        mov bl, dl
        cmp bl, "0"
        je in_kq_0
        
        mov ah, 9
        lea dx, s3
        int 21h
        
        mov dl, bl  ;ah = 2: Hien thi ký tu trong dl  => can chuyen vao dl de in ra man hinh
        
        mov ah, 2
        int 21h
        jmp thoat
     
    in_kq_0:
        mov ah, 9
        lea dx, s4
        int 21h
     
    thoat:    
        mov ah, 4ch
        int 21h
        main endp  
    
    end main
