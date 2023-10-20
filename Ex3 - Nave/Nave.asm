jmp main

main:
	loadn r0, #25		; Posição
	loadn r1, #'>' 		; Nave

	loadn r2, #' ' 		; Espaço em Branco
	loadn r4, #1199 	; Fim na tela

loop: 	
	outchar r2, r0 

	inc r0
	cmp r0, r4  		; Verifica se chegou no fim
	ceq VoltaIni		; Se chegar Volta Inicio

	outchar r1,r0

	call Delay			; Delay na tela

	jmp loop

	halt

VoltaIni:
	loadn r0, #25		; Posição Inicial
	rts					; Return

;********************************************************
;                       DELAY
;********************************************************		


Delay:
	;Utiliza Push e Pop para nao afetar os Ristradores do programa principal
	push R0
	push R1
	
	Loadn R1, #15   
   	Delay_volta2:				
		Loadn R0, #60000		; Intensidade do Delay
		
   		Delay_volta1: 
			dec R0					
			jnz Delay_volta1	
			dec R1
			jnz Delay_volta2
	
	pop R1
	pop R0
	
	rts							; Return

;********************************************************	