CLASS zeje_bloqii_oper_cad_caracii DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zeje_bloqii_oper_cad_caracii IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    """"""" FUNCION OVERLAY """""""""""""""""""
*
*    " 1. Imaginemos que los datos a completar con unas mascara pre-establecida de centros, se deba pasar a materiales por almacen.
*    " entonces con overlay se define las posiciones fijas del Centro, y rellena los espcacios vacios del Almacén
*
*    DATA(lv_mascara_mm) = 'C001-A002-PROY9999'.
*
*    " 2. El comprador crea un pedido pero solo ingresa el Centro nuevo (C777) y deja espacios en blanco
*
*
*    DATA(lv_datos_usuario) = 'C777-____-________'. " Los '_' simulan espacios o caracteres vacíos
*
*    " --- CASO 1: OVERLAY MODERNO PARA ABAP CLOUD ---
*    " Queremos que los huecos vacíos se rellenen automáticamente de la mascara de centros (lv_mascara_mm)
*    " La función overlay toma lv_datos_usuario y le encima lv_mascara_mm en los espacios no definidos
*
*
*    OVERLAY lv_datos_usuario WITH lv_mascara_mm ONLY '_'.
*
*    out->write( |Etiqueta MM generada: { lv_datos_usuario }| ).
*    " Resultado en consola: C777-A002-PROY9999
*    " Mantuvo el C777 que tipeó el usuario, pero parchó el resto con la máscara estándar de MM

    """"""  Función SUBSTRING """"""""""""""""""""""

*    " 1. Declaramos un código de material compuesto de SAP MM
*    DATA(lv_codigo_material) = `HERR-TORN-0052`. " HERR = Herramientas, TORN = Tornillos, 0052 = CAJON
*
*    " 2. Queremos extraer únicamente todo lo que esta antes del guion
*
*    DATA(lv_categoria) = substring_before( val = lv_codigo_material sub = '-' ).
*
*
*    " 3. Queremos extraer únicamente todo lo que esta despues del guion
*
*    DATA(lv_num_cajon) = substring_after( val = lv_codigo_material sub =  '-' occ = 2 ).

    "OPCION 1 EN UNA MISMA VARIABLE

*    DATA(lv_subtipo) = substring_after( "Es muy confuso, cuando hay alguien en el medio de lo que quieres sacar, tienes que hacerlo en dos cortes
*                                        "un primer corte con el after sacando el segundo guin,
*                         VAL = substring_before( VAL = lv_codigo_material SUB = '-' OCC = 2 )
*                         SUB = '-' ).
*
*     "OPCION 2 EN UNA MISMA VARIABLE
*
*     DATA(lv_subtipo1) = substring_after( val = lv_codigo_material sub = '-'  ).
*     DATA(lv_subtipo2) = substring_before( val = lv_subtipo1 sub = '-' ).
*
*
*    " 4. Mandamos los resultados directo a la consola de ADT
*    out->write( |Material Completo: { lv_codigo_material }| ).
*    out->write( |Categoría extraída: { lv_categoria }| ). " Imprime: HERR
*    out->write( |Subtipo extraído:   { lv_subtipo2 }| ).   " Imprime: TORN
*    out->write( |Numero de cajon:   { LV_NUM_CAJON }| ).   " Imprime: 0052


    """""""""""""FIND""""""""""""""""""""

*    " 1. El usuario de almacén ingresa el código de caja por error con un guion: '00-52'
*    DATA(lv_caja_error)  = `00-52`.
*    DATA(lv_caja_ok)     = `0052`.
*
*    " El patrón de caracteres prohibidos para esta validación (letras y símbolos)
*    DATA(lv_prohibidos) = `ABCDEFGHIJKLMNÑOPQRSTUVWXYZ-`.
*
*
*    " --- CASO 1: Validando el código ERRÓNEO ---
*    " find_any_of busca si CUALQUIERA de los caracteres prohibidos está en 'lv_caja_error'
*    " Va a encontrar el guion ('-') y nos va a devolver su posición (mayor o igual a 0)
*    IF find_any_of( val = lv_caja_error sub = lv_prohibidos ) >= 0.
*      out->write( 'Validación MM: Error, la caja contiene caracteres prohibidos o guiones.' ).
*    ENDIF.
*
*
*    " --- CASO 2: Validando el código CORRECTO ---
*    " En 'lv_caja_ok' no hay ninguna letra ni guion, por lo que find_any_of devuelve -1
*    IF find_any_of( val = lv_caja_ok sub = lv_prohibidos ) = -1.
*      out->write( 'Validación MM: Éxito, el código de caja es puramente numérico.' ).
*    ENDIF.

    """""""""" FUNCION REPLACE """"""""""""""""""

*    " Tu variable de la imagen
*    DATA(lv_codigo_material) = `HERR-TORN-0052`.
*
*
*    " Usamos REPLACE con expresiones regulares
*    " El patrón '\d{4}\$' significa: Busca los 4 dígitos numéricos (\d{4}) que estén al final (\$) del texto
*    DATA(lv_material_oculto) = replace( val   = lv_codigo_material
*                                       pcre = `\d{4}$`
*                                       with  = `****` ).
*
*    " Mandamos los resultados a la consola de ADT
*    out->write( |Material Original: { lv_codigo_material }| ). " Sigue originalito: HERR-TORN-0052
*    out->write( |Material Protegido: { lv_material_oculto }| ). " Imprime: HERR-TORN-****

    """""""" FUNCION PCRE REGEX """""""""""

