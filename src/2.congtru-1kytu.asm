.model small
.stack 100h
.data      
    s1   db  'nhap ky tu: $'
    s2   db  10, 13, 'ky tu dung truoc la : $'   
    s3   db   10, 13, 'ky tu dung sau la: $'

.code
    main proc  
        mov ax, @data
        mov ds, ax   
        
        mov ah, 9
        lea dx, s1
        int 21h
        
        ;nhap ki tu
        mov ah,1   
        int 21h
        mov bl, al
         
           
        mov ah, 9
        lea dx, s2
        int 21h
        
        
        mov ah, 2
        mov dl, bl
        sub dl, 1  ;dec dl
        int 21h
        
        mov ah, 9
        lea dx, s3
        int 21h
        
        mov ah, 2
        mov dl, bl
        add dl, 1  ;inc dl
        int 21h
        
        mov ah, 4ch
        int 21h   
        
        main endp;  
    end main
         

        
       
          
