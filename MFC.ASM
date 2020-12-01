.MODEL SMALL
.STACK 100
.DATA

;/////////////////////////////
;///DECLARATION OF VARIABLES//
;/////////////////////////////


;---MAIN MENU

	MENU DB 0AH,0DH,"============================================================================="
     	     DB 0AH,0DH,"|                        MULTIFUNCTIONAL CALCULATOR                         |"
	     DB 0AH,0DH,"|---------------------------------------------------------------------------|"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|   1)  Base Conversion/Calculation                                         |"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|   2)  Area/Volume Calculation                                             |"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|   3)  Fraction Calculation                                                |"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|   4)  Statistics Calculation                                              |"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|---------------------------------------------------------------------------|"
	     DB 0AH,0DH,"|   5)  Exit program                                                        |"	
	     DB 0AH,0DH,"|---------------------------------------------------------------------------|"	
	     DB 0AH,0DH
	     DB 0AH,0DH,"- Please enter your choice (1-5) > $"
    
    ;MAINMENU CHOICE
    
	CHOICE DB ?

;---BASE MENU

	BASEMENU DB 0AH,0DH,"|---------------------------------------------------------------------------|"
  	     DB 0AH,0DH,"|                       BASE CONVERSION/CALCULATION                         |"
	     DB 0AH,0DH,"|---------------------------------------------------------------------------|"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|   1)  Base Conversion                                                     |"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|   2)  Base Calculation                                                    |"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|---------------------------------------------------------------------------|"
	     DB 0AH,0DH,"|   3)  Exit to Main Menu                                                   |"	
	     DB 0AH,0DH,"|---------------------------------------------------------------------------|"
	     DB 0AH,0DH
	     DB 0AH,0DH,"- Please enter your choice (1-3) > $"
    
    ;BASE MENU CHOICE
    
	CHOICE1 DB ?

;---BASE CONVERSION MENU

	BASECONVMENU DB 0AH,0DH,"|---------------------------------------------------------------------------|"
  	     DB 0AH,0DH,"|                          SELECT BASE CONVERSION                           |"
	     DB 0AH,0DH,"|---------------------------------------------------------------------------|"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|   1)  BIN to HEX                                                          |"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|   2)  HEX to DEC                                                          |"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|---------------------------------------------------------------------------|"
	     DB 0AH,0DH,"|   3)  Exit to Base Calculator Menu                                        |"	
	     DB 0AH,0DH,"|---------------------------------------------------------------------------|"
	     DB 0AH,0DH
	     DB 0AH,0DH,"- Please enter your choice (1-3) > $"
	
	;BASE CONVERSION MENU CHOICE
	
	CHOICECONV DB ?
	
	
	
	;-------BIN2HEX VARIABLES   
	
	BIN LABEL BYTE
	MAX_BIN DB 32
	ACT_BIN DB ?
	BIN_ARRAY DB 32 DUP('0')         
	
	ASKBIN DB 0AH,0DH,"- Please enter a 16-bit binary number (1 & 0)"
	       DB 0AH,0DH,"  Ex: 1111 1000 0000 1010   > $"
    ASK16BITBIN DB 0AH,0DH,"- 16-BIT Binary Number Only ! $"
	ASKVALIDBIN DB 0AH,0DH,"- Invalid binary number (1 & 0 ONLY) ! $"
	
	
	HEXRESULT DB 13,10,"- Your 16-bit binary number in HEX : $"
	
	VAR DB 0              
	
	;---------------------    
	
	
    ;-------HEX2DEC VARIABLES
	
	HEX LABEL BYTE
	MAX_HEX DB 16
	ACT_HEX DB ?
	HEX_ARRAY DB 16 DUP('0')
	
	ASKHEX DB 0AH,0DH,"- Please enter a 16-bit hexadecimal number (0000 - FFFF) > $"
	
    ASK16BITHEX DB 0AH,0DH,"- 16-BIT Hexadecimal Number Only (0000 - FFFF) ! $"
	ASKVALIDHEX DB 0AH,0DH,"- Invalid hexadecimal number (0-9,A-F ONLY) ! $"
	
	DECRESULT DB 13,10,"- Your 16-bit hexadecimal number in DEC : $"
	
	VAR2 DW 0
	TEN DW 10 
	
	;--------------------
	
	
;----/////BASE CALCULATION VARIABLES   
	
	
	;---HEX ADDITION VARIABLES
	
	ASKHEX1 DB 0AH,0DH,"- 16-bit hexadecimal number (1)"
		DB 0AH,0DH,"  Ex: 0000 - FFFF 		  > $"
	ASKHEX2 DB 0AH,0DH,"- 16-bit hexadecimal number (2)"
		DB 0AH,0DH,"  Ex: 0000 - FFFF 		  > $"
	
	HEXADDRESULT DB 13,10,"- ADDITION Result : $"
	
	HEX1 LABEL BYTE
	MAX_HEX1 DB 16
	ACT_HEX1 DB ?
	HEX1_ARRAY DB 16 DUP('0')
	
	HEX2 LABEL BYTE
	MAX_HEX2 DB 16
	ACT_HEX2 DB ?
	HEX2_ARRAY DB 16 DUP('0')
	
	ADDHEXVAR1 DW 0
	ADDHEXVAR2 DW 0
	ADDHEXTOTAL DW 0
	SIXTEEN DW 16
	Q DW 0  
	
	R_ARRAY DB 16 DUP('0')
	
	;---------------------   
	
	
	;---HEX SUBTRACTION VARIABLES

	
	HEXSUBRESULT DB 13,10,"- SUBTRACTION Result : $"
	
	SUBHEX1 LABEL BYTE
	MAX_SUBHEX1 DB 16
	ACT_SUBHEX1 DB ?
	SUBHEX1_ARRAY DB 16 DUP('0')
	
	SUBHEX2 LABEL BYTE
	MAX_SUBHEX2 DB 16
	ACT_SUBHEX2 DB ?
	SUBHEX2_ARRAY DB 16 DUP('0')
	
	SUBHEXVAR1 DW 0
	SUBHEXVAR2 DW 0
	SUBHEXTOTAL DW 0
	QS DW 0  
	
	RS_ARRAY DB 16 DUP('0')
	
	;---------------------    
	
	
	;---HEX MULTIPLICATION VARIABLES
	
	ASKMULHEX1 DB 0AH,0DH,"- 8-bit hexadecimal number (00 - FF)  (1) > $" 
	ASKMULHEX2 DB 0AH,0DH,"- 8-bit hexadecimal number (00 - FF)  (2) > $"
	ASK8BITHEX DB 0AH,0DH,"- 8-BIT Hexadecimal Number Only (00 - FF) ! $"		
	
	HEXMULRESULT DB 13,10,"- MULTIPLICATION Result : $"
	
	MULHEX1 LABEL BYTE
	MAX_MULHEX1 DB 16
	ACT_MULHEX1 DB ?
	MULHEX1_ARRAY DB 16 DUP('0')
	
	MULHEX2 LABEL BYTE
	MAX_MULHEX2 DB 16
	ACT_MULHEX2 DB ?
	MULHEX2_ARRAY DB 16 DUP('0')
	
	MULHEXVAR1 DW 0
	MULHEXVAR2 DW 0
	MULHEXTOTAL DW 0
	QM DW 0  
	
	RM_ARRAY DB 16 DUP('0')
	
	;---------------------    
	
	
	;---HEX DIVISION VARIABLES
	
	
	HEXDIVRESULT DB 13,10,"- DIVISION Result : $"
	
	DIVHEX1 LABEL BYTE
	MAX_DIVHEX1 DB 16
	ACT_DIVHEX1 DB ?
	DIVHEX1_ARRAY DB 16 DUP('0')
	
	DIVHEX2 LABEL BYTE
	MAX_DIVHEX2 DB 16
	ACT_DIVHEX2 DB ?
	DIVHEX2_ARRAY DB 16 DUP('0')
	
	DIVHEXVAR1 DW 0
	DIVHEXVAR2 DW 0
	DIVHEXTOTAL DW 0
	QD DW 0  
	
	RD_ARRAY DB 16 DUP('0')
	
	;---------------------    
	
	
	
	
    VARBIN DW 0

	;---BIN ADDITION VARIABLES

	ASKBIN1 DB 0AH,0DH,"- 16-bit binary number (1)"
	       DB 0AH,0DH,"  Ex: 1111 1000 0000 1010 > $"	
	ASKBIN2 DB 0AH,0DH,"- 16-bit binary number (2)"
	       DB 0AH,0DH,"  Ex: 1111 1000 0000 1010 > $"
	
	BINADDRESULT DB 13,10,"- ADDITION Result : $"
	
	BIN1 LABEL BYTE
	MAX_BIN1 DB 32
	ACT_BIN1 DB ?
	BIN1_ARRAY DB 32 DUP('0')
	
	BIN2 LABEL BYTE
	MAX_BIN2 DB 32
	ACT_BIN2 DB ?
	BIN2_ARRAY DB 32 DUP('0')
	
	ADDBINVAR1 DW 0
	ADDBINVAR2 DW 0
	ADDBINTOTAL DW 0
	TWO DW 2
	BINQ DW 0  
	
	BINR_ARRAY DB 16 DUP('0')
	
	;---------------------
	
	
	
	;---BIN SUBTRACTION VARIABLES

	
	BINSUBRESULT DB 13,10,"- SUBTRACTION Result : $"
	
	SUBBIN1 LABEL BYTE
	MAX_SUBBIN1 DB 32
	ACT_SUBBIN1 DB ?
	SUBBIN1_ARRAY DB 32 DUP('0')
	
	SUBBIN2 LABEL BYTE
	MAX_SUBBIN2 DB 32
	ACT_SUBBIN2 DB ?
	SUBBIN2_ARRAY DB 32 DUP('0')
	
	SUBBINVAR1 DW 0
	SUBBINVAR2 DW 0
	SUBBINTOTAL DW 0
	BINQS DW 0  
	
	BINRS_ARRAY DB 16 DUP('0') 
	
	
	;---------------------
	
	;---BIN MULTIPLICATION VARIABLES
	
	ASKMULBIN1 DB 0AH,0DH,"- 8-bit binary number (Ex: 1111 0000)  (1) > $" 
	ASKMULBIN2 DB 0AH,0DH,"- 8-bit binary number (Ex: 1111 0000)  (2) > $"
	ASK8BITBIN DB 0AH,0DH,"- 8-BIT Binary Number Only ! $"		
	
	BINMULRESULT DB 13,10,"- MULTIPLICATION Result : $"
	
	MULBIN1 LABEL BYTE
	MAX_MULBIN1 DB 16
	ACT_MULBIN1 DB ?
	MULBIN1_ARRAY DB 16 DUP('0')
	
	MULBIN2 LABEL BYTE
	MAX_MULBIN2 DB 16
	ACT_MULBIN2 DB ?
	MULBIN2_ARRAY DB 16 DUP('0')
	
	MULBINVAR1 DW 0
	MULBINVAR2 DW 0
	MULBINTOTAL DW 0
	BINQM DW 0  
	
	BINRM_ARRAY DB 16 DUP('0')
	
	;---------------------  
	
	
	;---BIN DIVISION VARIABLES
	
	ASKNOZERO DB 13,10,"DIVISOR (2ND number) cannot = 0 ! $"
	BINDIVRESULT DB 13,10,"- DIVISION Result : $"
	
	DIVBIN1 LABEL BYTE
	MAX_DIVBIN1 DB 32
	ACT_DIVBIN1 DB ?
	DIVBIN1_ARRAY DB 32 DUP('0')
	
	DIVBIN2 LABEL BYTE
	MAX_DIVBIN2 DB 32
	ACT_DIVBIN2 DB ?
	DIVBIN2_ARRAY DB 32 DUP('0')
	
	DIVBINVAR1 DW 0
	DIVBINVAR2 DW 0
	DIVBINTOTAL DW 0
	BINQD DW 0  
	
	BINRD_ARRAY DB 16 DUP('0')
	
	;---------------------	
	
					
		
;---BASE CALCULATION MENU	
	
	BASECALCMENU DB 0AH,0DH,"|---------------------------------------------------------------------------|"
  	     DB 0AH,0DH,"|                          SELECT BASE CALCULATION                          |"
	     DB 0AH,0DH,"|---------------------------------------------------------------------------|"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|   1)  HEX                                                                 |"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|   2)  BIN                                                                 |"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|---------------------------------------------------------------------------|"
	     DB 0AH,0DH,"|   3)  Exit to Base Calculator Menu                                        |"	
	     DB 0AH,0DH,"|---------------------------------------------------------------------------|"
	     DB 0AH,0DH
	     DB 0AH,0DH,"- Please enter your choice (1-3) > $"  
	
	;BASE CALCULATION CHOICE     
	CHOICECALC DB ?   
	

;---BASE CALCULATION OPERATION MENU
	     
	BASECALCOP DB 0AH,0DH,"|---------------------------------------------------------------------------|"
  	     DB 0AH,0DH,"|                            SELECT OPERATION                               |"
	     DB 0AH,0DH,"|---------------------------------------------------------------------------|"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|   1)  Addition                                                            |"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|   2)  Subtraction                                                         |"
	     DB 0AH,0DH,"|                                                                           |"  
	     DB 0AH,0DH,"|   3)  Multiplication                                                      |"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|   4)  Division                                                            |"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|---------------------------------------------------------------------------|"
	     DB 0AH,0DH,"|   5)  Exit to Base Calculation                                            |"	
	     DB 0AH,0DH,"|---------------------------------------------------------------------------|"
	     DB 0AH,0DH
	     DB 0AH,0DH,"- Please enter your choice (1-5) > $"
	
	;BASE CALCULATION OPERATION CHOICE
	
	CHOICEOPHEX  DB ?
    CHOICEOPBIN  DB ?      
    
    
    
;;;;////////    
;;;//////AREA VOLUME CALCULATION VARIABLES
;;;////////


;---AREA VOLUME MENU

	AVMENU DB 0AH,0DH,"|---------------------------------------------------------------------------|"
  	     DB 0AH,0DH,"|                          AREA/VOLUME CALCULATION                          |"
	     DB 0AH,0DH,"|---------------------------------------------------------------------------|"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|   1)  Area                                                                |"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|   2)  Volume                                                              |"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|---------------------------------------------------------------------------|"
	     DB 0AH,0DH,"|   3)  Exit to Main Menu                                                   |"	
	     DB 0AH,0DH,"|---------------------------------------------------------------------------|"
	     DB 0AH,0DH
	     DB 0AH,0DH,"- Please enter your choice (1-3) > $" 
	
	;AREA VOLUME CHOICE
	
	CHOICEAV DB ?
	
	
;---AREA MENU     
	     
	AREAMENU DB 0AH,0DH,"|---------------------------------------------------------------------------|"
  	     DB 0AH,0DH,"|                       SELECT AREA CALCULATION                             |"
	     DB 0AH,0DH,"|---------------------------------------------------------------------------|"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|   1)  Rectangle                                                           |"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|   2)  Triangle                                                            |"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|   3)  Circle                                                              |"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|---------------------------------------------------------------------------|"
	     DB 0AH,0DH,"|   4)  Exit to Main Menu                                                   |"	
	     DB 0AH,0DH,"|---------------------------------------------------------------------------|"
	     DB 0AH,0DH
	     DB 0AH,0DH,"- Please enter your choice (1-4) > $"	     
    
    ;AREA CHOICE
    
	CHOICEA DB ?
	
	
;---VOLUME MENU
	
	VOLUMEMENU DB 0AH,0DH,"|---------------------------------------------------------------------------|"
  	     DB 0AH,0DH,"|                       SELECT AREA CALCULATION                             |"
	     DB 0AH,0DH,"|---------------------------------------------------------------------------|"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|   1)  Cube                                                                |"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|   2)  Cuboid                                                              |"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|   3)  Sphere                                                              |"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|   4)  Pyramid                                                             |"
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|   5)  Cylinder                                                            |"	     
	     DB 0AH,0DH,"|                                                                           |"
	     DB 0AH,0DH,"|   6)  Cone                                                                |"
	     DB 0AH,0DH,"|                                                                           |"	     	     	     
	     DB 0AH,0DH,"|---------------------------------------------------------------------------|"
	     DB 0AH,0DH,"|   7)  Exit to Main Menu                                                   |"	
	     DB 0AH,0DH,"|---------------------------------------------------------------------------|"
	     DB 0AH,0DH
	     DB 0AH,0DH,"- Please enter your choice (1-7) > $"	     
    
    ;VOLUME CHOICE
    
	CHOICEV DB ? 
	


;----//////AREA VARIABLES
	    
    ;-------RECTANGLE VARIABLES
    
	ASKHEIGHT DB 0AH,0DH,"- Height (cm) (1-255) > $"
    ASKWIDTH DB 0AH,0DH,"- Width  (cm) (1-255) > $"
    ASKVALID255 DB 13,10,"Invalid Input ! (1-255 ONLY) $"    
    RECTAREARESULT DB 13,10,"- Area of RECTANGLE : $"
    DISPLAYCM DB " cm^2 $"
    
	RECTH LABEL BYTE
	MAX_RECTH DB 16
	ACT_RECTH DB ?
	RECTH_ARRAY DB 16 DUP('0')
    
	RECTW LABEL BYTE
	MAX_RECTW DB 16
	ACT_RECTW DB ?
	RECTW_ARRAY DB 16 DUP('0')

	RECTHVAR DW 0
	RECTWVAR DW 0    
    RECTAREA DW 0
    

    VARDEC DW 0 
    
    ;------------------------------- 
    

    ;-------TRIANGLE VARIABLES
    
    ASKHEIGHT362 DB 0AH,0DH,"- Height (cm) (1-362) > $"
    ASKBASE DB 0AH,0DH,"- Base   (cm) (1-362) > $"
    ASKVALID362 DB 13,10,"Invalid Input ! (1-362 ONLY) $"         
    TRIAREARESULT DB 13,10,"- Area of TRIANGLE : $"
    
	TRIH LABEL BYTE
	MAX_TRIH DB 16
	ACT_TRIH DB ?
	TRIH_ARRAY DB 16 DUP('0')
    
	TRIB LABEL BYTE
	MAX_TRIB DB 16
	ACT_TRIB DB ?
	TRIB_ARRAY DB 16 DUP('0')

	TRIHVAR DW 0
	TRIBVAR DW 0
    
    TRIQUOTIENT DW 0
    TRIREMAINDER DW 0  
    
    ONEHUNDRED DW 100
    
    ;-------------------------------
    
    
    ;-------CIRCLE VARIABLES
    
    ASKRADIUS DB 0AH,0DH,"- Radius (cm) (1-144) > $"
    ASKVALID144 DB 13,10,"Invalid Input ! (1-144 ONLY) $"         
    CIRCAREARESULT DB 13,10,"- Area of CIRCLE : $"
    
	CIRCR LABEL BYTE
	MAX_CIRCR DB 16
	ACT_CIRCR DB ?
	CIRCR_ARRAY DB 16 DUP('0')

	CIRCRVAR DW 0  
    
    CIRCREMAINDER DW 0
    
    TWENTYTWO DW 22
    SEVEN DW 7 
    
    ;-------------------------------



;------///////VOLUME VARIABLES      

    DISPLAYCMSQUARE DB " cm^3 $"

    ;-------CUBE VARIABLES
    
    ASKLENGTH DB 0AH,0DH,"- Length (cm) (1-40) > $"
    ASKVALID40 DB 13,10,"Invalid Input ! (1-40 ONLY) $"         
    CUBEVOLRESULT DB 13,10,"- Volume of CUBE : $"
    
	CUBEL LABEL BYTE
	MAX_CUBEL DB 16
	ACT_CUBEL DB ?
	CUBEL_ARRAY DB 16 DUP('0')

	CUBELVAR DW 0
     
    
    ;-------------------------------
    
    ;-------CUBOID VARIABLES
    
    ASKHEIGHT40 DB 0AH,0DH,"- Height (cm) (1-40) > $"
    ASKWIDTH40 DB 0AH,0DH,"- Weight (cm) (1-40) > $"        
    CUBOVOLRESULT DB 13,10,"- Volume of CUBOID : $"
    
	CUBOL LABEL BYTE
	MAX_CUBOL DB 16
	ACT_CUBOL DB ?
	CUBOL_ARRAY DB 16 DUP('0')

	CUBOH LABEL BYTE
	MAX_CUBOH DB 16
	ACT_CUBOH DB ?
	CUBOH_ARRAY DB 16 DUP('0')
	
	CUBOW LABEL BYTE
	MAX_CUBOW DB 16
	ACT_CUBOW DB ?
	CUBOW_ARRAY DB 16 DUP('0')
	
	
	CUBOLVAR DW 0
	CUBOHVAR DW 0
	CUBOWVAR DW 0
     
    
    ;-------------------------------
    
    ;-------SPHERE VARIABLES
    
    ASKRADIUS14 DB 0AH,0DH,"- Radius (cm) (1-14) > $"
    ASKVALID14 DB 13,10,"Invalid Input ! (1-14 ONLY) $"         
    SPHEREVOLRESULT DB 13,10,"- Volume of SPHERE : $"
    
	SPHERER LABEL BYTE
	MAX_SPHERER DB 16
	ACT_SPHERER DB ?
	SPHERER_ARRAY DB 16 DUP('0')

	SPHERERVAR DW 0 
	
	FOUR DW 4
	THREE DW 3
	TWENTYONE DW 21
	
	SPHEREREMAINDER DW 0
     
    
    ;------------------------------- 
    
    
    ;-------PYRAMID VARIABLES
    
    ASKLENGTH58 DB 0AH,0DH,"- Length (cm) (1-58) > $"
    ASKHEIGHT58 DB 0AH,0DH,"- Height (cm) (1-58) > $"
    ASKWIDTH58 DB 0AH,0DH,"- Width (cm) (1-58) > $"
    ASKVALID58 DB 13,10,"Invalid Input ! (1-58 ONLY) $"         
    PYRAVOLRESULT DB 13,10,"- Volume of PYRAMID : $"
    
	PYRAL LABEL BYTE
	MAX_PYRAL DB 16
	ACT_PYRAL DB ?
	PYRAL_ARRAY DB 16 DUP('0')
	
	PYRAH LABEL BYTE
	MAX_PYRAH DB 16
	ACT_PYRAH DB ?
	PYRAH_ARRAY DB 16 DUP('0')

    PYRAW LABEL BYTE
	MAX_PYRAW DB 16
	ACT_PYRAW DB ?
	PYRAW_ARRAY DB 16 DUP('0')


	PYRALVAR DW 0
	PYRAHVAR DW 0
	PYRAWVAR DW 0
	
	PYRAQUOTIENT DW 0
	PYRAREMAINDER DW 0
      
    ;-------------------------------
    
    
    ;-------CYLINDER VARIABLES
    
    ASKRADIUS27 DB 0AH,0DH,"- Radius (cm) (1-27) > $"
    ASKHEIGHT27 DB 0AH,0DH,"- Height (cm) (1-27) > $"
    ASKVALID27 DB 13,10,"Invalid Input ! (1-27 ONLY) $"         
    CYLIVOLRESULT DB 13,10,"- Volume of CYLINDER : $"
    
	CYLIR LABEL BYTE
	MAX_CYLIR DB 16
	ACT_CYLIR DB ?
	CYLIR_ARRAY DB 16 DUP('0')
	
	CYLIH LABEL BYTE
	MAX_CYLIH DB 16
	ACT_CYLIH DB ?
	CYLIH_ARRAY DB 16 DUP('0')


	CYLIRVAR DW 0
	CYLIHVAR DW 0
	
	CYLIREMAINDER DW 0
      
    ;-------------------------------
    
    ;-------CONE VARIABLES
    
    ASKRADIUS39 DB 0AH,0DH,"- Radius (cm) (1-39) > $"
    ASKHEIGHT39 DB 0AH,0DH,"- Height (cm) (1-39) > $"
    ASKVALID39 DB 13,10,"Invalid Input ! (1-39 ONLY) $"         
    CONEVOLRESULT DB 13,10,"- Volume of CONE : $"
    
	CONER LABEL BYTE
	MAX_CONER DB 16
	ACT_CONER DB ?
	CONER_ARRAY DB 16 DUP('0')
	
	CONEH LABEL BYTE
	MAX_CONEH DB 16
	ACT_CONEH DB ?
	CONEH_ARRAY DB 16 DUP('0')


	CONERVAR DW 0
	CONEHVAR DW 0
	
	CONEREMAINDER DW 0
      
    ;-------------------------------
       
    
	
	ANYMORECALC DB 13,10
	            DB 13,10,"- Anymore Calculation? (1=Yes, 0=No) > $"
	            
	ANYMORE DB ?
	
	INVALIDANYMORE  DB 13,10,"- Invalid Input ! (1=Yes, 0=No) > $"
	
	INVALIDCHOICE  DB 13,10,"- Invalid Choice !$"


	;CODE FROM WEN ZHI
	;--------------------------------------------------------------------------------------------------------
	;--------------------------------------------------------------------------------------------------------
	;Hello here is Varaible And String
	;Use 
	;by 
	;FRACTION Calculator
	INPUT_ERROR db 0DH,0AH,'PLEASE ENTER THE "=" IN THE END OF FORMULA AND DONT ENTER ALPHABET. $'
	MATH_ERROR db 0DH,0AH,'THE INPUT VALUE OR THE CALCULATION IS INVALID. $'
	FRACMSG DB 0DH,0AH,'***FRACTION CALCULATOR***',0DH,0AH
			DB 0DH,0AH,'THE MAXIMUN DIGIT ENTER FOR DENOMINATOR AND NUMERATOR IS 4'
			DB 0DH,0AH,'MAXIMUN AND MINIMUN RESULT IS +-65535'
			DB 0DH,0AH,'PLEASE ENTER THE FRACTION FOR CALCULATION, USE<,>TO REPRESENT <slash> FRACTION'
			DB 0DH,0AH,'AND ENTER <=> REPRESENT END OF FORMULA'
			DB 0DH,0AH,'FOR EXAMPLE, 1/8+5/8 --> 1,8+5,8= ',0DH,0AH,'$'

	NEGMSG DB '   (NEGATIF)$'
	ENDFRACMSG DB 0DH,0AH,"Another fraction need to calculate ? (Y/N) :$"
	DECIMALMSG DB 0DH,0AH,"DECIMAL VALUES: $"
	FRACRESULTMSG DB 0DH,0AH,"RESULT: $"
	MIXFRACMSG DB 0DH,0AH,"MIXED FRACTION: $"

	;store string
	Formula label byte
	maxF db 30
	actF db ?
	StoredFormula db 30 dup("$")

	;store converted values
	CovertedF dw 35 dup(0)
	BOOLEANCF dW 35 dup(0);CHECK OPERATOR,0 for num,1 FOR -+, 2 FOR */, 3 FOR (, 4 FOR )
	CFLEN DW 0
	VALIDBOOL DW 0 ;CHECK VALIDDILITY OF ENTER FORMAT
	MATHBOOL DW 0; CHECK VALIDILITY OF NUMBER PROCESS


	;postorder
	POSTF dw 35 dup(0)
	BOOLEANPF dW 35 dup(0);CHECK OPERATOR,0 for num,1 FOR -+, 2 FOR */, 3 FOR (, 4 FOR )
	NUM1 DW 0
	NUM2 DW 0
	PFLEN DW 0
	FRACLEN DW 0
	TEMPDENO DW 0
	TEMPNUME DW 0

	;LENGTH OF STACK
	StackLen DB 0;

	;CALWHOLE REQUIRED for convert to number
	Digit db '0','0','0','0','0'
	DigitLen dw 0

	;CTS REQUIRED for convert to string
	TEMPVAL DW 0;
	STRDIS DB 0,0,0,0,0
	HAVEDIGIT DB 0


	TempNumeA dw 0 ;RESURLT STORE AT A
	TempDenoA dw 0 ;RESURLT STORE AT A

	SIMPLYNUME DW 0
	SIMPLYDENO DW 0
	WHOLENUM DW 0
	FocusGCF dw 0
	GCFSTORE dw 0

	TempNumeB dw 0
	TempDenoB dw 0

	EXTRANUME DW 0
	EXTRADENO DW 0

	MULNUM DW 0 ;STORE THE NUMBER FOR MULTIPLY
	NEGATIVEBOOL DW 0

	;--------------------------------------------------------------------------------------------------------
	;--------------------------------------------------------------------------------------------------------
	;Hello here is Varaible And String
	;Use 
	;by 
	;Statistics Calculator

	STATITLE DB 0DH,0AH,"***STATISTICS CALCULATOR***",0DH,0AH,'$'
	ENTERMSG DB 0DH,0AH,0DH,0AH,"YOUR INPUT SHOULD WITHIN 3 DIGIT AND 2 DECIMAL"
			DB 0DH,0AH,"PLEASE ENTER THE RAW DATA, EX:18.50"
			DB 0DH,0AH,"IF NO MORE DATA ENTER ANY CHARACTER TO STOP -> DATA : $"

	SUMOFTOTALMSG DB 0DH,0AH,"SUM OF THE RAW DATA: $"


	MODEMSG1 DB 0DH,0AH,"MODE: $"
	MODEMSG2 DB 0DH,0AH,"OCCUR TIMES: $"
	NOMODEMSG DB " NO MODE ALL OCCUR TIMES IS SAME $"
	MEDIANMSG DB 0DH,0AH,"MEDIAN: $"
	AVGMSG DB 0DH,0AH,"AVERANGE: $"

	SQUAMSG DB 0DH,0AH,"TOTAL OF EACH SQUARE: $"
	VarianceMsg DB 0DH,0AH,"VARIANCE: $"
	StanDMSG DB 0DH,0AH,"STANDARD DEVIASION: $"
	VarianceMsgSAM DB 0DH,0AH,"SAMPLE VARIANCE: $"
	StanDMsgSAM DB 0DH,0AH,"SAMPLE STANDARD DEVIASION: $"
	LargestMsg db 0dh,0ah,"LARGEST: $"
	SmallestMsg db "   SMALLEST: $"
	RangeMsg db 0dh,0ah,"RANGE (LARGEST-SMALLEST): $"
	ENTERNUMMSG DB 0DH,0AH,"NUMBERS YOU ENTERED:",0DH,0AH,"$"
	ASCENNUMMSG DB 0DH,0AH,"ASCENDING ORDER OF NUMBERS YOU ENTERED:",0DH,0AH,"$"
	COUNTMSG DB 0DH,0AH,"COUNT: $"
	FORMSTRING LABEL BYTE
	MAXFS db 7
	ACTFS db ?
	FSTRING db 7 dup("$")
	STOPINPUT DW 0

	ENDSTAMSG DB 0AH,0DH,"Continue calculate another set of Data ? (Y/N) : $"
	ERRORMSG DB 0DH,0AH,"THE TOTAL OF SQUARE VALUE IS OVER LIMIT,"
			DB 0AH,0DH,"SO WILL NOT CALCULATE THE FOLLOWING TERM",0DH,0AH,'$'

	;STORE ORI DATA
	RAWDATA DW 10 DUP(0)
	RDPOINTS DW 10 DUP(0)
	RDLEN DW 0

	;store ori data occur times USE SAME RDLEN
	RAWOCCUR DW 10 DUP(0)
	HIGHOCCUR DW 0

	;ASCENDING ORDER OF RAWDATA
	ASCRAWDATA DW 10 DUP(0)
	ASCRDPOINT DW 10 DUP(0)


	;STORE TOTAL OF RAW DATA
	;SUM
	TOTALOFRD DW 0
	TOTALOFRDP DW 0
	;AVERANGE
	AVROFRD DW 0
	AVROFRDP DW 0
	;MEDIAN
	MEDIANRD DW 0
	MEDIANRDP DW 0


	;MODE
	MODEARRAY DW 5 DUP(5) ;STORE REPRESENT INDEX
	MODELEN DW 0

	;ACCUMULATE OF SQUARE
	TOTALOFRDS DW 0
	TOTALOFRDPS DW 0
	SQUADIGIT DW 0
	SQUAPOINT DW 0
	LIMIT DW 0 ;IF 1 MEANS OVERLIMIT

	;VARIANCE
	VARIANCERD DW 0
	VARIANCERDP DW 0
	SUMSQUARERD DW 0
	SUMSQUARERDP DW 0
	TEMPRD DW 0
	TEMPRDP DW 0
	ATEMPRD DW 0
	ATEMPRDP DW 0
	BTEMPRD DW 0
	BTEMPRDP DW 0
	HALFRDLEN DW 0

	;SAMPLE VARIANCE
	VARIANCERDSAM DW 0
	VARIANCERDPSAM DW 0


	;standard deviasion
	NTRESULTDX DW 0
	NTRESULTAX DW 0
	ORIDX DW 0
	ORIAX DW 0

	;SAMPLE STANDARD DEVIATION
	NTRESULTDXSAM DW 0
	NTRESULTAXSAM DW 0

	;STORE LARGEST SMALLEST 
	LARGESTRD DW 0
	LARGESTRDP DW 0
	SMALLESTRD DW 0
	SMALLESTRDP DW 0
	RANGERD DW 0
	RANGERDP DW 0

	;CONVERT AND DISPLAY
	;SINCE IT STORE AND DISPLAY SO IS STORE THE ASCII OF 0 NOT NUMBER 0
	SDIGIT DB '0','0','0'
	SDIGITLEN DB 0
	SPOINT DB '0','0'
	SPOINTTLEN DB 0
	BOOLPOINT DB 0


	STRDISDIGIT DB 0,0,0,0,0
	STRDISPOINT DB 0,0
	HAVEDIGITSTA DB 0




