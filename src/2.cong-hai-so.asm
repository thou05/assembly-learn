.model small
.stack 100h
.data
    s1  db  'nhap so thu nhat: $'
    s2  db  10, 13, 'nhap so thu hai: $'
    s3  db  10, 13, 'tong la: $'
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
        sub al, 48  ;tru de doi thanh so , ?chua hieu lam 
        mov cl, al
        
        mov ah, 9
        lea dx, s3
        int 21h 
        
        add bl, cl
        
        mov ah, 2
        mov dl, bl
        add dl, 48
        int 21h 
        
        mov ah, 4ch
        int 21h 
        
        main endp
    end main
        





