CLASS zeje_bloqiii_if_do_enddo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zeje_bloqiii_if_do_enddo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    """"""""" DO/ENDDO

    DATA(lv_NUM_POS) = '0'.

    DO.

      "     out->write( |Posicion de pedido: { lv_NUM_POS }| ).
      lv_NUM_POS += 1.

      IF lv_NUM_POS GT 8.
        EXIT.
      ENDIF.


    ENDDO.

    """"" EJERCICIO CAJAS EN CINTA TRANSPORTADORA """"""""""""

    DATA(lv_caja_contador) = 0. " Contador de cajas procesadas
    DATA(lv_vuelta)        = 0. " Contador total de vueltas del bucle

    DO.
      "LE SUMA 1 A LA VARIABLE QUE INICIA CON 0, ES UN INICIADOR DE PARTIDA POR EJEMPLO
      lv_vuelta += 1.

      " REGLA 1: CONTROL DE SEGURIDAD EXIT
      " Si ya procesamos 5 cajas, el rack está lleno. Frenamos TODO el bucle.
      IF lv_caja_contador Ge 5.
        EXIT.
      ENDIF.

      " REGLA 2: CON EL CONTINUE HACEMOS UN SALTO, TENDRA QUE DAR LA VUELTA 3 VECES ANTES DE SEGUIR EL CAMINO
      " O sacar las cajas defectuosas a un lado y seguir con el resto
      " Simulamos que en la vuelta número 3 la cinta leyó una caja defectuosa.
      " Usamos CONTINUE para ignorar el procesamiento de esta vuelta y pasar a la siguiente caja.
      IF lv_vuelta = 3.
        out->write( |Vuelta { lv_vuelta }: Caja defectuosa detectada. Aplicando CONTINUE (Saltar vuelta)...| ).
        CONTINUE.
      ENDIF.

      " --- PROCESAMIENTO REAL DE LA CAJA ---
      " Esta lógica solo se ejecuta si la caja pasó los filtros anteriores
      lv_caja_contador += 1.
      out->write( |Vuelta { lv_vuelta }: Caja ingresada con éxito al stock. Cajas totales en rack: { lv_caja_contador }| ).

    ENDDO.


  ENDMETHOD.

ENDCLASS.
