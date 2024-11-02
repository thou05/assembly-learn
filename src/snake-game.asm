;Eng. Davis
;Snake Project
;University Microproccessor course
;version 1.1

data segment
    ;mainmenu
    main1 db "Davis Snake"
    main2 db "In this game you must eat 3 letters by sequence:"
    main3 db "First eat 'a' then 'v' then 'i' then 's'"
    main4 db "Move the snake by pressing the keys w,a,s,d"
    main5 db "w:move up"
    main6 db "s:move down"
    main7 db "d:move right"
    main8 db "a:move left"
    about1 db "This game is done by: Eng. Davis,"
    about2 db "For University Microproccessor course"
    main9 db "The snake head is the 'D' in the middle of the screen"
    main10 db "Press any key to start..."
    ;bild
    hlths db "Lives:",3,3,3
    ;ingame
    letadd dw 09b4h,0848h,06b0h,01E8h,4 Dup(0) ;display addresses of collectable letters, this is being displayed and updated during the game play
    dletadd dw 09b4h,0848h,06b0h,01E8h,4 Dup(0) ;default values for collectable letters addresses on display to return them back after reset the game
    letnum db 4 ;number of collectable letters
    fin db 4 ;to track the number of collectable letters
    hlth db 6 ;/2 ;health count which is 3 in this case
    ;Snake Info            
    sadd dw 07D2h,5 Dup(0) ;address of the first letter on the display and this will be updated during game play and will add each letter address after collecting
    snake db 'D',5 Dup(0) ;Collected letters array
    snakel db 1 ;collected letters count
    ;end 
    gmwin db "You Win"
    gmov db "Game Over"
    endtxt db "Press esc to exit"
    
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    mov ah,1 
    int 21h
    mov ax, data
    mov ds, ax
    
    mov ax,0b800h
    mov es, ax 
    
    cld ;clear Direction Flag
    
    ;hide text cursor
    mov ah,1
    mov ch,2bh
    mov cl,0bh
    int 10h  
    
    call main_menu
    
    startag:
    
    call bild ;put letters and draw borders
    
    xor cl,cl 
    xor dl,dl ;clear old values to not get input automatically or you can use it as the initial direction like " mov dl,'A' "
    read: ;check for keyboard inputs
    mov ah,1
    int 16H
    jz s1
    mov ah,0
    int 16H
    and al,0dfh 
    mov dl,al
    jmp s1
    
    s1: ;check if esc button is pressed
    cmp dl,1bh
    je ext
    
    left:
    cmp dl,'A'
    jne right
    call ml
    mov cl,dl
    jmp read
    
    right:
    cmp dl,'D'
    jne up
    call mr
    mov cl,dl
    jmp read
    
    up:
    cmp dl,'W'
    jne down
    call mu 
    mov cl,dl
    jmp read
    
    down:
    cmp dl,'S'
    jne read1
    call md
    mov cl,dl
    jmp read
    
    read1:
    mov dl,cl
    jmp read
    
    
    ext:
    xor cx,cx
    mov dh,24
    mov dl,79
    mov bh,7
    mov ax,700h
    int 10h
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends 

;main menu
main_menu proc
    call border
    
    mov di,186h
    lea si,main1
    mov cx,11
    lopem1:
    movsb 
    inc di
    loop lopem1
    
    mov di,33Eh
    lea si,main2
    mov cx,48
    lopem2:
    movsb 
    inc di
    loop lopem2
    
    mov di,3DEh
    lea si,main3
    mov cx,40
    lopem3:
    movsb 
    inc di
    loop lopem3
    
    mov di,47Eh
    lea si,main4
    mov cx,43
    lopem4:
    movsb 
    inc di
    loop lopem4
    
    mov di,5dch
    lea si,main5
    mov cx,9
    lopem5:
    movsb 
    inc di
    loop lopem5
    
    mov di,67ch
    lea si,main6
    mov cx,11
    lopem6:
    movsb 
    inc di
    loop lopem6
    
    mov di,71ch
    lea si,main7
    mov cx,12
    lopem7:
    movsb 
    inc di
    loop lopem7
    
    mov di,7bch
    lea si,main8
    mov cx,11
    lopem8:
    movsb 
    inc di
    loop lopem8
    
    mov di,8DEh
    lea si,about1
    mov cx,33
    lopea1:
    movsb 
    inc di
    loop lopea1
    
    mov di,97Eh
    lea si,about2
    mov cx,37
    lopea2:
    movsb 
    inc di
    loop lopea2
    
    mov di,0ABEh
    lea si,main9
    mov cx,53
    lopem9:
    movsb 
    inc di
    loop lopem9
    
    mov di,0b5Eh
    lea si,main10
    mov cx,25
    lopem10:
    movsb 
    inc di
    loop lopem10
    
    
       
    mov ah,7
    int 21h
    
    call clearall
    
    
ret
endp    
;Game screen 
bild proc ;is for placing borders and set chracters on the screen
    ;start point
    call border 
    
    lea si,hlths
    mov di,0
    mov cx,9
    loph:
    movsb 
    inc di
    loop loph
    
    lea si,main1
    mov di,88h
    mov cx,11
    loph1:
    movsb 
    inc di
    loop loph1   
    
    xor dx,dx
    mov di,sadd
    mov dl,snake 
    es: mov [di],dl  
    ;Place chracters in game screen
    es: mov [09b4h],'a'
    es: mov [0848h],'v'
    es: mov [06b0h],'i' 
    es: mov [01E8h],'s'
    ret
endp  

;snake move:
;left:
ml proc ;snake move left function
    push dx 
    call shift_addrs
    sub sadd,2
    
    call eat
    
    call move_snake
    pop dx
