.model small
.stack 1000h

.data
filename db 20 dup(?), 0
pfilename db ?
key db 42    
buffer db 1000 dup ('$') 
passbuffer db 1000 dup ('$')
fhandle dw ?
phandle dw ? 
decrrr db ?
p1 db ?
p2 db ?
p3 db ?
p4 db ?
op db ? 
b1 db ?
b2 db ?
b3 db ?
b4 db ?
c1 db ?
c2 db ?
c3 db ?
c4 db ?  
spc db ' '
msg1 db 'Enter file name:$'
error_msg db "Error: Unable to open file.", 0

; Personal Details and Social Media Links:
; Author: Muhammad Jawad Ahmad
; LinkedIn: https://www.linkedin.com/in/jawadahmadcs/
; Instagram: https://www.instagram.com/jawadahmadcs
; Facebook: https://www.facebook.com/JawadAhmadCS
; GitHub: https://github.com/JawadAhmadCS
; Blogs: https://jawadahmadcs.blogspot.com/

.code
include 'emu8086.inc'
main proc 
    mov ax, @data
    mov ds, ax  
    push ax
push bx
push cx
mov ah,09h
mov bl,31
mov cx,16
int 10h
mov ah,9
      mov dx,offset msg1
      int 21h
      pop cx
pop bx
pop ax
       mov bl,0
      label111:;file name from user
    mov ah, 01h      
    int 21h          
    cmp al, 13       
    je gooostart         
    mov filename[si], al 
    mov pfilename[si], al 
    inc si
    inc bl           
    jmp label111  
     gooostart:
     ;call filelength 
       call next_line
        
    lea dx, filename  ;file attribute set to read write
    mov ax, 4301h    
    mov cx, 0     
    int 21h 
    
    jmp start
    encr:
    call next_line
           push ax
push bx
push cx
mov ax, 3
int 10h  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,9
mov cx,50
int 10h
     print 'Encrypting Mod Opened'
     pop cx
pop bx
pop ax
        
               call next_line  
    call next_line  
    
               push ax
push bx
push cx  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,15
mov cx,50
int 10h
    print 'File:'
     pop cx
pop bx
pop ax
     
    call encryptFile
    jmp exit
    decr:
    call next_line
               push ax
push bx
push cx 
mov ax, 3
int 10h 
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,9
mov cx,50
int 10h
      print 'Decrypting Mod Opened'
     pop cx
pop bx 
pop ax
    call next_line
    call next_line 
                   push ax
push bx
push cx  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,15
mov cx,50
int 10h
      print 'File:'
     pop cx
pop bx
pop ax
    
    call decryptFile
      
    jmp exit
    start:
      call next_line
      call next_line
     push ax
push bx
push cx
  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,2
mov cx,50
    int 10h 
       
     print 'Continue with '  
     pop cx
pop bx
pop ax 
     push ax
push bx
push cx  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,12
mov cx,50
    int 10h 
       
     print '...'  
     pop cx
pop bx
pop ax
call next_line
         push ax
push bx
push cx  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,12
mov cx,2
    int 10h    
     print '1)'  
     pop cx
pop bx
pop ax
     push ax
push bx
push cx  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,15
mov cx,50
    int 10h 
       
     print ' Encrypt '  
     pop cx
pop bx
pop ax
    
    call next_line
      push ax
push bx
push cx  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,12
mov cx,2
    int 10h    
     print '2)'  
     pop cx
pop bx
pop ax 
push ax
push bx
push cx  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,15
mov cx,50
int 10h 

      print ' Decrypt '  
     pop cx
pop bx
pop ax
   
          
     call length 
     start2:
     call next_line
     call next_line 
     push ax
push bx
push cx  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,47
mov cx,18
int 10h
      print 'Enter your choice:' 
     pop cx
pop bx
pop ax
    mov ah,1
    int 21h  
        
    ; call next_line
    cmp al,49
    jz encr
    cmp al,50
    jz decr 
    print 13
    push ax
push bx
push cx  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,0ch
mov cx,50
int 10h
      print 'Wrong Choice TryAgain' 
     pop cx
