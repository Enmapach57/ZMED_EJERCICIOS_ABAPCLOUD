CLASS zeje_bloqiii_if_switch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zeje_bloqiii_if_switch IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.


    " 1. Variable local que simula el Estado actual del Camión en el circuito de SD
    " Cambia este valor para experimentar las distintas fases del proceso: 'E', 'B', 'C' o 'S'
    DATA(lv_estado_camion) = 'Z'.

    " 2. El Ingeniero SWITCH evalúa la variable y asigna la orden en una sola línea
        " El camion llega y grita !heyyy heyyyy! aqui esta el camion, donde lo mando?
    DATA(lv_instruccion_porteria) = SWITCH string( lv_estado_camion
                                                    WHEN 'E' THEN `ENTRADA: Dirigirse a Báscula 1 para Pesaje Inicial.`
                                                    WHEN 'B' THEN `BÁSCULA: Pesaje OK. Avanzar a Zona de Carga / Bahía asignada.`
                                                    WHEN 'C' THEN `CARGA: Proceso de carga finalizado. Retornar a Báscula para Control.`
                                                    WHEN 'S' THEN `SALIDA: Pesaje Final OK. Factura y Remito impresos. Liberar Camión.`
                                                    ELSE `ERROR: Estado no identificado. Camión debe permanecer en zona de espera.` ).

    " 3. Imprimimos el resultado directo en tu consola
    out->write( |[Circuito SD] Estado del Camión: { lv_estado_camion }| ).
    out->write( |[Circuito SD] Instrucción:        { lv_instruccion_porteria }| ).


  ENDMETHOD.

ENDCLASS.
