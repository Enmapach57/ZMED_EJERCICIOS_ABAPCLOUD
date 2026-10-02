CLASS zeje_bloqi_variables DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zeje_bloqi_variables IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA: lv_clasepedido TYPE  string, "DECLARACION DE VARIABLE
          lv_tipopedido  TYPE string,
          lv_numposicion TYPE i.

    lv_clasepedido = 34490912.
    lv_numposicion = 00010.
    lv_tipopedido = 'K,F'.


    CONSTANTS: lc_clasesolped TYPE string VALUE 'zclas', "DECLARACION DE CONSTANTE CON EL VALOR OBLIGATORIO
               lc_tiposolped  TYPE string VALUE 'zsolp', "DECLARACION DE CONSTANTE CON EL VALOR OBLIGATORIO
               lc_numposicion TYPE i VALUE 0.            "DECLARACION DE CONSTANTE CON EL VALOR OBLIGATORIO

    lv_clasepedido = lc_clasesolped.                    " SE ASIGNA A LA CONSTANTE EL VALOR DE LA VARIABLE
    lv_tipopedido = lc_tiposolped.                      " SE ASIGNA A LA CONSTANTE EL VALOR DE LA VARIABLE
    lv_numposicion = lc_numposicion.                    " SE ASIGNA A LA CONSTANTE EL VALOR DE LA VARIABLE


    DATA(PRECIO_PEDIDO) = '20500,15'.                   " DECLARACION DE VARIABLE EN LINEA, EL CONPILADOR TRADUCE EL TYPE
    DATA(FACT_PEDIDO) = '2000,15'.

    out->write( | value 1 = { lv_clasepedido } value 2 = { lv_numposicion } value 3 = { lv_tipopedido } | ).
    OUT->write( precio_pedido ).
    OUT->write( fact_pedido ).

  ENDMETHOD.

ENDCLASS.
