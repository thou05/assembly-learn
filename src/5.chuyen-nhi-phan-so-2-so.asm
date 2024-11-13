;push thanh ghi/bien nho 16bit: ax, bx 

;nhap 1 so thap phan =>in ra so nhi phan
  
.model small
.stack 100h
.data
    s1  db  "nhap so thap phan: $"
    s2  db  10, 13, "So nhi phan: $"
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, s1
        int 21h 
        
        mov bl, 10
        mov ah, 1
        int 21h 
        sub al, 48 
        mul bl    
        mov bh, al
        
        mov ah, 1
        int 21h
        sub al, 48
        add bh, al
        
        mov ah, 9
        lea dx, s2
        int 21h
        
        
        mov bl, 2
       
        mov al, bh
        mov cx, 0
  
    chiatiep:
        mov ah, 0      
        div bl
        push ax
        inc cl
        cmp al, 0
        je hienso
        jmp chiatiep
   
    hienso:
        mov ah, 2
        pop dx
        mov dl, dh
        add dl, 48
        int 21h
        loop hienso
        
        
        mov ah, 4ch
        int 21h
        main endp
    end main






