.MODEL SMALL
.STACK 100
.DATA

NEW_LINE DB 0DH,0AH,"$"
Line_pattern db 0DH,0AH,"----------------$"

ask db 0DH,0AH,0DH,0AH,"Please select the question (1-8): $"
numQ1 db ?


ask2 db 0DH,0AH,"Enter an uppercase (A-J) : $"
reply db 0DH,0AH,"The lowercase of the character entered is : $"


ask3a db 0DH,0AH,"Quantity (unit) : $"
ask3b db 0DH,0AH,"Unit price (RM) : $"
Qty db ?
Uprice db ?
Total dw ?
tens db 10
tens_dw dw 10
amount db 0,0,0,0

num_list label byte
max db 3
act db ?
number db 3 dup("$")

reply3 db 0DH,0AH,"Total amount is RM $"


VAR1 DB "COMPUTER"
VAR2 DB 8 dup ('*')

STRQ4A1 db 0DH,0AH,"Before convert case and reverse$"
STRQ4A2 db 0DH,0AH,"After convert case$"
STRQ4B2 db 0DH,0AH,"After reverse$"
STRQ41 db 0DH,0AH,"VAR1 = $"
STRQ42 db 0DH,0AH,"VAR2 = $"


NUM DB 6,12,7,5,9,11,13
NUM2 DB 6,12,7,5,9,11,13,16,8
NUMLEN=$-NUM
SUMQ4 DB ?
AVRQ4 DB ?
STRSUM DB 0DH,0AH,"SUM: $"
STRAVE DB 0DH,0AH,"Ave: $"

Q5S2 DB 0DH,0AH,0DH,0AH,"SAMPLE 2 USING CMP METHOD $"

UNAME DB "ICS"
UPSW DB "1024"
STRUSER DB 0AH,0DH,"Username: $"
STRPASS DB 0AH,0DH,"Password: $"
Invalid db 0AH,0DH,"Invalid login!$"
valid db 0AH,0DH,"Access Granted!$"

NAME_LIST LABEL byte
MAX_NAME DB 8
ACT_NAME DB ?
ENTER_NAME DB 8 DUP("$")

ENTER_PASS DB 0,0,0,0


W_MSG DB 0AH,0DH,"Invalid input! Enter digit only! $"

Q7ARR DB 79,93,30,4,6,1
Q7LEN=$-Q7ARR

Q8ARR DW 190, 5, 37, 66, 4
Q8ARRLEN DW 5
DIGITQ8 DB 0,0,0
DIGITQ8LEN DW 0
Q8STR1 DB  0AH,0DH,"LOOP METHOD: $"
Q8STR2 DB  0AH,0DH,"CMP METHOD: $"
TEMPCX DW 0
DOUBLEQ8ARRLEN DW 0

.CODE
MAIN PROC

MOV AX,@DATA
MOV DS,AX

START:
MOV AH,09H
LEA DX,ask
int 21h

mov ah,01h
int 21H

CMP AL,'1'
JZ Q1
CMP AL,'2'
JZ Q2
CMP AL,'3'
JZ Q3
CMP AL,'4'
JZ Q4
CMP AL,'5'
JZ Q5
CMP AL,'6'
JZ Q6
CMP AL,'7'
JZ Q7
CMP AL,'8'
JZ Q8
JMP FAR ptr ENDPOINT

Q1:
    CALL FAR PTR Ques1
    JMP START
Q2:
    CALL FAR PTR Ques2
    JMP START
Q3:
    CALL FAR PTR Ques3
    JMP START
Q4:
    CALL FAR PTR Ques4
    JMP START
Q5:
    CALL FAR PTR Ques5
    JMP START
Q6:
    CALL FAR PTR Ques6
    JMP START
Q7:
    CALL FAR PTR Ques7
    JMP START
Q8:
    CALL FAR PTR Ques8
    JMP START


ENDPOINT:
MOV AH,4CH
INT 21h

MAIN ENDP


Ques1 PROC FAR
    ;---NEW LINE
    MOV AH,02H
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H

    ;---NEW LINE
    MOV AH,02H
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H

    ;smile
    mov AH,02H
    MOV DL,02H
    INT 21h

    ;---NEW LINE
    MOV AH,02H
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H

    ;----calculation for single digit ,result in single digit also
    mov ah,01h
    int 21H
    sub al,30h
    mov numQ1,al

    mov ah,02H
    mov dl," "
    int 21H

    mov ah,02H
    mov dl,'+'
    int 21H

    mov ah,02H
    mov dl," "
    int 21H

    mov ah,01h
    int 21H
    sub al,30h
    add numQ1,al

    mov ah,02H
    mov dl," "
    int 21H

    mov ah,02H
    mov dl,'='
    int 21H

    mov ah,02H
    mov dl," "
    int 21H

    mov ah,02H
    add numQ1,30h
    mov dl,numQ1
    int 21H

    RET

