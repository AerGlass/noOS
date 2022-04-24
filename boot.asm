; boot.asm
   mov ax, 0x07c0
   mov ds, ax
 
   mov si, msg
   cld
clear:
   mov al, 02h
   mov ah, 00h
   int 10h
ch_loop:lodsb
   or al, al ; zero=end of str
   jz hang   ; get out
   mov ah, 0x0E
   mov bh, 0
   int 0x10
   jmp ch_loop
 
hang:
   jmp hang
 
msg   db 'NO.', 13, 10, 0
   times 510-($-$$) db 0
   db 0x55
   db 0xAA
