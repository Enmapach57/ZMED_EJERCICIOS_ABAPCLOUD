CLASS zeje_bloqii_oper_cad_carac DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zeje_bloqii_oper_cad_carac IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    """"" Tipos de datos para cadenas de caracteres """""

*    DATA: lv_dni              TYPE string,
*          lv_proveedor(8)     TYPE c,             " CHAR CON LONGITUD 8.
*          lv_especialidad(16) TYPE c,
*          lv_oficina          TYPE c.
*
*    DATA: lv_telefono TYPE n LENGTH 10 VALUE '1172810571'.
*
*    DATA(lv_direc) = 'CATAMARCA1156'.

    """"""Concatenación"""""""""""""


*    data: lv_oficina type string value 'ENMAPACH SYSTEM CONSULTING',
*          lv_direc  TYPE STRING.
*
*          lv_direc = 'MUITO' && ` ` && 'BOA'.
*
*          CONCATENATE lv_oficina lv_direc INTO DATA(lv_ofidire) SEPARATED BY space.
*
*          out->write( lv_ofidire ).

    """"""""Concatenaciones líneas de Tablas"""""""""""


*    SELECT FROM /DMO/Flight
*        FIELDS connection_id
*    INTO TABLE @DATA(lt_itab).
*
*
*    DATA(lv_destine) = concat_lines_of( table = lt_itab sep = ` ` ).
*
*    out->write( lv_destine ).
*
*
*  ENDMETHOD.


    """""""""" Instrucción SPLIT """"""""""""""

*    DATA(lv_nombre) = 'ENMAPACH-ACADEMY-CONSULTING-SAP'.
*
*    SPLIT lv_nombre AT '-' INTO DATA(lv_nomb1)
*                                DATA(lv_nomb2)
*                                DATA(lv_nomb3)
*                                DATA(lv_nomb4).
*
*    out->write( lv_nomb1 ).
*    out->write( lv_nomb2 ).
*    out->write( lv_nomb3 ).
*    out->write( lv_nomb4 ).




    """"""""""" SHIFT """"""""""""""
*
*    " Simulamos un número de material tal como viene de la tabla MARA
*    DATA(lv_matnr) = '000000000000100-200'.
*
*    " Eliminamos todos los ceros ('0') que estén al principio (LEADING)
*    SHIFT lv_matnr LEFT DELETING LEADING '0'.
*
*    out->write( |Material para reporte: { lv_matnr }| ).
*    " Resultado impreso: "100-200"
*
*    DATA: lv_ebeln TYPE c LENGTH 10 VALUE '  45000123'. " Tiene espacios al inicio
*
*    " Eliminamos los espacios en blanco sobrantes a la izquierda
*    SHIFT lv_ebeln LEFT DELETING LEADING space.
*
*    out->write( |Número de Pedido MM: { lv_ebeln }| ).
*    " Resultado impreso: "45000123"

    """"""""USO DE FUNCION CON SHIFT LEFT RIGHT""""""""

*    DATA(lv_material) = '000000000000100-200'.
*
*    lv_material = shift_left( val = lv_material sub = '0' ).
*
*    " Imprime el resultado de la función directamente sin destruir la variable lv_material
*    out->write( lv_material ).
*
*    " Si revisas lv_material aquí, sigue valiendo '000000000000100-200'


    " VEAMOSLO EN LA VIDA REAL CON EL RECORRIDO DE 3 POSICIONES, PARA SABER SI DEJA LA VARIABLE EN MEMORIA POR SIEMPRE O NO

    " Simulamos una tabla con 3 posiciones del mismo material
    DATA(lt_materiales) = VALUE string_table(
        ( `000000000000100-200` )
        ( `000000000000200-200` )
        ( `000000000000300-200` )
    ).


    " Entramos en el LOOP
*    LOOP AT lt_materiales INTO DATA(lv_material).
*
*      " En cada vuelta, lv_material entra CON TODOS SUS CEROS.
*      " La función limpia el valor solo para mostrarlo, pero NO toca la variable.
*      out->write( shift_left( val = lv_material sub = '0' ) ). " Muestra: 100-200
*
*      " Si imprimimos la variable abajo, verás que conserva los ceros en cada vuelta
*      out->write( lv_material ). " Muestra: 000000000000100-200
*
*    ENDLOOP.

*
*
*    LOOP AT lt_materiales INTO DATA(lv_otro).
*      SHIFT lv_otro LEFT DELETING LEADING '0'.
*        out->write( lv_otro ).
*    ENDLOOP.
*
*    out->write( lt_materiales ).


"""STRLEN NUMOFCHAR""""""""

" SUPONGAMOS QUE UN USUARIO DE COMPRAS CREA UN MATERIAL Y POR ERROR DEJA ESPACIO AL FINAL EN LA DESCRIPCION
" USAMOS COMILLA INVERTIDAS PARA SIMULAR EL TIPO STRING REAL DE LA BASE DE DATOS.

DATA(lv_maktx) = `Tornillo Cabeza Hexagonal   `. " Tiene 25 letras + 3 espacios que suman justo  caracteres

" 2. Queremos saber el tamaño del texto para validar si entra en una etiqueta de despacho.


" CASO A: Usando STRLEN (Mide TODO el string incluyendo los espacios fantasmas)
DATA(lv_largo_total) = strlen( lv_maktx ).
out->write( |STRLEN dice que mide: { lv_largo_total }| ).
" Resultado en consola: 28 (Te cuenta los 3 espacios vacíos del final)


" CASO B: Usando NUMOFCHAR (Mide solo los caracteres reales que le importan a MM)
DATA(lv_letras_reales) = numofchar( lv_maktx ).
out->write( |NUMOFCHAR dice que mide: { lv_letras_reales }| ).
" Resultado en consola: 25 (Ignora los espacios vacíos del final)

"""""Función INSERT y REVERSE """"""""""""

DATA(LV_PEDIDO) = INSERT( VAL = '4500002548' SUB = 'INV' OFF = 3 ).
out->write( LV_PEDIDO ).


"REVERSE

DATA(LV_SOLPED) = '34490912'.

LV_PEDIDO = REVERSE( VAL = LV_SOLPED ).
out->write( LV_PEDIDO ).



      ENDMETHOD.

ENDCLASS