;Comman Use Term
;String
NEW_LINE db 0DH,0AH,'$'

;Variable
tens_dw dw 10
hundreds_dw dw 100
thousands_dw dw 1000
ten_thousands_dw dw 10000

TEMPAX DW 0
TEMPBX DW 0
TEMPDX DW 0
TEMPSI DW 0
TEMPTOTAL DW 0
TEMPCX DW 0;



.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX

MAINMENU:
;---OUTPUT MENU
call far ptr clearSc
MOV AH,09H
LEA DX,MENU
INT 21H

;---INPUT MAIN MENU CHOICE

	MOV AH,01H
	INT 21H
	MOV CHOICE,AL
	CMP CHOICE,"1"			;BASE CONVERSION/CALCULATION FUNCTION
	JE BASE
	CMP CHOICE,"2"			;AREA/VOLUME CALCULATION FUNCTION
	JNE NOTAREAVOLUME	
	JMP AREAVOLUME

	NOTAREAVOLUME:
	CMP CHOICE,"3"			;FRACTION FUNCTION
	JNE NOTFRACCAL
	CALL FAR PTR FraCCal
	JMP MAINMENU;return back main menu

	NOTFRACCAL:				
	CMP CHOICE,"4"			;STATISTICS FUNCTION
	JNE NOTSTATISCAL
	CALL FAR PTR STATISCAL
	JMP MAINMENU;return back main menu

	NOTSTATISCAL:
    CMP CHOICE,"5"			;BACK TO MAIN MENU
    JNE NOTQUIT
	JMP QUIT
	NOTQUIT:
	
	;--IF INVALID CHOICE RETURN TO MAIN MENU
	MOV AH,09H
	LEA DX,INVALIDCHOICE
	INT 21H
	
	JMP MAINMENU

;---/////BASE MODULE
BASE:

	;---OUTPUT BASE MENU
	MOV AH,09H
	LEA DX,BASEMENU
	INT 21H
	
	;---INPUT BASE MENU CHOICE
	MOV AH,01H
	INT 21H
	MOV CHOICE1,AL
	CMP CHOICE1,"1"
	JE BASECONV
	CMP CHOICE1,"2"
	JNE NOTBASECALC	
	JMP BASECALC
	NOTBASECALC:
	CMP CHOICE1,"3"
	JE MAINMENU
	
	;--IF INVALID CHOICE RETURN TO BASE MENU
	MOV AH,09H
	LEA DX,INVALIDCHOICE
	INT 21H
	
	JMP BASE

	;----BASE CONVERSION FUNCTION
    BASECONV:
	MOV AH,09H
	LEA DX,BASECONVMENU				;BASE CONVERSION MENU 
	INT 21H 

	MOV AH,01H
	INT 21H
	MOV CHOICECONV,AL
	CMP CHOICECONV,"1"				;BIN TO HEX FUNCTION
	JE BIN2HEXINPUT
	CMP CHOICECONV,"2"
	JNE NOTHEX2DECINPUT2			;HEX TO DEC FUNCTION
	JMP HEX2DECINPUT
	NOTHEX2DECINPUT2:
    CMP CHOICECONV,"3"				;BACK TO BASE CONVERSION MENU
	JE BASE
	
	;--IF INVALID CHOICE RETURN TO BASE  CONVERSION MENU
	MOV AH,09H
	LEA DX,INVALIDCHOICE
	INT 21H
	
	JMP BASECONV      
	    
		
		;/////////BIN TO HEX FUNCTION
	    
		;BIN TO HEX INPUT
	    BIN2HEXINPUT:  
	        MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKBIN			;PROMPT USER TO INPUT 16 BIT BINARY
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,BIN
	        INT 21H
	        
	        CMP ACT_BIN,16			;COMPARE IF BINARY INPUT IS 16 BIT
	        JNE INVALID16BITBIN
	        JE CHECKBIN
	        
	        INVALID16BITBIN:		;IF NOT 16 BIT BINARY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASK16BITBIN
	        INT 21H
	        
	        JMP BIN2HEXINPUT
	        
			
			;CHECK WHETHER BINARY INPUT IS 1 OR 0 ONLY
	        CHECKBIN:
	        
	        MOV CH,0
	        MOV CL,ACT_BIN
	        MOV SI,0
	        CHECKBINFOR0:
	            CMP BIN_ARRAY[SI],30H
	            JGE CHECKBINFOR1
	            JL INVALIDBIN

            CHECKBINFOR1:
        	    CMP BIN_ARRAY[SI],31H
        	    JG INVALIDBIN
        	    INC SI
        	
        	LOOP CHECKBINFOR0
        	
        	JMP VALIDBIN    
        	    	        
	       INVALIDBIN:				;IF NOT 1 & 0 ONLY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASKVALIDBIN
	        INT 21H
	        
	        JMP BIN2HEXINPUT
        	
			;IF VALID BINARY INPUT
        	VALIDBIN: 
        	
            MOV AH, 09H
	        LEA DX, HEXRESULT
	        INT 21H
	              
	        
			;CONVERT BIN TO HEX
	        MOV CX,4
	        MOV SI,0
	        
	        BIN2HEX:
	            MOV AX,0
	            MOV AL,BIN_ARRAY[SI]
	            SUB AL, 30H
	            
	            MOV BL,8
	            MUL BL
	            
	            MOV VAR,AL
	            
	            INC SI	            
	          	            
	            MOV AX,0
	            MOV AL,BIN_ARRAY[SI]
	            SUB AL, 30H
	            
	            MOV BL,4
	            MUL BL
	            
	            ADD VAR,AL
	            
	            INC SI
	       
	            MOV AX,0
	            MOV AL,BIN_ARRAY[SI]
	            SUB AL, 30H
	            
	            MOV BL,2
	            MUL BL
	            
	            ADD VAR,AL
	            
	            INC SI  
	            
	            MOV AX,0
	            MOV AL,BIN_ARRAY[SI]
	            SUB AL, 30H
	            
	            MOV BL,1
	            MUL BL
	            
	            ADD VAR,AL
	            
	            INC SI	           
	            
	            ADD VAR,30H
	            
				;COMPARE HEXA VALUE TO A-F
	            CMP VAR, 3AH
	            JE PRINTA
	            CMP VAR, 3BH 
	            JE PRINTB
	            CMP VAR, 3CH
	            JE PRINTC
	            CMP VAR, 3DH
	            JE PRINTD
	            CMP VAR, 3EH
	            JE PRINTE
	            CMP VAR, 3FH
	            JE PRINTF
	            
				;PRINT HEXA VALUE RESULT
	            MOV AH,02H
	            MOV DL,VAR     
	            INT 21H
	            JMP ENDOFPRINTHEX
	            
	            PRINTA:
	            MOV AH, 02H
	            MOV DL, 'A'
	            INT 21H
	            JMP ENDOFPRINTHEX 
	            PRINTB:
	            MOV AH, 02H
	            MOV DL, 'B'
	            INT 21H       
	            JMP ENDOFPRINTHEX
	            PRINTC:
	            MOV AH, 02H
	            MOV DL, 'C'
	            INT 21H          
	            JMP ENDOFPRINTHEX
	            PRINTD:
	            MOV AH, 02H
	            MOV DL, 'D'
	            INT 21H          
	            JMP ENDOFPRINTHEX
	            PRINTE:
	            MOV AH, 02H
	            MOV DL, 'E'
	            INT 21H          
	            JMP ENDOFPRINTHEX
	           	PRINTF:
	            MOV AH, 02H
	            MOV DL, 'F'
	            INT 21H          
	            JMP ENDOFPRINTHEX
	           	
	           	ENDOFPRINTHEX:            
	            
	            DEC CX
	            
	       CMP CX,0
	       JE NOTBIN2HEX
	       JMP BIN2HEX
	       NOTBIN2HEX:
	       

	       MOV AH, 02H
	       MOV DL, 'H'
	       INT 21H
	    
		;ASK IF ANYMORE CALCULATION
	    ASKANYMORE1:   
	    MOV AH,09H
    	LEA DX,ANYMORECALC
    	INT 21H 
    	
    	MOV AH,01H
    	INT 21H
    	MOV ANYMORE,AL
    	CMP ANYMORE,"1"			;IF '1'(YES) INPUT AGAIN
    	JNE NOTBIN2HEXINPUT
    	JMP BIN2HEXINPUT
    	NOTBIN2HEXINPUT:
    	CMP ANYMORE,"0"			;IF '0'(NO) GO BACK TO MAIN MENU
    	JNE NOTMAINMENU10	
    	JMP MAINMENU
    	NOTMAINMENU10:
    
	    MOV AH,09H
    	LEA DX,INVALIDANYMORE	;IF INVALID CHOICE, INPUT AGAIN
    	INT 21H
    	
    	JMP ASKANYMORE1 
    	
    	
    	
    	
	       
	    ;-------HEX2DEC FUNCTION
		
		
		;HEX TO DEC INPUT
	    HEX2DECINPUT:  
	    
	    	MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKHEX			;PROMPT USER TO INPUT 16 BIT HEXADECIMAL
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,HEX
	        INT 21H
	        
	        CMP ACT_HEX,4			;COMPARE IF HEXADECIMAL INPUT IS 16 BIT
	        JNE INVALID16BITHEX
	        JE CHECKHEX
	        
	        INVALID16BITHEX:		;IF NOT 16 BIT HEXADECIMAL, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASK16BITHEX
	        INT 21H
	        
	        JMP HEX2DECINPUT
	        
			
			;CHECK WHETHER HEXADECIMAL INPUT IS 1-9 & A-F ONLY
			
	        CHECKHEX:
	        
	        MOV CH,0
	        MOV CL,ACT_HEX
	        MOV SI,0
	        CHECKHEXNUM1:
	            SUB HEX_ARRAY[SI],30H
	            MOV BL,HEX_ARRAY[SI]

	            CMP BL,0H
	            JGE CHECKHEXNUM2
	            JL INVALIDHEX

            CHECKHEXNUM2:
        	    CMP BL,9H
        	    JLE NEXTHEX
        	    
        	CHECKHEXALP1:
        	    CMP BL,11H
        	    JGE CHECKHEXALP2
        	    JL INVALIDHEX 
        	    
        	CHECKHEXALP2:
        	    CMP BL,16H
        	    JG INVALIDHEX  
        	    SUB HEX_ARRAY[SI],7H
        	
        	NEXTHEX:          	    
        	    INC SI
        	
        	LOOP CHECKHEXNUM1
        	
        	JMP VALIDHEX    
        	    	        
	       INVALIDHEX:				;IF NOT 1-9 & A-F ONLY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASKVALIDHEX
	        INT 21H
	        
	        JMP HEX2DECINPUT
        	

			;IF VALID HEXADECIMAL INPUT
			
        	VALIDHEX: 
        	
            MOV AH, 09H
	        LEA DX, DECRESULT
	        INT 21H
	        
	        MOV SI,0      
	        

			;CONVERT HEX TO DEC
			
	        HEX2DEC:
	            MOV AX,0
	            MOV AL,HEX_ARRAY[SI]
	            
	            MOV BX,4096
	            MUL BX
	            
	            MOV VAR2,AX
	            
	            INC SI	            
	          	            
	            MOV AX,0
	            MOV AL,HEX_ARRAY[SI]
	            
	            MOV BX,256
	            MUL BX
	            
	            ADD VAR2,AX
	            
	            INC SI
	       
	            MOV AX,0
	            MOV AL,HEX_ARRAY[SI]
	            
	            MOV BL,16
	            MUL BL
	            
	            ADD VAR2,AX
	            
	            INC SI  
	            
	            MOV AX,0
	            MOV AL,HEX_ARRAY[SI]
	            
	            MOV BL,1
	            MUL BL
	            
	            ADD VAR2,AX
	            	           
	            
				;PRINT DECIMAL VALUE RESULT
				
	            MOV AX,VAR2
	            
	                MOV CX,0 
                    MOV DX,0 
                    LABEL1:           
                        CMP AX,0 
                        JE PRINT1       
                          
                        ;INITIALIZE BP TO 10 
                        MOV BP,TEN         
                          
                        ; EXTRACT THE LAST DIGIT 
                        DIV BP                    
                          
                        ;PUSH IT IN THE STACK 
                        PUSH DX               
                          
                        ;INCREMENT THE COUNT 
                        INC CX               
                          
                        ;SET DX TO 0  
                        MOV DX,0 
                        JMP LABEL1 
                    PRINT1: 
                        ;CHECK IF COUNT  
                        ;IS GREATER THAN ZERO 
                        CMP CX,0 
                        JE EXIT
                          
                        ;POP THE TOP OF STACK 
                        POP DX 
                          
                        ;ADD 48 SO THAT IT  
                        ;REPRESENTS THE ASCII 
                        ;VALUE OF DIGITS 
                        ADD DX,30H 
                          
                        ;INTERRUPT TO PRINT A 
                        ;CHARACTER 
                        MOV AH,02H 
                        INT 21H 
                          
                        ;DECREASE THE COUNT 
                        DEC CX 
                        JMP PRINT1 
                EXIT:           
                            	            
	    ;ASK IF ANYMORE CALCULATION 
		 
	    ASKANYMORE2:   
	    MOV AH,09H
    	LEA DX,ANYMORECALC
    	INT 21H 
    	
    	MOV AH,01H
    	INT 21H
    	MOV ANYMORE,AL
    	CMP ANYMORE,"1"				;IF '1'(YES) INPUT AGAIN
    	JNE NOTHEX2DECINPUT
    	JMP HEX2DECINPUT
    	NOTHEX2DECINPUT:
    	CMP ANYMORE,"0"				;IF '0'(NO) GO BACK TO MAIN MENU
    	JNE NOTMAINMENU9	
    	JMP MAINMENU
    	NOTMAINMENU9:
    
	    MOV AH,09H
    	LEA DX,INVALIDANYMORE		;IF INVALID CHOICE, INPUT AGAIN
    	INT 21H
    	
    	JMP ASKANYMORE2
	    
	    
	    
	
