.model small
.stack 100h
.data     
    s1   db  'nhap ky tu: $'   
    s2   db   10, 13, 'ky tu vua nhap la: $'

.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9 ;hien h1
        lea dx, s1
        int 21h   
        
        ;nhap ki tu      
        mov ah, 1
        int 21h  
        mov bl, al 
        
        ;dung 10, 13 nhu tren thay cho 2 doan code nay de xuong dong
        ;mov ah, 2
        ;mov dl, 10
        ;int 21h
        
        ;mov ah, 2
        ;mov dl, 13
        ;int 21h
         
        mov ah, 9  ;hien h2
        lea dx, s2
        int 21h
        
        mov ah, 2
        mov dl, bl
        int 21h  
        
        mov ah, 4ch
        int 21h
        
        main endp
    end main
    
       
          
