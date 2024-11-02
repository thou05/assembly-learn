; nhap day so -> dem -> in ra so luong so chan , nhap 0 khi muon in ket qua

.model small
.stack 100h
.data
     s1 db  "nhap day: $"
     s2 db  10, 13, "day vua nhap: $"
     s3 db  10, 13, "so so chan: $"
     a  db  100 dup(?)
.code         
    main proc 
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, s1
        int 21h
        
        mov si, 0
    
    nhaptiep:
        mov ah, 1
        int 21h
        cmp al, 48
        je sokhong
        sub al, 48
        mov a[si], al
        inc si
        jmp nhaptiep
    
    sokhong:
        mov ah, 9
        lea dx, s2
        int 21h
        
        mov cx, si
        mov si, 0
    intiep:
        mov ah, 2
        mov dl, a[si]
        add dl, 48
        int 21h
        inc si
        cmp si, cx
        jle intiep
        
        mov bl, 2
        mov bh, 0
        mov si, 0
    sosanh:    
        mov ah, 0
        mov al, a[si]
        div bl
        cmp ah, 0
        je sochan
        jmp tiep
   
    sochan:
        inc bh
        
    tiep:
        inc si
        cmp si, cx
        jl sosanh
        
        mov ah, 9
        lea dx, s3
        int 21h
        
        mov ah, 2
        mov dl, bh
        add dl, 48
        int 21h
        
        
        mov ah, 4ch
        int 21h
        main endp
    end main
