CLASS zeje_bloqiii_if_while DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zeje_bloqiii_if_while IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " 1. Variables de control del proceso de SD
    DATA(lv_capacidad_max) = 20000. " El camión aguanta 20,000 kg
    DATA(lv_peso_actual)    = 0.     " El camión arranca vacío
    DATA(lv_contador_pallets) = 0.

DO 7 TIMES.
    " 2. El Director General WHILE en acción
    " ORDEN: 'Da vueltas y carga MIENTRAS el peso actual + el siguiente pallet sea menor o igual al máximo'
    WHILE lv_peso_actual + 3500 <= lv_capacidad_max.

      " Consecuencia de la vuelta: Sumamos un pallet y aumentamos el peso
      lv_contador_pallets += 1.
      lv_peso_actual       += 3500.

      out->write( |[Carga SD] Vuelta { lv_contador_pallets }: Pallet cargado. Peso actual: { lv_peso_actual } kg.| ).

    ENDWHILE. " Cierre del bucle condicional
ENDDO.
    " 3. Resultado final al salir del ciclo
    out->write( |\n[Portería SD] ¡Proceso terminado! El camión sale con { lv_contador_pallets } pallets y un peso total de { lv_peso_actual } kg.| ).



ENDMETHOD.


ENDCLASS.
