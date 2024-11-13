;ham 2ch, ngat 21h : lay thoi gian 
; ch: gio, cl: phut, dh: giay, dl: xgiay

.model small
.stack 100h
.data
    s   db  '00:00:00$'
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 2ch
        int 21h    
        
        ;in gio
        mov ah, 0
        mov al, ch
        mov bl, 10
        div bl 
        ;cach 1
        ;mov bh, ah
        ;mov ah, 2
        ;mov dl, al
        ;add dl, 48
        ;int 21h
        ;mov dl, bh
        ;add dl, 48
        ;int 21h 
        
        ;cach2
        add al, 48
        add ah, 48
        mov s, al
        mov s + 1, ah 
        
        ;phut
        mov ah, 0
        mov al, cl
        mov bl, 10
        div bl 
        add al, 48
        add ah, 48
        mov s + 3, al
        mov s + 4, ah  
        
        ;giay
        mov ah, 0
        mov al, dh
        mov bl, 10
        div bl 
        add al, 48
        add ah, 48
        mov s + 6, al
        mov s + 7, ah
        
        mov ah, 9
        lea dx, s
        int 21h  
        
        mov ah, 4ch
        int 21h
        main endp
    end main
        

