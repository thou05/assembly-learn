;cong hai so

.model small
.stack 100h
.data
    s1  db  "nhap so thu nhat: $"
    s2  db  10, 13, "nhap so thu hai: $"
    s3  db  10,13, "tong = $"

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
        add bl, al
        
        mov ah, 9
        lea dx, s2
        int 21h
        
        mov ah, 1
        int 21h
        sub al, 48 
        add bl, al
        
        mov ah, 9
        lea dx, s3
        int 21h
        
        ;chia
        ;core o cho nay
        mov ah, 0
        mov al, bl
        mov bl, 10
        div bl     ;al/bl
        
        mov bl, ah 
        
        mov ah, 2
        mov dl, al
        add dl, 48
        int 21h
        
        mov ah, 2
        mov dl, bl
        add dl, 48
        int 21h
        
        
        mov ah, 4ch
        int 21h
        main endp
    end main
        
        