ret    
endp
;right:
mr proc ;snake move right function
    push dx 
    call shift_addrs
    add sadd,2
    
    call eat
    
    call move_snake 
    
    pop dx
    
ret    
endp
;up:
mu proc ;snake move up function
    push dx 
    call shift_addrs
    sub sadd,160
    
    call eat
    
    call move_snake
    pop dx
ret    
endp
;down:
md proc ;snake move down function
    push dx 
    call shift_addrs
    add sadd,160
    
    call eat
    
    call move_snake
    pop dx
ret    
endp

shift_addrs proc
    push ax
    xor ch,ch
    xor bh,bh
    mov cl,snakel
    inc cl
    mov al,2
    mul cl
    mov bl,al
    
    xor dx,dx
    
    shiftsnake:
    mov dx,sadd[bx-2]
    mov sadd[bx],dx
    sub bx,2
    loop shiftsnake:
pop ax
ret
endp

eat proc ;to check if the snake hit a letter or not and add it to the snake
    push ax 
    push cx 
    
    mov di,sadd 
    es: cmp [di],0 
    jz no
    es: cmp [di],20h
    jz wall 
    xor ch,ch
    mov cl,letnum 
    xor si,si
    lop:
    cmp di,letadd[si]
    jz addf
    add si,2
    loop lop
    jmp wall
    addf:
    mov letadd[si],0 
    xor bh,bh
    mov bl,snakel
    es: mov dl,[di]
    mov snake[bx],dl
    es: mov [di],0
    add snakel,1 
    sub fin,1
    cmp fin,0
    jz chkletters
    jmp no
    wall:
    cmp di,320
    jbe wallk
    cmp di,3840
    jae wallk
    mov ax,di
    mov bl,160
    div bl
    cmp ah,0
    jz wallk
    mov ax,di
    add ax,2
    mov bl,160
    div bl
    cmp ah,0
    jz wallk
    jmp no
    wallk:
    xor bh,bh
    mov bl,hlth
    es: mov [bx+10],0
    mov hlths[bx+2],0
    sub hlth,2
    cmp hlth,0
    jnz rest
    pop cx
    pop ax
    call game_over 
    rest: 
    pop cx
    pop ax
    call restart
     
    no:
    pop cx
    pop ax
ret
endp 

move_snake proc
    xor ch,ch
    xor si,si
    xor dl,dl
    mov cl,snakel
    xor bx,bx
    l1mr:
    mov di,sadd[si]
    mov dl,snake[bx]
    es: mov [di],dl
    add si,2
    inc bx
    loop l1mr
    mov di,sadd[si] 
    es:mov [di],0
ret
endp

border proc ;build borders function
    mov ah,0
    mov al,3
    int 10h
    
    mov ah,6
    mov al,0 
    mov bh,0ffh 
    
    mov ch,1
    mov cl,0
    mov dh,1
    mov dl,80
    int 10h
  
    mov ch,3
    mov cl,0
    mov dh,24
    mov dl,0
    int 10h
   
    mov ch,24
    mov cl,0
    mov dh,24
    mov dl,79
    int 10h
    
    mov ch,1
    mov cl,79
    mov dh,24
    mov dl,79
    int 10h

ret
endp

restart proc
    xor ch,ch  
    xor si,si
    mov cl,snakel
    inc cl
    delt: 
    mov di,sadd[si]
    es:mov [di],0
    add si,2
    loop delt
       
    mov fin,4


    mov sadd,07D2h
    mov cl,snakel
    inc cl
    xor si,si
    inc si
    xor di,di
    add di,2
    emptsn:
    mov snake[si],0
    mov sadd[di],0
    add di,2
    inc si
    loop emptsn
    mov snakel,1
    
    xor ch,ch
    mov cl,letnum
    xor si,si
    reslet:
    mov bx,dletadd[si]
    mov letadd[si],bx
    add si,2
    add bx,2
    loop reslet      
    xor si,si
    mov snake[si],'D'

    jmp startag

endp

chkletters proc
    call move_snake
    
    cmp snake[1],'a'
    jnz endtestl
    cmp snake[2],'v'
    jnz endtestl   
    cmp snake[3],'i'
    jnz endtestl   
    cmp snake[4],'s'
    jnz endtestl
    call win
    endtestl:
    xor bh,bh
    mov bl,hlth
    es: mov [bx+10],0
    mov hlths[bx+2],0
    sub hlth,2
    cmp hlth,0
    jnz restc
    call game_over 
    restc: 
    call restart
    endp

win proc 
    call clearall
    call border
     
    mov di,7cah
    lea si,gmwin
    mov cx,7
    lope1w:
    movsb 
    inc di
    loop lope1w
    
    mov di,862h
    lea si,endtxt
    mov cx,17
    lope2:
    movsb 
    inc di
    loop lope2
    
    qwer1:         
    mov ah,7
    int 21h
    cmp al,1bh         
    jz ext
    jmp qwer1
    
    ret
    endp
game_over proc
    call clearall
    call border
    
    mov di,7c8h
    lea si,gmov
    mov cx,9
    lope1:
    movsb 
    inc di
    loop lope1
    
    mov di,862h
    lea si,endtxt
    mov cx,17
    lope2w:
    movsb 
    inc di
    loop lope2w 
    
    qwer:         
    mov ah,7
    int 21h
    cmp al,1bh         
    jz ext
    jmp qwer
    
endp

clearall proc
    
    xor cx,cx
    mov dh,24
    mov dl,79
    mov bh,7
    mov ax,700h
    int 10h 
    
ret
endp    

    
end start ; set entry point and stop the assembler.