Ques1 ENDP

Ques2 PROC FAR
    ;32 between uppercase and lower case
    MOV AH,09H
    LEA DX,ask2
    INT 21h

    MOV AH,01h
    INT 21h
    MOV BL,AL

    MOV AH,09H
    LEA DX,reply
    INT 21h

    MOV AH,02H
    ADD BL,32
    MOV DL,BL
    INT 21h

    RET
Ques2 ENDP

Ques3 PROC FAR

    JMP sAskA
    reaskA:
    MOV AH,09H
    LEA DX,W_MSG
    INT 21h
    sAskA:
    MOV AH,09H
    LEA DX,ask3a
    INT 21h

    ;MOV AH,01h
    ;INT 21h
    ;sub al,30h
    ;MOV Qty,AL

    MOV AH,0AH
    LEA DX,num_list
    INT 21h
    mov qty,0

    cmp act,1
    je one_digit_a



    mov al,number[0]
    CMP AL,48
    JL reaskA
    cmp al,57
    JG reaskA
    sub al,30h
    mul tens
    add qty,al

    mov al,number[1]
    CMP AL,48
    JL reaskA
    cmp al,57
    JG reaskA
    sub al,30h
    add qty,al
    JMP nextQA

    one_digit_a:
    mov al,number[0]
    CMP AL,48
    JL reaskA
    cmp al,57
    JG reaskA
    sub al,30h
    add qty,al

    nextQA:

    JMP sAskb
    reaskB:
    MOV AH,09H
    LEA DX,W_MSG
    INT 21h
    sAskb:
    MOV AH,09H
    LEA DX,ask3b
    INT 21H

    ;MOV AH,01h
    ;INT 21h
    ;sub al,30h
    ;MOV Uprice,AL

    MOV AH,0AH
    LEA DX,num_list
    INT 21h

    mov Uprice,0
    cmp act,1
    je one_digit_b


    mov al,number[0]
    CMP AL,48
    JL reaskB
    cmp al,57
    JG reaskB
    sub al,30h
    mul tens
    add Uprice,al

    mov al,number[1]
    CMP AL,48
    JL reaskB
    cmp al,57
    JG reaskB
    sub al,30h
    add Uprice,al
    JMP DO_CAL

    one_digit_b:
    mov al,number[0]
    CMP AL,48
    JL reaskB
    cmp al,57
    JG reaskB
    sub al,30h
    add Uprice,al

    DO_CAL:
    ;calculation
    mov al,qty
    mov cl,Uprice
    mul cl
    mov Total,AX

    MOV AH,09H
    LEA DX,REPLY3
    INT 21H

    ;form number for display
    mov cx,4
    mov si,3

    mov ax,Total
    store:
        mov dx,0
        div tens_dw
        mov amount[si],dl
        dec si
    loop store

    mov cx,4
    mov si,0
    display:
        mov ah,02H
        mov dl,amount[si]
        add dl,48
        int 21H
        inc si
    loop display

    RET
Ques3 ENDP

Ques4 PROC FAR

    mov ah,09H
    lea dx,STRQ4A1
    int 21H

    mov ah,09H
    lea dx,Line_pattern
    int 21H

    mov ah,09H
    lea dx,STRQ41
    int 21H

    mov cx,8
    mov si,0
    Q4LOOP1:
        mov ah,02H
        mov dl,VAR1[si]
        int 21H
        inc si
    loop Q4LOOP1

    mov ah,09H
    lea dx,STRQ42
    int 21H

    mov cx,8
    mov si,0
    Q4LOOP2:
        mov ah,02H
        mov dl,VAR2[si]
        int 21H
        inc si
    loop Q4LOOP2

    mov ah,09H
    lea dx,NEW_LINE
    int 21H

    mov ah,09H
    lea dx,STRQ4A2
    int 21H

    mov ah,09H
    lea dx,Line_pattern
    int 21H

    mov ah,09H
    lea dx,STRQ41
    int 21H

    mov cx,8
    mov si,0
    Q4LOOP1C:
        mov ah,02H
        mov dl,VAR1[si]
        int 21H
        inc si
    loop Q4LOOP1C

    mov ah,09H
    lea dx,STRQ42
    int 21H

    mov cx,8
    mov si,0
    Q4LOOP2C:
        mov ah,02H
        mov dl,VAR1[si]
        ADD DL,32
        int 21H
        inc si
    loop Q4LOOP2C
    ;--------------------------------
    mov ah,09H
    lea dx,NEW_LINE
    int 21H

    mov ah,09H
    lea dx,STRQ4B2
    int 21H

    mov ah,09H
    lea dx,Line_pattern
    int 21H

    mov ah,09H
    lea dx,STRQ41
    int 21H

    mov cx,8
    mov si,0
    Q4LOOP1R:
        mov ah,02H
        mov dl,VAR1[si]
        int 21H
        inc si
    loop Q4LOOP1R

    mov ah,09H
    lea dx,STRQ42
    int 21H

    mov cx,8
    mov si,7
    Q4LOOP2R:
        mov ah,02H
        mov dl,VAR1[si]
        int 21H
        DEC si
    loop Q4LOOP2R


    RET
