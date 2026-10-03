CLASS zeje_bloqii_trunca_redondeo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zeje_bloqii_trunca_redondeo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*
*    DATA: lv_string  TYPE string VALUE 'PEDIDO',    " VARIABLE CON VALOR UNICO DE NUMEROS
*          lv_int     TYPE i,
*          lv_char    TYPE c LENGTH 2,
*          lv_decimal TYPE p LENGTH 3 DECIMALS 4,
*          lv_date    TYPE d.
*
*
*    """"""""""truncamiento""""""""""""""""""""""""""
*
*    lv_char = lv_string.
*    out->write( lv_char ).
*
*    """""""" redondeo """""""""""""""
*
*    lv_decimal = 1 / 6.
*     out->write( lv_decimal ).

DATA: lv_hora_entrada TYPE p LENGTH 4 DECIMALS 2 VALUE '08.00',
      " Esta es la hora en que el profesional empezó: las 8 en punto.

      lv_hora_salida  TYPE p LENGTH 4 DECIMALS 2 VALUE '15.83',
      " Esta es la hora en que terminó: 15 y 83 centésimos (un número inventado para el ejemplo).

      lv_horas_calc   TYPE p LENGTH 4 DECIMALS 2,
      " Esta variable SÍ puede guardar decimales. Es "la jarra". Todavía está vacía.

      lv_horas_pago   TYPE i.
      " Esta variable es un NÚMERO ENTERO. Es "la bandeja de hielo". Jamás va a tener decimales,
      " no importa qué le pongas adentro - su molde no tiene espacio para eso.

lv_horas_calc = lv_hora_salida - lv_hora_entrada.
" Restamos: 15.83 - 8.00 = 7.83. Este resultado SÍ tiene decimales, y lv_horas_calc lo guarda bien,
" porque es la jarra, tiene espacio para eso.

out->write( lv_horas_calc ).
" Esto va a mostrar en la consola: 7.83 (con decimales, tal como quedó guardado).

lv_horas_pago = lv_horas_calc.
" Ahora intentamos pasar el 7.83 a la bandeja de hielo (la variable entera).
" Como la bandeja no tiene espacio para el ".83", el sistema hace lo único que puede hacer:
" redondea. Como 0.83 está muy cerca de 1 (más cerca que de 0), el resultado sube a 8.

out->write( lv_horas_pago ).
" Esto va a mostrar en la consola: 8 (sin ningún decimal).

  ENDMETHOD.

ENDCLASS.
