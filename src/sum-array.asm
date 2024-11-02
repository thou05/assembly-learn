;nhap chuoi va tinh tong chuoi do

.model small
.stack 100h
.data
    msgn    db  "enter n: $"
    n       db  0
    msga    db  "pls enter array: $"
    arr     db  100 dup(0)
    msgi    db  10, 13, "enter number: $"
    msgs    db  10, 13, "sum = $"   
    tong    db  0
    
.code
    main proc     
        ;chuyen dia chi data vao cpu
        mov ax, @data
        mov ds, ax 
    
    nhapn:
        mov ah, 9
        lea dx, msgn
        int 21h
        
        mov cl, 10
    nhaptn:
        mov ah, 1
        int 21h
        cmp al, 13  ;ktra enter
        je dungn    ;neu la enter -> dung nhap
        
        cmp al, '0'
        jl nhapn             
        cmp al, '9'
        jg nhapn
        
        sub al, 48  ;chyen ve chu so
        mov bx, 0   ;reset bx ve 0
        mov bl, al
        mov ax, 0
        mov al, n
        mul cl      ;n*10
        add ax, bx  ;n*10 + nhap
        mov n, al
        jmp nhaptn
    
    dungn:
        mov ah, 9
        lea dx, msga
        int 21h
        
        mov ch, n
        mov bx, 0   ;i = 0
        
    nhapta:
        mov ah, 9
        lea dx, msgi
        int 21h
    
    nhapti:
        ;nhap i
        mov ah, 1
        int 21h
        cmp al, 13  ;ktra enter
        je dungi    
        cmp al, '0'
        jl nhapta
        cmp al, '9'
        jg nhapta
        sub al, 48
        mov dx, 0
        mov dl, al
        mov ax, 0
        mov al, arr[bx] ;chuyen n vao al
        mul cl
        add ax, dx
        mov arr[bx], al
        jmp nhapti
    
    dungi:
        inc bx
        cmp ch, bl
        je dunga
        jmp nhapta
    dunga:
        mov ch, n
        mov bx, 0
        mov dx, 0
    
    congtiep:
        add dl, arr[bx]
        inc bx
        cmp ch, bl
        je dungcong
        jmp congtiep
    
    dungcong:
        mov tong, dl
        
        mov ah, 9
        lea dx, msgs
        int 21h
        
        mov al, tong
        mov bx, 0
   
    ct:
        mov ah, 0
        mov dx, 0
        div cl
        add ah, 48
        mov dl, ah
        push dx
        inc bx
        cmp al, 0
        je dungct
        jmp ct  
    
    dungct:
        mov cx, bx
    
    inso:
        mov ah, 2
        pop dx
        int 21h
        loop inso
        
        
        mov ah, 4ch
        int 21h
        main endp
    end main