;///////////////////////////////////
;////////BASE CALCULATION FUNCTION//
;///////////////////////////////////	

	;DISPLAY BASE CALCULATION MENU
    BASECALC:
    MOV AH,09H
	LEA DX,BASECALCMENU
	INT 21H 
	
	;INPUT BASE CALCULATION CHOICE
	MOV AH,01H
	INT 21H
	MOV CHOICECALC,AL
	CMP CHOICECALC,"1"			;HEXADECIMAL OPERATION
	JE HEXOP
	CMP CHOICECALC,"2"			;BINARY OPERATION
	JNE NOTBINOP	
	JMP BINOP
	NOTBINOP:
    CMP CHOICECALC,"3"			;BACK TO BASE MENU
    JNE NOTBASE
	JMP BASE
	NOTBASE:
	
	MOV AH,09H
	LEA DX,INVALIDCHOICE		;IF INVALID CHOICE, INPUT AGAIN
	INT 21H
	
	JMP BASECALC 
	
	
	;/////////
	;////////////----HEX OPERATION   
	;/////////
		
		;DISPLAY HEX BASE OPERATION MENU
	    HEXOP:   
        MOV AH,09H
        LEA DX,BASECALCOP
    	INT 21H
    	
		;INPUT HEX BASE OPERATION CHOICE
    	MOV AH,01H
    	INT 21H
    	MOV CHOICEOPHEX,AL
    	CMP CHOICEOPHEX,"1"			;HEX ADDITION
    	JE HEXADDINPUT1
    	CMP CHOICEOPHEX,"2"			;HEX SUBTRACTION
    	JNE NOTHEXSUBINPUT1A	
    	JMP HEXSUBINPUT1
    	NOTHEXSUBINPUT1A:
    	CMP CHOICEOPHEX,"3"			;HEX MULTIPLICATION
    	JNE NOTHEXMULINPUT1A
    	JMP HEXMULINPUT1
    	NOTHEXMULINPUT1A:
    	CMP CHOICEOPHEX,"4"			;HEX DIVISION
    	JNE NOTHEXDIVINPUT1B	
    	JMP HEXDIVINPUT1
    	NOTHEXDIVINPUT1B:
    	CMP CHOICEOPHEX,"5"       	;BACK TO BASE CALCULATION MENU       	        
        JE BASECALC
            
    	MOV AH,09H
    	LEA DX,INVALIDCHOICE		;IF INVALID CHOICE, INPUT AGAIN
    	INT 21H
    	
    	JMP HEXOP        
        
        
		;---////////HEX ADDITION FUNCTION
        	
			;INPUT 1ST HEXA OPERAND
            HEXADDINPUT1:
            
	    	MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKHEX1			;PROMPT USER TO INPUT 16 BIT HEXA
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,HEX1
	        INT 21H
	        
	        CMP ACT_HEX1,4			;COMPARE IF HEXA INPUT IS 16 BIT
	        JNE INVALID16BITHEX1
	        JE CHECKHEX1
	        
	        INVALID16BITHEX1:		;IF NOT 16 BIT HEXA, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASK16BITHEX
	        INT 21H
	        
	        JMP HEXADDINPUT1
			
	        
			;CHECK WHETHER HEXADECIMAL INPUT IS 1-9 & A-F ONLY
			
	        CHECKHEX1:
	        
	        MOV CH,0
	        MOV CL,ACT_HEX1
	        MOV SI,0
	        CHECKHEX1NUM1:
	            SUB HEX1_ARRAY[SI],30H
	            MOV BL,HEX1_ARRAY[SI]

	            CMP BL,0H
	            JGE CHECKHEX1NUM2
	            JL INVALIDHEX1

            CHECKHEX1NUM2:
        	    CMP BL,9H
        	    JLE NEXTHEX1
        	    
        	CHECKHEX1ALP1:
        	    CMP BL,11H
        	    JGE CHECKHEX1ALP2
        	    JL INVALIDHEX1 
        	    
        	CHECKHEX1ALP2:
        	    CMP BL,16H
        	    JG INVALIDHEX1  
        	    SUB HEX1_ARRAY[SI],7H
        	
        	NEXTHEX1:          	    
        	    INC SI
        	
        	LOOP CHECKHEX1NUM1
        	
        	JMP HEXADDINPUT2    
        	    	        
	       INVALIDHEX1:				;IF NOT 1-9 & A-F ONLY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASKVALIDHEX
	        INT 21H
	        
	        JMP HEXADDINPUT1
        	    
        	
        	;---------------
        	
        	;INPUT 2ND HEXA OPERAND
			
        	HEXADDINPUT2:
        	
        	MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKHEX2
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,HEX2
	        INT 21H
	        
	        CMP ACT_HEX2,4
	        JNE INVALID16BITHEX2
	        JE CHECKHEX2
	        
	        INVALID16BITHEX2:
	           	        
	        MOV AH,09H
	        LEA DX,ASK16BITHEX
	        INT 21H
	        
	        JMP HEXADDINPUT2
	        
			
			;CHECK WHETHER HEXADECIMAL INPUT IS 1-9 & A-F ONLY
			
	        CHECKHEX2:
	        
	        MOV CH,0
	        MOV CL,ACT_HEX2
	        MOV SI,0
	        CHECKHEX2NUM1:
	            SUB HEX2_ARRAY[SI],30H
	            MOV BL,HEX2_ARRAY[SI]

	            CMP BL,0H
	            JGE CHECKHEX2NUM2
	            JL INVALIDHEX2

            CHECKHEX2NUM2:
        	    CMP BL,9H
        	    JLE NEXTHEX2
        	    
        	CHECKHEX2ALP1:
        	    CMP BL,11H
        	    JGE CHECKHEX2ALP2
        	    JL INVALIDHEX2 
        	    
        	CHECKHEX2ALP2:
        	    CMP BL,16H
        	    JG INVALIDHEX2  
        	    SUB HEX2_ARRAY[SI],7H
        	
        	NEXTHEX2:          	    
        	    INC SI
        	
        	LOOP CHECKHEX2NUM1
        	
        	JMP VALIDHEXADD    
        	    	        
	       INVALIDHEX2:				;IF NOT 1-9 & A-F ONLY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASKVALIDHEX
	        INT 21H
	        
	        JMP HEXADDINPUT2 
	        
			;------------
			
	        ;IF VALID HEXADECIMAL INPUT
        	
        	VALIDHEXADD:            
            
            MOV AH, 02H
            MOV DL, 0DH
            INT 21H
            MOV DL, 0AH
            INT 21H
            
            MOV AH, 09H
	        LEA DX, HEXADDRESULT
	        INT 21H
	        
	        MOV SI,0      
	                
	        ;CONVERT HEX1 TO DEC
	            MOV AX,0
	            MOV AL,HEX1_ARRAY[SI]
	            
	            MOV BX,4096
	            MUL BX
	            
	            MOV ADDHEXVAR1,AX
	            
	            INC SI	            
	          	            
	            MOV AX,0
	            MOV AL,HEX1_ARRAY[SI]
	            
	            MOV BX,256
	            MUL BX
	            
	            ADD ADDHEXVAR1,AX
	            
	            INC SI
	       
	            MOV AX,0
	            MOV AL,HEX1_ARRAY[SI]
	            
	            MOV BL,16
	            MUL BL
	            
	            ADD ADDHEXVAR1,AX
	            
	            INC SI  
	            
	            MOV AX,0
	            MOV AL,HEX1_ARRAY[SI]
	            
	            MOV BL,1
	            MUL BL
	            
	            ADD ADDHEXVAR1,AX 
	        
	        
	            
	        MOV SI,0
	            
	        ;CONVERT HEX2 TO DEC
	            MOV AX,0
	            MOV AL,HEX2_ARRAY[SI]
	            
	            MOV BX,4096
	            MUL BX
	            
	            MOV ADDHEXVAR2,AX
	            
	            INC SI	            
	          	            
	            MOV AX,0
	            MOV AL,HEX2_ARRAY[SI]
	            
	            MOV BX,256
	            MUL BX
	            
	            ADD ADDHEXVAR2,AX
	            
	            INC SI
	       
	            MOV AX,0
	            MOV AL,HEX2_ARRAY[SI]
	            
	            MOV BL,16
	            MUL BL
	            
	            ADD ADDHEXVAR2,AX
	            
	            INC SI  
	            
	            MOV AX,0
	            MOV AL,HEX2_ARRAY[SI]
	            
	            MOV BL,1
	            MUL BL
	            
	            ADD ADDHEXVAR2,AX
	            
	        
	        ;ADD HEX1 & HEX2
	            
	            MOV AX,0
	            MOV AX,ADDHEXVAR1
	            ADD AX,ADDHEXVAR2
	            MOV ADDHEXTOTAL,AX
	            
	        ;ADDHEXTOTAL TO DECIMAL
	        
	            JNC NOHEXADDOVERFLOW		;CHECK WHETHER HAVE CARRY
	       
	        HEXADDOVERFLOW:					;IF HAVE CARRY, PRINT '1'
	            
	            MOV AH,02H
	            MOV DL,'1'
	            INT 21H  
	            
	        NOHEXADDOVERFLOW:   			;IF NO CARRY
	           
	           



			
			;ADDHEXTOTAL TO HEXADECIMAL
			 MOV SI,0
	        PRINTADDHEX:
	            
	            MOV AX,0
	            MOV AX,ADDHEXTOTAL
	            MOV DX,0
	            MOV BX,16
	            DIV BX
	            
	            MOV Q,AX
	            ADD DL,30H
	            MOV R_ARRAY[SI],DL
	            
	            INC SI
	            
	            MOV BX,Q
	            MOV ADDHEXTOTAL,BX
	            
	            CMP BX,0
	            
	            JNE PRINTADDHEX
	            
	       ;PRINT HEX ADDITION RESULT     
	       
	       MOV CH,0
	       MOV CL,4
	       MOV SI,3          
	       ENDOFADDHEX:
	            
	            MOV BH,0
	            MOV BL,R_ARRAY[SI]  
	               
	            CMP BL, 3AH
	            JE PRINTADDA
	            CMP BL, 3BH 
	            JE PRINTADDB
	            CMP BL, 3CH
	            JE PRINTADDC
	            CMP BL, 3DH
	            JE PRINTADDD
	            CMP BL, 3EH
	            JE PRINTADDE
	            CMP BL, 3FH
	            JE PRINTADDF
	            
	            MOV AX,0
	            MOV AH,02H
	            MOV DL,BL    
	            INT 21H
	            JMP ENDOFPRINTADDHEX
	            
	            PRINTADDA:
	            MOV AH, 02H
	            MOV DL, 'A'
	            INT 21H
	            JMP ENDOFPRINTADDHEX 
	            PRINTADDB:
	            MOV AH, 02H
	            MOV DL, 'B'
	            INT 21H       
	            JMP ENDOFPRINTADDHEX
	            PRINTADDC:
	            MOV AH, 02H
	            MOV DL, 'C'
	            INT 21H          
	            JMP ENDOFPRINTADDHEX
	            PRINTADDD:
	            MOV AH, 02H
	            MOV DL, 'D'
	            INT 21H          
	            JMP ENDOFPRINTADDHEX
	            PRINTADDE:
	            MOV AH, 02H
	            MOV DL, 'E'
	            INT 21H          
	            JMP ENDOFPRINTADDHEX
	            PRINTADDF:
	            MOV AH, 02H
	            MOV DL, 'F'
	            INT 21H          
	            JMP ENDOFPRINTADDHEX
	           	
	           	ENDOFPRINTADDHEX:
	           	
	           	DEC SI
	           	
	       LOOP ENDOFADDHEX
	            

	       MOV AH, 02H
	       MOV DL, 'H'
	       INT 21H
	    

		;ASK IF ANYMORE CALCULATION
		
	    ASKANYMORE3:   
	    MOV AH,09H
    	LEA DX,ANYMORECALC
    	INT 21H 
    	
    	MOV AH,01H
    	INT 21H
    	MOV ANYMORE,AL
    	CMP ANYMORE,"1"			;IF '1'(YES) INPUT AGAIN
    	JNE NOTHEXADDINPUT1
    	JMP HEXADDINPUT1
    	NOTHEXADDINPUT1:
    	CMP ANYMORE,"0"			;IF '0'(NO) GO BACK TO MAIN MENU
    	JNE NOTMAINMENU8	
    	JMP MAINMENU
    	NOTMAINMENU8:
    
	    MOV AH,09H
    	LEA DX,INVALIDANYMORE	;IF INVALID CHOICE, INPUT AGAIN
    	INT 21H
    	
    	JMP ASKANYMORE3	            
	        
	       
	     ;//////-----HEX SUBTRACTION FUNCTION       
            
			;INPUT 1ST HEXA OPERAND
			
            HEXSUBINPUT1:
            
            MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKHEX1				;PROMPT USER TO INPUT 16 BIT HEXA
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,SUBHEX1
	        INT 21H
	        
	        CMP ACT_SUBHEX1,4			;COMPARE IF HEXA INPUT IS 16 BIT
	        JNE INVALID16BITSUBHEX1
	        JE CHECKSUBHEX1
	        
	        INVALID16BITSUBHEX1:		;IF NOT 16 BIT HEXA, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASK16BITHEX
	        INT 21H
	        
	        JMP HEXSUBINPUT1
	        
			
			;CHECK WHETHER HEXADECIMAL INPUT IS 1-9 & A-F ONLY
			
	        CHECKSUBHEX1:
	        
	        MOV CH,0
	        MOV CL,ACT_SUBHEX1
	        MOV SI,0
	        CHECKSUBHEX1NUM1:
	            SUB SUBHEX1_ARRAY[SI],30H
	            MOV BL,SUBHEX1_ARRAY[SI]

	            CMP BL,0H
	            JGE CHECKSUBHEX1NUM2
	            JL INVALIDSUBHEX1

            CHECKSUBHEX1NUM2:
        	    CMP BL,9H
        	    JLE NEXTSUBHEX1
        	    
        	CHECKSUBHEX1ALP1:
        	    CMP BL,11H
        	    JGE CHECKSUBHEX1ALP2
        	    JL INVALIDSUBHEX1 
        	    
        	CHECKSUBHEX1ALP2:
        	    CMP BL,16H
        	    JG INVALIDSUBHEX1  
        	    SUB SUBHEX1_ARRAY[SI],7H
        	
        	NEXTSUBHEX1:          	    
        	    INC SI
        	
        	LOOP CHECKSUBHEX1NUM1
        	
        	JMP HEXSUBINPUT2    
        	    	        
	       INVALIDSUBHEX1:				;IF NOT 1-9 & A-F ONLY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASKVALIDHEX
	        INT 21H
	        
	        JMP HEXSUBINPUT1
        	    
        	
        	;---------------
        	;INPUT 2ND HEXA OPERAND
        	
        	HEXSUBINPUT2:
        	
        	MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKHEX2
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,SUBHEX2
	        INT 21H
	        
	        CMP ACT_SUBHEX2,4
	        JNE INVALID16BITSUBHEX2
	        JE CHECKSUBHEX2
	        
	        INVALID16BITSUBHEX2:
	           	        
	        MOV AH,09H
	        LEA DX,ASK16BITHEX
	        INT 21H
	        
	        JMP HEXSUBINPUT2
	        
			
			;CHECK WHETHER HEXADECIMAL INPUT IS 1-9 & A-F ONLY
			
	        CHECKSUBHEX2:
	        
	        MOV CH,0
	        MOV CL,ACT_SUBHEX2
	        MOV SI,0
	        CHECKSUBHEX2NUM1:
	            SUB SUBHEX2_ARRAY[SI],30H
	            MOV BL,SUBHEX2_ARRAY[SI]

	            CMP BL,0H
	            JGE CHECKSUBHEX2NUM2
	            JL INVALIDSUBHEX2

            CHECKSUBHEX2NUM2:
        	    CMP BL,9H
        	    JLE NEXTSUBHEX2
        	    
        	CHECKSUBHEX2ALP1:
        	    CMP BL,11H
        	    JGE CHECKSUBHEX2ALP2
        	    JL INVALIDSUBHEX2 
        	    
        	CHECKSUBHEX2ALP2:
        	    CMP BL,16H
        	    JG INVALIDSUBHEX2  
        	    SUB SUBHEX2_ARRAY[SI],7H
        	
        	NEXTSUBHEX2:          	    
        	    INC SI
        	
        	LOOP CHECKSUBHEX2NUM1
        	
        	JMP VALIDHEXSUB    
        	    	        
	       INVALIDSUBHEX2:			;IF NOT 1-9 & A-F ONLY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASKVALIDHEX
	        INT 21H
	        
	        JMP HEXSUBINPUT2 
	        
	        ;------------
        	;IF VALID HEXADECIMAL INPUT
			
        	VALIDHEXSUB:            
            
            MOV AH, 02H
            MOV DL, 0DH
            INT 21H
            MOV DL, 0AH
            INT 21H
            
            MOV AH, 09H
	        LEA DX, HEXSUBRESULT
	        INT 21H
	        
	        MOV SI,0    
	                
	        ;CONVERT SUBHEX1 TO DEC
	            MOV AX,0
	            MOV AL,SUBHEX1_ARRAY[SI]
	            
	            MOV BX,1000H
	            MUL BX
	            
	            MOV SUBHEXVAR1,AX
	            
	            INC SI	            
	          	            
	            MOV AX,0
	            MOV AL,SUBHEX1_ARRAY[SI]
	            
	            MOV BX,100H
	            MUL BX
	            
	            ADD SUBHEXVAR1,AX
	            
	            INC SI
	       
	            MOV AX,0
	            MOV AL,SUBHEX1_ARRAY[SI]
	            
	            MOV BL,10H
	            MUL BL
	            
	            ADD SUBHEXVAR1,AX
	            
	            INC SI  
	            
	            MOV AX,0
	            MOV AL,SUBHEX1_ARRAY[SI]
	            
	            MOV BL,1H
	            MUL BL
	            
	            ADD SUBHEXVAR1,AX 
	        
	        
	            
	        MOV SI,0
	            
	        ;CONVERT SUBHEX2 TO DEC
	            MOV AX,0
	            MOV AL,SUBHEX2_ARRAY[SI]
	            
	            MOV BX,1000H
	            MUL BX
	            
	            MOV SUBHEXVAR2,AX
	            
	            INC SI	            
	          	            
	            MOV AX,0
	            MOV AL,SUBHEX2_ARRAY[SI]
	            
	            MOV BX,100H
	            MUL BX
	            
	            ADD SUBHEXVAR2,AX
	            
	            INC SI
	       
	            MOV AX,0
	            MOV AL,SUBHEX2_ARRAY[SI]
	            
	            MOV BL,10H
	            MUL BL
	            
	            ADD SUBHEXVAR2,AX
	            
	            INC SI  
	            
	            MOV AX,0
	            MOV AL,SUBHEX2_ARRAY[SI]
	            
	            MOV BL,1H
	            MUL BL
	            
	            ADD SUBHEXVAR2,AX
	            
	       
	       
	        ;------     
	            MOV BP,0   
	            MOV AX,SUBHEXVAR1 
	            MOV BX,10H
	            SUBHEXPROB4:   
	            MOV DX,0
	            DIV BX  
	            INC BP
	            CMP AX,0
	            JNE SUBHEXPROB4
	             
	            
	            MOV DI,0 
	            MOV AX,SUBHEXVAR2
	            MOV BX,10H
	            SUBHEXPROB5:
	            MOV DX,0
	            DIV BX  
	            INC DI
	            CMP AX,0
	            JNE SUBHEXPROB5
	             
	            
	        ;SUB HEX1 & HEX2
	            
	            CMP BP,DI
	            JG SUBHEXPROB3
	            JL NEGATIVESUBHEX
	            JE SUBHEXPROB2
	          
	     
	     
	        	
	        	SUBHEXPROB2: 
				CMP BP, 4
				JE SUBHEXSOL1
	            MOV AX,0
	            MOV AX,SUBHEXVAR1
	            CMP AX,SUBHEXVAR2
	            JL NEGATIVESUBHEX
				
	            SUBHEXPROB3:
	            MOV AX,0
	            MOV AX,SUBHEXVAR1
	            SUB AX,SUBHEXVAR2
	            MOV SUBHEXTOTAL,AX
	            
	            JMP NORMALSUBHEX
	         
				SUBHEXSOL1:
				MOV AX, SUBHEXVAR1
				MOV BX, 1000H
				MOV DX, 0
				DIV BX
				MOV VAR2, AX
				MOV AX, SUBHEXVAR2
				MOV DX, 0
				DIV BX
				CMP AX, VAR2
				JL SUBHEXPROB3
				JE SUBHEXSOL2
				JG NEGATIVESUBHEX
				
				SUBHEXSOL2:
				MOV AX, SUBHEXVAR1
				MOV BX, 1000H
				MOV DX, 0
				DIV BX
				MOV VAR2, DX
				MOV AX, SUBHEXVAR2
				MOV DX, 0
				DIV BX
				CMP DX, VAR2
				JLE SUBHEXPROB3
	            
	       
	        NEGATIVESUBHEX:
	            
	            
	            MOV AX,0
	            MOV AX,SUBHEXVAR2
	            SUB AX,SUBHEXVAR1
	            MOV SUBHEXTOTAL,AX
	            
	            MOV AH,02H
	            MOV DL,'-'				;IF NEGATIVE, PRINT '-'
	            INT 21H  
	            
	        NORMALSUBHEX:  
	           
	            MOV SI,0
			
			
			
			;SUBHEXTOTAL TO HEXADECIMAL
			
	        PRINTSUBHEX:
	            
	            MOV AX,0
	            MOV AX,SUBHEXTOTAL
	            MOV DX,0
	            MOV BX,16
	            DIV BX
	            
	            MOV QS,AX
	            ADD DL,30H
	            MOV RS_ARRAY[SI],DL
	            
	            INC SI
	            
	            MOV BX,QS
	            MOV SUBHEXTOTAL,BX
	            
	            CMP BX,0H
	            
	            JNE PRINTSUBHEX
	            
	       ;PRINT HEX SUBTRACTION RESULT    
	       
	       MOV CH,0
	       MOV CL,4
	       MOV SI,3          
	       ENDOFSUBHEX:
	            
	            MOV BH,0
	            MOV BL,RS_ARRAY[SI]
				MOV RS_ARRAY[SI],0
	               
	            CMP BL, 3AH
	            JE PRINTSUBA
	            CMP BL, 3BH 
	            JE PRINTSUBB
	            CMP BL, 3CH
	            JE PRINTSUBC
	            CMP BL, 3DH
	            JE PRINTSUBD
	            CMP BL, 3EH
	            JE PRINTSUBE
	            CMP BL, 3FH
	            JE PRINTSUBF
	            
	            MOV AX,0
	            MOV AH,02H
	            MOV DL,BL    
	            INT 21H
	            JMP ENDOFPRINTSUBHEX
	            
	            PRINTSUBA:
	            MOV AH, 02H
	            MOV DL, 'A'
	            INT 21H
	            JMP ENDOFPRINTSUBHEX 
	            PRINTSUBB:
	            MOV AH, 02H
	            MOV DL, 'B'
	            INT 21H       
	            JMP ENDOFPRINTSUBHEX
	            PRINTSUBC:
	            MOV AH, 02H
	            MOV DL, 'C'
	            INT 21H          
	            JMP ENDOFPRINTSUBHEX
	            PRINTSUBD:
	            MOV AH, 02H
	            MOV DL, 'D'
	            INT 21H          
	            JMP ENDOFPRINTSUBHEX
	            PRINTSUBE:
	            MOV AH, 02H
	            MOV DL, 'E'
	            INT 21H          
	            JMP ENDOFPRINTSUBHEX
	            PRINTSUBF:
	            MOV AH, 02H
	            MOV DL, 'F'
	            INT 21H          
	            JMP ENDOFPRINTSUBHEX
	           	
	           	ENDOFPRINTSUBHEX:
	           	
	           	DEC SI
	           	
	       LOOP ENDOFSUBHEX
	            

	       MOV AH, 02H
	       MOV DL, 'H'
	       INT 21H
	    
		;ASK IF ANYMORE CALCULATION		
	
	    ASKANYMORE4:   
	    MOV AH,09H
    	LEA DX,ANYMORECALC
    	INT 21H 
    	
    	MOV AH,01H
    	INT 21H
    	MOV ANYMORE,AL
    	CMP ANYMORE,"1"				;IF '1'(YES) INPUT AGAIN
    	JNE NOTHEXSUBINPUT1
    	JMP HEXSUBINPUT1
    	NOTHEXSUBINPUT1:
    	CMP ANYMORE,"0"				;IF '0'(NO) GO BACK TO MAIN MENU
    	JNE NOTMAINMENU7	
    	JMP MAINMENU
    	NOTMAINMENU7:
    
	    MOV AH,09H
    	LEA DX,INVALIDANYMORE		;IF INVALID CHOICE, INPUT AGAIN
    	INT 21H
    	
    	JMP ASKANYMORE4
    	
    	
    	
     ;/////////////////////////////
     ;///-----------HEX MULTIPLICATION FUNCTION	       
	 ;////////////////////////////      
            
			;INPUT 1ST HEXA OPERAND
			
            HEXMULINPUT1:
                         
	    	MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKMULHEX1			;PROMPT USER TO INPUT 8 BIT HEXA
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,MULHEX1
	        INT 21H
	        
	        CMP ACT_MULHEX1,2			;COMPARE IF HEXA INPUT IS 8 BIT
	        JNE INVALID8BITMULHEX1
	        JE CHECKMULHEX1
	        
	        INVALID8BITMULHEX1:			;IF NOT 8 BIT HEXA, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASK8BITHEX
	        INT 21H
	        
	        JMP HEXMULINPUT1
	        
			;CHECK WHETHER HEXADECIMAL INPUT IS 1-9 & A-F ONLY
			
	        CHECKMULHEX1:
	        
	        MOV CH,0
	        MOV CL,ACT_MULHEX1
	        MOV SI,0
	        CHECKMULHEX1NUM1:
	            SUB MULHEX1_ARRAY[SI],30H
	            MOV BL,MULHEX1_ARRAY[SI]

	            CMP BL,0H
	            JGE CHECKMULHEX1NUM2
	            JL INVALIDMULHEX1

            CHECKMULHEX1NUM2:
        	    CMP BL,9H
        	    JLE NEXTMULHEX1
        	    
        	CHECKMULHEX1ALP1:
        	    CMP BL,11H
        	    JGE CHECKMULHEX1ALP2
        	    JL INVALIDMULHEX1 
        	    
        	CHECKMULHEX1ALP2:
        	    CMP BL,16H
        	    JG INVALIDMULHEX1  
        	    SUB MULHEX1_ARRAY[SI],7H
        	
        	NEXTMULHEX1:          	    
        	    INC SI
        	
        	LOOP CHECKMULHEX1NUM1
        	
        	JMP HEXMULINPUT2    
        	    	        
	       INVALIDMULHEX1:				;IF NOT 1-9 & A-F ONLY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASKVALIDHEX
	        INT 21H
	        
	        JMP HEXMULINPUT1
        	    
        	
        	;---------------
        	;INPUT 2ND HEXA OPERAND
        	
        	HEXMULINPUT2:
        	
        	MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKMULHEX2			;PROMPT USER TO INPUT 8 BIT HEXA
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,MULHEX2
	        INT 21H
	        
	        CMP ACT_MULHEX2,2			;COMPARE IF HEXA INPUT IS 8 BIT
	        JNE INVALID8BITMULHEX2
	        JE CHECKMULHEX2
	        
	        INVALID8BITMULHEX2:			;IF NOT 8 BIT HEXA, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASK8BITHEX
	        INT 21H
	        
	        JMP HEXMULINPUT2
	        
			
			;CHECK WHETHER HEXADECIMAL INPUT IS 1-9 & A-F ONLY
			
	        CHECKMULHEX2:
	        
	        MOV CH,0
	        MOV CL,ACT_MULHEX2
	        MOV SI,0
	        CHECKMULHEX2NUM1:
	            SUB MULHEX2_ARRAY[SI],30H
	            MOV BL,MULHEX2_ARRAY[SI]

	            CMP BL,0H
	            JGE CHECKMULHEX2NUM2
	            JL INVALIDMULHEX2

            CHECKMULHEX2NUM2:
        	    CMP BL,9H
        	    JLE NEXTMULHEX2
        	    
        	CHECKMULHEX2ALP1:
        	    CMP BL,11H
        	    JGE CHECKMULHEX2ALP2
        	    JL INVALIDMULHEX2 
        	    
        	CHECKMULHEX2ALP2:
        	    CMP BL,16H
        	    JG INVALIDMULHEX2  
        	    SUB MULHEX2_ARRAY[SI],7H
        	
        	NEXTMULHEX2:          	    
        	    INC SI
        	
        	LOOP CHECKMULHEX2NUM1
        	
        	JMP VALIDHEXMUL    
        	    	        
	       INVALIDMULHEX2:			;IF NOT 1-9 & A-F ONLY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASKVALIDHEX
	        INT 21H
	        
	        JMP HEXMULINPUT2 
	        
	        ;------------
        	;IF VALID HEXA INPUT
			
        	VALIDHEXMUL:            
            
            MOV AH, 02H
            MOV DL, 0DH
            INT 21H
            MOV DL, 0AH
            INT 21H
            
            MOV AH, 09H
	        LEA DX, HEXMULRESULT
	        INT 21H
	        
	        MOV SI,0      
	                
	        ;CONVERT MULHEX1 TO DEC
	       
	            MOV AX,0
	            MOV AL,MULHEX1_ARRAY[SI]
	            
	            MOV BL,16
	            MUL BL
	            
	            MOV MULHEXVAR1,AX
	            
	            INC SI  
	            
	            MOV AX,0
	            MOV AL,MULHEX1_ARRAY[SI]
	            
	            MOV BL,1
	            MUL BL
	            
	            ADD MULHEXVAR1,AX 
	        
	        
	            
	        MOV SI,0
	            
	        ;CONVERT MULHEX2 TO DEC
	       
	            MOV AX,0
	            MOV AL,MULHEX2_ARRAY[SI]
	            
	            MOV BL,16
	            MUL BL
	            
	            MOV MULHEXVAR2,AX
	            
	            INC SI  
	            
	            MOV AX,0
	            MOV AL,MULHEX2_ARRAY[SI]
	            
	            MOV BL,1
	            MUL BL
	            
	            ADD MULHEXVAR2,AX
	            
	        
	        ;MULTIPLY HEX1 & HEX2
	            
	            MOV AX,0
	            MOV AX,MULHEXVAR1
	            MOV BX,MULHEXVAR2
	            MUL BX
	            MOV MULHEXTOTAL,AX
	            
	        
	        ;MULHEXTOTAL TO HEXADECIMAL  
	           
	            MOV SI,0
			
	        PRINTMULHEX:
	            
	            MOV AX,0
	            MOV AX,MULHEXTOTAL
	            MOV DX,0
	            MOV BX,0
	            MOV BX,16				
	            DIV BX
	            
	            MOV QM,AX
	            ADD DL,30H
	            MOV RM_ARRAY[SI],DL
	            
	            INC SI
	            
	            MOV BX,QM
	            MOV MULHEXTOTAL,BX
	            
	            CMP BX,0
	            
	            JNE PRINTMULHEX
	            
	       ;PRINT HEX MULTIPLICATION RESULT     
	       
	       MOV CH,0
	       MOV CL,4
	       MOV SI,3          
	       ENDOFMULHEX:
	            
	            MOV BH,0
	            MOV BL,RM_ARRAY[SI]  
	               
	            CMP BL, 3AH
	            JE PRINTMULA
	            CMP BL, 3BH 
	            JE PRINTMULB
	            CMP BL, 3CH
	            JE PRINTMULC
	            CMP BL, 3DH
	            JE PRINTMULD
	            CMP BL, 3EH
	            JE PRINTMULE
	            CMP BL, 3FH
	            JE PRINTMULF
	            
	            MOV AX,0
	            MOV AH,02H
	            MOV DL,BL    
	            INT 21H
	            JMP ENDOFPRINTMULHEX
	            
	            PRINTMULA:
	            MOV AH, 02H
	            MOV DL, 'A'
	            INT 21H
	            JMP ENDOFPRINTMULHEX 
	            PRINTMULB:
	            MOV AH, 02H
	            MOV DL, 'B'
	            INT 21H       
	            JMP ENDOFPRINTMULHEX
	            PRINTMULC:
	            MOV AH, 02H
	            MOV DL, 'C'
	            INT 21H          
	            JMP ENDOFPRINTMULHEX
	            PRINTMULD:
	            MOV AH, 02H
	            MOV DL, 'D'
	            INT 21H          
	            JMP ENDOFPRINTMULHEX
	            PRINTMULE:
	            MOV AH, 02H
	            MOV DL, 'E'
	            INT 21H          
	            JMP ENDOFPRINTMULHEX
	            PRINTMULF:
	            MOV AH, 02H
	            MOV DL, 'F'
	            INT 21H          
	            JMP ENDOFPRINTMULHEX
	           	
	           	ENDOFPRINTMULHEX:
	           	
	           	DEC SI
	           	
	       LOOP ENDOFMULHEX
	            

	       MOV AH, 02H
	       MOV DL, 'H'
	       INT 21H

		;ASK IF ANYMORE CALCULATION
	       
	    ASKANYMORE5:   
	    MOV AH,09H
    	LEA DX,ANYMORECALC
    	INT 21H 
    	
    	MOV AH,01H
    	INT 21H
    	MOV ANYMORE,AL
    	CMP ANYMORE,"1"				;IF '1'(YES) INPUT AGAIN
    	JNE NOTHEXMULINPUT1
    	JMP HEXMULINPUT1
    	NOTHEXMULINPUT1:
    	CMP ANYMORE,"0"				;IF '0'(NO) GO BACK TO MAIN MENU
    	JNE	NOTMAINMENU6
    	JMP MAINMENU
    	NOTMAINMENU6:
    
	    MOV AH,09H
    	LEA DX,INVALIDANYMORE		;IF INVALID CHOICE, INPUT AGAIN
    	INT 21H
    	
    	JMP ASKANYMORE5                         
                         
                         
                         
     ;///-----------HEX DIVISION FUNCTION                         
            
			;INPUT 1ST HEXA OPERAND		
			
            HEXDIVINPUT1:
            	        
            MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        	        
	        MOV AH,09H
	        LEA DX,ASKHEX1				;PROMPT USER TO INPUT 16 BIT HEXA
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,DIVHEX1
	        INT 21H
	        
	        CMP ACT_DIVHEX1,4			;COMPARE IF HEXA INPUT IS 16 BIT
	        JNE INVALID16BITDIVHEX1
	        JE CHECKDIVHEX1
	        
	        INVALID16BITDIVHEX1:		;IF NOT 16 BIT HEXA, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASK16BITHEX
	        INT 21H
	        
	        JMP HEXDIVINPUT1
	        
			;CHECK WHETHER HEXADECIMAL INPUT IS 1-9 & A-F ONLY
			
	        CHECKDIVHEX1:
	        
	        MOV CH,0
	        MOV CL,ACT_DIVHEX1
	        MOV SI,0
	        CHECKDIVHEX1NUM1:
	            SUB DIVHEX1_ARRAY[SI],30H
	            MOV BL,DIVHEX1_ARRAY[SI]

	            CMP BL,0H
	            JGE CHECKDIVHEX1NUM2
	            JL INVALIDDIVHEX1

            CHECKDIVHEX1NUM2:
        	    CMP BL,9H
        	    JLE NEXTDIVHEX1
        	    
        	CHECKDIVHEX1ALP1:
        	    CMP BL,11H
        	    JGE CHECKDIVHEX1ALP2
        	    JL INVALIDDIVHEX1 
        	    
        	CHECKDIVHEX1ALP2:
        	    CMP BL,16H
        	    JG INVALIDDIVHEX1  
        	    SUB DIVHEX1_ARRAY[SI],7H
        	
        	NEXTDIVHEX1:          	    
        	    INC SI
        	
        	LOOP CHECKDIVHEX1NUM1
        	
        	JMP HEXDIVINPUT2    
        	    	        
	       INVALIDDIVHEX1:			;IF NOT 1-9 & A-F ONLY, INPUT AGAIN
							
	        MOV AH,09H
	        LEA DX,ASKVALIDHEX
	        INT 21H
	        
	        JMP HEXDIVINPUT1
        	    
        	
        	;---------------
        	;INPUT 2ND HEXA OPERAND
        	
        	HEXDIVINPUT2:
        	
        	MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKHEX2				;PROMPT USER TO INPUT 16 BIT HEXA
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,DIVHEX2
	        INT 21H
	        
	        CMP ACT_DIVHEX2,4			;COMPARE IF HEXA INPUT IS 16 BIT
	        JNE INVALID16BITDIVHEX2
	        JE CHECKDIVHEX2
	        
	        INVALID16BITDIVHEX2:		;IF NOT 16 BIT HEXA, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASK16BITHEX
	        INT 21H
	        
	        JMP HEXDIVINPUT2
	        
			;CHECK WHETHER HEXADECIMAL INPUT IS 1-9 & A-F ONLY
			
	        CHECKDIVHEX2:
	        
	        MOV CH,0
	        MOV CL,ACT_DIVHEX2
	        MOV SI,0
	        CHECKDIVHEX2NUM1:
	            SUB DIVHEX2_ARRAY[SI],30H
	            MOV BL,DIVHEX2_ARRAY[SI]

	            CMP BL,0H
	            JGE CHECKDIVHEX2NUM2
	            JL INVALIDDIVHEX2

            CHECKDIVHEX2NUM2:
        	    CMP BL,9H
        	    JLE NEXTDIVHEX2
        	    
        	CHECKDIVHEX2ALP1:
        	    CMP BL,11H
        	    JGE CHECKDIVHEX2ALP2
        	    JL INVALIDDIVHEX2 
        	    
        	CHECKDIVHEX2ALP2:
        	    CMP BL,16H
        	    JG INVALIDDIVHEX2  
        	    SUB DIVHEX2_ARRAY[SI],7H
        	
        	NEXTDIVHEX2:          	    
        	    INC SI
        	
        	LOOP CHECKDIVHEX2NUM1
        	
        	JMP VALIDHEXDIV    
        	    	        
	       INVALIDDIVHEX2:			;IF NOT 1-9 & A-F ONLY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASKVALIDHEX
	        INT 21H
	        
	        JMP HEXDIVINPUT2
	        
	        
	         
	        
	        ;------------ 
	        ;IF VALID HEXADECIMAL INPUT
	        
        	
        	VALIDHEXDIV:
        	
        	           
           
	        
	        MOV SI,0      
	                
	        ;CONVERT DIVHEX1 TO DEC
	            MOV AX,0
	            MOV AL,DIVHEX1_ARRAY[SI]
	            
	            MOV BX,4096
	            MUL BX
	            
	            MOV DIVHEXVAR1,AX
	            
	            INC SI	            
	          	            
	            MOV AX,0
	            MOV AL,DIVHEX1_ARRAY[SI]
	            
	            MOV BX,256
	            MUL BX
	            
	            ADD DIVHEXVAR1,AX
	            
	            INC SI
	       
	            MOV AX,0
	            MOV AL,DIVHEX1_ARRAY[SI]
	            
	            MOV BL,16
	            MUL BL
	            
	            ADD DIVHEXVAR1,AX
	            
	            INC SI  
	            
	            MOV AX,0
	            MOV AL,DIVHEX1_ARRAY[SI]
	            
	            MOV BL,1
	            MUL BL
	            
	            ADD DIVHEXVAR1,AX 
	        
	        
	            
	        MOV SI,0
	            
	        ;CONVERT DIVHEX2 TO DEC
	            MOV AX,0
	            MOV AL,DIVHEX2_ARRAY[SI]
	            
	            MOV BX,4096
	            MUL BX
	            
	            MOV DIVHEXVAR2,AX
	            
	            INC SI	            
	          	            
	            MOV AX,0
	            MOV AL,DIVHEX2_ARRAY[SI]
	            
	            MOV BX,256
	            MUL BX
	            
	            ADD DIVHEXVAR2,AX
	            
	            INC SI
	       
	            MOV AX,0
	            MOV AL,DIVHEX2_ARRAY[SI]
	            
	            MOV BL,16
	            MUL BL
	            
	            ADD DIVHEXVAR2,AX
	            
	            INC SI  
	            
	            MOV AX,0
	            MOV AL,DIVHEX2_ARRAY[SI]
	            
	            MOV BL,1
	            MUL BL
	            
	            ADD DIVHEXVAR2,AX
                                            
            CMP DIVHEXVAR2,0		;CHECK WHETHER USER INPUT ZERO FOR 2ND OPERAND
	        JNE HEXNOZERO
	        
	        MOV AH,09H
	        LEA DX,ASKNOZERO		;INPUT AGAIN IF USER INPUT ZERO
	        INT 21H
	        
	        JMP HEXDIVINPUT2
	        
	        HEXNOZERO:                         	        
	            
	        
	        ;DIV HEX1 &HEX2
	              

	            MOV AX,0
	            MOV BX,0
	            MOV AX,DIVHEXVAR1
	            MOV BX,DIVHEXVAR2
	            DIV BX
	            MOV DIVHEXTOTAL,AX
	            
	            
	         
	        
    	        MOV AH, 02H
                MOV DL, 0DH
                INT 21H
                MOV DL, 0AH
                INT 21H
                
                MOV AH, 09H
    	        LEA DX, HEXDIVRESULT
    	        INT 21H   
	        	            
	        	            
	        	            
	        	            
	            MOV SI,0
			
			;DIVHEXTOTAL TO HEXADECIMAL
			
	        PRINTDIVHEX:
	            
	            MOV AX,0
	            MOV AX,DIVHEXTOTAL
	            MOV DX,0
	            MOV BX,16
	            DIV BX
	            
	            MOV QD,AX
	            ADD DL,30H
	            MOV RD_ARRAY[SI],DL
	            
	            INC SI
	            
	            MOV BX,QD
	            MOV DIVHEXTOTAL,BX
	            
	            CMP BX,0
	            
	            JNE PRINTDIVHEX
	            
		   ;--PRINT DIVHEXTOTAL     
	       
		   MOV CH,0
	       MOV CL,4
	       MOV SI,3          
	       ENDOFDIVHEX:
	            
	            MOV BH,0
	            MOV BL,RD_ARRAY[SI]  
	               
	            CMP BL, 3AH
	            JE PRINTDIVA
	            CMP BL, 3BH 
	            JE PRINTDIVB
	            CMP BL, 3CH
	            JE PRINTDIVC
	            CMP BL, 3DH
	            JE PRINTDIVD
	            CMP BL, 3EH
	            JE PRINTDIVE
	            CMP BL, 3FH
	            JE PRINTDIVF
	            
	            MOV AX,0
	            MOV AH,02H
	            MOV DL,BL    
	            INT 21H
	            JMP ENDOFPRINTDIVHEX
	            
	            PRINTDIVA:
	            MOV AH, 02H
	            MOV DL, 'A'
	            INT 21H
	            JMP ENDOFPRINTDIVHEX 
	            PRINTDIVB:
	            MOV AH, 02H
	            MOV DL, 'B'
	            INT 21H       
	            JMP ENDOFPRINTDIVHEX
	            PRINTDIVC:
	            MOV AH, 02H
	            MOV DL, 'C'
	            INT 21H          
	            JMP ENDOFPRINTDIVHEX
	            PRINTDIVD:
	            MOV AH, 02H
	            MOV DL, 'D'
	            INT 21H          
	            JMP ENDOFPRINTDIVHEX
	            PRINTDIVE:
	            MOV AH, 02H
	            MOV DL, 'E'
	            INT 21H          
	            JMP ENDOFPRINTDIVHEX
	            PRINTDIVF:
	            MOV AH, 02H
	            MOV DL, 'F'
	            INT 21H          
	            JMP ENDOFPRINTDIVHEX
	           	
	           	ENDOFPRINTDIVHEX:
	           	
	           	DEC SI
	           	
	       LOOP ENDOFDIVHEX
	            

	       MOV AH, 02H
	       MOV DL, 'H'
	       INT 21H

		;ASK IF ANYMORE CALCULATION
	       
	    ASKANYMORE6:   
	    MOV AH,09H
    	LEA DX,ANYMORECALC
    	INT 21H 
    	
    	MOV AH,01H
    	INT 21H
    	MOV ANYMORE,AL
    	CMP ANYMORE,"1"			;IF '1'(YES) INPUT AGAIN
    	JNE NOTHEXDIVINPUT1A
    	JMP HEXDIVINPUT1
    	NOTHEXDIVINPUT1A:
    	CMP ANYMORE,"0"			;IF '0'(NO) GO BACK TO MAIN MENU
    	JNE NOTMAIMENU6	
    	JMP MAINMENU
    	NOTMAIMENU6:
    
	    MOV AH,09H
    	LEA DX,INVALIDANYMORE	;IF INVALID CHOICE, INPUT AGAIN
    	INT 21H
    	
    	JMP ASKANYMORE6


