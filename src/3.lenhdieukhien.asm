;bai 3: lenh dieu khien
; compare: cmp dest, source  

; je lable: jump if equal
; jne lable: jump if not equa
; jz     : zero
; jnz
; ja    : jum if above
; jna
; jg  : greater
; jb : jum if below  
; jl : jump if less than  

; loop 

;jmp label : nhay bat cu den dau khong phu thuoc dieu kien

;-------------------------------------------

.model small
.stack 100h
.data

.code
    main proc  
        ;mov ch, 0 
        ;mov cl, 10  ; dung 2 cau nay hoac cx   
        mov cx, 10
        
        back:
        mov ah, 2
        mov dl, 'A'
        int 21h
        loop back 
        
        mov ah, 4ch
        int 21h
        
        main endp
    end main
    
    
;---------------------
;khong dung loop

.code
    main proc
        mov cl, 1
        
    back:
        mov ah, 2
        mov dl, 'A'
        int 21h  
        mov dl, 32 ;dau cach  ascii 32
        int 21h 
        
        inc cl
        cmp cl, 10  
        ;jl back      ; neu cl < 10 quay lai
        jg end_loop    ;neu cl > 10 nhay toi endloop
        jmp back       ; nguoc lai, quay laji in tiep
    
    end_loop:    
        mov ah, 4ch
        int 21h
        
        main endp
    end main
