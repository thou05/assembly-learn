;nhap vao 2 so, in ra 2 so do

;nhap so thu nhat -> * 10 -> nhap so thu 2 -> cong voi so 1
;in : chia cho 10 -> in thuong al -> in du ah

.model small
.stack 100h
.data 
s1 db 'nhap n: $'
s2 db 10, 13, 'So vua nhap: $'
.code
main proc
        mov ax, @data
        mov ds, ax  
        
        mov ah, 9 
        lea dx, s1
        int 21h  
        
        mov ah, 1
        int 21h    
        
        sub al, 48
        mov bl, 10
        mul bl
        mov bh, al
        mov ah, 1
        int 21h
        sub al, 48
        add bh, al  	
        
        mov ah, 9
        lea dx, s2
        int 21h  
        
        mov ah, 0
        mov al, bh
        mov bl, 10
        div bl
        mov bl, al
        mov bh, ah
        mov ah, 2
        mov dl, bl
        add dl, 48
        int 21h
        mov dl, bh
        add dl, 48
        int 21h
        mov ah, 4ch
        int 21h
    main endp
end main
