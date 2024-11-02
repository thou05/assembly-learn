; nhap so tu 0->10
; neu khong trong do hoac la ki tu thi nhap lai

;bug: 1 khong nhan, 01 moi nhan , deo biet fix

.model small
.stack 100h
.data 
    s1  db  "enter score: $"
    s2  db  10, 13, ":)$"
    s3  db  10, 13, ":($"  
    invalid db  10, 13, "pls enter a score from 0 to 10: $"

.code
    main proc
        mov ax, @data 
        mov ds, ax
   
    input:
        mov ah, 9
        lea dx, s1
        int 21h 
             
        mov ah, 1
        int 21h 
        
        cmp al, 13  ;so sanh enter
        je input_2
    
    input_2:    
        sub al, 48  
        mov bl, 10
        mul bl
        mov bh, al
        
        mov ah, 1
        int 21h
        sub al, 48
        add bh, al
        
        cmp bh, 0
        jl invalid_input
        cmp bh, 10
        jg invalid_input
        
        cmp bh, 7
        jl sad
        jmp fun       
        
    invalid_input: 
        mov ah, 9
        lea dx, invalid
        int 21h
        jmp input
        
    sad:
        mov ah, 9
        lea dx, s3
        int 21h 
        jmp exit
    
    fun:
        mov ah, 9
        lea dx, s2
        int 21h
        jmp exit
    
    exit:    
        mov ah, 4ch
        int 21h
        main endp
    end main
