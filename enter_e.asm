;a program that it beeps until you press the "e" button
.model small  

;-----------------------------------------------------

.stack 63    

;-----------------------------------------------------

.data
    s        db   'enter a button','$' 
    ex     db   'you exited','$'
    chr      db   '_______________','$'
      
;-----------------------------------------------------

.code

    main:
         
          MOV   AX,@DATA
          MOV   DS,AX
          MOV   AX,00
          
          MOV   AH,09H
          MOV   BX,OFFSET S
          INT   21H
          
    bogh:
          MOV   AH,02H
          MOV   DL,07
          INT 21H
          
          MOV   AH,01
          INT   16H
          
          JZ    bogh 
          
    luup: ;loop
          
          MOV   AH,00
          CMP   AL,'e'
          INT   16H
          JNZ    luup      
          
           
          
    EXIT:     
    
    ;------------noting-----------
    
    
    prt:  
          MOV   AH,02H
          MOV   BH,00
          MOV   DH,19
          MOV   DL,00
          INT   10H
          
          MOV   AH,09H
          MOV   DX,OFFSET CHR 
          INT   21H
          
          MOV   AH,09H
          MOV   DX,OFFSET EX
          INT   21H 
          
          MOV   AH,09H
          MOV   DX,OFFSET CHR 
          INT   21H     
 
          
    END main            