;/////////////
;///////////////------BINARY OPERATION
;////////////	    

		
	    
	    BINOP:       
		
		;DISPLAY BIN OPERATION MENU
        MOV AH,09H
        LEA DX,BASECALCOP
    	INT 21H 
    	
		;INPUT BIN OPERATION CHOICE
    	MOV AH,01H
    	INT 21H
    	MOV CHOICEOPBIN,AL
    	CMP CHOICEOPBIN,"1"			;BIN ADDITION
    	JE BINADDINPUT1
    	CMP CHOICEOPBIN,"2"			;BIN SUBTRACTION
    	JNE NOTBINSUBINPUT1B	
    	JMP BINSUBINPUT1
    	NOTBINSUBINPUT1B:
    	CMP CHOICEOPBIN,"3"			;BIN MULTIPLICATION
    	JNE NOTBINMULINPUT1B
    	JMP BINMULINPUT1
    	NOTBINMULINPUT1B:
    	CMP CHOICEOPBIN,"4"			;BIN DIVISION
    	JNE NOTBINDIVINPUT1B	
    	JMP BINDIVINPUT1
    	NOTBINDIVINPUT1B:
        CMP CHOICEOPBIN,"5"			;BACK TO BASE CALCULATION MENU
        JNE NOTBASECALC2	          	        
        JMP BASECALC
        NOTBASECALC2:
        
    	MOV AH,09H
    	LEA DX,INVALIDCHOICE		;IF INVALID CHOICE, INPUT AGAIN
    	INT 21H
    	
    	JMP BINOP
        
            ;-----------
        	;BINARY ADDITION
			
			
			;INPUT 1ST BIN OPERAND
            BINADDINPUT1:
            
	    	MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKBIN1			;PROMPT USER TO INPUT 16 BIT BINARY
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,BIN1
	        INT 21H
	        
	        CMP ACT_BIN1,16			;COMPARE IF BINARY INPUT IS 16 BIT
	        JNE INVALID16BITBIN1
	        JE CHECKBIN1
	        
	        INVALID16BITBIN1:		;IF NOT 16 BIT BINARY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASK16BITBIN
	        INT 21H
	        
	        JMP BINADDINPUT1
	        
			
			;CHECK WHETHER BINARY INPUT IS 1 OR 0 ONLY
			
	        CHECKBIN1:
	        
	        MOV CH,0
	        MOV CL,ACT_BIN1
	        MOV SI,0
	        CHECKBIN1NUM1:
	            SUB BIN1_ARRAY[SI],30H
	            MOV BL,BIN1_ARRAY[SI]

	            CMP BL,0H
	            JGE CHECKBIN1NUM2
	            JL INVALIDBIN1

            CHECKBIN1NUM2:
        	    CMP BL,1H
        	    JLE NEXTBIN1
        	    JMP INVALIDBIN1
        	
        	NEXTBIN1:          	    
        	    INC SI
        	
        	LOOP CHECKBIN1NUM1
        	
        	JMP BINADDINPUT2    
        	    	        
	       INVALIDBIN1:				;IF NOT 1 & 0 ONLY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASKVALIDBIN
	        INT 21H
	        
	        JMP BINADDINPUT1
        	    
        	
        	;---------------
        	;INPUT 2ND BIN OPERAND
        	
        	BINADDINPUT2:
        	
        	MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKBIN2			;PROMPT USER TO INPUT 16 BIT BINARY
	        INT 21H	
	        
	        MOV AH,0AH
	        LEA DX,BIN2
	        INT 21H
	        
	        CMP ACT_BIN2,16			;COMPARE IF BINARY INPUT IS 16 BIT
	        JNE INVALID16BITBIN2
	        JE CHECKBIN2
	        
	        INVALID16BITBIN2:		;IF NOT 16 BIT BINARY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASK16BITBIN
	        INT 21H
	        
	        JMP BINADDINPUT2
	        
			;CHECK WHETHER BINARY INPUT IS 1 OR 0 ONLY
			
	        CHECKBIN2:
	        
	        MOV CH,0
	        MOV CL,ACT_BIN2
	        MOV SI,0
	        CHECKBIN2NUM1:
	            SUB BIN2_ARRAY[SI],30H
	            MOV BL,BIN2_ARRAY[SI]

	            CMP BL,0H
	            JGE CHECKBIN2NUM2
	            JL INVALIDBIN2

            CHECKBIN2NUM2:
        	    CMP BL,1H
        	    JLE NEXTBIN2
        	    JMP INVALIDBIN2
        	    
        	NEXTBIN2:          	    
        	    INC SI
        	
        	LOOP CHECKBIN2NUM1
        	
        	JMP VALIDBINADD    
        	    	        
	       INVALIDBIN2:			;IF NOT 1 & 0 ONLY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASKVALIDBIN
	        INT 21H
	        
	        JMP BINADDINPUT2 
	        
	        ;------------
        	;IF VALID BINARY INPUT
			
        	VALIDBINADD:            
            
            MOV AH, 02H
            MOV DL, 0DH
            INT 21H
            MOV DL, 0AH
            INT 21H
            
            MOV AH, 09H
	        LEA DX, BINADDRESULT
	        INT 21H
	        
	        
	        ;---CONVERT BIN1 TO DEC
	        
	        MOV ADDBINVAR1,0
	        MOV BX,1
	        MOV VARBIN,BX
	        MOV CX,16
	        MOV SI,15      
	                
	        BIN1TODEC:
	            MOV AX,0
	            MOV AL,BIN1_ARRAY[SI]
	            
	            CMP AL,1
	            JNE NOSTOREBIN1
	             
	            MUL VARBIN
	            ADD ADDBINVAR1,AX
	            
	            NOSTOREBIN1:
	            
	            DEC SI
	            MOV AX,0
	            MOV AX,VARBIN
	            MUL TWO
	            MOV VARBIN,AX
	            
	        LOOP BIN1TODEC
	        
	        
	            
	        ;---CONVERT BIN2 TO DEC
	        MOV ADDBINVAR2,0
	        MOV BX,1
	        MOV VARBIN,BX
	        MOV CX,16
	        MOV SI,15      
	                
	        BIN2TODEC:
	            MOV AX,0
	            MOV AL,BIN2_ARRAY[SI]
	            
	            CMP AL,1
	            JNE NOSTOREBIN2
	             
	            MUL VARBIN
	            ADD ADDBINVAR2,AX
	            
	            NOSTOREBIN2:
	            
	            DEC SI
	            MOV AX,0
	            MOV AX,VARBIN
	            MUL TWO
	            MOV VARBIN,AX
	            
	        LOOP BIN2TODEC
	            
	        
	        ;ADD BIN1 & BIN2
	            
	            MOV AX,0
	            MOV AX,ADDBINVAR1
	            ADD AX,ADDBINVAR2
	            MOV ADDBINTOTAL,AX
	            
	        ;CONVERT ADDBINTOTAL TO BINARY
	        
	            JNC NOBINADDOVERFLOW		;CHECK IF GOT CARRY
	       
	        BINADDOVERFLOW:
	            
	            MOV AH,02H
	            MOV DL,'1'					;IF GOT CARRY, PRINT '1'
	            INT 21H
	            
	            MOV AH,02H
	            MOV DL,' '
	            INT 21H  
	            
	        NOBINADDOVERFLOW:   			;IF NO CARRY
	           
	            MOV SI,0

	        PRINTADDBIN:
	            
	            MOV AX,0
	            MOV AX,ADDBINTOTAL
	            MOV DX,0
	            MOV BX,2
	            DIV BX
	            
	            MOV BINQ,AX
	            ADD DL,30H
	            MOV BINR_ARRAY[SI],DL
	            
	            INC SI
	            
	            MOV BX,BINQ
	            MOV ADDBINTOTAL,BX
	            
	            CMP BX,0
	            
	            JNE PRINTADDBIN
	            
	       ;PRINT BINARY ADDITION RESULT   
	       
	       MOV CH,0
	       MOV CL,16
	       MOV SI,15          
	       ENDOFADDBIN:
                MOV AX,CX
                MOV BL,4
                DIV BL
                
                CMP AH,0
                JNE NOPRINTSPACE
	           	
	           	
	            MOV AH,02H
	            MOV DL,' '
	            INT 21H
	            	  
	            NOPRINTSPACE:
	                     
	            MOV BH,0
	            MOV BL,BINR_ARRAY[SI]  
	               
	            
	            MOV AX,0
	            MOV AH,02H
	            MOV DL,BL    
	            INT 21H
                
                DEC SI
                

	            
	             
	           	
	       LOOP ENDOFADDBIN
	            
	    ;ASK IF ANYMORE CALCULATION
		
	    ASKANYMORE7:   
	    MOV AH,09H
    	LEA DX,ANYMORECALC
    	INT 21H 
    	
    	MOV AH,01H
    	INT 21H
    	MOV ANYMORE,AL
    	CMP ANYMORE,"1"			;IF '1'(YES) INPUT AGAIN
    	JNE NOTBINADDINPUT1
    	JMP BINADDINPUT1
    	NOTBINADDINPUT1:
    	CMP ANYMORE,"0"			;IF '0'(NO) GO BACK TO MAIN MENU
    	JNE NOTMAINMENU5	
    	JMP MAINMENU
    	NOTMAINMENU5:
    
	    MOV AH,09H
    	LEA DX,INVALIDANYMORE	;IF INVALID CHOICE, INPUT AGAIN
    	INT 21H
    	
    	JMP ASKANYMORE7	            
	        
	       
	     ;//////-----BIN SUBTRACTION FUNCTION       
           
			;INPUT 1ST BIN OPERAND		   
			BINSUBINPUT1:
            
			MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKBIN1			;PROMPT USER TO INPUT 16 BIT BINARY
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,SUBBIN1
	        INT 21H
	        
	        CMP ACT_SUBBIN1,16		;COMPARE IF BINARY INPUT IS 16 BIT
	        JNE INVALID16BITSUBBIN1
	        JE CHECKSUBBIN1
	        
	        INVALID16BITSUBBIN1:	;IF NOT 16 BIT BINARY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASK16BITBIN
	        INT 21H
	        
	        JMP BINSUBINPUT1
	        
			
			;CHECK WHETHER BINARY INPUT IS 1 OR 0 ONLY
			
	        CHECKSUBBIN1:
	        
	        MOV CH,0
	        MOV CL,ACT_SUBBIN1
	        MOV SI,0
	        CHECKSUBBIN1NUM1:
	            SUB SUBBIN1_ARRAY[SI],30H
	            MOV BL,SUBBIN1_ARRAY[SI]

	            CMP BL,0H
	            JGE CHECKSUBBIN1NUM2
	            JL INVALIDSUBBIN1

            CHECKSUBBIN1NUM2:
        	    CMP BL,1H
        	    JLE NEXTSUBBIN1
        	    JMP INVALIDSUBBIN1
        	
        	NEXTSUBBIN1:          	    
        	    INC SI
        	
        	LOOP CHECKSUBBIN1NUM1
        	
        	JMP BINSUBINPUT2    
        	    	        
	       INVALIDSUBBIN1:			;IF NOT 1 & 0 ONLY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASKVALIDBIN
	        INT 21H
	        
	        JMP BINSUBINPUT1
        	    
        	
        	;---------------
        	;INPUT 2ND BIN OPERAND
        	
        	BINSUBINPUT2:
        	
        	MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKBIN2				;PROMPT USER TO INPUT 16 BIT BINARY
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,SUBBIN2
	        INT 21H
	        
	        CMP ACT_SUBBIN2,16			;COMPARE IF BINARY INPUT IS 16 BIT
	        JNE INVALID16BITSUBBIN2
	        JE CHECKSUBBIN2
	        
	        INVALID16BITSUBBIN2:		;IF NOT 16 BIT BINARY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASK16BITBIN
	        INT 21H
	        
	        JMP BINSUBINPUT2
	        
			
			;CHECK WHETHER BINARY INPUT IS 1 OR 0 ONLY
			
	        CHECKSUBBIN2:
	        
	        MOV CH,0
	        MOV CL,ACT_SUBBIN2
	        MOV SI,0
	        CHECKSUBBIN2NUM1:
	            SUB SUBBIN2_ARRAY[SI],30H
	            MOV BL,SUBBIN2_ARRAY[SI]

	            CMP BL,0H
	            JGE CHECKSUBBIN2NUM2
	            JL INVALIDSUBBIN2

            CHECKSUBBIN2NUM2:
        	    CMP BL,1H
        	    JLE NEXTSUBBIN2
       	        JMP INVALIDSUBBIN2
        	
        	NEXTSUBBIN2:          	    
        	    INC SI
        	
        	LOOP CHECKSUBBIN2NUM1
        	
        	JMP VALIDBINSUB    
        	    	        
	       INVALIDSUBBIN2:			;IF NOT 1 & 0 ONLY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASKVALIDBIN
	        INT 21H
	        
	        JMP BINSUBINPUT2 
	        
	        ;------------
        	;IF VALID BINARY INPUT
			
        	VALIDBINSUB:            
            
            MOV AH, 02H
            MOV DL, 0DH
            INT 21H
            MOV DL, 0AH
            INT 21H
            
            MOV AH, 09H
	        LEA DX, BINSUBRESULT
	        INT 21H
	        
	        MOV SI,0      
	                
	        ;---CONVERT SUBBIN1 TO DEC
	        
	        MOV SUBBINVAR1,0
	        MOV BX,1
	        MOV VARBIN,BX
	        MOV CX,16
	        MOV SI,15      
	                
	        SUBBIN1TODEC:
	            MOV AX,0
	            MOV AL,SUBBIN1_ARRAY[SI]
	            
	            CMP AL,1
	            JNE NOSTORESUBBIN1
	             
	            MUL VARBIN
	            ADD SUBBINVAR1,AX
	            
	            NOSTORESUBBIN1:
	            
	            DEC SI
	            MOV AX,0
	            MOV AX,VARBIN
	            MUL TWO
	            MOV VARBIN,AX
	            
	        LOOP SUBBIN1TODEC
	        
	        
	            
	        ;---CONVERT SUBBIN2 TO DEC
	        MOV SUBBINVAR2,0
	        MOV BX,1
	        MOV VARBIN,BX
	        MOV CX,16
	        MOV SI,15      
	                
	        SUBBIN2TODEC:
	            MOV AX,0
	            MOV AL,SUBBIN2_ARRAY[SI]
	            
	            CMP AL,1
	            JNE NOSTORESUBBIN2
	             
	            MUL VARBIN
	            ADD SUBBINVAR2,AX
	            
	            NOSTORESUBBIN2:
	            
	            DEC SI
	            MOV AX,0
	            MOV AX,VARBIN
	            MUL TWO
	            MOV VARBIN,AX
	            
	        LOOP SUBBIN2TODEC
	            
	        
	            MOV BP,0   
	            MOV AX,SUBBINVAR1 
	            MOV BX,10H
	            SUBBINPROB4:
	            MOV DX,0
	            DIV BX
	            INC BP
	            CMP AX,0
	            JNE SUBBINPROB4
	             
	            
	            MOV DI,0 
	            MOV AX,SUBBINVAR2
	            MOV BX,10H
	            SUBBINPROB5:
	            MOV DX,0
	            DIV BX  
	            INC DI
	            CMP AX,0
	            JNE SUBBINPROB5
	             
	            
	        ;SUBTRACT BIN1 & BIN2
	            
	            CMP BP,DI
	            JG SUBBINPROB3
	            JL NEGATIVESUBBIN
	            JE SUBBINPROB2
	        	
	        	SUBBINPROB2: 
				CMP BP,4
				JE SUBBINSOL1
	            MOV AX,0
	            MOV AX,SUBBINVAR1
	            CMP AX,SUBBINVAR2
	            JL NEGATIVESUBBIN
	            
	            SUBBINPROB3:
	            MOV AX,0
	            MOV AX,SUBBINVAR1
	            SUB AX,SUBBINVAR2
	            MOV SUBBINTOTAL,AX
	            
	            JMP NORMALSUBBIN
	         
				SUBBINSOL1:
				MOV AX, SUBBINVAR1
				MOV BX, 1000H
				MOV DX, 0
				DIV BX
				MOV VAR2, AX
				MOV AX, SUBBINVAR2
				MOV DX, 0
				DIV BX
				CMP AX, VAR2
				JL SUBBINPROB3
				JLE SUBBINSOL2
				JG NEGATIVESUBBIN
				
				SUBBINSOL2:
				MOV AX, SUBBINVAR1
				MOV BX, 1000H
				MOV DX, 0
				DIV BX
				MOV VAR2, DX
				MOV AX, SUBBINVAR2
				MOV DX, 0
				DIV BX
				CMP DX, VAR2
				JLE SUBBINPROB3
	            
	       
	        NEGATIVESUBBIN:
	            
	            
	            MOV AX,0
	            MOV AX,SUBBINVAR2 
	            SUB AX,SUBBINVAR1
	            MOV SUBBINTOTAL,AX
	            
	            MOV AH,02H
	            MOV DL,'-'				;IF NEGATIVE PRINT '-'
	            INT 21H  
	            
	        NORMALSUBBIN:  
	           
	            MOV SI,0
			
			;CONVERT SUBBINTOTAL TO BINARY
			
	        PRINTSUBBIN:
	            
	            MOV AX,0
	            MOV AX,SUBBINTOTAL
	            MOV DX,0
	            MOV BX,2
	            DIV BX
	            
	            MOV BINQS,AX
	            ADD DL,30H
	            MOV BINRS_ARRAY[SI],DL
	            
	            INC SI
	            
	            MOV BX,BINQS
	            MOV SUBBINTOTAL,BX
	            
	            CMP BX,0
	            
	            JNE PRINTSUBBIN
	            
	       ;PRINT BIN SUBTRACTION RESULT    
	       
	       MOV CH,0
	       MOV CL,16
	       MOV SI,15          
	       ENDOFSUBBIN:
                MOV AX,CX                                  
                MOV BL,4
                DIV BL
                
                CMP AH,0
                JNE NOPRINTSPACE2
	           	
	           	
	            MOV AH,02H
	            MOV DL,' '
	            INT 21H
	            	  
	            NOPRINTSPACE2:
	                     
	            MOV BH,0
	            MOV BL,BINRS_ARRAY[SI]  
	            MOV BINRS_ARRAY[SI],0   
	            
	            MOV AX,0
	            MOV AH,02H
	            MOV DL,BL    
	            INT 21H
                
                DEC SI
                

	            
	             
	           	
	       LOOP ENDOFSUBBIN
	            
		;ASK IF ANYMORE CALCULATION

	    ASKANYMORE8:   
	    MOV AH,09H
    	LEA DX,ANYMORECALC
    	INT 21H 
    	
    	MOV AH,01H
    	INT 21H
    	MOV ANYMORE,AL
    	CMP ANYMORE,"1"			;IF '1'(YES) INPUT AGAIN
    	JNE NOTBINSUBINPUT1A
    	JMP BINSUBINPUT1
    	NOTBINSUBINPUT1A:
    	CMP ANYMORE,"0"			;IF '0'(NO) GO BACK TO MAIN MENU
    	JNE NOTMAINMENU4	
    	JMP MAINMENU
    	NOTMAINMENU4:
    
	    MOV AH,09H
    	LEA DX,INVALIDANYMORE	;IF INVALID CHOICE, INPUT AGAIN
    	INT 21H
    	
    	JMP ASKANYMORE8
    	
    	
    	
    	
     ;///-----------BIN MULTIPLICATION FUNCTION	  
     
	       ;INPUT 1ST BIN OPERAND
            
           BINMULINPUT1:
                         
	    	MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKMULBIN1		;PROMPT USER TO INPUT 8 BIT BINARY
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,MULBIN1
	        INT 21H
	        
	        CMP ACT_MULBIN1,8		;COMPARE IF BINARY INPUT IS 8 BIT
	        JNE INVALID8BITMULBIN1
	        JE CHECKMULBIN1
	        
	        INVALID8BITMULBIN1:		;IF NOT 8 BIT BINARY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASK8BITBIN
	        INT 21H
	        
	        JMP BINMULINPUT1
	        
			;CHECK WHETHER BINARY INPUT IS 1 OR 0 ONLY
			
	        CHECKMULBIN1:
	        
	        MOV CH,0
	        MOV CL,ACT_MULBIN1
	        MOV SI,0
	        CHECKMULBIN1NUM1:
	            SUB MULBIN1_ARRAY[SI],30H
	            MOV BL,MULBIN1_ARRAY[SI]

	            CMP BL,0H
	            JGE CHECKMULBIN1NUM2
	            JL INVALIDMULBIN1

            CHECKMULBIN1NUM2:
        	    CMP BL,1H
        	    JLE NEXTMULBIN1
        	    JMP INVALIDMULBIN1 
        	
        	NEXTMULBIN1:          	    
        	    INC SI
        	
        	LOOP CHECKMULBIN1NUM1
        	
        	JMP BINMULINPUT2    
        	    	        
	       INVALIDMULBIN1:			;IF NOT 1 & 0 ONLY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASKVALIDBIN
	        INT 21H
	        
	        JMP BINMULINPUT1
        	    
        	
        	;---------------
        	;INPUT 2ND BIN OPERAND
        	
        	BINMULINPUT2:
        	
        	MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKMULBIN2			;PROMPT USER TO INPUT 8 BIT BINARY
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,MULBIN2
	        INT 21H
	        
	        CMP ACT_MULBIN2,8			;COMPARE IF BINARY INPUT IS 8 BIT
	        JNE INVALID8BITMULBIN2
	        JE CHECKMULBIN2
	        
	        INVALID8BITMULBIN2:			;IF NOT 8 BIT BINARY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASK8BITBIN
	        INT 21H
	        
	        JMP BINMULINPUT2
	        
			;CHECK WHETHER BINARY INPUT IS 1 OR 0 ONLY
			
	        CHECKMULBIN2:
	        
	        MOV CH,0
	        MOV CL,ACT_MULBIN2
	        MOV SI,0
	        CHECKMULBIN2NUM1:
	            SUB MULBIN2_ARRAY[SI],30H
	            MOV BL,MULBIN2_ARRAY[SI]

	            CMP BL,0H
	            JGE CHECKMULBIN2NUM2
	            JL INVALIDMULBIN2

            CHECKMULBIN2NUM2:
        	    CMP BL,1H
        	    JLE NEXTMULBIN2
        	    JMP INVALIDMULBIN2 


        	NEXTMULBIN2:          	    
        	    INC SI
        	
        	LOOP CHECKMULBIN2NUM1
        	
        	JMP VALIDBINMUL    
        	    	        
	       INVALIDMULBIN2:			;IF NOT 1 & 0 ONLY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASKVALIDBIN
	        INT 21H
	        
	        JMP BINMULINPUT2 
	        
	        ;------------
        	;IF VALID BINARY INPUT
			
        	VALIDBINMUL:            
            
            MOV AH, 02H
            MOV DL, 0DH
            INT 21H
            MOV DL, 0AH
            INT 21H
            
            MOV AH, 09H
	        LEA DX, BINMULRESULT
	        INT 21H
	        
	        MOV SI,0      
	                
	        ;---CONVERT MULBIN1 TO DEC
	        
	        MOV MULBINVAR1,0
	        MOV BX,1
	        MOV VARBIN,BX
	        MOV CX,8
	        MOV SI,7      
	                
	        MULBIN1TODEC:
	            MOV AX,0
	            MOV AL,MULBIN1_ARRAY[SI]
	            
	            CMP AL,1
	            JNE NOSTOREMULBIN1
	             
	            MUL VARBIN
	            ADD MULBINVAR1,AX
	            
	            NOSTOREMULBIN1:
	            
	            DEC SI
	            MOV AX,0
	            MOV AX,VARBIN
	            MUL TWO
	            MOV VARBIN,AX
	            
	        LOOP MULBIN1TODEC
	        
	        
	            
	        ;---CONVERT MULBIN2 TO DEC
	        MOV MULBINVAR2,0
	        MOV BX,1
	        MOV VARBIN,BX
	        MOV CX,8
	        MOV SI,7      
	                
	        MULBIN2TODEC:
	            MOV AX,0
	            MOV AL,MULBIN2_ARRAY[SI]
	            
	            CMP AL,1
	            JNE NOSTOREMULBIN2
	             
	            MUL VARBIN
	            ADD MULBINVAR2,AX
	            
	            NOSTOREMULBIN2:
	            
	            DEC SI
	            MOV AX,0
	            MOV AX,VARBIN
	            MUL TWO
	            MOV VARBIN,AX
	            
	        LOOP MULBIN2TODEC
	            
	        
	        ;MULTIPLY BIN1 & BIN2
	            
	            MOV AX,0
	            MOV AX,MULBINVAR1
	            MOV BX,MULBINVAR2
	            MUL BX
	            MOV MULBINTOTAL,AX
	            
	        
	         ;CONVERT MULBINTOTAL TO BINARY 
	           
	            MOV SI,0

	        PRINTMULBIN:
	            
	            MOV AX,0
	            MOV AX,MULBINTOTAL
	            MOV DX,0
	            MOV BX,0
	            MOV BX,2
	            DIV BX
	            
	            MOV BINQM,AX
	            ADD DL,30H
	            MOV BINRM_ARRAY[SI],DL
	            
	            INC SI
	            
	            MOV BX,BINQM
	            MOV MULBINTOTAL,BX
	            
	            CMP BX,0
	            
	            JNE PRINTMULBIN
	            
	       ;PRINT MULBINTOTAL     
	       
	       MOV CH,0
	       MOV CL,16
	       MOV SI,15          
	       ENDOFMULBIN:
                MOV AX,CX                                  
                MOV BL,4
                DIV BL
                
                CMP AH,0
                JNE NOPRINTSPACE3
	           	
	           	
	            MOV AH,02H
	            MOV DL,' '
	            INT 21H
	            	  
	            NOPRINTSPACE3:
	                     
	            MOV BH,0
	            MOV BL,BINRM_ARRAY[SI]  
	               
	            
	            MOV AX,0
	            MOV AH,02H
	            MOV DL,BL    
	            INT 21H
                
                DEC SI
   
	           	
	       LOOP ENDOFMULBIN
	       
	    ;ASK IF ANYMORE CALCULATION
		
	    ASKANYMORE9:   
	    MOV AH,09H
    	LEA DX,ANYMORECALC
    	INT 21H 
    	
    	MOV AH,01H
    	INT 21H
    	MOV ANYMORE,AL
    	CMP ANYMORE,"1"				;IF '1'(YES) INPUT AGAIN
    	JNE NOTBINMULINPUT1A
    	JMP BINMULINPUT1
    	NOTBINMULINPUT1A:
    	CMP ANYMORE,"0"				;IF '0'(NO) GO BACK TO MAIN MENU
    	JNE NOTMAINMENU3	
    	JMP MAINMENU
    	NOTMAINMENU3:
    
	    MOV AH,09H
    	LEA DX,INVALIDANYMORE		;IF INVALID CHOICE, INPUT AGAIN
    	INT 21H
    	
    	JMP ASKANYMORE9                         
                         
                         
                         
     ;///-----------BIN DIVISION FUNCTION      

	 
			;INPUT 1ST BIN OPERAND
			
			BINDIVINPUT1:
            	        
            MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        	        
	        MOV AH,09H
	        LEA DX,ASKBIN1				;PROMPT USER TO INPUT 16 BIT BINARY
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,DIVBIN1
	        INT 21H
	        
	        CMP ACT_DIVBIN1,16
	        JNE INVALID16BITDIVBIN1		;COMPARE IF BINARY INPUT IS 16 BIT
	        JE CHECKDIVBIN1
	        
	        INVALID16BITDIVBIN1:		;IF NOT 16 BIT BINARY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASK16BITBIN
	        INT 21H
	        
	        JMP BINDIVINPUT1
	        
			;CHECK WHETHER BINARY INPUT IS 1 OR 0 ONLY
			
	        CHECKDIVBIN1:
	        
	        MOV CH,0
	        MOV CL,ACT_DIVBIN1
	        MOV SI,0
	        CHECKDIVBIN1NUM1:
	            SUB DIVBIN1_ARRAY[SI],30H
	            MOV BL,DIVBIN1_ARRAY[SI]

	            CMP BL,0H
	            JGE CHECKDIVBIN1NUM2
	            JL INVALIDDIVBIN1

            CHECKDIVBIN1NUM2:
        	    CMP BL,1H
        	    JLE NEXTDIVBIN1
        	    JMP INVALIDDIVBIN1 
        	    
        	
        	NEXTDIVBIN1:          	    
        	    INC SI
        	
        	LOOP CHECKDIVBIN1NUM1
        	
        	JMP BINDIVINPUT2    
        	    	        
	       INVALIDDIVBIN1:			;IF NOT 1 & 0 ONLY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASKVALIDBIN
	        INT 21H
	        
	        JMP BINDIVINPUT1
        	    
        	
        	;---------------
        	;INPUT 2ND BIN OPERAND
        	
        	BINDIVINPUT2:
        	
        	MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKBIN2			;PROMPT USER TO INPUT 16 BIT BINARY
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,DIVBIN2
	        INT 21H
	        
	        CMP ACT_DIVBIN2,16		;COMPARE IF BINARY INPUT IS 16 BIT
	        JNE INVALID16BITDIVBIN2
	        JE CHECKDIVBIN2
	        
	        INVALID16BITDIVBIN2:	;IF NOT 16 BIT BINARY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASK16BITBIN
	        INT 21H
	        
	        JMP BINDIVINPUT2
	        
			;CHECK WHETHER BINARY INPUT IS 1 OR 0 ONLY
			
	        CHECKDIVBIN2:
	        
	        MOV CH,0
	        MOV CL,ACT_DIVBIN2
	        MOV SI,0
	        CHECKDIVBIN2NUM1:
	            SUB DIVBIN2_ARRAY[SI],30H
	            MOV BL,DIVBIN2_ARRAY[SI]

	            CMP BL,0H
	            JGE CHECKDIVBIN2NUM2
	            JL INVALIDDIVBIN2

            CHECKDIVBIN2NUM2:
        	    CMP BL,1H
        	    JLE NEXTDIVBIN2
        	    JMP INVALIDDIVBIN2 
        	    
        	
        	NEXTDIVBIN2:          	    
        	    INC SI
        	
        	LOOP CHECKDIVBIN2NUM1
        	
        	JMP VALIDBINDIV    
        	    	        
	       INVALIDDIVBIN2:			;IF NOT 1 & 0 ONLY, INPUT AGAIN
	           	        
	        MOV AH,09H
	        LEA DX,ASKVALIDBIN
	        INT 21H
	        
	        JMP BINDIVINPUT2
	        
	        
	         
	        
	        ;------------ 
	        ;IF VALID BINARY INPUT
	        
        	
        	VALIDBINDIV:
        	
        	           
           
	        
	        MOV SI,0      
	                
	        ;---CONVERT DIVBIN1 TO DEC
	        
	        MOV DIVBINVAR1,0
	        MOV BX,1
	        MOV VARBIN,BX
	        MOV CX,16
	        MOV SI,15      
	                
	        DIVBIN1TODEC:
	            MOV AX,0
	            MOV AL,DIVBIN1_ARRAY[SI]
	            
	            CMP AL,1
	            JNE NOSTOREDIVBIN1
	             
	            MUL VARBIN
	            ADD DIVBINVAR1,AX
	            
	            NOSTOREDIVBIN1:
	            
	            DEC SI
	            MOV AX,0
	            MOV AX,VARBIN
	            MUL TWO
	            MOV VARBIN,AX
	            
	        LOOP DIVBIN1TODEC
	        
	        
	            
	        ;---CONVERT DIVBIN2 TO DEC
	        
	        MOV DIVBINVAR2,0
	        MOV BX,1
	        MOV VARBIN,BX
	        MOV CX,16
	        MOV SI,15      
	                
	        DIVBIN2TODEC:
	            MOV AX,0
	            MOV AL,DIVBIN2_ARRAY[SI]
	            
	            CMP AL,1
	            JNE NOSTOREDIVBIN2
	             
	            MUL VARBIN
	            ADD DIVBINVAR2,AX
	            
	            NOSTOREDIVBIN2:
	            
	            DEC SI
	            MOV AX,0
	            MOV AX,VARBIN
	            MUL TWO
	            MOV VARBIN,AX
	            
	        LOOP DIVBIN2TODEC
                                            
                                     	        
	        CMP DIVBINVAR2,0		;CHECK WHETHER USER INPUT ZERO FOR 2ND OPERAND
	        JNE BINNOZERO
	        
	        MOV AH,09H		
	        LEA DX,ASKNOZERO		;INPUT AGAIN IF USER INPUT ZERO
	        INT 21H
	        
	        JMP BINDIVINPUT2
	        
	        BINNOZERO:   
	        
	        ;DIVIDE BIN1 & BIN2
	            MOV DX,0  

	            MOV AX,0
	            MOV BX,0
	            MOV AX,DIVBINVAR1
	            MOV BX,DIVBINVAR2
	            DIV BX
	            MOV DIVBINTOTAL,AX
	            
	            
	       
	        
    	        MOV AH, 02H
                MOV DL, 0DH
                INT 21H
                MOV DL, 0AH
                INT 21H
                
                MOV AH, 09H
    	        LEA DX, BINDIVRESULT
    	        INT 21H   
	        	            
	        	            
	        ;CONVERT DIVBINTOTAL TO BINARY	            
	        	            
	            MOV SI,0

	        PRINTDIVBIN:
	            
	            MOV AX,0
	            MOV AX,DIVBINTOTAL
	            MOV DX,0
	            MOV BX,2
	            DIV BX
	            
	            MOV BINQD,AX
	            ADD DL,30H
	            MOV BINRD_ARRAY[SI],DL
	            
	            INC SI
	            
	            MOV BX,BINQD
	            MOV DIVBINTOTAL,BX
	            
	            CMP BX,0
	            
	            JNE PRINTDIVBIN
	            
	       ;--PRINT DIVBINTOTAL      
	       
	       MOV CH,0
	       MOV CL,16
	       MOV SI,15          
	       ENDOFDIVBIN:
                MOV AX,CX                                  
                MOV BL,4
                DIV BL
                
                CMP AH,0
                JNE NOPRINTSPACE4
	           	
	           	
	            MOV AH,02H
	            MOV DL,' '
	            INT 21H
	            	  
	            NOPRINTSPACE4:
	                     
	            MOV BH,0
	            MOV BL,BINRD_ARRAY[SI]  
	               
	            
	            MOV AX,0
	            MOV AH,02H
	            MOV DL,BL    
	            INT 21H
                
                DEC SI
   
	           	
	       LOOP ENDOFDIVBIN
	            

		;ASK IF ANYMORE CALCULATION
	   
	    ASKANYMORE10:   
	    MOV AH,09H
    	LEA DX,ANYMORECALC
    	INT 21H 
    	
    	MOV AH,01H
    	INT 21H
    	MOV ANYMORE,AL
    	CMP ANYMORE,"1"				;IF '1'(YES) INPUT AGAIN
    	JNE NOTBINDIVINPUT1A
    	JMP BINDIVINPUT1
    	NOTBINDIVINPUT1A:
    	CMP ANYMORE,"0"				;IF '0'(NO) GO BACK TO MAIN MENU
    	JNE NOTMAINMENU2
        JMP MAINMENU
        NOTMAINMENU2:
        
	    MOV AH,09H
    	LEA DX,INVALIDANYMORE		;IF INVALID CHOICE, INPUT AGAIN
    	INT 21H
    	
    	JMP ASKANYMORE10


