;nhap vao 1 ky tu va hien thi ra man hinh

.model small
.stack 100h
.data
    s1  db  "nhap vao 1 ky tu: $"
    s2  db  10, 13, "Ky tu vua nhap la: $"
    kytu db ?                
.code    
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, s1
        int 21h
        
        mov ah, 1
        int 21h
        mov kytu, al
        
        mov ah, 9
        lea dx, s2
        int 21h
        
        mov ah, 2
        mov dl, kytu
        int 21h
        
        mov ah, 4ch
        int 21h
        main endp
    end main
 
