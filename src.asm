.model small
.stack 
.data
    num1 db 9,9,9,9,9
    num2 db 9,9,9,9,9
    crr  db 0 ; This is carry!
    ans  db 0,0,0,0,0,0,0,0,0,0
    
    SIZE dw 5
        
    
.code
    main proc near  
        push ds
        push 0
        mov ax,@data
        mov ds,ax
        ; Start from here!
        mov si, 0
                
             
        ; Num2 loop      
        loop1:
            ; Calculate index                          
            mov ax, SIZE 
            mov dx, 2
            mul dx
            mov dx, ax
            
            sub dx, SIZE
            add dx, si
            inc dx
            
            mov di, SIZE
            
            
            mov bl, num2[si]
            mov crr, 0
            ; Num1 loop
            loop2: 
                mov al, bl
                dec di
                mov ah, num1[di]
                mul ah
                                    
                ; Answer index
                xchg dx, di
                
                dec di        
                add al, ans[di]
                add al, crr
                
                mov cl, 10
                div cl
                
                mov ans[di], ah
                mov crr, al
                                
                
                xchg di, dx
                
            cmp di, 0
            jg  loop2
            
            ; Calculate carry for Non-Calculated digits
            mov di, dx
            loop3:
                dec di
                mov al, ans[di]
                mov ah, 0
                add al, crr
                
                mov cl, 10
                div cl
                
                mov ans[di], ah
                mov crr, al
                
           cmp di, 0
           jg loop3
            
            
            
        inc si    
        cmp si, SIZE
        jl loop1
                    
        
    
        
    main endp
end main
