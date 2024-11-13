;nhap chuoi  -> tach chuoi hoa va chuoi thuong va so

;y tuong: dung bx, si lam 2 chi so cho vao 2 mang a va b

.model small
.stack 100h
.data
    s1  db  "nhap chuoi: $"
    s2  db  10, 13, "in hoa: $"  
    s3  db  10, 13, "in thuong: $"  
    s4  db  10, 13, "in so: $"
    a   db  100 dup(?)
    hoa   db  100 dup(?)  
    thuong  db  100 dup(?)  
    so  db  100 dup(?)    
    tmp dw 0
    
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
        je enter 
        
        mov a(bx), al
        inc bx
        jmp nhap
   
    enter:       
        mov cx, bx
        mov bx, 0
        mov si, 0 
        mov di, 0 
        mov dx, 0
        
    duyettiep:       
        cmp a(bx), 'a'
        jl chuhoa 
        mov al, a(bx)
        mov thuong(di), al
        inc di
        jmp tiep  
        
    chuhoa:  
        cmp a(bx), 'A' 
        jl tachso
        mov al, a(bx)
        mov hoa(si), al
        inc si 
        jmp tiep
   
    tachso:
        mov al, a(bx) 
        mov tmp, bx
        mov bx, dx
        mov so(bx), al
        inc bx
        mov dx, bx
        mov bx, tmp

    tiep:      
        inc bx 
        loop duyettiep  
        
        mov ah, 9
        lea dx, s2
        int 21h
        
        mov hoa(si), '$'
        lea dx, hoa
        int 21h
        
        lea dx, s3
        int 21h 
        
        mov thuong(di), '$'
        lea dx, thuong
        int 21h   
        
    
        lea dx, s4
        int 21h  
        
        mov bx, dx
        mov so(bx), '$'
        lea dx, so
        int 21h
        
        
        mov ah, 4ch
        int 21h
        main endp
    end main
