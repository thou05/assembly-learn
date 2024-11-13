;ham 2ah, ngat 21h : lay thoi gian 

;al: thi <0: SUN, 1: MON... 6:SAT>
;dl: ngay <1-31> 
;dh: thang <1-12>
;cx: nam <1980-2099>

.model small
.stack 100h
.data    
    ngay    db  ?
    thang   db  ?
    nam     dw  ?  
    ;cach 1
    ;chunhat db  'Chu nhat$'
    ;thuhai  db  'thu hai$'    
    ;thuba   db  'thu ba$'  
    ;thutu   db  'thu tu$'
    ;cach2
    thu     db  'SUNMONTUEWEDTHUFRISAT$'     

.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 2ah
        int 21h  
        
        mov ngay, dl
        mov thang, dh
        mov nam, cx 
        
        ;cach 1
        ;cmp al, 0
        ;je SUN
        ;cmp al, 1
        ;je MON
        ;cmp al, 2
        ;je TUE  
        ;cmp al, 3
        ;je WED
        
    
    ;SUN:
        ;mov ah, 9
        ;lea dx, chunhat
        ;int 21h  
        ;jmp hienngay 
       
    ;MON:
        ;mov ah, 9
        ;lea dx, thuhai
        ;int 21h  
        ;jmp hienngay 
        
    ;TUE:
        ;mov ah, 9
        ;lea dx, thuba
        ;int 21h   
        ;jmp hienngay 
   
    ;WED:
        ;mov ah, 9
        ;lea dx, thutu
        ;int 21h  
        ;jmp hienngay  
        
        ;cach 2
        mov bl, 3
        mov ah, 0
        mul bl
        mov bx, ax
        mov cx, 3
    inthu:
        mov ah, 2
        mov dl, thu(bx)
        int 21h
        inc bx
        loop inthu
   
    hienngay: 
        mov ah, 2
        mov dl, ' '
        int 21h  
        
        mov bl, 10
        mov al, ngay
        mov ah, 0
        div bl 
        mov bh, ah
        mov ah, 2
        mov dl, al
        add dl, 48
        int 21h
        mov dl, bh
        add dl, 48
        int 21h
        mov dl, '-'
        int 21h 
        
   hienthang:
        mov bl, 10
        mov al, thang
        mov ah, 0
        div bl 
        mov bh, ah
        mov ah, 2
        mov dl, al
        add dl, 48
        int 21h
        mov dl, bh
        add dl, 48
        int 21h
        mov dl, '-'
        int 21h 
        
       
        mov bx, 10
        mov ax, nam
        mov cx, 4 
        
    chiatiep:
        mov dx, 0
        div bx
        push dx ;push du
        loop chiatiep 
        
        mov cx, 4
    hiennam:
        pop dx
        add dl, 48
        mov ah, 2
        int 21h
        loop hiennam:
        
        
        
        
        mov ah, 4ch
        int 21h
        main endp
    end main
        

