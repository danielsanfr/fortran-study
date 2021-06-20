FRASE:
 
            MOVLW	.3
            MOVWF	CARACT_1
            MOVLW	TAM4
            MOVWF	TAM_CARACT_1
            MOVLW	.0
            MOVWF	CARACT_2
            MOVLW	TAM4
            MOVWF	TAM_CARACT_2
            MOVLW	.13
            MOVWF	CARACT_3
            MOVLW	TAM4
            MOVWF	TAM_CARACT_3
            MOVLW	.8
            MOVWF	CARACT_4
            MOVLW	TAM3
            MOVWF	TAM_CARACT_4
            MOVLW	.4
            MOVWF	CARACT_5
            MOVLW	TAM4
            MOVWF	TAM_CARACT_5
            MOVLW	.11
            MOVWF	CARACT_6
            MOVLW	TAM3
            MOVWF	TAM_CARACT_6
            MOVLW	.51
            MOVWF	CARACT_7
            MOVLW	TAM2
            MOVWF	TAM_CARACT_7
            MOVLW	.18
            MOVWF	CARACT_8
            MOVLW	TAM4
            MOVWF	TAM_CARACT_8
            MOVLW	.0
            MOVWF	CARACT_9
            MOVLW	TAM4
            MOVWF	TAM_CARACT_9
            MOVLW	.13
            MOVWF	CARACT_10
            MOVLW	TAM4
            MOVWF	TAM_CARACT_10
 
            MOVLW    .10
            MOVWF    QUANT_CARACT

            CALL    CAPTURA

            CALL    LIMPAR_MATRIZ

        RETURN