;//////////////////////////////////////////////
;////////////AREA VOLUME CALCULATION FUNCTION//
;//////////////////////////////////////////////

AREAVOLUME:

	;DISPLAY AREA VOLUME MENU
    MOV AH,09H
	LEA DX,AVMENU
	INT 21H
	
	;INPUT AREA OR VOLUME CHOICE
	MOV AH,01H
	INT 21H
	MOV CHOICEAV,AL
	CMP CHOICEAV,"1"		;AREA FUNCTION
	JE AREA
	CMP CHOICEAV,"2"		;VOLUME FUNCTION
	JNE NOTVOLUME	
	JMP VOLUME
	NOTVOLUME:
	CMP CHOICEAV,"3"		;BACK TO MAIN MENU
	JNE NOTMAINMENU12	
	JMP MAINMENU
	NOTMAINMENU12:
	
	MOV AH,09H
	LEA DX,INVALIDCHOICE	;IF INVALID CHOICE, INPUT AGAIN
	INT 21H
	
	JMP AREAVOLUME


;//////////////////////
;//////////AREA FUNCTION
;/////////////////////	

    AREA:
	;DISPLAY AREA MENU
	MOV AH,09H
	LEA DX,AREAMENU
	INT 21H 
	
	;INPUT AREA CHOICE
	MOV AH,01H
	INT 21H
	MOV CHOICEA,AL
	CMP CHOICEA,"1"			;RECTANGLE
	JE RECTANGLE
	CMP CHOICEA,"2"			;TRIANGLE
	JNE NOTTRIANGLE	
	JMP TRIANGLE
	NOTTRIANGLE: 
	CMP CHOICEA,"3"			;CIRCLE
	JNE NOTCIRCLE	
	JMP CIRCLE
	NOTCIRCLE:
    CMP CHOICEA,"4"			;BACK TO AREA VOLUME MENU
	JE AREAVOLUME 

	MOV AH,09H
	LEA DX,INVALIDCHOICE	;IF INVALID CHOICE, INPUT AGAIN
	INT 21H
	
	JMP AREA	
	
	    ;-----------RECTANGLE CALCULATION     
	
	    RECTANGLE:
	    
		;INPUT RECT HEIGHT
	    RECTINPUT1:
            
            MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKHEIGHT
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,RECTH
	        INT 21H
        	
        ;INPUT RECT WIDTH	
		RECTINPUT2:
        	
            MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKWIDTH
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,RECTW
	        INT 21H
	        
	
	    ;-----CONVERT RECT HEIGHT & WIDTH TO DEC

            
	        MOV RECTHVAR,0
	        MOV VARDEC,1
	        MOV CH,0
	        MOV CL,ACT_RECTH
	        MOV SI,CX  
	        DEC SI    
	                
	        RECTHTODEC:
	            SUB RECTH_ARRAY[SI],30H
	            MOV AX,0
	            MOV AL,RECTH_ARRAY[SI]
	            
	             
	            MUL VARDEC
	            ADD RECTHVAR,AX
	            
	            
	            DEC SI
	            MOV AX,0
	            MOV AX,VARDEC
	            MUL TEN
	            MOV VARDEC,AX
	            
	        LOOP RECTHTODEC
	        
	        
	        
	        
	        MOV RECTWVAR,0
	        MOV VARDEC,1
            MOV CH,0
	        MOV CL,ACT_RECTW
	        MOV SI,CX  
	        DEC SI      
	                
	        RECTWTODEC:
	            SUB RECTW_ARRAY[SI],30H
	            MOV AX,0
	            MOV AL,RECTW_ARRAY[SI]
	             
	            MUL VARDEC
	            ADD RECTWVAR,AX
	            
	            DEC SI
	            MOV AX,0
	            MOV AX,VARDEC
	            MUL TEN
	            MOV VARDEC,AX
	            
	        LOOP RECTWTODEC
            
            
            ;--CHECK RECT HEIGHT AND WIDTH (1-255)
            
            CMP RECTHVAR,1
            JL ASKVALIDRECT
            
            
            CMP RECTHVAR,255
            JG ASKVALIDRECT
 
            CMP RECTWVAR,1
            JL ASKVALIDRECT
            
            CMP RECTWVAR,255
            JG ASKVALIDRECT
            
            JMP PRINTRECTAREA
            
            ASKVALIDRECT:			;IF NOT 1-255 ONLY, INPUT AGAIN
            
            MOV AH, 09H
	        LEA DX, ASKVALID255
	        INT 21H
	        
	        JMP RECTINPUT1
	        
            
            
            PRINTRECTAREA:            
                        
            MOV AH, 02H
            MOV DL, 0DH
            INT 21H
            MOV DL, 0AH
            INT 21H
            
            MOV AH, 09H
	        LEA DX, RECTAREARESULT
	        INT 21H
	        
			;MULTIPLY RECT HEIGHT & WIDTH
			
	        MOV AX,RECTHVAR
	        MOV BX,RECTWVAR
	        MUL BX
	        
	        
	        ;---PRINT RECTAREA
	        
	            MOV CX,0 
                MOV DX,0 
                RECTLABEL1:           
                    CMP AX,0 
                    JE RECTPRINT1       
                      
                    ;INITIALIZE BP TO 10 
                    MOV BP,TEN         
                      
                    ; EXTRACT THE LAST DIGIT 
                    DIV BP                    
                      
                    ;PUSH IT IN THE STACK 
                    PUSH DX               
                      
                    ;INCREMENT THE COUNT 
                    INC CX               
                      
                    ;SET DX TO 0  
                    MOV DX,0 
                    JMP RECTLABEL1 
                RECTPRINT1: 
                    ;CHECK IF COUNT  
                    ;IS GREATER THAN ZERO 
                    CMP CX,0 
                    JE RECTEXIT
                      
                    ;POP THE TOP OF STACK 
                    POP DX 
                      
                    ;ADD 48 SO THAT IT  
                    ;REPRESENTS THE ASCII 
                    ;VALUE OF DIGITS 
                    ADD DX,30H 
                      
                    ;INTERRUPT TO PRINT A 
                    ;CHARACTER 
                    MOV AH,02H 
                    INT 21H 
                      
                    ;DECREASE THE COUNT 
                    DEC CX 
                    JMP RECTPRINT1 
            RECTEXIT:

	        MOV AH,09H
	        LEA DX,DISPLAYCM
	        INT 21H            
             
		;ASK IF ANYMORE CALCULATION
		
	    ASKANYMORE11:   
	    MOV AH,09H
    	LEA DX,ANYMORECALC
    	INT 21H 
    	
    	MOV AH,01H
    	INT 21H
    	MOV ANYMORE,AL
    	CMP ANYMORE,"1"			;IF '1'(YES) INPUT AGAIN
    	JNE NOTRECTINPUT1
    	JMP RECTINPUT1
    	NOTRECTINPUT1:
    	CMP ANYMORE,"0"			;IF '0'(NO) GO BACK TO MAIN MENU
    	JNE NOTMAINMENU1
    	JMP MAINMENU
        
        NOTMAINMENU1:
        
	    MOV AH,09H
    	LEA DX,INVALIDANYMORE	;IF INVALID CHOICE, INPUT AGAIN
    	INT 21H
    	
    	JMP ASKANYMORE11	    
	    

        ;-----TRIANGLE AREA FUNCTION	      
	
	    TRIANGLE:
	    
		
		;INPUT TRIANGLE HEIGHT
	    TRIINPUT1:
            
            MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKHEIGHT362
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,TRIH
	        INT 21H
	        
        ;INPUT TRIANGLE BASE	
        	
        TRIINPUT2:
        	
            MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKBASE
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,TRIB
	        INT 21H
	        
			
			;CONVERT TRIANGLE HEIGHT AND BASE TO DEC
            
	        MOV TRIHVAR,0
	        MOV VARDEC,1
	        MOV CH,0    
	        MOV CL,ACT_TRIH
	        MOV SI,CX  
	        DEC SI    
	                
	        TRIHTODEC:
	            SUB TRIH_ARRAY[SI],30H
	            MOV AX,0
	            MOV AL,TRIH_ARRAY[SI]
	            
	             
	            MUL VARDEC
	            ADD TRIHVAR,AX
	            
	            
	            DEC SI
	            MOV AX,0
	            MOV AX,VARDEC
	            MUL TEN
	            MOV VARDEC,AX
	            
	        LOOP TRIHTODEC
	        	        
	        
	        
	        MOV TRIBVAR,0
	        MOV VARDEC,1
            MOV CH,0
	        MOV CL,ACT_TRIB
	        MOV SI,CX  
	        DEC SI      
	                
	        TRIBTODEC:
	            SUB TRIB_ARRAY[SI],30H
	            MOV AX,0
	            MOV AL,TRIB_ARRAY[SI]
	             
	            MUL VARDEC
	            ADD TRIBVAR,AX
	            
	            DEC SI
	            MOV AX,0
	            MOV AX,VARDEC
	            MUL TEN
	            MOV VARDEC,AX
	            
	        LOOP TRIBTODEC


			
			;--CHECK TRIANGLE HEIGHT AND BASE (1-362)
			
            CMP TRIHVAR,1
            JL ASKVALIDTRI
            
            
            CMP TRIHVAR,362
            JG ASKVALIDTRI
 
            CMP TRIBVAR,1
            JL ASKVALIDTRI
            
            CMP TRIBVAR,362
            JG ASKVALIDTRI
            
            JMP PRINTTRIAREA
            
            ASKVALIDTRI:			;IF NOT 1-362 ONLY, INPUT AGAIN
            
            MOV AH, 09H
	        LEA DX, ASKVALID362
	        INT 21H
	        
	        JMP TRIINPUT1
	       
            
            
            PRINTTRIAREA:
            
            MOV AH, 02H
            MOV DL, 0DH
            INT 21H
            MOV DL, 0AH
            INT 21H
            
            MOV AH, 09H
	        LEA DX, TRIAREARESULT
	        INT 21H
	        
			;Triangle = height * base / 2
			
	        MOV AX,TRIHVAR
	        MOV BX,TRIBVAR
	        MUL BX
	        DIV TWO
	        MOV TRIQUOTIENT,AX
	        MOV TRIREMAINDER,DX
	        
	        
	        ;---PRINT TRIAREA
	        
	            MOV CX,0 
                MOV DX,0 
                TRILABEL1:           
                    CMP AX,0 
                    JE TRIPRINT1       
                      
                    ;INITIALIZE BP TO 10 
                    MOV BP,TEN         
                      
                    ; EXTRACT THE LAST DIGIT 
                    DIV BP                    
                      
                    ;PUSH IT IN THE STACK 
                    PUSH DX               
                      
                    ;INCREMENT THE COUNT 
                    INC CX               
                      
                    ;SET DX TO 0  
                    MOV DX,0 
                    JMP TRILABEL1 
                TRIPRINT1: 
                    ;CHECK IF COUNT  
                    ;IS GREATER THAN ZERO 
                    CMP CX,0 
                    JE TRIEXIT1
                      
                    ;POP THE TOP OF STACK 
                    POP DX 
                      
                    ;ADD 48 SO THAT IT  
                    ;REPRESENTS THE ASCII 
                    ;VALUE OF DIGITS 
                    ADD DX,30H 
                      
                    ;INTERRUPT TO PRINT A 
                    ;CHARACTER 
                    MOV AH,02H 
                    INT 21H 
                      
                    ;DECREASE THE COUNT 
                    DEC CX 
                    JMP TRIPRINT1
                    
                     
            TRIEXIT1:
            
            
            CMP TRIREMAINDER,0
            JE TRIEXIT2
            
            CMP TRIQUOTIENT,0
            JNE NOPRINTZERO
            
            MOV AH,02H
	        MOV DL,'0'
	        INT 21H    
            
            NOPRINTZERO:
            
            MOV AH,02H
	        MOV DL,'.'
	        INT 21H        
            
            MOV AX,0
            MOV AX,TRIREMAINDER
            MUL ONEHUNDRED
            DIV TWO
            
	        ;---PRINT TRIAREADECIMAL
	        
	            MOV CX,0 
                MOV DX,0 
                TRILABEL2:           
                    CMP AX,0 
                    JE TRIPRINT2       
                      
                    ;INITIALIZE BP TO 10 
                    MOV BP,TEN         
                      
                    ; EXTRACT THE LAST DIGIT 
                    DIV BP                    
                      
                    ;PUSH IT IN THE STACK 
                    PUSH DX               
                      
                    ;INCREMENT THE COUNT 
                    INC CX               
                      
                    ;SET DX TO 0  
                    MOV DX,0 
                    JMP TRILABEL2 
                TRIPRINT2: 
                    ;CHECK IF COUNT  
                    ;IS GREATER THAN ZERO 
                    CMP CX,0 
                    JE TRIEXIT2
                      
                    ;POP THE TOP OF STACK 
                    POP DX 
                      
                    ;ADD 48 SO THAT IT  
                    ;REPRESENTS THE ASCII 
                    ;VALUE OF DIGITS 
                    ADD DX,30H 
                      
                    ;INTERRUPT TO PRINT A 
                    ;CHARACTER 
                    MOV AH,02H 
                    INT 21H 
                      
                    ;DECREASE THE COUNT 
                    DEC CX 
                    JMP TRIPRINT2 
            TRIEXIT2:            

	        MOV AH,09H
	        LEA DX,DISPLAYCM
	        INT 21H            
             
		;ASK IF ANYMORE CALCULATION
		
	    ASKANYMORE12:   
	    MOV AH,09H
    	LEA DX,ANYMORECALC
    	INT 21H 
    	
    	MOV AH,01H
    	INT 21H
    	MOV ANYMORE,AL
    	CMP ANYMORE,"1"			;IF '1'(YES) INPUT AGAIN
    	JNE NOTTRIINPUT1
    	JMP TRIINPUT1
    	NOTTRIINPUT1:
    	CMP ANYMORE,"0"			;IF '0'(NO) GO BACK TO MAIN MENU
    	JNE NOTMAINMENU11
    	JMP MAINMENU
        
        NOTMAINMENU11:
        
	    MOV AH,09H
    	LEA DX,INVALIDANYMORE	;IF INVALID CHOICE, INPUT AGAIN
    	INT 21H
    	
    	JMP ASKANYMORE12	
    	              
    	              
    	              
    	              
    	;-------CIRCLE  FUNCTION
		
	    CIRCLE:   
	    
		;INPUT CIRCLE RADIUS
		
	    CIRCINPUT1:
            
            MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKRADIUS
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,CIRCR
	        INT 21H

            
	        MOV CIRCRVAR,0
	        MOV VARDEC,1
	        MOV CH,0    
	        MOV CL,ACT_CIRCR
	        MOV SI,CX  
	        DEC SI    
			
			;CONVERT CIRCLE RADIUS TO DEC
	                
	        CIRCRTODEC:
	            SUB CIRCR_ARRAY[SI],30H
	            MOV AX,0
	            MOV AL,CIRCR_ARRAY[SI]
	            
	             
	            MUL VARDEC
	            ADD CIRCRVAR,AX
	            
	            
	            DEC SI
	            MOV AX,0
	            MOV AX,VARDEC
	            MUL TEN
	            MOV VARDEC,AX
	            
	        LOOP CIRCRTODEC
	        
			;--CHECK CIRCLE RADIUS (1-144)
            CMP CIRCRVAR,1
            JL ASKVALIDCIRC1
            
            
            CMP CIRCRVAR,144
            JG ASKVALIDCIRC1
 
            
            JMP PRINTCIRCAREA
            
            ASKVALIDCIRC1:			;IF NOT 1-144 ONLY, INPUT AGAIN
            
            MOV AH, 09H
	        LEA DX, ASKVALID144
	        INT 21H
	        
	        JMP CIRCINPUT1
	        
	        
	        
	        
            PRINTCIRCAREA:
            
            
            MOV AH, 02H
            MOV DL, 0DH
            INT 21H
            MOV DL, 0AH
            INT 21H
            
            MOV AH, 09H
	        LEA DX, CIRCAREARESULT
	        INT 21H
	        
			;Circle = PI * radius^2
			
	        MOV AX,CIRCRVAR
	        MOV BX,CIRCRVAR
	        MUL BX
	        MUL TWENTYTWO
	        DIV SEVEN
	        MOV CIRCREMAINDER,DX
	        
	        
	        ;---PRINT CIRCAREA
	        
	            MOV CX,0 
                MOV DX,0 
                CIRCLABEL1:           
                    CMP AX,0 
                    JE CIRCPRINT1       
                      
                    ;INITIALIZE BP TO 10 
                    MOV BP,TEN         
                      
                    ; EXTRACT THE LAST DIGIT 
                    DIV BP                    
                      
                    ;PUSH IT IN THE STACK 
                    PUSH DX               
                      
                    ;INCREMENT THE COUNT 
                    INC CX               
                      
                    ;SET DX TO 0  
                    MOV DX,0 
                    JMP CIRCLABEL1 
                CIRCPRINT1: 
                    ;CHECK IF COUNT  
                    ;IS GREATER THAN ZERO 
                    CMP CX,0 
                    JE CIRCEXIT1
                      
                    ;POP THE TOP OF STACK 
                    POP DX 
                      
                    ;ADD 48 SO THAT IT  
                    ;REPRESENTS THE ASCII 
                    ;VALUE OF DIGITS 
                    ADD DX,30H 
                      
                    ;INTERRUPT TO PRINT A 
                    ;CHARACTER 
                    MOV AH,02H 
                    INT 21H 
                      
                    ;DECREASE THE COUNT 
                    DEC CX 
                    JMP CIRCPRINT1
                    
                     

            CIRCEXIT1:    

            CMP CIRCREMAINDER,0
            JE CIRCEXIT2
                        
            MOV AH,02H
	        MOV DL,'.'
	        INT 21H        
            
            MOV AX,0
            MOV AX,CIRCREMAINDER
            MUL ONEHUNDRED
            DIV SEVEN
            
	        ;---PRINT CIRCAREADECIMAL
	        
	            MOV CX,0 
                MOV DX,0 
                CIRCLABEL2:           
                    CMP AX,0 
                    JE CIRCPRINT2       
                      
                    ;INITIALIZE BP TO 10 
                    MOV BP,TEN         
                      
                    ; EXTRACT THE LAST DIGIT 
                    DIV BP                    
                      
                    ;PUSH IT IN THE STACK 
                    PUSH DX               
                      
                    ;INCREMENT THE COUNT 
                    INC CX               
                      
                    ;SET DX TO 0  
                    MOV DX,0 
                    JMP CIRCLABEL2 
                CIRCPRINT2: 
                    ;CHECK IF COUNT  
                    ;IS GREATER THAN ZERO 
                    CMP CX,0 
                    JE CIRCEXIT2
                      
                    ;POP THE TOP OF STACK 
                    POP DX 
                      
                    ;ADD 48 SO THAT IT  
                    ;REPRESENTS THE ASCII 
                    ;VALUE OF DIGITS 
                    ADD DX,30H 
                      
                    ;INTERRUPT TO PRINT A 
                    ;CHARACTER 
                    MOV AH,02H 
                    INT 21H 
                      
                    ;DECREASE THE COUNT 
                    DEC CX 
                    JMP CIRCPRINT2 
            CIRCEXIT2:            

	        MOV AH,09H
	        LEA DX,DISPLAYCM
	        INT 21H            
             
		;ASK IF ANYMORE CALCULATION
	    ASKANYMORE13:   
	    MOV AH,09H
    	LEA DX,ANYMORECALC
    	INT 21H 
    	
    	MOV AH,01H
    	INT 21H
    	MOV ANYMORE,AL
    	CMP ANYMORE,"1"			;IF '1'(YES) INPUT AGAIN
    	JNE NOTCIRCINPUT1
    	JMP CIRCINPUT1
    	NOTCIRCINPUT1:
    	CMP ANYMORE,"0"			;IF '0'(NO) GO BACK TO MAIN MENU
    	JNE NOTMAINMENU13
    	JMP MAINMENU
        
        NOTMAINMENU13:
        
	    MOV AH,09H
    	LEA DX,INVALIDANYMORE	;IF INVALID CHOICE, INPUT AGAIN
    	INT 21H
    	
    	JMP ASKANYMORE13
	    

