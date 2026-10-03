CLASS zeje_bloqii_conv_tipos_datos DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zeje_bloqii_conv_tipos_datos IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    """"""CONVERSIONS"""""""

    DATA: lv_date    TYPE d,
          lv_decimal TYPE p LENGTH 5 DECIMALS 2.

    DATA: lv_string TYPE string VALUE 'PEDIDO',    " VARIABLE CON VALOR UNICO DE NUMEROS
          lv_int    TYPE i.                           " VARIBALE DE TIPO ENTERO

*    lv_string = '102026'.                          "SE LE ASIGNA UN NUEVO NUMERICO A LA VARIABLE STRING QUE YA TIENE VALOR DE LETRAS
    lv_int  =  lv_string.                          " VARIABLE DATE TIENE NUEVO VALOR O EL VALOR DE STRING
    out->write( lv_int ).

*    lv_string = '34490912'.
*    lv_decimal = lv_string.
*
*     out->write( lv_decimal ).
*
*    lv_int = lv_string.                               " LE DAMOS VALOR A LA VARIABLE DE TIPO ENTERO
*
*    out->write( | PEDIDO = { lv_int } | ).
*
*    """"""""
*
*    lv_string = '19990515'.                           "SE LE ASIGNA UN NUEVO VALOR EN LINEA A LA VARIABLE STRING
*    lv_date =    lv_string.
*
*    out->write( lv_string ).
*    out->write( | DATE = { lv_date DATE = USER } | ). "SE ASIGNA DATE USER PARA TOMAR LA FECHA DEL SISTEMA

***


*    lv_int = lv_string.                             " LE DAMOS VALOR A LA VARIABLE ENTERA
*
*    out->write( | PEDIDO = { lv_string } | ).
*
*    lv_string = '34490912'.
*    "SE LE ASIGNA UN NUEVO VALOR EN LINEA A LA VARIABLE NUMPEDIDO, PERO DA ERROR PORQUE LOS CHAR NO SE COMBIERTEN A NUMEROS
*    lv_string =    lv_string.                         " VARIABLE NUMPEDIDO TIENE NUEVO VALOR O EL VALOR DE STRING
*
*
*    out->write( lv_string ).
*    out->write( | DATE = { lv_string } | ).

*    lv_string = '34490912'.
*    lv_decimal = lv_string.

*    lv_date = cl_abap_context_info=>get_system_date(  ).
*    out->write( lv_date ).
*
*
*    lv_int = lv_date.                       "HACE LA CONVERSION DE LA FECHA
*    out->write( lv_int ).




  ENDMETHOD.

ENDCLASS.
