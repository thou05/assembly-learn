 ;de 1 

;bai 1
.model small
.stack 100h
.data   
    ltthaoTB1   db  "Ho ten ban la: $"
    ltthaoTB2   db  10, 13, "Chao ban: $"  
    ltthaoTB3   db  10, 13, "Dao nguoc: $"
    a           db  100 dup (?)

.code
    main proc  
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, ltthaoTB1
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
        mov a(bx), "$"
        mov ah, 9
        lea dx, ltthaoTB2
        int 21h
        
        mov cx, bx
        mov bx, 0 
        
    in_thuong: 
        mov al, a(bx) ; chuyen vao al de khi in nguoc khong bi ghi de
        cmp al, "$" ; N?u g?p '$', chuy?n sang in ch? hoa
        je kt_in_thuong
        
        cmp al, "A"
        jl khong_doi 
        cmp al, "Z"
        jg khong_doi
        add al, 32
   
    khong_doi: 
        mov ah, 2
        mov dl, al
        int 21h
        inc bx
        loop in_thuong  
   
    kt_in_thuong:
        mov ah, 9
        lea dx, ltthaoTB2
        int 21h
        
        mov cx, bx
        mov bx, 0
    in_hoa:     
        mov al, a(bx)
        cmp al, "$"
        je kt_in_hoa
         
        cmp al, "a"
        jl khong_doi_hoa   
        cmp al, "z"
        ja  khong_doi_hoa
        sub al, 32 
    
    khong_doi_hoa:
        mov ah, 2
        mov dl, al
        int 21h
        inc bx
        loop in_hoa
   
    kt_in_hoa:
        mov ah, 9
        lea dx, ltthaoTB3
        int 21h  
        
        dec bx
    in_nguoc:  
        cmp a(bx), "$"
        je ketthuc  
        
        mov ah, 2
        mov dl, a(bx)
        int 21h
        
        dec bx
        jmp in_nguoc
        

    ketthuc:     
        mov ah, 4ch
        int 21h 
        main endp
    end main
