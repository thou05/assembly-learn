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
        
        mov ah, 1
        int 21h 
        sub al, 48
        
        mov cl, 0   ;i 
        mov bl, 2 
    chiatiep: 
        mov ah, 0
        div bl
        push ax      ;push ah nhung phai push 16bit nen push ca ax
        inc cl
        cmp al, 0    ;dung khi thuong = 0
        je hienso 
        jmp chiatiep
    hienso: 
        mov ah, 9
        lea dx, s2
        int 21h
        
        mov ch, 0
    intiep:     
        mov ah, 2
        pop dx   
        mov dl, dh
        add dl, 48
        int 21h
        loop intiep

        
        
        mov ah, 4ch
        int 21h
        main endp
    end main