*    " Opción 1: variable nueva, el material queda sin guion, a diferencia del replace que saca de un texto un caracter
*    " el replace con pcre quita todo lo que venga en un patron regex, porque si no se sabe que basura puede venir
*    DATA(lv_limpio) = replace( val = lv_codigo_material pcre = `[^A-Za-z0-9]+` with = ` ` occ = 0 ).
*
*    out->write( |Material queda original: { lv_limpio }| ). " Imprime: HERR-TORN-****
*
*
*    " Opción 2: sin variable nueva,
*    " replace con sub: reemplaza un texto exacto (ej. el guion)
*    " replace con pcre: reemplaza todo lo que NO sea letra ni número,
*    " útil cuando no sabés qué símbolos pueden venir
*
*    lv_codigo_material = replace( val = lv_codigo_material pcre = `[^A-Za-z0-9]+` with = ` ` occ = 0 ).
*
*    out->write( |Material se sustituye: { lv_codigo_material }| ). " Imprime: HERR-TORN-****


    """"""" Operadores de comparación """""""""""""""""


*    " 1. El usuario ingresa un código de almacén de MM
*    DATA(lv_almacen_mm) = 'A00X'. " Almacén incorrecto porque tiene una X
*
*    " 2. Evaluamos con NP (No Pattern)
*    " Le decimos: 'Si el almacén NO CONTIENE la letra X en ninguna parte...'
*    IF lv_almacen_mm NP '*E*'.
*      out->write( |Almacén { lv_almacen_mm } -> Formato Válido| ).
*    ELSE.
*      " Como el texto SÍ contiene la X, el NP da falso y cae aquí:
*      out->write( |Almacén { lv_almacen_mm } -> ERROR: Contiene la letra prohibida X| ).
*    ENDIF.

*OPCION CON TYPE BOOLEANO, SI O NO

*    " 1. Declaramos la variable booleana que controlará el estado
*    DATA lv_necesita_aprobacion TYPE abap_bool.               "al declar el type_bool estamos queriendo traer un si o no
*    " en un juego de variables para saber si se cumple o no una cosa
*
*    DATA(lv_monto_pedido) = 150000. " Monto del pedido de MM
*
*    " 2. Evaluamos la condición de negocio
*    IF lv_monto_pedido > 100000.
*      " Si el pedido es caro, marcamos la bandera como VERDADERO
*      lv_necesita_aprobacion = abap_true.
*    ELSE.
*      lv_necesita_aprobacion = abap_false.
*    ENDIF.
*
*
*    " --- Más adelante lo vemos en el proyecto monitor de atenciones medicas MM ---
*    " 3. Evaluamos la variable booleana directamente en el IF
*    IF lv_necesita_aprobacion = abap_true.
*      out->write( 'Logística MM: Pedido bloqueado. Requiere aprobación del Gerente.' ).
*    ELSE.
*      out->write( 'Logística MM: Pedido aprobado automáticamente. Liberando para despacho.' ).
*    ENDIF.

    """"""""""" Repetición de strings """"""""""""""""""""

*    " 1. Línea separadora para ordenar la salida del monitor
*    out->write( repeat( val = `-` occ = 10 ) ).
*
*    " 2. Completar con ceros a la izquierda (relleno)
*    DATA(lv_matnr) = `100`.
*    DATA(lv_relleno) = repeat( val = `0` occ = 6 DIV strlen( lv_matnr ) ) && lv_matnr. "SE REPITE 6 VECES 0, STRLEN OBTIENE EL VALOR DE LA VARIABLE O FIJO
*                                                                                       " Y DEL VALOR SE HACE UNA OPERACION NUMERICA
*    " 000000000000000100
*    out->write( lv_relleno ).
*
*    " 3. Enmascarar: parte visible + asteriscos (mezcla con concatenación)
*    DATA(lv_oculto) = substring( val = `HERR-TORN-0052` len = 10 ) && repeat( val = `*` occ = 4 ).
*    " HERR-TORN-****
*    out->write( lv_oculto ).


    """""""" FUNCION ESCAPE """""""""""""""""""}

    " 1. Definimos nuestro texto con caracteres conflictivos (espacios y un ampersand)
    DATA(lv_nombre_original) = 'Juan Pérez & Cía.'.

    " 2. ESCAPAMOS el texto para que sea seguro usarlo en una URL
    DATA(lv_nombre_seguro) = escape( val    = lv_nombre_original
                                     format = cl_abap_format=>e_url_full ).

    " 3. Lo mostramos en la consola de Eclipse
    out->write( lv_nombre_seguro ).


  ENDMETHOD.

ENDCLASS.