;/////////////////////////////
;-------VOLUME CALCULATION FUNCTION
;/////////////////////////////	    

    VOLUME:
    
	;DISPLAY VOLUME MENU
    MOV AH,09H
	LEA DX,VOLUMEMENU
	INT 21H 
	
	;INPUT VOLUME CHOICE
	MOV AH,01H
	INT 21H
	MOV CHOICEV,AL
	CMP CHOICEV,"1" 			;CUBE
	JE CUBE
	CMP CHOICEV,"2"				;CUBOID
	JNE NOTCUBOID	
	JMP CUBOID
	NOTCUBOID: 
	CMP CHOICEV,"3"				;SPHERE
	JNE NOTSPHERE	
	JMP SPHERE
	NOTSPHERE:
	CMP CHOICEV,"4"				;PYRAMID
	JNE NOTPYRAMID	
	JMP PYRAMID
	NOTPYRAMID:
	CMP CHOICEV,"5"				;CYLINDER
	JNE NOTCYLINDER	
	JMP CYLINDER
	NOTCYLINDER:
	CMP CHOICEV,"6"				;CONE
	JNE NOTCONE	
	JMP CONE
	NOTCONE:
	CMP CHOICEV,"7"				;BACK TO AREA VOLUME MENU
	JNE NOTAREAVOLUME2
	JMP AREAVOLUME
	NOTAREAVOLUME2: 

	MOV AH,09H
	LEA DX,INVALIDCHOICE		;IF INVALID CHOICE, INPUT AGAIN
	INT 21H
	
	JMP VOLUME
	    
	    
	    ;------CUBE VOLUME FUNCTION
	    
	    CUBE:
	    
	    ;-----PROMPT USER TO INPUT CUBE LENGTH
	    
	    CUBEINPUT1:
            
            MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKLENGTH
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,CUBEL
	        INT 21H
        	
        	
	        
	
	    ;-----CONVERT CUBE LENGTH TO DEC

            
	        MOV CUBELVAR,0
	        MOV VARDEC,1
	        MOV CH,0
	        MOV CL,ACT_CUBEL
	        MOV SI,CX  
	        DEC SI    
	                
	        CUBELTODEC:
	            SUB CUBEL_ARRAY[SI],30H
	            MOV AX,0
	            MOV AL,CUBEL_ARRAY[SI]
	            
	             
	            MUL VARDEC
	            ADD CUBELVAR,AX
	            
	            
	            DEC SI
	            MOV AX,0
	            MOV AX,VARDEC
	            MUL TEN
	            MOV VARDEC,AX
	            
	        LOOP CUBELTODEC
	        
	        
            
            ;--CHECK CUBE LENGTH (1-40)
            
            CMP CUBELVAR,1
            JL ASKVALIDCUBE
            
            
            CMP CUBELVAR,40
            JG ASKVALIDCUBE
 
            
            JMP PRINTCUBEVOL
            
            ASKVALIDCUBE:			;IF NOT 1-40 ONLY, INPUT AGAIN
            
            MOV AH, 09H
	        LEA DX, ASKVALID40
	        INT 21H
	        
	        JMP CUBEINPUT1
	        
            
            ;---PRINT CUBE VOLUME
            
            
            PRINTCUBEVOL:            
                        
            MOV AH, 02H
            MOV DL, 0DH
            INT 21H
            MOV DL, 0AH
            INT 21H
            
            MOV AH, 09H
	        LEA DX, CUBEVOLRESULT
	        INT 21H
	        
			;Cube = length^3
			
	        MOV AX,CUBELVAR
	        MOV BX,CUBELVAR
	        MUL BX
	        MUL BX
	        
	        
	        
	            MOV CX,0 
                MOV DX,0 
                CUBELABEL1:           
                    CMP AX,0 
                    JE CUBEPRINT1       
                      
                    ;INITIALIZE BP TO 10 
                    MOV BP,TEN         
                      
                    ; EXTRACT THE LAST DIGIT 
                    DIV BP                    
                      
                    ;PUSH IT IN THE STACK 
                    PUSH DX               
                      
                    ;INCREMENT THE COUNT 
                    INC CX               
                      
                    ;SET DX TO 0  
                    MOV DX,0 
                    JMP CUBELABEL1 
                CUBEPRINT1: 
                    ;CHECK IF COUNT  
                    ;IS GREATER THAN ZERO 
                    CMP CX,0 
                    JE CUBEEXIT
                      
                    ;POP THE TOP OF STACK 
                    POP DX 
                      
                    ;ADD 48 SO THAT IT  
                    ;REPRESENTS THE ASCII 
                    ;VALUE OF DIGITS 
                    ADD DX,30H 
                      
                    ;INTERRUPT TO PRINT A 
                    ;CHARACTER 
                    MOV AH,02H 
                    INT 21H 
                      
                    ;DECREASE THE COUNT 
                    DEC CX 
                    JMP CUBEPRINT1 
            CUBEEXIT:

	        MOV AH,09H
	        LEA DX,DISPLAYCMSQUARE
	        INT 21H            
             
		;ASK IF ANYMORE CALCULATION
		
	    ASKANYMORE14:   
	    MOV AH,09H
    	LEA DX,ANYMORECALC
    	INT 21H 
    	
    	MOV AH,01H
    	INT 21H
    	MOV ANYMORE,AL
    	CMP ANYMORE,"1"				;IF '1'(YES) INPUT AGAIN
    	JNE NOTCUBEINPUT1
    	JMP CUBEINPUT1
    	NOTCUBEINPUT1:
    	CMP ANYMORE,"0"				;IF '0'(NO) GO BACK TO MAIN MENU
    	JNE NOTMAINMENU14
    	JMP MAINMENU
        
        NOTMAINMENU14:
        
	    MOV AH,09H
    	LEA DX,INVALIDANYMORE		;IF INVALID CHOICE, INPUT AGAIN
    	INT 21H
    	
    	JMP ASKANYMORE14
    	
    	
	    
	    ;------CUBOID VOLUME FUNCTION
	    
	    CUBOID:
	    
	    ;-----PROMPT USER TO INPUT CUBOID LENGTH
	    
	    CUBOINPUT1:
            
            MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKLENGTH
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,CUBOL
	        INT 21H
       
       ;-----PROMPT USER TO INPUT CUBOID HEIGHT
        	
       CUBOINPUT2:
            
            MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKHEIGHT40
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,CUBOH
	        INT 21H
	   
	   ;-----PROMPT USER TO INPUT CUBOID WIDTH
	   
	        
	   CUBOINPUT3:
            
            MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKWIDTH40
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,CUBOW
	        INT 21H      	
	        
	
	    ;-----CONVERT CUBOID LENGTH, HEIGHT & WIDTH TO DEC

            
            ;CUBOID LENGTH
            
	        MOV CUBOLVAR,0
	        MOV VARDEC,1
	        MOV CH,0
	        MOV CL,ACT_CUBOL
	        MOV SI,CX  
	        DEC SI    
	                
	        CUBOLTODEC:
	            SUB CUBOL_ARRAY[SI],30H
	            MOV AX,0
	            MOV AL,CUBOL_ARRAY[SI]
	            
	             
	            MUL VARDEC
	            ADD CUBOLVAR,AX
	            
	            
	            DEC SI
	            MOV AX,0
	            MOV AX,VARDEC
	            MUL TEN
	            MOV VARDEC,AX
	            
	        LOOP CUBOLTODEC
	        
	        
	        
	        
	        ;CUBOID HEIGHT
	        
	        MOV CUBOHVAR,0
	        MOV VARDEC,1
	        MOV CH,0
	        MOV CL,ACT_CUBOH
	        MOV SI,CX  
	        DEC SI    
	                
	        CUBOHTODEC:
	            SUB CUBOH_ARRAY[SI],30H
	            MOV AX,0
	            MOV AL,CUBOH_ARRAY[SI]
	            
	             
	            MUL VARDEC
	            ADD CUBOHVAR,AX
	            
	            
	            DEC SI
	            MOV AX,0
	            MOV AX,VARDEC
	            MUL TEN
	            MOV VARDEC,AX
	            
	        LOOP CUBOHTODEC
	        
	        
	        
	        ;CUBOID WIDTH
	        
	        MOV CUBOWVAR,0
	        MOV VARDEC,1
	        MOV CH,0
	        MOV CL,ACT_CUBOW
	        MOV SI,CX  
	        DEC SI    
	                
	        CUBOWTODEC:
	            SUB CUBOW_ARRAY[SI],30H
	            MOV AX,0
	            MOV AL,CUBOW_ARRAY[SI]
	            
	             
	            MUL VARDEC
	            ADD CUBOWVAR,AX
	            
	            
	            DEC SI
	            MOV AX,0
	            MOV AX,VARDEC
	            MUL TEN
	            MOV VARDEC,AX
	            
	        LOOP CUBOWTODEC
	        
	        
            
            ;--CHECK CUBOLVAR, CUBOHVAR, CUBOWVAR (1-40)
            
            CMP CUBOLVAR,1
            JL ASKVALIDCUBO
            
            
            CMP CUBOLVAR,40
            JG ASKVALIDCUBO
            
            CMP CUBOHVAR,1
            JL ASKVALIDCUBO
            
            
            CMP CUBOHVAR,40
            JG ASKVALIDCUBO
            
            CMP CUBOWVAR,1
            JL ASKVALIDCUBO
            
            
            CMP CUBOWVAR,40
            JG ASKVALIDCUBO
 
            
            JMP PRINTCUBOVOL
            
            ASKVALIDCUBO:
            
            MOV AH, 09H
	        LEA DX, ASKVALID40
	        INT 21H
	        
	        JMP CUBOINPUT1
	        
            
            ;---PRINT CUBO VOLUME
            
            
            PRINTCUBOVOL:            
                        
            MOV AH, 02H
            MOV DL, 0DH
            INT 21H
            MOV DL, 0AH
            INT 21H
            
            MOV AH, 09H
	        LEA DX, CUBOVOLRESULT
	        INT 21H
	        
			;Cuboid = length * height * width

	        MOV AX,CUBOLVAR
	        MOV BX,CUBOHVAR
	        MUL BX
	        MOV BX,CUBOWVAR
	        MUL BX
	        
	        
	       
	        
	            MOV CX,0 
                MOV DX,0 
                CUBOLABEL1:           
                    CMP AX,0 
                    JE CUBOPRINT1       
                      
                    ;INITIALIZE BP TO 10 
                    MOV BP,TEN         
                      
                    ; EXTRACT THE LAST DIGIT 
                    DIV BP                    
                      
                    ;PUSH IT IN THE STACK 
                    PUSH DX               
                      
                    ;INCREMENT THE COUNT 
                    INC CX               
                      
                    ;SET DX TO 0  
                    MOV DX,0 
                    JMP CUBOLABEL1 
                CUBOPRINT1: 
                    ;CHECK IF COUNT  
                    ;IS GREATER THAN ZERO 
                    CMP CX,0 
                    JE CUBOEXIT
                      
                    ;POP THE TOP OF STACK 
                    POP DX 
                      
                    ;ADD 48 SO THAT IT  
                    ;REPRESENTS THE ASCII 
                    ;VALUE OF DIGITS 
                    ADD DX,30H 
                      
                    ;INTERRUPT TO PRINT A 
                    ;CHARACTER 
                    MOV AH,02H 
                    INT 21H 
                      
                    ;DECREASE THE COUNT 
                    DEC CX 
                    JMP CUBOPRINT1 
            CUBOEXIT:

	        MOV AH,09H
	        LEA DX,DISPLAYCMSQUARE
	        INT 21H            
             
		;ASK IF ANYMORE CALCULATION
	    ASKANYMORE15:   
	    MOV AH,09H
    	LEA DX,ANYMORECALC
    	INT 21H 
    	
    	MOV AH,01H
    	INT 21H
    	MOV ANYMORE,AL
    	CMP ANYMORE,"1"			;IF '1'(YES) INPUT AGAIN
    	JNE NOTCUBOINPUT1
    	JMP CUBOINPUT1
    	NOTCUBOINPUT1:
    	CMP ANYMORE,"0"			;IF '0'(NO) GO BACK TO MAIN MENU
    	JNE NOTMAINMENU15
    	JMP MAINMENU
        
        NOTMAINMENU15:
        
	    MOV AH,09H
    	LEA DX,INVALIDANYMORE	;IF INVALID CHOICE, INPUT AGAIN
    	INT 21H
    	
    	JMP ASKANYMORE15
    	
    	
	    
	    ;------SPHERE VOLUME FUNCTION
	    
	    
	    SPHERE:
	    
		;INPUT SPHERE RADIUS
	    
	    SPHEREINPUT1:
            
            MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKRADIUS14
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,SPHERER
	        INT 21H
			
			;CONVERT SPHERE RADIUS TO DEC
            
	        MOV SPHERERVAR,0
	        MOV VARDEC,1
	        MOV CH,0    
	        MOV CL,ACT_SPHERER
	        MOV SI,CX  
	        DEC SI    
	        			
	        SPHERERTODEC:
	            SUB SPHERER_ARRAY[SI],30H
	            MOV AX,0
	            MOV AL,SPHERER_ARRAY[SI]
	            
	             
	            MUL VARDEC
	            ADD SPHERERVAR,AX
	            
	            
	            DEC SI
	            MOV AX,0
	            MOV AX,VARDEC
	            MUL TEN
	            MOV VARDEC,AX
	            
	        LOOP SPHERERTODEC
	        
			;--CHECK SPHERE RADIUS (1-14)
			
            CMP SPHERERVAR,1
            JL ASKVALIDSPHERE1
            
            
            CMP SPHERERVAR,14
            JG ASKVALIDSPHERE1
 
            
            JMP PRINTSPHEREAREA
            
            ASKVALIDSPHERE1:		;IF NOT 1-14 ONLY, INPUT AGAIN
            
            MOV AH, 09H
	        LEA DX, ASKVALID14
	        INT 21H
	        
	        JMP SPHEREINPUT1
	        
	        
	        
	        
            PRINTSPHEREAREA:
            
            
            MOV AH, 02H
            MOV DL, 0DH
            INT 21H
            MOV DL, 0AH
            INT 21H
            
            MOV AH, 09H
	        LEA DX, SPHEREVOLRESULT
	        INT 21H
	        
			;Sphere = 4/3 * PI * radius^3
		mov dx,0	
	        MOV AX,SPHERERVAR
	        MOV BX,SPHERERVAR
	        MUL BX
	        MUL BX
	        MUL TWENTYTWO
	        MUL FOUR
	        DIV TWENTYONE
	        MOV SPHEREREMAINDER,DX
	        
	        
	        ;---PRINT SPHERE VOLUME
	        
	            MOV CX,0 
                MOV DX,0 
                SPHERELABEL1:           
                    CMP AX,0 
                    JE SPHEREPRINT1       
                      
                    ;INITIALIZE BP TO 10 
                    MOV BP,TEN         
                      
                    ; EXTRACT THE LAST DIGIT 
                    DIV BP                    
                      
                    ;PUSH IT IN THE STACK 
                    PUSH DX               
                      
                    ;INCREMENT THE COUNT 
                    INC CX               
                      
                    ;SET DX TO 0  
                    MOV DX,0 
                    JMP SPHERELABEL1 
                SPHEREPRINT1: 
                    ;CHECK IF COUNT  
                    ;IS GREATER THAN ZERO 
                    CMP CX,0 
                    JE SPHEREEXIT1
                      
                    ;POP THE TOP OF STACK 
                    POP DX 
                      
                    ;ADD 48 SO THAT IT  
                    ;REPRESENTS THE ASCII 
                    ;VALUE OF DIGITS 
                    ADD DX,30H 
                      
                    ;INTERRUPT TO PRINT A 
                    ;CHARACTER 
                    MOV AH,02H 
                    INT 21H 
                      
                    ;DECREASE THE COUNT 
                    DEC CX 
                    JMP SPHEREPRINT1
                    
                     

            SPHEREEXIT1:    

            CMP SPHEREREMAINDER,0
            JE SPHEREEXIT2
                        
            MOV AH,02H
	        MOV DL,'.'
	        INT 21H        
            
            MOV AX,0
            MOV AX,SPHEREREMAINDER
            MUL ONEHUNDRED
            DIV TWENTYONE
            
	        ;---PRINT SPHERE VOLUME FLOATING POINT
	        
	            MOV CX,0 
                MOV DX,0 
                SPHERELABEL2:           
                    CMP AX,0 
                    JE SPHEREPRINT2       
                      
                    ;INITIALIZE BP TO 10 
                    MOV BP,TEN         
                      
                    ; EXTRACT THE LAST DIGIT 
                    DIV BP                    
                      
                    ;PUSH IT IN THE STACK 
                    PUSH DX               
                      
                    ;INCREMENT THE COUNT 
                    INC CX               
                      
                    ;SET DX TO 0  
                    MOV DX,0 
                    JMP SPHERELABEL2 
                SPHEREPRINT2: 
                    ;CHECK IF COUNT  
                    ;IS GREATER THAN ZERO 
                    CMP CX,0 
                    JE SPHEREEXIT2
                      
                    ;POP THE TOP OF STACK 
                    POP DX 
                      
                    ;ADD 48 SO THAT IT  
                    ;REPRESENTS THE ASCII 
                    ;VALUE OF DIGITS 
                    ADD DX,30H 
                      
                    ;INTERRUPT TO PRINT A 
                    ;CHARACTER 
                    MOV AH,02H 
                    INT 21H 
                      
                    ;DECREASE THE COUNT 
                    DEC CX 
                    JMP SPHEREPRINT2 
            SPHEREEXIT2:            

	        MOV AH,09H
	        LEA DX,DISPLAYCMSQUARE
	        INT 21H            
             
		;ASK IF ANYMORE CALCULATION
		
	    ASKANYMORE16:   
	    MOV AH,09H
    	LEA DX,ANYMORECALC
    	INT 21H 
    	
    	MOV AH,01H
    	INT 21H
    	MOV ANYMORE,AL
    	CMP ANYMORE,"1"			;IF '1'(YES) INPUT AGAIN
    	JNE NOTSPHEREINPUT1
    	JMP SPHEREINPUT1
    	NOTSPHEREINPUT1:
    	CMP ANYMORE,"0"			;IF '0'(NO) GO BACK TO MAIN MENU
    	JNE NOTMAINMENU16
    	JMP MAINMENU
        
        NOTMAINMENU16:
        
	    MOV AH,09H
    	LEA DX,INVALIDANYMORE	;IF INVALID CHOICE, INPUT AGAIN
    	INT 21H
    	
    	JMP ASKANYMORE16
	    
		
		
		;----------------------------
	    ;------PYRAMID VOLUME FUNCTION
	    
	    
	    PYRAMID:
	    
	    ;---PROMPT USER TO INPUT PYRAMID LENGTH
	    
        PYRAINPUT1:
            
            MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKLENGTH58
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,PYRAL
	        INT 21H
	    
	        
        ;---PROMPT USER TO INPUT PYRAMID HEIGHT	
        	
        PYRAINPUT2:
        	
            MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKHEIGHT58
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,PYRAH
	        INT 21H
	    
	    
	    ;---PROMPT USER TO INPUT PYRAMID WIDTH
	        
	    PYRAINPUT3:
        	
            MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKWIDTH58
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,PYRAW
	        INT 21H    
	        
       ;---CONVERT PYRAMID LENGTH, HEIGHT & WIDTH TO DECIMAL
            
            
            ;---PYRAMID LENGTH
            
	        MOV PYRALVAR,0
	        MOV VARDEC,1
	        MOV CH,0    
	        MOV CL,ACT_PYRAL
	        MOV SI,CX  
	        DEC SI    
	                
	        PYRALTODEC:
	            SUB PYRAL_ARRAY[SI],30H
	            MOV AX,0
	            MOV AL,PYRAL_ARRAY[SI]
	            
	             
	            MUL VARDEC
	            ADD PYRALVAR,AX
	            
	            
	            DEC SI
	            MOV AX,0
	            MOV AX,VARDEC
	            MUL TEN
	            MOV VARDEC,AX
	            
	        LOOP PYRALTODEC
	        	        
	       ;---PYRAMID HEIGHT 
	        
	        MOV PYRAHVAR,0
	        MOV VARDEC,1
            MOV CH,0
	        MOV CL,ACT_PYRAH
	        MOV SI,CX  
	        DEC SI      
	                
	        PYRAHTODEC:
	            SUB PYRAH_ARRAY[SI],30H
	            MOV AX,0
	            MOV AL,PYRAH_ARRAY[SI]
	             
	            MUL VARDEC
	            ADD PYRAHVAR,AX
	            
	            DEC SI
	            MOV AX,0
	            MOV AX,VARDEC
	            MUL TEN
	            MOV VARDEC,AX
	            
	        LOOP PYRAHTODEC
	       
	       
	        ;---PYRAMID WIDTH
	        
	        MOV PYRAWVAR,0
	        MOV VARDEC,1
            MOV CH,0
	        MOV CL,ACT_PYRAW
	        MOV SI,CX  
	        DEC SI      
	                
	        PYRAWTODEC:
	            SUB PYRAW_ARRAY[SI],30H
	            MOV AX,0
	            MOV AL,PYRAW_ARRAY[SI]
	             
	            MUL VARDEC
	            ADD PYRAWVAR,AX
	            
	            DEC SI
	            MOV AX,0
	            MOV AX,VARDEC
	            MUL TEN
	            MOV VARDEC,AX
	            
	        LOOP PYRAWTODEC
            
            
            ;---CHECK PYRAMID LENGTH, HEIGHT & WIDTH RANGE (1-58)
            
            CMP PYRALVAR,1
            JL ASKVALIDPYRA
            
            
            CMP PYRALVAR,58
            JG ASKVALIDPYRA

            CMP PYRAHVAR,1
            JL ASKVALIDPYRA
            
            
            CMP PYRAHVAR,58
            JG ASKVALIDPYRA
 
            CMP PYRAWVAR,1
            JL ASKVALIDPYRA
            
            CMP PYRAWVAR,58
            JG ASKVALIDPYRA
            
            JMP PRINTPYRAVOL
            
            ASKVALIDPYRA:			;IF NOT 1-58 ONLY, INPUT AGAIN
            
            MOV AH, 09H
	        LEA DX, ASKVALID58
	        INT 21H
	        
	        JMP PYRAINPUT1
	       
            
            
            PRINTPYRAVOL:
            
            MOV AH, 02H
            MOV DL, 0DH
            INT 21H
            MOV DL, 0AH
            INT 21H
            
            MOV AH, 09H
	        LEA DX, PYRAVOLRESULT
	        INT 21H
	        
			;Pyramid = (length * height * width) /3
	        MOV AX,PYRALVAR
	        MOV BX,PYRAHVAR
	        MUL BX
	        MOV BX,PYRAWVAR
	        MUL BX
	        DIV THREE
	        MOV PYRAQUOTIENT,AX
	        MOV PYRAREMAINDER,DX
	        
	        
	        ;---PRINT PYRAMID VOLUME INTEGER
	        
	            MOV CX,0 
                MOV DX,0 
                PYRALABEL1:           
                    CMP AX,0 
                    JE PYRAPRINT1       
                      
                    ;INITIALIZE BP TO 10 
                    MOV BP,TEN         
                      
                    ; EXTRACT THE LAST DIGIT 
                    DIV BP                    
                      
                    ;PUSH IT IN THE STACK 
                    PUSH DX               
                      
                    ;INCREMENT THE COUNT 
                    INC CX               
                      
                    ;SET DX TO 0  
                    MOV DX,0 
                    JMP PYRALABEL1 
                PYRAPRINT1: 
                    ;CHECK IF COUNT  
                    ;IS GREATER THAN ZERO 
                    CMP CX,0 
                    JE PYRAEXIT1
                      
                    ;POP THE TOP OF STACK 
                    POP DX 
                      
                    ;ADD 48 SO THAT IT  
                    ;REPRESENTS THE ASCII 
                    ;VALUE OF DIGITS 
                    ADD DX,30H 
                      
                    ;INTERRUPT TO PRINT A 
                    ;CHARACTER 
                    MOV AH,02H 
                    INT 21H 
                      
                    ;DECREASE THE COUNT 
                    DEC CX 
                    JMP PYRAPRINT1
                    
                     
            PYRAEXIT1:
            
            
            CMP PYRAREMAINDER,0
            JE PYRAEXIT2
            
            CMP PYRAQUOTIENT,0
            JNE NOPRINTZERO2
            
            MOV AH,02H
	        MOV DL,'0'
	        INT 21H    
            
            NOPRINTZERO2:
            
            MOV AH,02H
	        MOV DL,'.'
	        INT 21H        
            
            MOV AX,0
            MOV AX,PYRAREMAINDER
            MUL ONEHUNDRED
            DIV THREE
            
	        ;---PRINT PYRAMID VOLUME FLOATING POINT
	        
	            MOV CX,0 
                MOV DX,0 
                PYRALABEL2:           
                    CMP AX,0 
                    JE PYRAPRINT2       
                      
                    ;INITIALIZE BP TO 10 
                    MOV BP,TEN         
                      
                    ; EXTRACT THE LAST DIGIT 
                    DIV BP                    
                      
                    ;PUSH IT IN THE STACK 
                    PUSH DX               
                      
                    ;INCREMENT THE COUNT 
                    INC CX               
                      
                    ;SET DX TO 0  
                    MOV DX,0 
                    JMP PYRALABEL2 
                PYRAPRINT2: 
                    ;CHECK IF COUNT  
                    ;IS GREATER THAN ZERO 
                    CMP CX,0 
                    JE PYRAEXIT2
                      
                    ;POP THE TOP OF STACK 
                    POP DX 
                      
                    ;ADD 48 SO THAT IT  
                    ;REPRESENTS THE ASCII 
                    ;VALUE OF DIGITS 
                    ADD DX,30H 
                      
                    ;INTERRUPT TO PRINT A 
                    ;CHARACTER 
                    MOV AH,02H 
                    INT 21H 
                      
                    ;DECREASE THE COUNT 
                    DEC CX 
                    JMP PYRAPRINT2 
            PYRAEXIT2:            

	        MOV AH,09H
	        LEA DX,DISPLAYCMSQUARE
	        INT 21H            
             
		;ASK IF ANYMORE CALCULATION
		
	    ASKANYMORE17:   
	    MOV AH,09H
    	LEA DX,ANYMORECALC
    	INT 21H 
    	
    	MOV AH,01H
    	INT 21H
    	MOV ANYMORE,AL
    	CMP ANYMORE,"1"			;IF '1'(YES) INPUT AGAIN
    	JNE NOTPYRAINPUT1
    	JMP PYRAINPUT1
    	NOTPYRAINPUT1:
    	CMP ANYMORE,"0"			;IF '0'(NO) GO BACK TO MAIN MENU
    	JNE NOTMAINMENU17
    	JMP MAINMENU
        
        NOTMAINMENU17:
        
	    MOV AH,09H
    	LEA DX,INVALIDANYMORE	;IF INVALID CHOICE, INPUT AGAIN
    	INT 21H
    	
    	JMP ASKANYMORE17
	    
	    
	    
	    ;------CYLINDER VOLUME FUNCTION
	    
	    
	    CYLINDER: 
	    
	    ;---PROMPT USER TO INPUT CYLINDER RADIUS
	    
        CYLIINPUT1:
            
            MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKRADIUS27
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,CYLIR
	        INT 21H
	    
	        
        ;---PROMPT USER TO INPUT CYLINDER HEIGHT	
        	
        CYLIINPUT2:
        	
            MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKHEIGHT27
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,CYLIH
	        INT 21H
	    
	    
	     
	        
       ;---CONVERT CYLINDER RADIUS & HEIGHT TO DECIMAL
            
            
            ;---CYLINDER RADIUS
            
	        MOV CYLIRVAR,0
	        MOV VARDEC,1
	        MOV CH,0    
	        MOV CL,ACT_CYLIR
	        MOV SI,CX  
	        DEC SI    
	                
	        CYLIRTODEC:
	            SUB CYLIR_ARRAY[SI],30H
	            MOV AX,0
	            MOV AL,CYLIR_ARRAY[SI]
	            
	             
	            MUL VARDEC
	            ADD CYLIRVAR,AX
	            
	            
	            DEC SI
	            MOV AX,0
	            MOV AX,VARDEC
	            MUL TEN
	            MOV VARDEC,AX
	            
	        LOOP CYLIRTODEC
	        	        
	       ;---CYLINDER HEIGHT 
	        
	        MOV CYLIHVAR,0
	        MOV VARDEC,1
            MOV CH,0
	        MOV CL,ACT_CYLIH
	        MOV SI,CX  
	        DEC SI      
	                
	        CYLIHTODEC:
	            SUB CYLIH_ARRAY[SI],30H
	            MOV AX,0
	            MOV AL,CYLIH_ARRAY[SI]
	             
	            MUL VARDEC
	            ADD CYLIHVAR,AX
	            
	            DEC SI
	            MOV AX,0
	            MOV AX,VARDEC
	            MUL TEN
	            MOV VARDEC,AX
	            
	        LOOP CYLIHTODEC
	       
            
            
            ;---CHECK CYLINDER RADIUS & HEIGHT RANGE (1-27)
            
            CMP CYLIRVAR,1
            JL ASKVALIDCYLI
            
            
            CMP CYLIRVAR,27
            JG ASKVALIDCYLI

            CMP CYLIHVAR,1
            JL ASKVALIDCYLI
            
            
            CMP CYLIHVAR,27
            JG ASKVALIDCYLI
 
            
            JMP PRINTCYLIVOL
            
            ASKVALIDCYLI:			;IF NOT 1-27 ONLY, INPUT AGAIN
            
            MOV AH, 09H
	        LEA DX, ASKVALID27
	        INT 21H
	        
	        JMP CYLIINPUT1
	       
            
            
            PRINTCYLIVOL:
            
            MOV AH, 02H
            MOV DL, 0DH
            INT 21H
            MOV DL, 0AH
            INT 21H
            
            MOV AH, 09H
	        LEA DX, CYLIVOLRESULT
	        INT 21H
	        
			;Cylinder = PI * radius^2 * height

	        MOV AX,CYLIRVAR
	        MOV BX,CYLIRVAR
	        MUL BX
	        MOV BX,CYLIHVAR
	        MUL BX
	        MUL TWENTYTWO
	        DIV SEVEN
	        MOV CYLIREMAINDER,DX
	        
	        
	        ;---PRINT CYLINDER VOLUME INTEGER
	        
	            MOV CX,0 
                MOV DX,0 
                CYLILABEL1:           
                    CMP AX,0 
                    JE CYLIPRINT1       
                      
                    ;INITIALIZE BP TO 10 
                    MOV BP,TEN         
                      
                    ; EXTRACT THE LAST DIGIT 
                    DIV BP                    
                      
                    ;PUSH IT IN THE STACK 
                    PUSH DX               
                      
                    ;INCREMENT THE COUNT 
                    INC CX               
                      
                    ;SET DX TO 0  
                    MOV DX,0 
                    JMP CYLILABEL1 
                CYLIPRINT1: 
                    ;CHECK IF COUNT  
                    ;IS GREATER THAN ZERO 
                    CMP CX,0 
                    JE CYLIEXIT1
                      
                    ;POP THE TOP OF STACK 
                    POP DX 
                      
                    ;ADD 48 SO THAT IT  
                    ;REPRESENTS THE ASCII 
                    ;VALUE OF DIGITS 
                    ADD DX,30H 
                      
                    ;INTERRUPT TO PRINT A 
                    ;CHARACTER 
                    MOV AH,02H 
                    INT 21H 
                      
                    ;DECREASE THE COUNT 
                    DEC CX 
                    JMP CYLIPRINT1
                    
                     
            CYLIEXIT1:
            
            
            CMP CYLIREMAINDER,0
            JE CYLIEXIT2
            
            
            MOV AH,02H
	        MOV DL,'.'
	        INT 21H        
            
            MOV AX,0
            MOV AX,CYLIREMAINDER
            MUL ONEHUNDRED
            DIV SEVEN
            
	        ;---PRINT CYLINDER VOLUME FLOATING POINT
	        
	            MOV CX,0 
                MOV DX,0 
                CYLILABEL2:           
                    CMP AX,0 
                    JE CYLIPRINT2       
                      
                    ;INITIALIZE BP TO 10 
                    MOV BP,TEN         
                      
                    ; EXTRACT THE LAST DIGIT 
                    DIV BP                    
                      
                    ;PUSH IT IN THE STACK 
                    PUSH DX               
                      
                    ;INCREMENT THE COUNT 
                    INC CX               
                      
                    ;SET DX TO 0  
                    MOV DX,0 
                    JMP CYLILABEL2 
                CYLIPRINT2: 
                    ;CHECK IF COUNT  
                    ;IS GREATER THAN ZERO 
                    CMP CX,0 
                    JE CYLIEXIT2
                      
                    ;POP THE TOP OF STACK 
                    POP DX 
                      
                    ;ADD 48 SO THAT IT  
                    ;REPRESENTS THE ASCII 
                    ;VALUE OF DIGITS 
                    ADD DX,30H 
                      
                    ;INTERRUPT TO PRINT A 
                    ;CHARACTER 
                    MOV AH,02H 
                    INT 21H 
                      
                    ;DECREASE THE COUNT 
                    DEC CX 
                    JMP CYLIPRINT2 
            CYLIEXIT2:            

	        MOV AH,09H
	        LEA DX,DISPLAYCMSQUARE
	        INT 21H            
             
		;ASK IF ANYMORE CALCULATION
	    ASKANYMORE18:   
	    MOV AH,09H
    	LEA DX,ANYMORECALC
    	INT 21H 
    	
    	MOV AH,01H
    	INT 21H
    	MOV ANYMORE,AL
    	CMP ANYMORE,"1"			;IF '1'(YES) INPUT AGAIN
    	JNE NOTCYLIINPUT1
    	JMP CYLIINPUT1
    	NOTCYLIINPUT1:
    	CMP ANYMORE,"0"			;IF '0'(NO) GO BACK TO MAIN MENU
    	JNE NOTMAINMENU18
    	JMP MAINMENU
        
        NOTMAINMENU18:
        
	    MOV AH,09H
    	LEA DX,INVALIDANYMORE	;IF INVALID CHOICE, INPUT AGAIN
    	INT 21H
    	
    	JMP ASKANYMORE18
	    
	    
	    
	    ;------CONE VOLUME FUNCTION
	    
	    
	    CONE:   
	    
	    ;---PROMPT USER TO INPUT CONE RADIUS
	    
        CONEINPUT1:
            
            MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKRADIUS39
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,CONER
	        INT 21H
	    
	        
        ;---PROMPT USER TO INPUT CONE HEIGHT	
        	
        CONEINPUT2:
        	
            MOV AH, 02H
	        MOV DL, 0DH
	        INT 21H
	        MOV DL, 0AH
	        INT 21H
	        
	        MOV AH,09H
	        LEA DX,ASKHEIGHT39
	        INT 21H
	        
	        MOV AH,0AH
	        LEA DX,CONEH
	        INT 21H
	    
	    
	     
	        
       ;---CONVERT CONE RADIUS & HEIGHT TO DECIMAL
            
            
            ;---CONE RADIUS
            
	        MOV CONERVAR,0
	        MOV VARDEC,1
	        MOV CH,0    
	        MOV CL,ACT_CONER
	        MOV SI,CX  
	        DEC SI    
	                
	        CONERTODEC:
	            SUB CONER_ARRAY[SI],30H
	            MOV AX,0
	            MOV AL,CONER_ARRAY[SI]
	            
	             
	            MUL VARDEC
	            ADD CONERVAR,AX
	            
	            
	            DEC SI
	            MOV AX,0
	            MOV AX,VARDEC
	            MUL TEN
	            MOV VARDEC,AX
	            
	        LOOP CONERTODEC
	        	        
	       ;---CONE HEIGHT 
	        
	        MOV CONEHVAR,0
	        MOV VARDEC,1
            MOV CH,0
	        MOV CL,ACT_CONEH
	        MOV SI,CX  
	        DEC SI      
	                
	        CONEHTODEC:
	            SUB CONEH_ARRAY[SI],30H
	            MOV AX,0
	            MOV AL,CONEH_ARRAY[SI]
	             
	            MUL VARDEC
	            ADD CONEHVAR,AX
	            
	            DEC SI
	            MOV AX,0
	            MOV AX,VARDEC
	            MUL TEN
	            MOV VARDEC,AX
	            
	        LOOP CONEHTODEC
	       
            
            
            ;---CHECK CONE RADIUS & HEIGHT RANGE (1-39)
            
            CMP CONERVAR,1
            JL ASKVALIDCONE
            
            
            CMP CONERVAR,39
            JG ASKVALIDCONE

            CMP CONEHVAR,1
            JL ASKVALIDCONE
            
            
            CMP CONEHVAR,39
            JG ASKVALIDCONE
 
            
            JMP PRINTCONEVOL
            
            ASKVALIDCONE:			;IF NOT 1-39 ONLY, INPUT AGAIN
            
            MOV AH, 09H
	        LEA DX, ASKVALID39
	        INT 21H
	        
	        JMP CONEINPUT1
	       
            
            
            PRINTCONEVOL:
            
            MOV AH, 02H
            MOV DL, 0DH
            INT 21H
            MOV DL, 0AH
            INT 21H
            
            MOV AH, 09H
	        LEA DX, CONEVOLRESULT
	        INT 21H
	        
			;Cone = (PI * radius^2 * height) /3

	        MOV AX,CONERVAR
	        MOV BX,CONERVAR
	        MUL BX
	        MOV BX,CONEHVAR
	        MUL BX
	        MUL TWENTYTWO
	        DIV TWENTYONE
	        MOV CONEREMAINDER,DX
	        
	        
	        ;---PRINT CONE VOLUME INTEGER
	        
	            MOV CX,0 
                MOV DX,0 
                CONELABEL1:           
                    CMP AX,0 
                    JE CONEPRINT1       
                      
                    ;INITIALIZE BP TO 10 
                    MOV BP,TEN         
                      
                    ; EXTRACT THE LAST DIGIT 
                    DIV BP                    
                      
                    ;PUSH IT IN THE STACK 
                    PUSH DX               
                      
                    ;INCREMENT THE COUNT 
                    INC CX               
                      
                    ;SET DX TO 0  
                    MOV DX,0 
                    JMP CONELABEL1 
                CONEPRINT1: 
                    ;CHECK IF COUNT  
                    ;IS GREATER THAN ZERO 
                    CMP CX,0 
                    JE CONEEXIT1
                      
                    ;POP THE TOP OF STACK 
                    POP DX 
                      
                    ;ADD 48 SO THAT IT  
                    ;REPRESENTS THE ASCII 
                    ;VALUE OF DIGITS 
                    ADD DX,30H 
                      
                    ;INTERRUPT TO PRINT A 
                    ;CHARACTER 
                    MOV AH,02H 
                    INT 21H 
                      
                    ;DECREASE THE COUNT 
                    DEC CX 
                    JMP CONEPRINT1
                    
                     
            CONEEXIT1:
            
            
            CMP CONEREMAINDER,0
            JE CONEEXIT2
            
            
            MOV AH,02H
	        MOV DL,'.'
	        INT 21H        
            
            MOV AX,0
            MOV AX,CONEREMAINDER
            MUL ONEHUNDRED
            DIV TWENTYONE
            
	        ;---PRINT CONE VOLUME FLOATING POINT
	        
	            MOV CX,0 
                MOV DX,0 
                CONELABEL2:           
                    CMP AX,0 
                    JE CONEPRINT2       
                      
                    ;INITIALIZE BP TO 10 
                    MOV BP,TEN         
                      
                    ; EXTRACT THE LAST DIGIT 
                    DIV BP                    
                      
                    ;PUSH IT IN THE STACK 
                    PUSH DX               
                      
                    ;INCREMENT THE COUNT 
                    INC CX               
                      
                    ;SET DX TO 0  
                    MOV DX,0 
                    JMP CONELABEL2 
                CONEPRINT2: 
                    ;CHECK IF COUNT  
                    ;IS GREATER THAN ZERO 
                    CMP CX,0 
                    JE CONEEXIT2
                      
                    ;POP THE TOP OF STACK 
                    POP DX 
                      
                    ;ADD 48 SO THAT IT  
                    ;REPRESENTS THE ASCII 
                    ;VALUE OF DIGITS 
                    ADD DX,30H 
                      
                    ;INTERRUPT TO PRINT A 
                    ;CHARACTER 
                    MOV AH,02H 
                    INT 21H 
                      
                    ;DECREASE THE COUNT 
                    DEC CX 
                    JMP CONEPRINT2 
            CONEEXIT2:            

	        MOV AH,09H
	        LEA DX,DISPLAYCMSQUARE
	        INT 21H            
             
		
		;ASK IF ANYMORE CALCULATION
	    ASKANYMORE19:   
	    MOV AH,09H
    	LEA DX,ANYMORECALC
    	INT 21H 
    	
    	MOV AH,01H
    	INT 21H
    	MOV ANYMORE,AL
    	CMP ANYMORE,"1"			;IF '1'(YES) INPUT AGAIN
    	JNE NOTCONEINPUT1
    	JMP CONEINPUT1
    	NOTCONEINPUT1:
    	CMP ANYMORE,"0"			;IF '0'(NO) GO BACK TO MAIN MENU
    	JNE NOTMAINMENU19
    	JMP MAINMENU
        
        NOTMAINMENU19:
        
	    MOV AH,09H
    	LEA DX,INVALIDANYMORE	;IF INVALID CHOICE, INPUT AGAIN
    	INT 21H
    	
    	JMP ASKANYMORE19
	    

;FRAC:
;STATS:


QUIT:

	MOV AH, 4CH
	INT 21H

