CLASS zeje_bloqii_calc_operaciones DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zeje_bloqii_calc_operaciones IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA: lv_num_a TYPE i VALUE 35,
          lv_num_b TYPE i VALUE 45,
          lv_total TYPE p LENGTH 8 DECIMALS 2.
*
* """"""" SUMA """"""""""

*  LV_TOTAL = lv_num_a + lv_num_b.
*
* OUT->write( | NUMBER A = { lv_num_a } NUMBER B = { lv_num_b } TOTAL = { lv_total } | ).
*
*"+=
*
*LV_TOTAL += 10.
*
*OUT->write( LV_TOTAL ).


    """"""""RESTA""""""""""""""""

*
*    " +
*    lv_total = lv_num_a - lv_num_b.
*
*    out->write( | NUMBER A = { lv_num_a } NUMBER B = { lv_num_b } TOTAL = { lv_total } | ).
*
*    "+=
*
*    lv_total = lv_num_a - 4.
*
*    out->write( lv_total ).
*
*
*
*    CLEAR lv_total.

    """""" MULTIPLICACION"""""""""""


*    lv_total = lv_num_a * lv_num_b.
*
*    out->write( lv_total ).
*
*    MULTIPLY   lv_total BY 10.
*
*    MULTIPLY lv_total BY lv_num_a.
*
*    out->write( lv_total ).


    """"" DIVISION """""""""""""

*    lv_total = lv_num_a / lv_num_b.
*
*    out->write( | NUMBER A = { lv_num_a } NUMBER B = { lv_num_b } TOTAL = { lv_total } | ).
*
*    DIVIDE lv_total BY 4.
*
*    CLEAR lv_total.
*
*    lv_total = ( lv_num_a + lv_num_b ) / 2.
*
*    out->write( | NUMBER A = { lv_num_a } NUMBER B = { lv_num_b } TOTAL = { lv_total } | ).

    """""" MOD """""""""

*    lv_total = lv_num_a MOD lv_num_b.
*
*    out->write( | NUMBER A = { lv_num_a } NUMBER B = { lv_num_b } TOTAL = { lv_total } | ).


"""""" EXPO """""""

*lv_num_a = 2.                               "SE ASIGNA VALOR A LA VARIABLE EN LINEA
*
*out->write( | NUMBER A VALOR = { lv_num_a } | ).
*
*lv_num_a = lv_num_a ** 2.                      " SE AGREGA LA EXPONENCIACION CON ** Y EL VALOR NUMERICO
*out->write( | NUMBER A EXPONER= { lv_num_a } | ).
*
*
*
*DATA(LV_EXP) = 8.                               "SE DECLARA VARIABLE EN LINEA
*
*lv_num_a = lv_num_a ** LV_EXP.                  " SE AGREGA LA EXPONENCIACION PERO ENTRE VARIABLES .
*out->write( | NUMBER A EXPONER II= { lv_num_a } | ).

"""""" SQRT """""""""""

lv_num_a = SQRT( 25 ).
out->write( | RAIZ CUADRADA= { lv_num_a } | ).

lv_num_a = 9.

lv_num_a = SQRT( lv_num_a ).
out->write( | RAIZ CUADRADA= { lv_num_a } | ).




  ENDMETHOD.

ENDCLASS.