Ques4 ENDP

Ques5 PROC FAR

    MOV CX,7
    MOV SI,0
    MOV SUMQ4,0
    CAL_SUM:
        MOV BL,NUM[SI]
        ADD SUMQ4,BL
        inc si
    LOOP CAL_SUM

    MOV AH,09H
    LEA DX,STRSUM
    INT 21H

    mov ax,0
    MOV AL,SUMQ4
    DIV tens
    mov bx,ax

    mov ah,02H
    mov dl,BL
    add dl,30h
    int 21H

    mov ah,02H
    mov dl,bh
    add dl,30h
    int 21H

    MOV AH,09H
    LEA DX,STRAVE
    INT 21H

    mov ax,0
    MOV AL,SUMQ4
    MOV BL,7
    DIV bl
    mov bx,ax

    mov ah,02H
    mov dl,BL
    add dl,30h
    int 21H

    mov ah,02H
    mov dl,"."
    int 21H

    mov ah,02H
    mov dl,bh
    add dl,30h
    int 21H
    ;----------------
    ;USING CMP
    MOV AH,09H
    LEA DX,Q5S2
    INT 21H
    MOV SUMQ4,0
    
    MOV SI,0
    CMPFINDAVR:
    CMP SI,9
    JE STOPCMPFINDAVR
        MOV BL,NUM2[SI]
        ADD SUMQ4,BL
        inc si
    JMP CMPFINDAVR
    
    STOPCMPFINDAVR:
    MOV AH,09H
    LEA DX,STRSUM
    INT 21H

    mov ax,0
    MOV AL,SUMQ4
    DIV tens
    mov bx,ax

    mov ah,02H
    mov dl,BL
    add dl,30h
    int 21H

    mov ah,02H
    mov dl,bh
    add dl,30h
    int 21H

    MOV AH,09H
    LEA DX,STRAVE
    INT 21H

    mov ax,0
    MOV AL,SUMQ4
    MOV BL,9
    DIV bl
    mov bx,ax

    mov ah,02H
    mov dl,BL
    add dl,30h
    int 21H

    mov ah,02H
    mov dl,"."
    int 21H

    mov ah,02H
    mov dl,bh
    add dl,30h
    int 21H




    RET


Ques5 ENDP

Ques6  PROC FAR
    JMP START_Ques6
    NO_ACCESS:
    MOV AH,09H
    LEA DX,Invalid
    INT 21h

    START_Ques6:
    MOV AH,09H
    LEA DX,STRUSER
    INT 21h

    MOV AH,0AH
    LEA DX,NAME_LIST
    INT 21H

    MOV AH,09H
    LEA DX,STRPASS
    INT 21h

    MOV CX,4
    MOV SI,0
    ENTER_LOOP:
    MOV AH,07H
    INT 21H
    SUB AL,30H
    MOV ENTER_PASS[SI],AL
    INC SI
    LOOP ENTER_LOOP


    CMP ACT_NAME,3
    jne NO_ACCESS

    MOV CX,4
    MOV SI,0

    CHECK_VALID:
        CMP CX,1
        JE CHECK_PASSWORD

        MOV BL,ENTER_NAME[SI]
        CMP UNAME[SI],BL
        JNE NO_ACCESS

        CHECK_PASSWORD:
        MOV BL,ENTER_PASS[SI]
        ADD BL,30h
        CMP UPSW[SI],bl
        JNE NO_ACCESS

        INC SI
    LOOP CHECK_VALID

    MOV AH,09H
    LEA DX,valid
    INT 21h



    RET