pop bx
pop ax
    
    jmp start2
    
     file_error:
         push ax
push bx
push cx 
call next_line
call next_line 
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,4
mov cx,50
int 10h
      print "Error: Unable to open file." 
     pop cx
pop bx
pop ax
     
    
    exit:
    call next_line
                        push ax
push bx
push cx  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,15
mov cx,50
int 10h
      print 'Exited!'
     pop cx
pop bx
pop ax
        
    
    mov ah, 4Ch
    int 21h

main endp
  
  next_line proc
    print 10
    print 13
    ret
    next_line endp

 length proc
      ;...........Block 1 to find length of file
 
    mov ah, 3Dh        
    mov al, 0          
    lea dx, filename   
    int 21h            

    jc file_error 
     mov fhandle,ax     
    mov bx,fhandle
   
            
mov ah, 42h
mov al,2
int 21h 
mov ah,0
mov cx, ax

   ;   
    mov ah, 3Eh         
    int 21h
            
            
            
            ;End Block 1
 ret
    
    
length endp
 

encryptFile proc
     
    jmp start0
       yes:
       jmp start00
      ; file_error:
;    mov ah, 09h      
;    lea dx, error_msg
;    int 21h          
        print 10
       start00:
       
    mov ah, 3Dh      
    mov al, 0        
    lea dx, filename 
    int 21h          

    jc file_error    
    mov fhandle, ax       

     mov bx, fhandle 
    mov ah, 3Fh
    ;push cx
    ;mov cx,1000      
    lea dx, buffer   
    int 21h          
   ; pop cx
    mov ah, 3Eh      
    mov bx, fhandle       
    int 21h          
     print 13
                             push ax
push bx
push cx  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,13
mov cx,50
int 10h
       print 'File:'
     pop cx
pop bx
pop ax
    
     call next_line
     call next_line
                                  push ax
push bx
push cx  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,3
mov cx,250
int 10h
      mov ah, 09h      
    lea dx, buffer   
    int 21h 
     pop cx
pop bx
pop ax
     
     call next_line
         call createpassward
        ;cmp di,3
     ;  jnz action
     ;  jmp exit
     jmp action
       no: 
       print 10
      ;  cmp di,3
      ; jnz action
      ; jmp exit
      call createpassward
      
       jmp action
    start0: 
    print "("
    mov ah,9
    lea dx,pfilename
    int 21h
     print ')'
     call checkbeforestart
     print 10
     print 13  
     
         push ax
push bx
push cx  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,11
mov cx,50
int 10h
      print 'Do You Want To Open File y/n'
     pop cx
pop bx
pop ax
     
     start22:
     call next_line 
     mov ah,1
     int 21h
     cmp al,121
     jz yes
     cmp al,110
     jz no
     print 13
              push ax
push bx
push cx  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,0ch
mov cx,50
int 10h
      print 'Wrong Choice TryAgain y/n'
     pop cx
pop bx
pop ax
     
    
    jmp start22
    
    action:   
    
         
    
   
  mov si,8  
   encrypt_looop: 
    mov al, buffer[si]
    xor al, key 
    push si
    cmp decrrr,2
    jz decrypt333 
    jnz ecrypt333  
     
    decrypt333:
    
    sub si,8
    jmp letok
     ecrypt333:
     add si,8
     letok:    
    mov passbuffer[si], al
    pop si
    inc si         
    cmp si,cx 
    jb encrypt_looop
         
           
      cmp decrrr,2
      jnz noopleasegonottohere
      add cx,8 
      inc si  
      mov al,spc
      MOV BYTE PTR passbuffer[SI], ' '
      inc si
      mov al,spc
      MOV BYTE PTR passbuffer[SI], ' '
      inc si
      mov al,0             
     MOV BYTE PTR passbuffer[SI], ' '
      inc si
      mov al,spc
     MOV BYTE PTR passbuffer[SI], ' '
      
      noopleasegonottohere:
         
        cmp decrrr,2
    jz iamdone
         
     mov si,8 
     mov al,b1 
     xor al, key 
     mov passbuffer[si],al
     inc si
      mov al,b2 
      xor al, key 
     mov passbuffer[si],al
     inc si   
             
      mov al,b3
      xor al, key 
     mov passbuffer[si],al
     inc si  
              
      mov al,b4
      xor al, key 
     mov passbuffer[si],al    
     inc si
     mov al,c1 
     xor al, key 
     mov passbuffer[si],al
     inc si
      mov al,c2 
      xor al, key 
     mov passbuffer[si],al
     inc si   
