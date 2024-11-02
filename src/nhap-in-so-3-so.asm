;nhap, luu va thien thi so 3 chu so
;n = a * 100 + b * 10 + c    

;bug phan in ra man hinh

.model small
.stack 100h
.data  
    s1  db  "nhap 3 so: $"
    s2  db  10, 13, "so vua nhap: $"
    dv  db  0
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, s1
        int 21h
        
        ;(a * 10 + b) * 10 + c 
        mov ah, 1
        int 21h
        sub al, 48  ;doi thanh so
        mov ah, 0   ;xoa ah      
        
        mov bl, 100
        mul bl      ;al * 10
        mov bh, al  ;cat vao bh   
        
        mov ah, 1
        int 21h   
        sub al, 48
        mov ah, 0
        mov bl, 10
        mul bl 
        add bh, al
        
        mov ah, 1
        int 21h 
        sub al, 48
        add bh, al
        
        ;mov dv, bh
       
        ;in 3 so
        mov ah, 9
        lea dx, s2
        int 21h   
        

        mov bl, 10
        mov al, bh
        mov ah, 0
        div bl
        mov dv, ah
        
        mov bl, 10
        mov ah, 0
        div bl
        mov bl, al
        mov bh, ah  
        
        mov ah, 2
        mov dl, al
        add dl, 48
        int 21h
        
        mov dl, bh
        add dl, 48
        int 21h
        
        mov dl, dv
        add dl, 48
        int 21h
          

        
        mov ah, 4ch
        int 21h
        main endp
    end main
