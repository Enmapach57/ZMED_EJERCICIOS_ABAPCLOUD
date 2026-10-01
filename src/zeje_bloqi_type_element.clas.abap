CLASS zeje_bloqi_type_element DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES   IF_OO_ADT_CLASSRUN.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zeje_bloqi_type_element IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

**   DATA: lv_string type string,             "VARIABLE DE TIPO STRING
*         lv_int     type i VALUE 20466298,
*         lv_date    TYPE d.
*
*      lv_string = '34490912'.
*      lv_date = '20260929'.
*
*    out->write( lv_string ).
*    out->write( lv_date ).

**   DATA: lv_npedido TYPE ebeln,
*          lv_nposicion TYPE numc5,
*          lv_cant_pedida type p length 8 decimals 2,
*          lv_valor_total type p length 10 decimals 2,
*          lv_tasa_iva type menge_d,
*          lv_texto_conf type string.
*
*     lv_npedido = '2034490912'.
*     lv_cant_pedida = '10.50'.
*     lv_valor_total = '2050'.
*     lv_texto_conf = 'CON ENTREGA PRONTA'.
*
*   out->write( lv_npedido ).
*   out->write( lv_cant_pedida ).
*   out->write( lv_valor_total ).
*   out->write( lv_texto_conf ).

    DATA: lv_npedido TYPE ebeln,
          lv_nposicion TYPE ebelp,
          lv_cant_pedida type menge_d, "p length 8 decimals 2,
          lv_valor_total type wrbtr, "p length 10 decimals 2,
          lv_tasa_iva type p decimals 2 VALUE '21',
          lv_texto_conf type string.

     lv_npedido = '2034490912'.
     lv_cant_pedida = '10.50'.
     lv_valor_total = '2050'.
     lv_tasa_iva = '21'.
     lv_texto_conf = 'CON ENTREGA PRONTA'.

   out->write( lv_npedido ).
   out->write( lv_cant_pedida ).
   out->write( lv_valor_total ).
   out->write( lv_tasa_iva ).
   out->write( lv_texto_conf ).

  ENDMETHOD.



ENDCLASS.