Ques6 ENDP

Ques7 PROC FAR

    MOV BX,0
    MOV BL,2
    MOV CX,Q7LEN
    MOV SI,0
    
    Q7LOOP:
        MOV AX,0
        MOV AL,Q7ARR[SI]
        DIV BL
        CMP AH,0
        JE Q7FOUND
        INC SI
    LOOP Q7LOOP

    Q7FOUND:
    MOV BL,10
    MOV AX,0
    MOV AL,Q7ARR[SI]
    DIV BL

    MOV BX,AX

    MOV AH,09H
    LEA DX,NEW_LINE
    INT 21H

    MOV AH,02H
    MOV DL,BL
    ADD DL,30h
    INT 21h

    MOV AH,02H
    MOV DL,bh
    ADD DL,30h
    INT 21H
    
    
    




    RET
Ques7 ENDP

Ques8 PROC FAR
    ;LOOP METHOD
    ;Q8ARRLEN=$-Q8ARR AUTO COUNT LENGHT
    MOV AH,09H
    LEA DX,NEW_LINE
    INT 21H

    MOV AH,09H
    LEA DX,Q8STR1
    INT 21h

    MOV CX,Q8ARRLEN
    MOV SI,0
    PROCEEDDIS:

        MOV DI,2
        MOV DIGITQ8LEN,0

        MOV DX,0
        MOV AX,Q8ARR[SI]
        DIV tens_dw

        MOV DIGITQ8[DI],DL
        INC DIGITQ8LEN
        DEC DI

        CHECK:
        CMP AX,10
        JL ACCEPT

        MOV DX,0
        DIV tens_dw
        MOV DIGITQ8[DI],DL
        INC DIGITQ8LEN
        DEC DI

        JMP CHECK

        ACCEPT:
        CMP AL,0
        JE CONTODIS
        MOV DIGITQ8[DI],AL
        INC DIGITQ8LEN
        DEC DI
        

        CONTODIS:

        MOV TEMPCX,CX

        MOV AH,09H
        LEA DX,NEW_LINE
        INT 21H

        MOV CX,DIGITQ8LEN
        MOV DI,3
        SUB DI,DIGITQ8LEN
        LOOPDIS:
            MOV AH,02H
            MOV DL,DIGITQ8[DI]
            ADD DL,30h
            INT 21H
            MOV DIGITQ8[DI],0
            INC DI
        LOOP LOOPDIS

        MOV CX,TEMPCX
        ADD SI,2
        
    LOOP PROCEEDDIS

    ;------------
    MOV AH,09H
    LEA DX,NEW_LINE
    INT 21H

    MOV AH,09H
    LEA DX,Q8STR2
    INT 21h

    MOV SI,0

    MOV AX,Q8ARRLEN
    MOV BX,2
    MUL BX
    MOV DOUBLEQ8ARRLEN,AX

    PROCEEDDIS2:
        CMP SI,DOUBLEQ8ARRLEN
        JGE ENDPROCEEDDIS2
    

        MOV DI,2
        MOV DIGITQ8LEN,0

        MOV DX,0
        MOV AX,Q8ARR[SI]
        DIV tens_dw

        MOV DIGITQ8[DI],DL
        INC DIGITQ8LEN
        DEC DI

        CHECK2:
        CMP AX,10
        JL ACCEPT2

        MOV DX,0
        DIV tens_dw
        MOV DIGITQ8[DI],DL
        INC DIGITQ8LEN
        DEC DI

        JMP CHECK2

        ACCEPT2:
        CMP AL,0
        JE CONTODIS2
        MOV DIGITQ8[DI],AL
        INC DIGITQ8LEN
        DEC DI
        

        CONTODIS2:

        MOV TEMPCX,SI

        MOV AH,09H
        LEA DX,NEW_LINE
        INT 21H

        MOV CX,DIGITQ8LEN

        LOOPDIS2:
        CMP CX,0
        JLE ENDLOOPDIS2
        MOV DI,3
        SUB DI,DIGITQ8LEN
        
            MOV AH,02H
            MOV DL,DIGITQ8[DI]
            ADD DL,30h
            INT 21H
            MOV DIGITQ8[DI],0
            INC DI
            DEC CX
            JMP LOOPDIS2

        ENDLOOPDIS2:

        MOV SI,TEMPCX
        ADD SI,2
    
    JMP PROCEEDDIS2
    ENDPROCEEDDIS2:




    RET
Ques8 ENDP

END MAIN
         

