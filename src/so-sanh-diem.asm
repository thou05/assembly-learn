;so sanh diem
;nhap diem 0->10 => xac dinh muc do 
;0->4: kem, 5->6: trung binh, 7->8: gioi, 9->10: xuat sac

.model small 
.stack 100h
.data 
    s1  db  "Nhap diem: $"
    s2  db  10, 13, "KEM$"
    s3  db  10, 13, "TRUNG BINH$"
    s4  db  10, 13, "GIOI$"
    s5  db  10, 13, "XUAT SAC$"

.code
    main proc  
        mov ax, @data
        mov ds, ax  
        
        mov ah, 9
        lea dx, s1
        int 21h
        
        mov ah, 1
        int 21h
        
        cmp al, "4"
        jle kem
        cmp al, "6"
        jle trungbinh
        cmp al, "8"
        jle gioi  
        
        jmp xuatsac
        
     kem:
        mov ah, 9
        lea dx, s2
        int 21h 
        jmp thoat  
        
     trungbinh:
        mov ah, 9
        lea dx, s3
        int 21h  
        jmp thoat  
     
     gioi:
        mov ah, 9
        lea dx, s4
        int 21h    
        jmp thoat 
        
     xuatsac:      
        mov ah, 9
        lea dx, s5
        int 21h  
        jmp thoat  
     
     thoat:   
        mov ah, 4ch
        int 21h
        main endp
    
    end main
