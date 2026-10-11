CLASS zeje_bloqiii_try_endtry DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zeje_bloqiii_try_endtry IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " 1. Simulamos datos reales de una posición de factura de SD
    DATA(lv_monto_total) = 1500. " El camión lleva 1500 USD en mercancía
    DATA(lv_cantidad)    = 0.    " <-- ¡ERROR EN LOGÍSTICA! Cargaron cantidad cero.
    DATA lv_precio_unit  TYPE f.


    " 2. PROTEGEMOS EL PROCESO CON EL INSPECTOR TRY
    TRY.
        " El sistema intentará hacer la división matemática peligrosa
        lv_precio_unit = lv_monto_total / lv_cantidad.

        " Si la división es exitosa (cantidad > 0), el programa pasa por aquí:
        out->write( |[SD Facturación] Precio Unitario calculado: { lv_precio_unit } USD.| ).

        " 🚧 EL ESCUDO DE SEGURIDAD (CATCH) 🚧
        " Si la cantidad fue 0, salta la excepción exacta del sistema: cx_sy_zerodivide
      CATCH cx_sy_zerodivide INTO DATA(lx_error_sd).

        " En lugar de tirar un DUMP y romper SAP, atrapamos el error y alertamos al funcional:
        out->write( '[SD ALERTA CRÍTICA]: Error de división por cero detectado en la posición.' ).
        out->write( '   -> Motivo: La cantidad en la factura es 0. Revisar documento de entrega.' ).

    ENDTRY. " Cierre obligatorio del bloque de protección

    out->write( '\n[Proceso SD]: El programa continuó corriendo de forma segura hacia abajo.' ).


  ENDMETHOD.

ENDCLASS.