; Personal Details and Social Media Links:
; Author: Muhammad Jawad Ahmad
; LinkedIn: https://www.linkedin.com/in/jawadahmadcs/
; Instagram: https://www.instagram.com/jawadahmadcs
; Facebook: https://www.facebook.com/JawadAhmadCS
; GitHub: https://github.com/JawadAhmadCS
; Blogs: https://jawadahmadcs.blogspot.com/         
      mov al,c3
      xor al, key 
     mov passbuffer[si],al
     inc si  
              
      mov al,c4
      xor al, key 
     mov passbuffer[si],al
    
    ;jb encrypt_looop
    
    iamdone: 
     cmp decrrr,2
    jz letdecrypt
    jnz letsencrypt
    letdecrypt:
    sub cx,8
     letsencrypt:
    mov bx,fhandle
    mov ah, 42h  ;move file pointer to start     
    mov al, 0
    push cx         
    mov cx, 0         
    mov dx, 0         
    int 21h
      pop cx     
         
    cmp decrrr,2
    jz nogoagain
         
         mov si,0
    mov al, '#'
    xor  al,key       
    mov passbuffer[si], al
    inc si 
    
    mov al,'@'
    xor  al,key       
    mov passbuffer[si], al
    inc si
    
    mov al,'^'
    xor al,key       
    mov passbuffer[si], al
    inc si
    
    mov al, ')'
    xor al,key      
    mov passbuffer[si], al  
           
        mov bx,fhandle 
       mov ah, 3Eh       
    int 21h
        push cx
       MOV AH, 3Ch      
    MOV CX, 2 ;hide file     
    MOV DX, OFFSET filename
    INT 21h
     
    mov fhandle,ax 
       mov bx,fhandle
       pop cx
    mov ah, 40h       
    mov al,2
    add cx,8       
    lea dx, passbuffer    
    int 21h  
         
        
         
     ; Close file
    mov ah, 3Eh       
    int 21h 
    
    lea dx, filename  
    mov ax, 4301h     
    mov cx, 03h       
    int 21h           
      print 10
       print 10
       print 13                           
push ax
push bx
push cx  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,47
mov cx,17
int 10h

      print 'File Locked...'
      mov ah,2
mov dl,12
int 21h
     pop cx
pop bx
pop ax
       jmp lastmessage
      nogoagain:
       
       mov bx,fhandle 
       mov ah, 3Eh       
    int 21h 
    
   
     
    push cx 
    
   
    MOV AH, 3Ch      
    MOV CX, 0      
    MOV DX, OFFSET filename
    INT 21h
      
    mov bx,ax
    mov ah, 40h       
    mov al,2
    ;add cx,4
    pop cx
    sub cx,8       
    lea dx, passbuffer    
    int 21h           
     ; Close file
    mov ah, 3Eh       
    int 21h
       print 10
       print 10
       print 13                           
push ax
push bx
push cx  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,44
mov cx,17
int 10h

      print 'File Unlocked...'
      mov ah,2
mov dl,12
int 21h
     pop cx
pop bx
pop ax
     lastmessage:
    call next_line
;                  push ax
;push bx
;push cx  
;mov ax,0
;mov bx,0
;mov dx,0
;mov ah,09h
;mov bl,47
;mov cx,20
;int 10h
;      print 'Operation Successful'
;     pop cx
;pop bx
;pop ax           
;    
   ; print 10
   ;; print 13
   ; print 'Do You Want To View Updated File y/n' 
   ; mov di,3
   ; jmp start22
