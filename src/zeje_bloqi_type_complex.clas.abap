CLASS zeje_bloqi_type_complex DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zeje_bloqi_type_complex IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*  TYPES: BEGIN OF TY_PEDIDO,   "DECLARACION DE ESTRUCTURA TY_PEDIDO, EJEMPLO EL NOMBRE DE LA TABLA
*         EBELN TYPE EBELN,     "ESTOS SON LOS CAMPOS DE ESA TABLA
*         MATNR TYPE MATNR,     "ESTOS SON LOS CAMPOS DE ESA TABLA
*         TEX_MAT  TYPE STRING, "ESTOS SON LOS CAMPOS DE ESA TABLA
*         MENGE TYPE I,         "ESTOS SON LOS CAMPOS DE ESA TABLA
*
*         END OF ty_pedido.      "SE CIERRA LA DECLARACIO DE CAMPOS
*
*    DATA LS_PEDIDO TYPE ty_pedido.  "DECLARACION DE VARIABLE ASIGANADA O QUE VIVIRA DENTRO DE LA ESTRUCTURA"
*
*
*    ls_pedido = VALUE #( EBELN = '4500001234'   " SE LE DA VALORES A ESOS CAMPOS
*                         MATNR = '000010001234'
*                         tex_mat = 'ABAP CLOUD'
*                         MENGE = '00010' ).
*
*   OUT->write( ls_pedido ).                     "SE IMPRIMEN LOS VALORES ASIGNADOS A LAS VARIABLES Y VIVIENDO EN LA ESTRUCTURA

   TYPES: BEGIN OF ENUM ty_estado_pedido,
          CERRADO,
          CANCELADO,
          EN_ESPERA,
          EN_PROCESO_LIBERACION,

          END OF ENUM ty_estado_pedido.


DATA lv_dato_externo TYPE string.
*lv_dato_externo = 'CERRADox'.   " simula lo que mandó el satélite o tipeó el usuario


DATA ls_estado_pedido TYPE ty_estado_pedido.

CASE lv_dato_externo.
  WHEN 'CERRADO'.
    ls_estado_pedido = cerrado.
  WHEN 'CANCELADO'.
    ls_estado_pedido = cancelado.
  WHEN 'EN_ESPERA'.
    ls_estado_pedido = en_espera.
  WHEN 'EN_PROCESO_LIBERACION'.
    ls_estado_pedido = en_proceso_liberacion.
  WHEN OTHERS.
    out->write( |Valor '{ lv_dato_externo }' no es un estado válido| ).
ENDCASE.



     OUT->write( ls_estado_pedido ).

  ENDMETHOD.

ENDCLASS.
