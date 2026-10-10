CLASS zeje_bloqiii_if_check DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zeje_bloqiii_if_check IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(lv_posicion) = 0. " Contador de posiciones de la Orden de Compra
    DATA(lv_procesadas) = 0. " Contador de posiciones procesadas con éxito

    DO 5 TIMES. " Simulamos un pedido con 5 posiciones
      lv_posicion += 10. " += Significa que las posiciones en SAP MM van de 10 en 10 (10, 20, 30...)

      " Simulamos el dato que viene de la base de datos para el Grupo de Artículos (MATKL)
      " Queremos forzar que en la posición 30 el dato venga vacío/erróneo con ``.
      " El COND es como el capataz que grita !Atencion Atencion, preparense que viene la mezcla, es el que da la instruccion
      "El único poder que tiene COND es mandar sobre el valor de una sola variable. Él se para al lado de la variable
      "(en la misma línea de código) y dice: «De acá no nos movemos hasta que yo decida qué valor le vamos a meter a esta caja».

      DATA(lv_matkl) = COND string( WHEN lv_posicion = 30 THEN ``
                                     ELSE `HERRAMIENTAS` ).

      out->write( |--- Iniciando análisis Posición MM: { lv_posicion } ---| ).

      " --- LA BARRERA DEL CHECK ---
      " Le decimos: 'Verifica que el Grupo de Artículos NO esté vacío'.
      " Si es Verdadero (tiene texto), pasa de largo hacia abajo.
      " Si es Falso (está vacío), frena la vuelta actual y salta a la siguiente posición.
      CHECK lv_matkl IS NOT INITIAL.

      " Lógica de negocio (Solo se ejecuta si el CHECK dio VERDADERO)

      out->write( |ÉXITO: Posición { lv_posicion } procesada. Grupo: { lv_matkl }| ).
    lv_procesadas += 1.

    ENDDO.

    out->write( |\nProceso terminado. Total posiciones exitosas: { lv_procesadas }| ).


  ENDMETHOD.

ENDCLASS.