jmp exit:
    ret
encryptFile endp


decryptFile proc 
    print "("
    mov ah,9
    lea dx,pfilename
    int 21h
     print ')'
     print 10
     print 13
    mov decrrr,2
    mov op,2 
     call checkbeforestart 
    call checkpassward 
     
    
  
     ; call encryptFile
    ret
decryptFile endp
 
 
 deleteFile proc
    
    mov ah,41h
    lea dx,filename
    int 21h
    
    ret
deleteFile endp
 
 
getpassward proc
                  push ax
push bx
push cx  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,15
mov cx,50
int 10h
      print 'Passward:'
     pop cx
pop bx
pop ax
    
    mov ah,1
    int 21h
    mov p1,al
    mov ah,1
    int 21h
    mov p2,al
    mov ah,1
    int 21h
    mov p3,al
    mov ah,1
    int 21h
    mov p4,al 
    
    ret
getpassward endp
  
  createpassward proc
    
      
    mov ah, 3Dh       
    lea dx, filename  
    mov al, 2         
    int 21h           
      
    mov bx, ax        
    mov fhandle ,ax  
      
    ; Read from file
    mov ah, 3Fh             
    lea dx, buffer    
    int 21h 
   
   mov si,0       
   mov al,buffer[si] 
   mov b1,al
   inc si
   mov al,buffer[si]
   mov b2,al
   inc si
   mov al,buffer[si]
   mov b3,al
   inc si
   mov al,buffer[si]
   mov b4,al
   inc si 
          
   mov al,buffer[si] 
   mov c1,al
   inc si
   mov al,buffer[si]
   mov c2,al
   inc si
   mov al,buffer[si]
   mov c3,al
   inc si
   mov al,buffer[si]
   mov c4,al
       print 10
                                  push ax
push bx
push cx  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,15
mov cx,50
int 10h
     print 'Create 4 digit '
     pop cx
pop bx
pop ax
      
       
     call getpassward
      print 10
      
      print 10  
      print 13
               push ax
push bx
push cx  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,14
mov cx,15
int 10h 

      print 'Processing...'
     pop cx
pop bx
pop ax
      
      mov si,4
    mov al, p1
    xor  al,key       
    mov passbuffer[si], al
    inc si 
    
    mov al,p2
    xor  al,key       
    mov passbuffer[si], al
    inc si
    
    mov al,p3
    xor al,key       
    mov passbuffer[si], al
    inc si
; Personal Details and Social Media Links:
; Author: Muhammad Jawad Ahmad
; LinkedIn: https://www.linkedin.com/in/jawadahmadcs/
; Instagram: https://www.instagram.com/jawadahmadcs
; Facebook: https://www.facebook.com/JawadAhmadCS
; GitHub: https://github.com/JawadAhmadCS
; Blogs: https://jawadahmadcs.blogspot.com/    
    mov al, p4
    xor al,key      
    mov passbuffer[si], al   
    
     
    ret
    createpassward endp 
    
    
  
  checkpassward proc
     ; push cx          
     
    
     ; pop cx
    mov ah, 3Dh       
    lea dx, filename  
    mov al, 2         
    int 21h 
                
    mov bx, ax        
      
    ; Read from file
    mov ah, 3Fh               
    lea dx, buffer    
    int 21h 
         
    mov ah, 3Eh                  
    int 21h
    
      mov ah, 3Dh       
    mov al, 0           
    lea dx, filename    
    int 21h                    
    mov bx, ax          
    
    mov ah, 3Fh
    push cx         
    mov cx, 8        
    lea dx,passbuffer     
    int 21h             

    ; Close file
    mov ah, 3Eh            
    int 21h 
     
       call deleteFile 
     
print 10
print 13                                                 
                  
      mov si,4  
   encrypt_loooop: 
    mov al, passbuffer[si]
    xor al, key       
    mov passbuffer[si], al
    inc si           
    loop encrypt_loooop
    
    pop cx
        
         jmp g1234
      incorrect:
      print 10
       print 13
                           push ax
