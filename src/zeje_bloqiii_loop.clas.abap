CLASS zeje_bloqiii_loop DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zeje_bloqiii_loop IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.



    " 1. Creamos un TIPO LOCAL para simular las columnas de la tabla (Como viste en el Bloque III)
    "CON EL BEGIN OF ESTAMOS CREANDO UN ESTRUCTURA, NO OCUPA MEMORIA, SE CREA EL MOLDE POR EJEMPLO
    TYPES: BEGIN OF ty_posicion_sd,
             posicion TYPE i,
             material TYPE string,
             cantidad TYPE i,
           END OF ty_posicion_sd.

    " 1 SE DECLARA LA VARIABLE LT (HACIENDO ENFASIS A LOCAL TABLA)
    " 2 USAMOS EL TYPE TABLE OF PARA ASIGNARLE LA ESTRUCTURA ARRIBA DECLARADA
    " ES LA SEGUNDA PARTE DEL BEGIN OF, AMBOS TRABAJAN EN EQUIPO
    " 3 CON WHIT EMPTY KEY LE DECIMOS A LA TABLA QUE LOS VALORES SE PUEDE REPETIR EN LA LS.

    DATA lt_pedido_sd TYPE TABLE OF ty_posicion_sd WITH EMPTY KEY.

    " 2. Fabricamos una TABLA INTERNA de mentira con 3 filas de datos reales de SD
    " Usamos el constructor moderno VALUE para llenarla al vuelo
    lt_pedido_sd = value #(
        ( posicion = 10 material = `TORNILLO-001` cantidad = 100 )
        ( posicion = 20 material = `TUERCA-002`    cantidad = 0   ) " <-- Ojo con esta cantidad
        ( posicion = 30 material = `ARANDELA-003`  cantidad = 50  )
    ).


    " 3. EL DIRECTOR GENERAL LOOP EN ACCIÓN
    " ORDEN: Recorre la tabla de pedidos y mete cada fila en la estructura 'ls_fila'
    LOOP AT lt_pedido_sd INTO DATA(ls_fila).

      out->write( |[SD Loop] Leyendo Posición: { ls_fila-posicion } - Mat: { ls_fila-material }| ).

      " Metemos un inspector CHECK (Tu viejo amigo) para validar el proceso
      " REGLA: Si la cantidad de la posición es cero, saltea el procesamiento
      CHECK ls_fila-cantidad > 0.

      " Lógica de negocio: Solo se ejecuta si el CHECK de arriba dio verdadero
      out->write( |   -> ÉXITO: Generando orden de preparación para { ls_fila-cantidad } unidades.| ).

    ENDLOOP. " Cierre obligatorio del bucle de tablas



*    " Variable acumuladora (Arranca en 0)
*    DATA lv_total_cantidad TYPE i.
*
*    LOOP AT lt_pedido_sd INTO DATA(ty_posicion_sd).
*
*      out->write( |[SD Loop] Leyendo Posición: { ls_fila-posicion }| ).
*
*      " Barrera de control (El CHECK)
*      CHECK ls_fila-cantidad > 0.
*
*      " --- ¡EL ACUMULADOR QUE PEDISTE! ---
*      " Si pasó el CHECK, acumulamos la cantidad en la variable
*      lv_total_cantidad += ls_fila-cantidad.
*
*      out->write( |   -> Sumando { ls_fila-cantidad } unidades al total.| ).
*
*    ENDLOOP.
*
*    " Al salir del loop, mostramos el acumulado final
*    out->write( |\n[Resultado Final] Cantidad total acumulada: { lv_total_cantidad }| ).







  ENDMETHOD.

ENDCLASS.
