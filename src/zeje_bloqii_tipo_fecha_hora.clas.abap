CLASS zeje_bloqii_tipo_fecha_hora DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zeje_bloqii_tipo_fecha_hora IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

DATA: LV_DATE TYPE D,
      LV_TIME TYPE T,
      LV_TIME2 TYPE C LENGTH 6.

    LV_DATE = cl_abap_context_info=>get_system_date( ).
      LV_TIME = cl_abap_context_info=>get_system_time( ).
      LV_TIME2 = cl_abap_context_info=>get_user_time_zone( ).

      out->write( LV_DATE ).
      out->write( LV_TIME ).
      out->write( LV_TIME2 ).


DATA lv_timestamp1 TYPE timestampl.

GET TIME STAMP FIELD lv_timestamp1.

out->write( lv_timestamp1 ).

DATA lv_timestamp2 TYPE utclong.

 lv_timestamp2 = utclong_current( ).

out->write( lv_timestamp2 ).


  ENDMETHOD.

ENDCLASS.