MAIN ENDP


;Main start program for Fraction Calculation
FraCCal PROC FAR
    
    STARTFRACCAL:
    CALL FAR PTR clearSc
    MOV AH,09h
    LEA DX,NEW_LINE
    INT 21H
    MOV AH,09h
    LEA DX,NEW_LINE
    INT 21H

    MOV NEGATIVEBOOL,0
    MOV VALIDBOOL,0
    MOV MATHBOOL,0
    
    MOV AH,09h
    LEA DX,FRACMSG
    INT 21H

    MOV AH,09h
    LEA DX,NEW_LINE
    INT 21H

    MOV AH,0AH
    LEA DX,Formula
    INT 21H

    ;convert string formula AND CHECK VALIDILITY
    CALL FAR PTR CTI

    CMP VALIDBOOL,0
    JE SHOWERROR
    ;CONVERT TO POSTFIX
    CALL FAR PTR CTP
    ;CALCULATE POSTFIX
    CALL FAR PTR CALPOSTF
    ;CHECK SIGN AND DO CONVERT
    CALL FAR PTR CONVERTSIGNFUN
    ;SIMPLYFY FRACTION
    CALL FAR PTR SIMPLYFRAC
    ;SHOW ALL THE RESULT
    CALL FAR PTR SHOWFRACRESULT

    CMP MATHBOOL,1
    JNE COMATHOPE
    MOV AH,09h
    LEA DX,NEW_LINE
    INT 21H
    MOV AH,09h
    LEA DX,MATH_ERROR
    INT 21H
    
    ;CORRCT MATH OPERATION
    COMATHOPE:
    JMP SHOWFRACENDMSG

    SHOWERROR:
    MOV AH,09h
    LEA DX,NEW_LINE
    INT 21h
    MOV AH,09h
    LEA DX,INPUT_ERROR
    INT 21H

    SHOWFRACENDMSG:
    MOV AH,09h
    LEA DX,NEW_LINE
    INT 21H
    MOV AH,09h
    LEA DX,ENDFRACMSG
    INT 21H


    MOV AH,01H
    INT 21h
    CMP AL,'Y'
    JE TURNSTART
    CMP AL,'y'
    JE TURNSTART
    JMP ENDCALPOSTF

    TURNSTART:
    JMP STARTFRACCAL

    ENDFRACCAL:
    RET

FraCCal ENDP

;Calculate the whole number from input string
CALWHOLE PROC FAR

	cmp DigitLen,4
	jna notoverlimit
	mov MATHBOOL,1

	notoverlimit:
    MOV TEMPTOTAL,0
    MOV DI,0
    ;FROM LARGE TO SMALL
    CMP DigitLen,1
    JE ONES
    CMP DigitLen,2
    JE TENS
    CMP DigitLen,3
    JE HUNDREDS

    THOUSANDS:
    MOV AX,0
    MOV AL,Digit[DI]
    SUB AL,30H
    MUL thousands_dw
    ADD TEMPTOTAL,AX
    INC DI

    HUNDREDS:
    MOV AX,0
    MOV AL,Digit[DI]
    SUB AL,30H
    MUL hundreds_dw
    ADD TEMPTOTAL,AX
    INC DI

    TENS:
    MOV AX,0
    MOV AL,Digit[DI]
    SUB AL,30H
    MUL tens_dw
    ADD TEMPTOTAL,AX
    INC DI

    ONES:
    MOV AX,0
    MOV AL,Digit[DI]
    SUB AL,30H
    ADD TEMPTOTAL,AX

    ;put into covertedF
    MOV AX,CFLEN
    MOV DX,2
    MUL DX
    MOV DI,AX

    mov dx,TEMPTOTAL
    mov covertedF[DI],dx
    inc CFLEN

    MOV TEMPCX,CX
    MOV CX,5
    MOV DI,0
    CLEARDIGIT:
         MOV Digit[DI],'0'
         INC DI
    LOOP CLEARDIGIT
    MOV CX,TEMPCX

    mov di,0


    RET
CALWHOLE ENDP

;Calculate the result
CALPOSTF PROC FAR

    MOV CX,PFLEN
    MOV SI,0

    INSTACK:
        MOV BX,BOOLEANPF[SI]
        CMP BL,0
        JNE ISOPERATOR3
      
        ;IF NUMBER PUT INTO STACK
        MOV BX,POSTF[SI]
        PUSH BX

        JMP ENDLOOP

        ISOPERATOR3:
       
	   	JMP POPOPERATION
		CHECKDENO:
		
		;CHECK DENOMINATOR STATUS
		CMP TempDenoA,0
		JE ISZERO
		CMP TempDenoB,0
		JE ISZERO
		JMP NOTZERO
		ISZERO:
		JMP POPALLRESULT

		NOTZERO:
        MOV BX,POSTF[SI]
        CMP BL,'+'
        JE ADDITION
        CMP BL,'-'
        JE SUBTRATION
        CMP BL,'*'
        JE MULTIPLICATION
        CMP BL,'/'
        JE DIVISION

        ADDITION:
        CALL FAR PTR FRACADD
        JMP CALRESULT
        SUBTRATION:
        CALL FAR PTR FRACSUB
        JMP CALRESULT
        MULTIPLICATION:
        CALL FAR PTR FRACMUL
        JMP CALRESULT
        DIVISION:
        CALL FAR PTR FRACDIV

        CALRESULT:
        PUSH TempNumeA
        push TempDenoA
         
        ENDLOOP:
        ADD SI,2
    LOOP INSTACK
	JMP COMPLETCALPF

	POPOPERATION:
	 	;POP OUT VALUES
        POP TempDenoB
        POP TempNumeB
        POP TempDenoA
        pop TempNumeA
	JMP CHECKDENO

	;POP ALL RESULT IF MEET ZERO DENO 
	;EVERY PUSH AND POP IS IMPORTANT FOR RETURN 
	POPALLRESULT:
	MOV MATHBOOL,1
	MOV TempNumeA,0
	MOV TempNumeB,0
	MOV CX,0
	MOV CL,StackLen
	POPALL:
		POP AX
		DEC StackLen
	LOOP POPALL
	JMP ENDCALPOSTF

	COMPLETCALPF:
    pop TempDenoA
    pop TempNumeA

	cmp TempDenoA,0
	JNE DENONOTEZERO
	MOV TempNumeA,0
	MOV MATHBOOL,1
	JMP ENDCALPOSTF

	DENONOTEZERO:
    CMP TempNumeA,0
    JNE ENDCALPOSTF
    MOV TEMPDENOA,0

    ENDCALPOSTF:
    RET

CALPOSTF ENDP

;ADD OPERATION
FRACADD PROC FAR

    ;EXTRADENO/NUME TEMPRORARY PLACE OF TEMPDENOB
    MOV AX,TempDenoB
    MOV EXTRADENO,AX
    MOV AX,TempNumeB
    MOV EXTRANUME,AX

    MOV AX,TempDenoA
    CMP AX,TempDenoB
    JE CHECKPOINT
    JMP NOTSAMEDENO
    CHECKPOINT:
    JMP SAMEDENO

    NOTSAMEDENO:
    ;ELSE check which one bigger
    CMP AX,TempDenoB
    JB BdenoLARGER
        MOV DX,0
        MOV AX,TempDenoA
        DIV TempDenoB
        CMP DX,0
        JNE MULBETWEEN; REMAINDER NOT ZERO MEANS NEED TO MUL EACH OF THEM
        MOV MULNUM,AX; STORE THE NUMBER FOR MULTIPLY
        MOV AX,TEMPDENOB
        MUL MULNUM
        MOV TEMPDENOB,AX
        MOV AX,TempNumeB
        MUL MULNUM
        MOV TempNumeB,AX
    JMP SAMEDENO

    BdenoLARGER:
        MOV DX,0
        MOV AX,TempDenoB
        DIV TempDenoA
        CMP DX,0
        JNE MULBETWEEN; REMAINDER NOT ZERO MEANS NEED TO MUL EACH OF THEM
        MOV MULNUM,AX; STORE THE NUMBER FOR MULTIPLY
        MOV AX,TEMPDENOA
        MUL MULNUM
        MOV TEMPDENOA,AX
        MOV AX,TempNumeA
        MUL MULNUM
        MOV TempNumeA,AX
    JMP SAMEDENO

    ;last way direct multiply
    MULBETWEEN:
    MOV AX,TempDenoB
    MUL TempDenoA
    MOV TempDenoB,AX
    ;PROCEED NUME
    MOV AX,TempNumeB
    MUL TempDenoA
    MOV TempNumeB,AX

    ;PROCEED DENO
    MOV AX,TempDenoA
    MUL EXTRADENO
    MOV TempDenoA,AX
    ;PROCEED NUME
    MOV AX,TempNumeA
    MUL EXTRADENO
    MOV TempNumeA,AX


    SAMEDENO:
    MOV AX,TempNumeB
    ADD TempNumeA,AX

    JC NEGATIFNUM2
    JMP ENDFRACADD
    NEGATIFNUM2:
    mov NEGATIVEBOOL,0
 
    ENDFRACADD:
    RET
FRACADD ENDP

;SUB OPERATION
FRACSUB PROC FAR

    ;EXTRADENO/NUME TEMPRORARY PLACE OF TEMPDENOB
    MOV AX,TempDenoB
    MOV EXTRADENO,AX
    MOV AX,TempNumeB
    MOV EXTRANUME,AX

    MOV AX,TempDenoA
    CMP AX,TempDenoB
    JE CHECKPOINT2
    JMP NOTSAMEDENO2
    CHECKPOINT2:
    JMP SAMEDENO2

    NOTSAMEDENO2:
    ;ELSE check which one bigger
    CMP AX,TempDenoB
    JB BdenoLARGER2
        MOV DX,0
        MOV AX,TempDenoA
        DIV TempDenoB
        CMP DX,0
        JNE MULBETWEEN2; REMAINDER NOT ZERO MEANS NEED TO MUL EACH OF THEM
        MOV MULNUM,AX; STORE THE NUMBER FOR MULTIPLY
        MOV AX,TEMPDENOB
        MUL MULNUM
        MOV TEMPDENOB,AX
        MOV AX,TempNumeB
        MUL MULNUM
        MOV TempNumeB,AX
    JMP SAMEDENO2

    BdenoLARGER2:
        MOV DX,0
        MOV AX,TempDenoB
        DIV TempDenoA
        CMP DX,0
        JNE MULBETWEEN2; REMAINDER NOT ZERO MEANS NEED TO MUL EACH OF THEM
        MOV MULNUM,AX; STORE THE NUMBER FOR MULTIPLY
        MOV AX,TEMPDENOA
        MUL MULNUM
        MOV TEMPDENOA,AX
        MOV AX,TempNumeA
        MUL MULNUM
        MOV TempNumeA,AX
    JMP SAMEDENO2

    ;last way direct multiply
    MULBETWEEN2:
    MOV AX,TempDenoB
    MUL TempDenoA
    MOV TempDenoB,AX
    ;PROCEED NUME
    MOV AX,TempNumeB
    MUL TempDenoA
    MOV TempNumeB,AX

    ;PROCEED DENO
    MOV AX,TempDenoA
    MUL EXTRADENO
    MOV TempDenoA,AX
    ;PROCEED NUME
    MOV AX,TempNumeA
    MUL EXTRADENO
    MOV TempNumeA,AX



    SAMEDENO2:
    MOV AX,TempNumeB
    SUB TempNumeA,AX


    JS NEGATIFNUM
    JMP ENDFRACSUB
    NEGATIFNUM:
    mov NEGATIVEBOOL,1

    ENDFRACSUB:
    RET
FRACSUB ENDP

;MUL OPRTATION
FRACMUL PROC FAR

    MOV DX,0
    MOV AX,TempDenoA
    MUL TempDenoB
    MOV TempDenoA,AX

    CMP DX,0
    JE MULNUME
    MOV MATHBOOL,1

    MULNUME:
    MOV DX,0
    MOV AX,TempNumeA
    MUL TempNumeB
    MOV TempNumeA,AX

    CMP DX,0
    JE ENDFRACMUL
    MOV MATHBOOL,1


    ENDFRACMUL:
    RET
FRACMUL ENDP

;DIV OPERATION
FRACDIV PROC FAR
	CMP TempNumeB,0
	JNE NOTZERO3
	MOV MATHBOOL,1
	NOTZERO3:
    MOV DX,0
    MOV AX,TempDenoA
    MUL TempNumeB
    MOV TempDenoA,AX

    MOV DX,0
    MOV AX,TempNumeA
    MUL TempDenoB
    MOV TempNumeA,AX
    RET
FRACDIV ENDP

;CONVERT TO INFIX FORM 
CTI PROC FAR
    MOV CFLEN,0
    MOV DigitLen,0
    CMP actF,0
    JNE STARTCTI
    RET
    
    STARTCTI:
    MOV CX,35
    MOV SI,0
    CLEARCTI:
        MOV BOOLEANCF[SI],0
        ADD SI,2
    LOOP CLEARCTI
    ;convert formula
    MOV BX,0
    MOV BL,actF

    MOV CX,BX
    MOV SI,0
    MOV DI,0; For Digit Conversion

    convert:
        MOV BL,StoredFormula[SI]
        ;ASCII 0 IS 48 DEC

        NOTEQUALS:
		CMP BL,39
		JBE NOTVALIDIN
		CMP BL,46 ; CANNOT ACCEPT POINT '.'=46
		JE NOTVALIDIN
        CMP BL,64
        JB CONCHECK
		NOTVALIDIN:
        MOV VALIDBOOL,0
        RET

        CONCHECK:
        CMP BL,48
        JB ISOPERATOR
        CMP BL,57
        JG ISOPERATOR

        MOV Digit[DI],BL
        INC DI
        INC DigitLen
        jmp next_convert

        
        ISOPERATOR:
        CMP DigitLen,0
        JE CHECKOPERATOR
        CALL FAR PTR CALWHOLE
        MOV DigitLen,0
    

        ;BX RESERVED FOR VALUE IN THIS FUNCTION
        ;CHECK COVERTED[DI] IS , OR NOT
        CHECKOPERATOR:
        CMP BX,'='
        JE CHECKFORMULA
        CMP BX,',' 
        JE next_convert
        JMP SETSIGN

        CHECKFORMULA:
        MOV VALIDBOOL,1

        SETSIGN:
        MOV AX,CFLEN
        MOV DX,2
        MUL DX
        MOV DI,AX
        
        
        MOV CovertedF[DI],BX
        MOV BOOLEANCF[DI],1
        INC CFLEN
        MOV DI,0; RESET FOR NEXT DIGIT

        next_convert:
        INC SI
    LOOP convert

    ENDCTI:
    RET
CTI ENDP

;Covert to Postfix form
CTP PROC FAR

    MOV CX,35
    MOV SI,0
    CLEARCTP:
        MOV BOOLEANPF[SI],0
        ADD SI,2
    LOOP CLEARCTP

    MOV PFLEN,0
    MOV CX,CFLEN
    MOV SI,0;original array
    MOV DI,0;postorder array
    MOV FRACLEN,0

    TOPOST:
    
        MOV BX,BOOLEANCF[SI]
        CMP BX,0
        JNE ISOPERATOR2;IF OPERATOR CANNOT DIRECT INSERT TO POSTORDER


        MOV BX,CovertedF[SI]
        MOV POSTF[DI],BX
        ADD DI,2
        INC PFLEN
        INC FRACLEN
        JMP ENDTOPOST

        ISOPERATOR2:
        CALL FAR PTR CHECKFRACLEN
        MOV BX,CovertedF[SI]
        CMP BX,'='
        JNE C_N_STACK
        JMP ENDTOPOST
        
        C_N_STACK:
        CMP StackLen,0 ;if stack empty means first value direct push
        JE PUSHIN
        POP AX
        DEC StackLen
        ;CHECK OPERATOR

        JMP CHECKSIGN

        ;IF BX OCCUR ')' CHECK AND POP AX UNTIL AX IS '('
        FINDBRACKET:
        JMP FBRACFUNC

        CHECKPRIOR1:
        JMP CP1FUNC
        
        CHECKPRIOR2:
        JMP CP2FUNC
    
        CHECKPRIOR3:
        JMP CP3FUNC

        PUSHIN:
        PUSH BX
        INC StackLen
        JMP ENDTOPOST

        CHECKSTACK:
        MOV POSTF[DI],AX
        mov BOOLEANPF[DI],1
        ADD DI,2
        INC PFLEN
        JMP C_N_STACK

        ENDTOPOST:
        ADD SI,2
    LOOP TOPOST
    JMP ENDCAL

    CHECKSIGN:
        CMP BX,')'
        JE FINDBRACKET
        CMP BX,'+'
        JE CHECKPRIOR1
        CMP BX,'-'
        JE CHECKPRIOR1
        CMP BX,'*'
        JE CHECKPRIOR2
        CMP BX,'/'
        JE CHECKPRIOR2
        CMP BX,'('
        JE CHECKPRIOR3

    

    FBRACFUNC:
        CMP Al,'('
        JE COMPLETEBRAC

        MOV POSTF[DI],AX
        mov BOOLEANPF[DI],1
        ADD DI,2
        INC PFLEN

        cmp StackLen,0
        je COMPLETEBRAC
        POP AX
        DEC StackLen
        JMP FBRACFUNC
        
        COMPLETEBRAC:

    jmp ENDTOPOST


    CP1FUNC:
        CMP AX,40
        JNE CHECKSTACK
        PUSH AX
        INC StackLen
    JMP PUSHIN

    CP2FUNC:
        CMP AX,'*'
        JE CHECKSTACK
        CMP AX,'/'
        JE CHECKSTACK
        PUSH AX
        INC StackLen
    JMP PUSHIN

    CP3FUNC:
        PUSH AX
        INC StackLen
    JMP PUSHIN

    ENDCAL:

    ;POP ALL OPERATOR
    CMP StackLen,0
    JE RETURNCTP
    MOV BX,0
    MOV BL,StackLen
    MOV CX,bx
    POPALLOPR:
        POP AX
        DEC StackLen
        MOV POSTF[DI],AX
        mov BOOLEANPF[DI],1
        ADD DI,2
        INC PFLEN
    LOOP POPALLOPR

    
    RETURNCTP:
    RET
CTP ENDP

;CONVERT TO STRING NEED TO PUT value into AX FIRST
;ACTUALLY SAME THINGS WIH STATISTICS CALCULATOR (STACTS)
;SEPARATE OUT FOR EASE FUTURE ENCHANCE
CTS PROC FAR
    ;INITIAL THE VALUES
    MOV CX,5
    MOV DI,0

    SETZERO:
        MOV DX,0
        MOV STRDIS[DI],DL
        INC DI
    LOOP SETZERO
    
    MOV CX,5
    MOV DI,4

    DIV10:
        MOV DX,0
        DIV tens_dw
        MOV STRDIS[DI],DL
        DEC DI
    LOOP DIV10


    MOV CX,5
    MOV DI,0
    MOV HAVEDIGIT,0
    DISLOOP:

        cmp di,4
        je onlydigit2
        cmp HAVEDIGIT,0
        jne onlydigit2
        mov ah,STRDIS[DI]
        cmp ah,0
        je NEXTDIS3
        mov HAVEDIGIT,1

        onlydigit2:
        MOV AH,02H
        MOV DL,STRDIS[DI]
        ADD DL,30H
        INT 21H

        NEXTDIS3:
        INC DI
    LOOP DISLOOP
    RET
CTS ENDP

;SIMPLY THE FRACTION
SIMPLYFRAC PROC FAR
    MOV WHOLENUM,0
	mov simplydeno,0
	mov simplynume,0
    ;make it into mixed fraction if nume>deno
	CMP TempDenoA,0
    JNE NOTZERO2
    RET

    NOTZERO2:
    mov ax,TempNumeA
    mov bx,TempDenoA

    MOV SIMPLYDENO,BX ;INITIAL VALUES FOR NOT MIX
    MOV SIMPLYNUME,AX ;INITIAL VALUES FOR NOT MIX
    CMP AX,BX
    JB NOTMIXFRAC

    ;IF NUME > DENO CONVERT TO MIXED Frac
    MOV DX,0
    DIV SIMPLYDENO
    MOV WHOLENUM,AX
    CMP DX,0
    JNE NOTONLYWHOLE
    MOV SIMPLYNUME,0
    MOV SIMPLYDENO,0
    JMP ENDSIMPLYFRAC

    NOTONLYWHOLE:
    MOV SIMPLYNUME,DX
    MOV DX,TEMPDENOA
    MOV SIMPLYDENO,DX
    

    NOTMIXFRAC:
    ;FIRST CHECK WITH DIVISION METHOD
    MOV DX,0
    MOV AX,SIMPLYDENO
    DIV SIMPLYNUME
    ;CHECK REMAIDER FOR KNOW CAN FULLY DEVIDE OR NOT
    CMP DX,0
    ;IF CAN BOTH DIVIDE NUME
    JNE NEXTMETHOD
        ;CAN
        MOV DX,0
        MOV AX,SIMPLYDENO
        DIV SIMPLYNUME
        MOV SIMPLYDENO,AX

        MOV DX,0
        MOV AX,SIMPLYNUME
        DIV SIMPLYNUME
        MOV SIMPLYNUME,AX

    NEXTMETHOD:
    
    ;Greatest Common Factor
    ;check simplydeno and simplynume
    mov FocusGCF,0
    mov ax,simplydeno
    cmp ax,simplynume
    JB DENOGCF
    MOV AX,SIMPLYNUME
    MOV FocusGCF,AX
    JMP NUMEGCF

    DENOGCF:
    MOV FocusGCF,AX

    NUMEGCF:
    MOV CX,FocusGCF
    MOV BX,1
    FindGCF:

    MOV AX,SIMPLYDENO
    MOV DX,0
    DIV BX
    CMP DX,0
    JNE NOTGCF

    MOV AX,SIMPLYNUME
    MOV DX,0
    DIV BX
    CMP DX,0
    JNE NOTGCF

    MOV GCFSTORE,BX

    NOTGCF:
    INC BX
    LOOP FindGCF

    MOV AX,SIMPLYNUME
    MOV DX,0
    DIV GCFSTORE
    MOV SIMPLYNUME,AX

    MOV AX,SIMPLYDENO
    MOV DX,0
    DIV GCFSTORE
    MOV SIMPLYDENO,AX


    ENDSIMPLYFRAC:
    RET
SIMPLYFRAC ENDP

;TO CHECK THE DATA STORE AND COVENT TO STANDART FORMAT FOR POSTFIX
CHECKFRACLEN PROC FAR
    CMP FRACLEN,1
    JE CONDTOF
    CMP FRACLEN,3
    JE CONMTOF
    JMP ENDCHECKFL

    ;CONVERT DIGIT TO FRACTION
    ;PUT 1 IN DENO
    CONDTOF:
    MOV BX,1
    MOV POSTF[DI],BX
    ADD DI,2
    INC PFLEN
    MOV FRACLEN,0
    JMP ENDCHECKFL

    ;CONVERT MIX FRAC TO REAL FRACC
    CONMTOF:
    SUB DI,2
    DEC PFLEN
    MOV AX,POSTF[DI]
    MOV TEMPDENO,AX

    SUB DI,2
    DEC PFLEN
    MOV AX,POSTF[DI]
    MOV TEMPNUME,AX

    SUB DI,2
    DEC PFLEN
    MOV AX,POSTF[DI]
    mul TEMPDENO
    ADD TEMPNUME,AX

    MOV BX,TEMPNUME
    MOV POSTF[DI],BX
    ADD DI,2
    INC PFLEN

    MOV BX,TEMPDENO
    MOV POSTF[DI],BX
    ADD DI,2
    INC PFLEN

    ENDCHECKFL:
    MOV FRACLEN,0
    RET
CHECKFRACLEN ENDP

;BECAUSE THIS FUNCTION THE CALCULATOR WILL NOT ABLE TO IDENTIFY THE
;ERROR WHICH OVER OR LESS THAN 65535
;BUT IT PROVIDE THE NEGATIVE PRESENTATION FOR THE SYSTEM
;SIGNED DIGIT ONLY MAXIMUN GO TO 32768
CONVERTSIGNFUN PROC FAR
    CMP NEGATIVEBOOL,0
    JE ENDCSF
    MOV BX,0

    MOV AX,65535
    SUB AX,TempNumeA
    MOV TempNumeA,AX
    INC TempNumeA

    ENDCSF:
    RET
CONVERTSIGNFUN ENDP

;SIMPLE FUNCTION FOR CONVERT FRACTION TO Decimal
CALDECIMAL PROC FAR
    MOV AX,WHOLENUM
    CALL FAR PTR CTS

    CMP SIMPLYNUME,0
    JE ENDCALDECIMAL

    MOV AH,02H
    MOV DL,'.'
    INT 21H
    
    MOV DX,0
    MOV AX,SIMPLYNUME
    MUL hundreds_dw
    DIV SIMPLYDENO
    MOV TEMPAX,AX

    MOV AX,DX
    MOV DX,0
    MUL hundreds_dw
    DIV SIMPLYDENO
    CMP AX,50
    JB NOCARRY
    INC TEMPAX

    NOCARRY:
    MOV DX,0
    MOV AX,TEMPAX
    DIV tens_dw

    MOV BX,DX
    MOV DX,AX

    MOV AH,02H
    ADD DX,30H
    INT 21h
    MOV AH,02H
    MOV DX,BX
    ADD DX,30H
    INT 21H

    ENDCALDECIMAL:
    RET
CALDECIMAL ENDP

;SIMPLE FUNCTION FOR DISPLAY
SHOWFRACRESULT PROC FAR
    mov ah,09h
    lea dx,NEW_LINE
    int 21h

    mov ah,09H
    lea dx,FRACRESULTMSG
    int 21h

    MOV AX,TempNumeA
    CALL FAR PTR CTS
    MOV AH,02H
    MOV DL,'/'
    INT 21H
    MOV AX,TempDenoA
    CALL FAR PTR CTS

    CMP NEGATIVEBOOL,0
    JE NOTNEG
    MOV AH,09H
    LEA DX,NEGMSG
    INT 21H
    NOTNEG:


    MOV AH,09h
    LEA DX,NEW_LINE
    INT 21H

    mov ah,09H
    LEA dx,MIXFRACMSG
    int 21h


    MOV AX,WHOLENUM
    CALL FAR PTR CTS

    MOV AH,02H
    MOV DL,' '
    INT 21H

    MOV AX,SIMPLYNUME
    CALL FAR PTR CTS

    MOV AH,02H
    MOV DL,'/'
    INT 21H

    MOV AX,SIMPLYDENO
    CALL FAR PTR CTS

    CMP NEGATIVEBOOL,0
    JE NOTNEG2
    MOV AH,09H
    LEA DX,NEGMSG
    INT 21H
    NOTNEG2:

    MOV AH,09h
    LEA DX,NEW_LINE
    INT 21h
    MOV AH,09h
    LEA DX,DECIMALMSG
    INT 21h
    CALL FAR PTR CALDECIMAL

    CMP NEGATIVEBOOL,0
    JE NOTNEG3
    MOV AH,09H
    LEA DX,NEGMSG
    INT 21H
    NOTNEG3:

    RET
SHOWFRACRESULT ENDP


;----------------------------------------------------------------------------------------------
;STATISTICS CALCULATOR
;Main Driver Program Statistic Calculation
STATISCAL PROC FAR

    STARTSTACAL:
    CALL FAR PTR clearSc

    MOV AH,09h
    LEA DX,STATITLE
    INT 21h

    mov RDLEN,0
    MOV STOPINPUT,0
    ; GET THE VALUES FROM USER
    MOV CX,10
    GETRAWD:
        MOV AH,09H
        LEA DX,ENTERMSG
        INT 21H

        MOV AH,0AH
        LEA DX,FORMSTRING
        INT 21H

        CALL FAR PTR CONVERTSTR
        MOV BX,STOPINPUT
        CMP BX,0
        JNE DONEINPUT
        CALL FAR PTR SCALWHOLE
    LOOP GETRAWD

    DONEINPUT:
    CMP RDLEN,0
    JNE DOSTACAL
    JMP ENDSTAMSGDIS
    
    DOSTACAL:
    ;CALCULATE SUM OF THE ALL VALUES
    CALL FAR PTR ACCUMULATE
    CALL FAR PTR ACCUMULATESQUA
    CALL FAR PTR SELECTSORT
    CALL FAR PTR FINDMEDIAN
    CALL FAR PTR FINDMODE
    CALL FAR PTR FINDAVG
    CALL FAR PTR CALRANGE

    CALL FAR PTR CALVARIANCE
    CALL FAR PTR CALSAMVARIANCE
    CALL FAR PTR CALSTDV
    CALL FAR PTR CALSTDVSAM
    

    CALL FAR PTR STARESULT
   

    ENDSTAMSGDIS:
    MOV AH,09h
    LEA DX,NEW_LINE
    INT 21H
    MOV AH,09h
    LEA DX,ENDSTAMSG
    INT 21H
    
  
    MOV AH,01H
    INT 21h
    CMP AL,'Y'
    JE STATURNSTART
    CMP AL,'y'
    JE STATURNSTART
    JMP ENDSTACAL

    STATURNSTART:
    JMP STARTSTACAL

    ENDSTACAL:
    RET
STATISCAL ENDP

;Find MODE DEPENDS ON OCCUR TIMES
FINDMODE PROC FAR
    ;reset rawoccur array
    mov cx,RDLEN
    mov si,0
    RERAWOCCUR:
        MOV RAWOCCUR[SI],0
        ADD SI,2
    LOOP RERAWOCCUR



    MOV MODELEN,0
    MOV CX,RDLEN
    MOV SI,0  
    ;RUN THROUGH ALL RAW DATA
    RUNTRAWDATA:
        MOV TEMPCX,CX

        MOV AX,RAWDATA[SI]
        MOV BX,RDPOINTS[SI]

        MOV CX,RDLEN
        MOV DI,0
        RUNTRAWDATA2:
            CMP AX,RAWDATA[DI]
            JNE ENDLOOPRD2
            CMP BX,RDPOINTS[DI]
            JNE ENDLOOPRD2

            INC RAWOCCUR[SI]
            ENDLOOPRD2:
            ADD DI,2
        LOOP RUNTRAWDATA2

        ADD SI,2
        MOV CX,TEMPCX
    LOOP RUNTRAWDATA

    ;FIND LARGEST VALUE IN RAWOCCUR
    MOV CX,RDLEN
    MOV SI,0
    MOV HIGHOCCUR,0
    RUNRAWOCCUR:
        MOV AX,RAWOCCUR[SI]

        CMP AX,HIGHOCCUR
        JLE NEXTRUN

        MOV HIGHOCCUR,AX
    
        NEXTRUN:
        ADD SI,2
    LOOP RUNRAWOCCUR


    ;FIND all value which are highoccur
    
    MOV CX,RDLEN
    MOV SI,0
    MOV DI,0

    PREMODEV:

        MOV TEMPCX,CX
        MOV TEMPSI,SI

        MOV AX,RAWOCCUR[SI]
        CMP AX,HIGHOCCUR
        JNE NEXTDIS

        CMP MODELEN,0
        JE NOTREPEAT

    
        MOV CX,MODELEN
        MOV SI,0
        CHECKREP:
          
            MOV DI,MODEARRAY[SI]
            MOV AX,RAWDATA[DI]
            MOV DI,TEMPSI
            MOV BX,RAWDATA[DI]

            CMP AX,BX
            JE CHKPOINT
            JMP NEXTINDEX

            CHKPOINT:
            MOV DI,MODEARRAY[SI]
            MOV AX,RDPOINTS[DI]
            MOV DI,TEMPSI
            MOV BX,RDPOINTS[DI]

            CMP AX,BX
            JE NEXTDIS
            
            NEXTINDEX:
            ADD SI,2

        LOOP CHECKREP

      
        MOV AX,MODELEN
        MOV BX,2
        MUL BX
        MOV DI,AX
        
        NOTREPEAT:
        MOV SI,TEMPSI
        MOV MODEARRAY[DI],SI
        INC MODELEN

        NEXTDIS:
        MOV CX,TEMPCX
        MOV SI,TEMPSI

        ADD SI,2
    LOOP PREMODEV
    RET
