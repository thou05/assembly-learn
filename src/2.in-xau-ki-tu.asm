.model small
.stack 100h
.data     
    s   db  'hello$'

.code
    main proc
        
        mov ax, @data
        mov ds, ax
        
        mov ah, 9 ;in xau ki tu
        ;int dx, offset s tuowng tu lea dx ben duoi
        lea dx, s
        int 21h

        mov ah, 4ch
        int 21h
        
        main endp
    end main
