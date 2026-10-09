CLASS zeje_bloqiii_if_endif DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zeje_bloqiii_if_endif IMPLEMENTATION.

  """""""" ENDIF IF """""""""""""""""

  METHOD if_oo_adt_classrun~main.

    DATA(tipo_docu1) = 'F'.

    IF tipo_docu1 EQ 'L'.
      out->write( | HA ESCOGIDO CREAR EL TIPO DE DOC F = PEDIDO = { tipo_docu1 } | ).

    ELSEIF tipo_docu1 EQ 'C'.
      out->write( | HA ESCOGIDO CREAR EL TIPO DE DOC K = CONTRATO = { tipo_docu1 } | ).

    ELSEIF tipo_docu1 EQ 'H'.
      out->write( | HA ESCOGIDO CREAR EL TIPO DE DOC L = PLAN ENTREGA = { tipo_docu1 } | ).

    ELSE.
      out->write( 'DESICION INDEFINIDA ' ).
    ENDIF.
"___________________________________________________________________________________________________"

  " 1. Datos de prueba (Aquí es donde vas a cambiar los valores para testear)
  DATA(lv_monto) = '99000'.  " Monto del pedido en USD
  DATA(lv_centro) = 'C001'. " Centro de distribución

  " Variable para guardar el resultado de la decisión
  DATA lv_estado_aprobacion TYPE string.


  " 2. Estructura de Bifurcación IF / ELSEIF / ELSE
  IF lv_monto >= 99850.
    " Camino A: Pedidos ultra caros
    lv_estado_aprobacion = 'Bloqueado: Requiere firma del Gerente General'.
    out->write( |Monto: { lv_monto } | ).

  ELSEIF lv_monto > 50000 AND lv_monto < 99850 AND lv_centro = 'C001'.
    " Camino B: Monto medio pero pertenece al centro crítico C001
    lv_estado_aprobacion = 'Bloqueado: Requiere firma del Jefe de Compras'.
   out->write( |Monto: { lv_monto } | ).

  ELSE.
    " Camino C: Si no cumple ninguna de las anteriores, se aprueba directo
    lv_estado_aprobacion = 'Liberado: Pedido bloqueado hasta que cumpla requisitos'.

  ENDIF. " Cierre obligatorio de la estructura


  " 3. Imprimimos el resultado final en la consola

  out->write( |Estado: { lv_estado_aprobacion }| ).

  ENDMETHOD.

ENDCLASS.