FINDMODE ENDP

;FIND MEDIAN DEPENS ON SORTING FUNCTION
FINDMEDIAN PROC FAR
    MOV DX,0
    MOV AX,RDLEN
    MOV BX,2
    DIV BX
    CMP DX,1
    JE ONLYONE

    MOV DX,0
    MUL BX
    MOV SI,AX

    MOV AX,ASCRAWDATA[SI]
    MOV MEDIANRD,AX
    MOV AX,ASCRDPOINT[SI]
    MOV MEDIANRDP,AX
    
    SUB SI,2 ;INDEX START FROM ZERO TAKE N WITH N-1
    MOV AX,ASCRAWDATA[SI]
    ADD MEDIANRD,AX
    MOV AX,ASCRDPOINT[SI]
    ADD MEDIANRDP,AX

    CMP MEDIANRDP,100
    JGE CARRY100
    JMP DIVIDETWO

    CARRY100:
    ADD MEDIANRD,1
    SUB MEDIANRDP,100

    DIVIDETWO:

    ;DECIMAL POINT
    MOV DX,0
    MOV AX,MEDIANRDP
    MOV BX,2
    DIV BX
    MOV MEDIANRDP,AX
    CMP DX,0
    JE CALMDRD
    ADD MEDIANRDP,1

    CALMDRD:
    MOV DX,0
    MOV AX,MEDIANRD
    MOV BX,2
    DIV BX
    MOV MEDIANRD,AX
    CMP DX,0
    JE ENDFINDMEDIAN
    ADD MEDIANRDP,50

    JMP ENDFINDMEDIAN

    ONLYONE:
    MOV DX,0
    MUL BX
    MOV SI,AX
    MOV AX,ASCRAWDATA[SI]
    MOV MEDIANRD,AX
    MOV AX,ASCRDPOINT[SI]
    MOV MEDIANRDP,AX


    ENDFINDMEDIAN:
    RET
FINDMEDIAN ENDP

;Find Average
FINDAVG PROC FAR
    MOV AVROFRDP,0
    MOV AVROFRD,0
    MOV AX,TOTALOFRD
    MOV DX,0
    DIV RDLEN
    MOV AVROFRD,AX

    MOV AX,DX
    MUL hundreds_dw
    ADD AX,TOTALOFRDP
    MOV DX,0
    DIV RDLEN
    MOV AVROFRDP,AX
    CMP DX,50
    JL ENDFINDAVG
    INC AVROFRDP
   
    ENDFINDAVG:
    RET
FINDAVG ENDP

;CONVERT TO STRING AND DISPLAY
CONVERTSTR PROC FAR

    MOV SDIGITLEN,0
    MOV SPOINTTLEN,0
    MOV BOOLPOINT,0 ;SET TO FALSE
    MOV TEMPCX,CX

    MOV BX,0
    MOV BL,ACTFS
    MOV CX,BX
    MOV SI,0
    MOV DI,0
    SCONVERT: 
        MOV BL,FSTRING[SI]
        CMP BL,64
        JGE Nintterupt
        CMP BOOLPOINT,0
        JNE ISPOINT
        CMP BL,48
        JL POINTEXIST

        MOV SDigit[SI],BL
        INC SDIGITLEN
        JMP ENDSCONVERT

        POINTEXIST:
        MOV BOOLPOINT,1
        JMP ENDSCONVERT

        ISPOINT:
        MOV SPOINT[DI],BL
        INC SPOINTTLEN
        INC DI

        ENDSCONVERT:
        INC SI
    LOOP SCONVERT
    JMP ENDCONVERTSTR

    Nintterupt:
    MOV STOPINPUT,1

    ENDCONVERTSTR:
    MOV CX,TEMPCX
    RET

CONVERTSTR ENDP

;COVER INPUT DIGIT INTO NUMBER IN SYSTEM
SCALWHOLE PROC FAR

    MOV TEMPTOTAL,0
    MOV DI,0
    ;FROM LARGE TO SMALL
    CMP SDIGITLEN,1
    JE STAONES
    CMP SDIGITLEN,2
    JE STATENS

    STAHUNDREDS:
    MOV AX,0
    MOV AL,SDigit[DI]
    SUB AL,30H
    MUL hundreds_dw
    ADD TEMPTOTAL,AX
    INC DI

    STATENS:
    MOV AX,0
    MOV AL,SDigit[DI]
    SUB AL,30H
    MUL tens_dw
    ADD TEMPTOTAL,AX
    INC DI

    STAONES:
    MOV AX,0
    MOV AL,SDigit[DI]
    SUB AL,30H
    ADD TEMPTOTAL,AX 

    ;put into RAWDATA
    MOV AX,RDLEN
    MOV DX,2
    MUL DX
    MOV DI,AX

    mov dx,TEMPTOTAL
    mov RAWDATA[DI],dx
  

    ;----------------------

    MOV DI,0
    MOV TEMPTOTAL,0

    TENSP:
    MOV AX,0
    MOV AL,SPOINT[DI]
    SUB AL,30H
    MUL tens_dw
    ADD TEMPTOTAL,AX
    INC DI

    ONESP:
    MOV AX,0
    MOV AL,SPOINT[DI]
    SUB AL,30H
    ADD TEMPTOTAL,AX

    ;put into RDPOINTS
    MOV AX,RDLEN
    MOV DX,2
    MUL DX
    MOV DI,AX

    mov dx,TEMPTOTAL
    mov RDPOINTS[DI],dx

    inc RDLEN
   

    ;RESET SDIGIT AND SPOINT
    MOV TEMPCX,CX

    MOV CX,3
    MOV DI,0
    RESETDIGIT:
        MOV SDIGIT[DI],'0'
        INC DI
    LOOP RESETDIGIT

    MOV CX,2
    MOV DI,0
    RESETPOINTS:
        MOV SPOINT[DI],'0'
        INC DI
    LOOP RESETPOINTS

    MOV CX,TEMPCX
    MOV DI,0

    RET
SCALWHOLE ENDP

;TOTAL ALL RAWDATA
ACCUMULATE PROC FAR

    MOV TOTALOFRD,0
    MOV TOTALOFRDP,0

    MOV CX,RDLEN
    MOV SI,0

    ADDVALUES:
        MOV AX,TOTALOFRD
        ADD AX,RAWDATA[SI]
        MOV TOTALOFRD,AX

        MOV BX,TOTALOFRDP
        ADD BX,RDPOINTS[SI]
        MOV TOTALOFRDP,BX
        CMP BX,100
        JL NEXTVALUE

        MOV AX,BX
        MOV DX,0
        DIV hundreds_dw
        MOV TOTALOFRDP,DX
        ADD TOTALOFRD,AX
       
        NEXTVALUE:
        ADD SI,2
    LOOP ADDVALUES

    RET
    
ACCUMULATE ENDP

;TOTAL OF SQUARE RAW DATA
ACCUMULATESQUA PROC FAR
    MOV LIMIT,0
    MOV TOTALOFRDS,0
    MOV TOTALOFRDPS,0
    
    MOV CX,RDLEN
    MOV SI,0

    ADDVALUES2:

        mov SQUADIGIT,0
        mov SQUAPOINT,0
        JMP PROCEEDSQUARE

        SQUAREDONE:
        MOV BX,TOTALOFRDPS
        ADD BX,SQUAPOINT
        MOV TOTALOFRDPS,BX
        CMP BX,100
        JL NOCARRY2
        MOV DX,0
        MOV AX,BX
        DIV hundreds_dw
        MOV TOTALOFRDPS,DX
        ADD TOTALOFRDS,AX
        JMP POINTDONE

        NOCARRY2:
        MOV TOTALOFRDPS,BX

        POINTDONE:
        MOV BX,TOTALOFRDS
        ADD BX,SQUADIGIT
        jc OVERLIMIT
        MOV TOTALOFRDS,BX

        ADD SI,2
    LOOP ADDVALUES2
    JMP RETURNSQUA

    ;the number for square must below 256, and the square result not more than 65536
    ;6.8=6+80/100
    ;(a+b)square= a square + b square +2a*b
    PROCEEDSQUARE:
        ;point
        ;ALL TAKE 2 DECIMAL POINT ONLY!
        MOV AX,RDPOINTS[SI]
        MUL AX
        DIV hundreds_dw
        MOV SQUAPOINT,ax
        CMP DX,50
        JL NOCARRY3
        INC SQUAPOINT

        NOCARRY3:
        Mov Ax,RAWDATA[si]
        mul RDPOINTS[si]
        mov bx,2
        mul bx
        add ax,SQUAPOINT
        mov dx,0
        div hundreds_dw
        mov SQUAPOINT,dx
        add SQUADIGIT,ax

        ;digit
        MOV DX,0
        MOV AX,RAWDATA[SI]
        MUL AX
        ADD SQUADIGIT,AX
        CMP DX,0
        JNE OVERLIMIT
    JMP SQUAREDONE

    OVERLIMIT:
    MOV TOTALOFRDS,0
    MOV TOTALOFRDPS,0
    MOV LIMIT,1


    RETURNSQUA:
    RET
ACCUMULATESQUA ENDP

;CACULATE VARIANCE
CALVARIANCE PROC FAR
    MOV VARIANCERD,0
    MOV VARIANCERDP,0
    MOV TEMPRD,0
    MOV TEMPRDP,0
    ;CHECK LIMIT
    CMP LIMIT,0
    JE DOCALV
    RET
    DOCALV:
    ;CALCULATE THE HALF OF RDLEN FOR CARRY
    MOV DX,0
    MOV AX,RDLEN
    MOV BX,2
    DIV BX
    CMP DX,0
    JE NOCARRY5
    ADD AX,1
    NOCARRY5:
    MOV HALFRDLEN,AX
    
    ;SETA
    ;TOTALOFSQUARE DIVIDE NUMBER OF RAW DATA
    MOV DX,0
    MOV AX,TOTALOFRDS
    DIV RDLEN
    MOV ATEMPRD,AX

    ;REMAINDER NEED TO PROCEED WITH CARRY
    MOV AX,DX
    MUL hundreds_dw
    MOV DX,0
    DIV RDLEN
    MOV TEMPRDP,AX
    CMP DX,50
    JB NOCARRY12
    ADD TEMPRDP,1

    NOCARRY12:
    MOV DX,0
    MOV AX,TOTALOFRDPS
    DIV RDLEN
    ADD AX,TEMPRDP
    CMP DX,HALFRDLEN
    JL NOCARRY6
    ADD AX,1
    NOCARRY6:
    MOV ATEMPRDP,AX


    ;SET B
    ;SUM DIVIDE NUMBER OF RAW DATA
    MOV DX,0
    MOV AX,TOTALOFRD
    DIV RDLEN
    MOV BTEMPRD,AX

    ;REMAINDER NEED TO PROCEED WITH CARRY
    MOV AX,DX
    MUL hundreds_dw
    MOV DX,0
    DIV RDLEN
    MOV TEMPRDP,AX
    CMP DX,HALFRDLEN
    JB NOCARRY13
    ADD TEMPRDP,1

    NOCARRY13:
    MOV DX,0
    MOV AX,TOTALOFRDP
    DIV RDLEN
    ADD AX,TEMPRDP
    CMP DX,HALFRDLEN
    JL NOCARRY7
    ADD AX,1
    NOCARRY7:
    CMP AX,100
    JL NOCARRY15
    ADD BTEMPRD,1
    SUB AX,100

    NOCARRY15:
    MOV BTEMPRDP,AX



    ; a+b square= a s+ b s+ 2ab
    ; CALCULATE SQUARE (SUM divide N)
    MOV AX,BTEMPRDP;
    MUL AX
    DIV hundreds_dw
    MOV TEMPRDP,ax
    CMP DX,50
    JL NOCARRY4
    INC TEMPRDP

    NOCARRY4:
    mov dx,0
    Mov Ax,BTEMPRD;
    mul BTEMPRDP
    mov bx,2
    mul bx
    add ax,TEMPRDP
    mov dx,0
    div hundreds_dw
    mov TEMPRDP,dx
    add TEMPRD,ax

    ;digit
    MOV AX,BTEMPRD;
    MUL AX
    ADD AX,TEMPRD
    adc dx,0

    MOV BTEMPRD,AX
    MOV AX,TEMPRDP
    MOV BTEMPRDP,AX

   
    ;SET A- SETB
    MOV AX,ATEMPRDP
    MOV BX,BTEMPRDP
    CMP BX,AX
    JLE NONEEDBORROW
    DEC ATEMPRD
    ADD AX,100

    NONEEDBORROW:
    SUB AX,BX
    MOV VARIANCERDP,AX
    MOV AX,ATEMPRD
    MOV BX,BTEMPRD
    SUB AX,BX
    MOV VARIANCERD,AX

    RET
CALVARIANCE ENDP

;CACULATE STANDARD DEVIATION
CALSTDV PROC FAR
    MOV NTRESULTAX,0
    MOV NTRESULTDX,0
    MOV ORIAX,0
    MOV ORIDX,0
    CMP LIMIT,0
    JE DOCALSTDV
    RET
    DOCALSTDV:
    
    mov ax,VARIANCERDP
    CMP AX,0
    JE CHECKRD
    MUL hundreds_dw
    MOV TEMPAX,AX

    CHECKRD:
    MOV AX,VARIANCERD
    CMP AX,0
    JE ENDCALSTDV
    mul ten_thousands_dw
    add ax,TEMPAX
    adc dx,0

    mov ORIAX,ax
    mov ORIDX,DX
    mov NTRESULTAX,27000

    Mov cx,10
    NEWTONCAL:  
        MOV AX,ORIAX
        MOV DX,ORIDX
        DIV NTRESULTAX

        ADD AX,NTRESULTAX
        MOV DX,0
        MOV BX,2
        DIV bx

        MOV NTRESULTAX,AX
        MOV NTRESULTDX,DX


    LOOP NEWTONCAL

    MOV AX,NTRESULTAX
    MOV DX,0
    DIV hundreds_dw
    MOV NTRESULTAX,AX
    MOV NTRESULTDX,DX

    ENDCALSTDV:
    RET
CALSTDV ENDP

;EXTRA
;LAZY TO EXPLAIN DIFFERENCES SAMPLE/POPULATION VARIACE
;JUST DO BOTH 
CALSAMVARIANCE PROC FAR 
    MOV VARIANCERDSAM,0
    MOV VARIANCERDPSAM,0
    CMP RDLEN,1
    JNE STARTCAL
    RET
    STARTCAL:
    MOV TEMPRD,0
    MOV TEMPRDP,0

    ;CHECK LIMIT
    CMP LIMIT,0
    JE DOCALV2
    RET
    DOCALV2:
    ;CALCULATE THE HALF OF RDLEN FOR CARRY
    MOV DX,0
    MOV AX,RDLEN
    MOV BX,2
    DIV BX
    CMP DX,0
    JE NOCARRY8
    ADD AX,1
    NOCARRY8:
    MOV HALFRDLEN,AX

    ;SETA
    MOV AX,TOTALOFRDS
    MOV ATEMPRD,AX
    MOV AX,TOTALOFRDPS
    MOV ATEMPRDP,AX

    ;SET B
    ;SUM DIVIDE NUMBER OF RAW DATA
    MOV AX,TOTALOFRD
    MOV BTEMPRD,AX
    MOV AX,TOTALOFRDP
    MOV BTEMPRDP,AX

    ; CALCULATE SQUARE OF POINT
    MOV AX,BTEMPRDP
    MUL AX
    DIV hundreds_dw
    MOV TEMPRDP,ax
    CMP DX,50
    JL NOCARRY9
    INC TEMPRDP

    ;2AB
    NOCARRY9:
    MOV DX,0
    Mov Ax,BTEMPRD;
    mul BTEMPRDP
    DIV hundreds_dw

    ;AX*2
    mov bx,2
    mul bx
    add TEMPRD,AX

    ;DX*2
    MOV AX,DX
    MUL BX
    CMP AX,100
    JB NOCARRY14
    ADD TEMPRD,1
    SUB AX,100

    NOCARRY14:
    ADD TEMPRDP,AX

    

    MOV DX,0
    ;digit 
    ;IF DATA LARGE WILL STORE IN DX:AX
    MOV AX,BTEMPRD;
    MUL AX
    ADD AX,TEMPRD
    ADC DX,0

    ;SET B DIVIDE BY N
    DIV RDLEN
    MOV BTEMPRD,AX

    ;REMAINDER NEED TO PROCEED WITH CARRY
    MOV AX,DX
    MUL hundreds_dw
    MOV DX,0
    DIV RDLEN
    MOV TEMPRDP,AX

    MOV DX,0
    MOV AX,BTEMPRDP
    DIV RDLEN
    ADD AX,TEMPRDP
    CMP DX,HALFRDLEN
    JL NOCARRY10
    ADD AX,1
    NOCARRY10:
    MOV BTEMPRDP,AX


   
    ;SET A- SETB
    MOV AX,ATEMPRDP
    MOV BX,BTEMPRDP
    CMP BX,AX
    JLE NONEEDBORROW2
    DEC ATEMPRD
    ADD AX,100

    NONEEDBORROW2:
    SUB AX,BX
    MOV VARIANCERDPSAM,AX
    MOV AX,ATEMPRD
    MOV BX,BTEMPRD
    SUB AX,BX
    MOV VARIANCERDSAM,AX

    
    

    ;RESULT DIVIDE BY N-1
    MOV DX,0
    MOV AX,VARIANCERDSAM
    mov bx,RDLEN
    dec bx
    DIV bx
    MOV VARIANCERDSAM,AX

    ;REMAINDER NEED TO PROCEED WITH CARRY
    MOV AX,DX
    MUL hundreds_dw
    MOV DX,0
    mov bx,RDLEN
    dec bx
    DIV bx
    MOV TEMPRDP,AX

    MOV DX,0
    MOV AX,VARIANCERDPSAM
    mov bx,RDLEN
    dec bx
    DIV bx
    ADD AX,TEMPRDP
    CMP DX,HALFRDLEN
    JL NOCARRY11
    ADD AX,1
    NOCARRY11:
    MOV VARIANCERDPSAM,AX

    RET
CALSAMVARIANCE ENDP
;CAN USE THE SAME CODE FROM CALSTDC,LAZY TO CHANGE VARIABLE NAME AND PARAMETER
CALSTDVSAM PROC FAR
    MOV NTRESULTAXSAM,0
    MOV NTRESULTDXSAM,0
    MOV ORIAX,0
    MOV ORIDX,0
    CMP LIMIT,0
    JE DOCALSTDVSAM
    RET
    DOCALSTDVSAM:
    
    mov ax,VARIANCERDPSAM
    CMP AX,0
    JE CHECKRDSAM
    MUL hundreds_dw
    MOV TEMPAX,AX

    CHECKRDSAM:
    MOV AX,VARIANCERDSAM
    CMP AX,0
    JE ENDCALSTDVSAM
    mul ten_thousands_dw
    add ax,TEMPAX
    adc dx,0

    mov ORIAX,ax
    mov ORIDX,DX
    mov NTRESULTAXSAM,27000

    Mov cx,10
    NEWTONCALSAM:  
        MOV AX,ORIAX
        MOV DX,ORIDX
        DIV NTRESULTAXSAM

        ADD AX,NTRESULTAXSAM
        MOV DX,0
        MOV BX,2
        DIV bx

        MOV NTRESULTAXSAM,AX
        MOV NTRESULTDXSAM,DX


    LOOP NEWTONCALSAM

    MOV AX,NTRESULTAXSAM
    MOV DX,0
    DIV hundreds_dw
    MOV NTRESULTAXSAM,AX
    MOV NTRESULTDXSAM,DX

    ENDCALSTDVSAM:
    RET
CALSTDVSAM ENDP
;EXTRA


;BX AND AX RESERVED IN STACTS PUT NUMBER AS PARAMETER THEN OUTPUT
STACTS PROC FAR
    MOV CX,5
    MOV DI,4

    STADIV10:
        MOV DX,0
        DIV tens_dw
        MOV STRDISDIGIT[DI],DL
        DEC DI
    LOOP STADIV10

    MOV CX,5
    MOV DI,0
    mov HAVEDIGITSTA,0
    STADISLOOP:
        cmp di,4
        je onlydigit
        cmp HAVEDIGITSTA,0
        jne onlydigit
        mov ah,STRDISDIGIT[DI]
        cmp ah,0
        je NEXTDIS2
        mov HAVEDIGITSTA,1

        onlydigit:
        MOV AH,02H
        MOV DL,STRDISDIGIT[DI]
        ADD DL,30H
        INT 21H

        NEXTDIS2:
        INC DI

        
    LOOP STADISLOOP


    MOV CX,2
    MOV DI,1
    MOV AX,BX
    STADIV10P:
        MOV DX,0
        DIV tens_dw
        MOV STRDISPOINT[DI],DL
        DEC DI
    LOOP STADIV10P

    mov ah,02h
    MOV DL,'.'
    int 21h

    MOV CX,2
    MOV DI,0
    STADISLOOPP:
        MOV AH,02H
        MOV DL,STRDISPOINT[DI]
        ADD DL,30H
        INT 21H
        INC DI
    LOOP STADISLOOPP
    RET
STACTS ENDP

;SELECTION SORTING TECHNIQUE
SELECTSORT PROC FAR

    ;COPY ARRAY
    MOV CX,RDLEN
    MOV SI,0
    COPYARRAY:
        MOV AX,RAWDATA[SI]
        MOV BX,RDPOINTS[SI]

        MOV ASCRAWDATA[SI],AX
        MOV ASCRDPOINT[SI],BX
        ADD SI,2
    LOOP COPYARRAY


    MOV CX,RDLEN
    MOV SI,0
    RUNTORIARR:
        ;Initial every unsorted SI as the smallest
        MOV AX,ASCRAWDATA[SI]
        MOV SMALLESTRD,AX
        MOV AX,ASCRDPOINT[SI]
        MOV SMALLESTRDP,AX

        ;since si jmp 2 bit every times,convert it to 1 for CX
        ;LAZY TO CREATE A NEW VARIABLE FOR CX PURPOSE
        MOV DX,0
        MOV AX,SI
        MOV BX,2
        DIV BX
        MOV DX,AX
        ;JUST STORE RESULT IN DX

        ;INNER LOOP WILL START FROM UNSORTED PART ONLY
        MOV TEMPCX,CX
        MOV CX,RDLEN
        SUB CX,DX ;HERE TO USE TO LIMIT THE LOOP ROUNDS, LAZY TO USE OTHER METHOD
        MOV DI,SI ;START FROM SI, SI IS UNSORTED INDEX
        FINDSMALLEST:

            MOV AX,ASCRAWDATA[DI]
            MOV BX,ASCRDPOINT[DI]

            CMP AX,SMALLESTRD
            JG NEXTFIND ;IF LARGEER GO NEXT
            JE CPOINT; IF SAME CHECK POINT
            JMP RPCSMALLEST

            CPOINT:
            CMP BX,SMALLESTRDP
            JGE NEXTFIND

            ;EXCHANGE THE VALUE 
            RPCSMALLEST:
            MOV DX,SMALLESTRD
            MOV ASCRAWDATA[DI],DX
            MOV DX,SMALLESTRDP
            MOV ASCRDPOINT[DI],DX

            MOV SMALLESTRD,AX
            MOV SMALLESTRDP,BX

            NEXTFIND:
            ADD DI,2

        LOOP FINDSMALLEST

        ;FIND THE SMALLEST FOR SI
        MOV AX,SMALLESTRD
        MOV ASCRAWDATA[SI],AX
        MOV AX,SMALLESTRDP
        MOV ASCRDPOINT[SI],AX

        MOV CX,TEMPCX
        ADD SI,2

    LOOP RUNTORIARR

    RET
SELECTSORT ENDP

;DISPLAY STATISTICS RESULT
STARESULT PROC FAR
    ;Display Enter num
    MOV AH,09H
    LEA DX,ENTERNUMMSG
    INT 21h

    MOV CX,RDLEN
    MOV SI,0
    SHOWENUM: 
        MOV TEMPCX,CX
        MOV AX,RAWDATA[SI]
        MOV BX,RDPOINTS[SI]
        CALL FAR PTR STACTS

        MOV AH,02h
        MOV dl,' '
        INT 21h

        ADD SI,2
        MOV CX,TEMPCX
    LOOP SHOWENUM

    MOV AH,09h
    LEA DX,NEW_LINE
    INT 21h

    ;DISPLAY ASCENDING ORDER
    MOV AH,09H
    LEA DX,ASCENNUMMSG
    INT 21h
    MOV CX,RDLEN
    MOV SI,0
    SHOWANUM: 
        MOV TEMPCX,CX
        MOV AX,ASCRAWDATA[SI]
        MOV BX,ASCRDPOINT[SI]
        CALL FAR PTR STACTS

        MOV AH,02h
        MOV dl,' '
        INT 21h

        ADD SI,2
        MOV CX,TEMPCX
    LOOP SHOWANUM

    ;DISPLAY COUNT
    MOV AH,09h
    LEA DX,NEW_LINE
    INT 21h

    MOV AH,09h
    LEA DX,COUNTMSG
    INT 21h

    ;display count
    MOV AX,RDLEN
    MOV DX,0
    DIV tens_dw
    MOV BX,DX
    MOV DX,AX
    MOV AH,02h
    ADD DX,30H
    INT 21h
    MOV AH,02h
    MOV DX,BX
    ADD DX,30H
    INT 21H

    ;DISPLAY MODE
    MOV AH,09h
    LEA DX,MODEMSG1
    INT 21H
    
    CMP HIGHOCCUR,1
    JE NOMODE
    mov ax,MODELEN
    cmp ax,RDLEN
    JE NOMODE
    
    MOV CX,MODELEN
    MOV SI,0
    DISMODEDATA:
        MOV TEMPCX,CX
        MOV DI,MODEARRAY[SI]

       
        MOV AX,RAWDATA[DI]
        MOV BX,RDPOINTS[DI]
        CALL FAR PTR STACTS

        MOV AH,02h
        MOV dl,' '
        INT 21h

        MOV CX,TEMPCX
        ADD SI,2
    LOOP DISMODEDATA
    JMP nextmodeMSG

    NOMODE:
    MOV AH,09H
    LEA DX,NOMODEMSG
    INT 21H

    nextmodeMSG:
    
    MOV AH,09h
    LEA DX,MODEMSG2
    INT 21H

    MOV DX,HIGHOCCUR
    CMP DX,10
    JGE CONTODIS
    JMP NOTCON

    CONTODIS:
    MOV DX,0
    MOV AX,HIGHOCCUR
    DIV tens_dw
    MOV TEMPAX,AX
    MOV TEMPDX,DX

    MOV AH,02h
    MOV DX,TEMPAX
    ADD DX,30H
    INT 21h

    MOV AH,02h
    MOV DX,TEMPDX
    ADD DX,30H
    INT 21H
    JMP DONEDIS

    NOTCON:
    MOV AH,02h
    ADD DX,30H
    INT 21H
    DONEDIS:

    ;DISPLAY MEDIAN
    MOV AH,09h
    LEA DX,MEDIANMSG
    INT 21h
    MOV AX,MEDIANRD
    MOV BX,MEDIANRDP
    CALL FAR PTR STACTS

    ;DISPLAY AVERAGE 
    MOV AH,09h
    LEA DX,AVGMSG
    INT 21h
    MOV AX,AVROFRD
    MOV BX,AVROFRDP
    CALL FAR PTR STACTS

    ;DISPLAY SMALLEST LARGEST
    MOV AH,09h
    LEA DX,LargestMsg
    INT 21h
    MOV AX,LARGESTRD
    MOV BX,LARGESTRDP
    CALL FAR PTR STACTS

    MOV AH,09h
    LEA DX,SmallestMsg
    INT 21H
    MOV AX,SMALLESTRD
    MOV BX,SMALLESTRDP
    CALL FAR PTR STACTS

    MOV AH,09h
    LEA DX,RangeMsg
    INT 21h
    MOV AX,RANGERD
    MOV BX,RANGERDP
    CALL FAR PTR STACTS

    ;DISPLAY TOTAL
    MOV AH,09h
    LEA DX,SUMOFTOTALMSG
    INT 21H
    MOV AX,TOTALOFRD
    MOV BX,TOTALOFRDP
    CALL FAR PTR STACTS

    ;IF OVER LIMIT SHOULD DISPLAY MESSAGE
    CMP LIMIT,0
    JE NOOVERLIMIT
    MOV AH,09h
    LEA DX,NEW_LINE
    INT 21h
    MOV AH,09h
    LEA DX,ERRORMSG
    INT 21H

    NOOVERLIMIT:
    MOV AH,09h
    LEA DX,SQUAMSG
    INT 21H
    MOV AX,TOTALOFRDS
    MOV BX,TOTALOFRDPS
    CALL FAR PTR STACTS

    ;STANDARD DEVIATION
    MOV AH,09h
    LEA DX,VarianceMsg
    INT 21h
    MOV AX,VARIANCERD
    MOV BX,VARIANCERDP
    CALL FAR PTR STACTS


    ;STANDARD DEVIATION
    MOV AH,09h
    LEA DX,StanDMSG
    INT 21H
    MOV AX,NTRESULTAX
    MOV BX,NTRESULTDX
    CALL FAR PTR STACTS

    ;SAMPLE VARIANCE
    MOV AH,09h
    LEA DX,VarianceMsgSAM
    INT 21H
    MOV AX,VARIANCERDSAM
    MOV BX,VARIANCERDPSAM
    CALL FAR PTR STACTS

    ;SAMPLE STANDARD DEVIATION
    MOV AH,09h
    LEA DX,StanDMsgSAM
    INT 21H
    MOV AX,NTRESULTAXSAM
    MOV BX,NTRESULTDXSAM
    CALL FAR PTR STACTS

    RET
STARESULT ENDP

;LARGEST VALUE - SMALLEST VALUE
CALRANGE PROC FAR
    MOV AX,ASCRAWDATA[0]
    MOV SMALLESTRD,AX
    MOV BX,ASCRDPOINT[0]
    MOV SMALLESTRDP,BX

    MOV AH,09h
    LEA DX,NEW_LINE
    INT 21h

    mov ax,RDLEN
    dec ax
    mov bx,2
    mul bx
    mov si,ax

    MOV AX,ASCRAWDATA[SI]
    MOV LARGESTRD,AX
    MOV BX,ASCRDPOINT[SI]
    MOV LARGESTRDP,BX

    CMP BX,SMALLESTRDP
    JGE NONEEDBORROW3
    DEC AX
    ADD BX,100
    NONEEDBORROW3:
    SUB BX,SMALLESTRDP
    MOV RANGERDP,BX
    SUB AX,SMALLESTRD
    MOV RANGERD,AX

    ENDCALRANGE:
    RET
CALRANGE ENDP


;COMMON FUNCTION
;CLEAR SCREEN FUNCTION FROM EXITING ASSIGNMENT GITHUB
clearSc proc FAR
	mov ah,06h
	mov bh,07h
	mov al,0
	mov cx,0
	mov dh,24
	mov dl,79
	int 10H

	mov ah,02H
	mov bh,0
	mov dx,0
	int 10h

	RET
clearSc endp





END MAIN