push bx
push cx  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,12
mov cx,50
int 10h
      print 'Incorrect passward...try again'
     pop cx
pop bx
pop ax
      
       print 10
print 13
       g1234:
    
       call getpassward 
       
       mov si,4      
       mov al,p1
       
       cmp passbuffer[si],al
       jne incorrect
        inc si 
        
         mov al,p2
       cmp passbuffer[si],al
       jne incorrect
        inc si
          
        mov al,p3
       cmp passbuffer[si],al
       jne incorrect
        inc si
        
         mov al,p4
       cmp passbuffer[si],al
       jne incorrect
        print 13
                                   push ax
push bx
push cx
mov ax,13
int 10h  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,10
mov cx,16
int 10h 

      print 'Passward correct'
     pop cx
pop bx
pop ax
       print 10
       print 10
       print 13                           
push ax
push bx
push cx  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,14
mov cx,17
int 10h

      print 'Processing...'
     
     pop cx
pop bx
pop ax
       
       print 10
       print 13
        jmp action
   ret
      checkpassward endp
      ;
      ;
      ;
      ;
      ;
      ;
      ;;
      ;
      ;
      ;
      ;
      
      ;
      ;
      ;
      ;;
      ;
      ;
      ;
      ;
      ;;
      ;
      checkbeforestart proc
 
      mov ah, 3Dh       
    mov al, 0           
    lea dx, filename    
    int 21h                    
    mov bx, ax          
    
    mov ah, 3Fh
    push cx         
    mov cx, 4        
    lea dx,passbuffer     
    int 21h             

    ; Close file
    mov ah, 3Eh            
    int 21h 
      
                                                
                  
      mov si,0  
   encrypt_looooop: 
    mov al, passbuffer[si]
    xor al, key       
    mov passbuffer[si], al
    inc si           
    loop encrypt_looooop
      
    pop cx
        
         jmp g1234567
      incorrect1:
      print 10
       print 13
       cmp decrrr,2
      jz helloagaincome
push ax
push bx
push cx  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,14
mov cx,50
int 10h
     print 'File already encrypted'
     pop cx
pop bx
pop ax       
      
       jmp exit
       helloagaincome:
       push ax
push bx
push cx  
mov ax,0
mov bx,0
mov dx,0
mov ah,09h
mov bl,14
mov cx,50
int 10h
     print 'File not encrypted yet'
     pop cx
pop bx
pop ax
           
           jmp exit
       g1234567:
    
       mov al,'#'
       
       mov c1,al
       
       mov al,'@'
      
       mov c2,al
       
       mov al,'^'
       
       mov c3,al
       
       mov al,')'
       
       mov c4,al 
        
         cmp decrrr,2
      jz helloagaincometooo
; Personal Details and Social Media Links:
; Author: Muhammad Jawad Ahmad
; LinkedIn: https://www.linkedin.com/in/jawadahmadcs/
; Instagram: https://www.instagram.com/jawadahmadcs
; Facebook: https://www.facebook.com/JawadAhmadCS
; GitHub: https://github.com/JawadAhmadCS
; Blogs: https://jawadahmadcs.blogspot.com/         
       mov si,0      
       
       mov al,c1 
       cmp passbuffer[si],al
       je incorrect1
        inc si 
        
         mov al,c2
       cmp passbuffer[si],al
       je incorrect1
        inc si
          
        mov al,c3
       cmp passbuffer[si],al
       je incorrect1
        inc si
        
         mov al,c4
       cmp passbuffer[si],al
       je incorrect1
         ret
         helloagaincometooo:
        mov si,0      
       
       mov al,c1 
       cmp passbuffer[si],al
       jne incorrect1
        inc si 
        
         mov al,c2
       cmp passbuffer[si],al
       jne incorrect1
        inc si
          
        mov al,c3
       cmp passbuffer[si],al
       jne incorrect1
        inc si
        
         mov al,c4
       cmp passbuffer[si],al
       jne incorrect1 
      
        ret
      checkbeforestart endp
         
      
end main
     
    
