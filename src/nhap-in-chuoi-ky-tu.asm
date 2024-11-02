.model small
.stack 100
.data
    tb1 DB 10,13, 'chuoi da nhap la: $'
    str DB 100 dup('$') ;
.code
    main proc
        mov ax, @data
        mov ds,ax 
        
        mov ah,10    ;10-tuong ung 0Ah 
                    ; ah = 10 yêu c?u DOS th?c hi?n ch?c nang "nh?p m?t chu?i ký t?"
        lea dx,str
        int 21h   
        
        mov ah,9
        lea dx,tb1
        int 21h     
        
        lea dx,str +2 ; dua dia chi chuoi da nhap (bat dau tu byte thu 3 - 2 byte dau la do dai chuoi va thong tin khac)
        int 21h     
        
        mov ah,4CH
        int 21h
        main endp
    end
