CLASS zeje_bloqiv_in_regis_tablas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zeje_bloqiv_in_regis_tablas IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_atenciones,
             uid              TYPE string,
             fecha_inicio     TYPE d,
             fecha_fin        TYPE d,
             hora_inicio      TYPE t,
             hora_fin         TYPE t,
             centro_medico    TYPE string,
             estado_turno     TYPE string,
             n_afiliado       TYPE string,   " llave a ty_paciente
             cuit_profesional TYPE string,   " llave a ty_profesional
             practica_codigo  TYPE string,   " llave a ty_practica
           END OF ty_atenciones.


    DATA: LT_atenciones TYPE STANDARD TABLE OF ty_atenciones,
          ls_atenciones TYPE ty_atenciones.

    TYPES: BEGIN OF ty_atencion_envio_sap,
             uid              TYPE string,
             fecha_inicio     TYPE d,
             fecha_fin        TYPE d,
             hora_inicio      TYPE t,
             hora_fin         TYPE t,
             centro_medico    TYPE string,
             estado_turno     TYPE string,
             n_afiliado       TYPE string,
             cuit_profesional TYPE string,
             practica_codigo  TYPE string,
             paciente_nombre  TYPE string,
             cant_horas_txt   TYPE string,
           END OF ty_atencion_envio_sap.

    DATA ls_atencion_envio_sap TYPE ty_atencion_envio_sap.
    DATA lt_atencion_envio_sap TYPE STANDARD TABLE OF ty_atencion_envio_sap.


    TYPES lty_atenciones LIKE LT_atenciones.

*    LT_atenciones = VALUE #(
*                         ( uid               = '34490912'
*                           fecha_inicio      = '20261016'
*                           fecha_fin         = '20261016'
*                           hora_inicio       = '214800'
*                           hora_fin          = '220600' )
*                                                            ).
    "    out->write( LT_atenciones ).

*__________INSERTAR REGISTROS CON ANIDADAS____________*

    ls_atenciones-uid           = '34490912'.    "Otra forma de hacerlo es con conexiones
    ls_atenciones-fecha_inicio  = '20261016'.  "Anidadas, con la estructura-campo y su valor
    ls_atenciones-fecha_fin     = '20261016'.  "Recordar que los campos tienen que estar declarados
    ls_atenciones-hora_inicio   = '230000'.    "en el type con begin of.
    ls_atenciones-hora_fin      = '232800'.
    ls_atenciones-practica_codigo = 'Ginecologia'.
    INSERT ls_atenciones INTO TABLE lt_atenciones. " Con insert into table a la LT declarada
    "previamente
    "out->write( LT_atenciones ).

    "CLEAR lt_atenciones.
*___________ CON INSERTE VALUE SIN DEPENDER DE ESTRUCTURAS DE POR MEDIO, ES MAS LIMPIO

    INSERT VALUE #(
    uid           = '34490913'
    fecha_inicio  = '20261017'
    fecha_fin     = '20261017'
    hora_inicio   = '114500'
    hora_fin      = '121800'
    practica_codigo = 'Cardiologia'  ) INTO TABLE lt_atenciones.  " INGRESAMOS VALORES DIRECTAMENTE SIN DEPENDER DE UNA ESTRUCTURA
    " COMO EN LOS DEMAS EJEMPLO,

    "INSERT INITIAL LINE INTO TABLE lt_atenciones.                "OPCIONAL, SOLO SI SE QUIERE AÑADIR UNA LINEA EN BLANCO

    "out->write( LT_atenciones ).


*___________ INSERTAR FILAS EN UN INDICE ESPECIFICO_______

    INSERT VALUE #(
        uid           = '34490914'
        fecha_inicio  = '20261017'
        fecha_fin     = '20261017'
        hora_inicio   = '130000'
        hora_fin      = '131900'
        practica_codigo = 'Cardiologia'  ) INTO lt_atenciones INDEX 1.


    out->write( LT_atenciones ).


*____________ AÑADIR REGISTROS CON APPEND_______________

    ls_atenciones-uid           = '34490915'.
    ls_atenciones-fecha_inicio  = '20261017'.
    ls_atenciones-fecha_fin     = '20261017'.
    ls_atenciones-hora_inicio   = '170000'.
    ls_atenciones-hora_fin      = '173100'.
    ls_atenciones-practica_codigo = 'Urologia'.

    APPEND ls_atenciones TO lt_atenciones.     "La diferencia con INSERT es que APPEND siempre agrega
    "al final. No admite INDEX, y solo sirve para tablas standard.

    "APPEND INITIAL LINE TO lt_atenciones.

    APPEND VALUE #(
    uid           = '34490916'
    fecha_inicio  = '20261017'
    fecha_fin     = '20261017'
    hora_inicio   = '190000'
    hora_fin      = '194600'
    practica_codigo = 'OBSTETRA'
                                    ) TO lt_atenciones.

    out->write( LT_atenciones ).


**____________ USO DEL CORRESPONDING_______________*
*
    MOVE-CORRESPONDING lt_atenciones TO lt_atencion_envio_sap.
*
    lt_atencion_envio_sap = CORRESPONDING #( LT_atenciones ).
*
*
*
*
******** MOVE CORRESPONDING CON EL USO DE KEEPING TARGET LINES.
*
*MOVE-CORRESPONDING lt_atenciones TO lt_atencion_envio_sap KEEPING TARGET LINES.
*
*out->write( data = lt_atencion_envio_sap name = `lt_atencion_envio_sap` ).


**___________READ TABLE CON INDICE Y CLAVE_________________*

    "READ TABLE lt_atenciones INTO ls_atenciones INDEX 2.
*    out->write( data = sy-subrc name = `sy-subrc` ).
*    out->write( data = ls_atenciones name = `ls_atenciones` ).


    READ TABLE lt_atenciones INTO DATA(ls_atencion_ginecologia) WITH KEY practica_codigo = 'Ginecologia'.

    out->write( data = sy-subrc                  name = `sy-subrc` ).
    out->write( data = ls_atencion_ginecologia   name = `ls_atencion_ginecologia` ).


*____________CHEQUEAR REGISTROS CON LINES EXITS__________________

    DATA: lv_pos  TYPE i,                                "se declaran para darles valores luego
          lv_cant TYPE i.

    " 1) Chequeo con READ TABLE
    READ TABLE lt_atenciones WITH KEY uid = '34490913' TRANSPORTING NO FIELDS.
    out->write( data = sy-subrc name = `existe 34490913 (0 = si)` ).

    " 2) Chequeo con line_exists
    IF line_exists( lt_atenciones[ uid = '34490920' ] ). "comprueba si una línea o registro existe dentro de una tabla interna
                                                         "que cumpla con una condición específica.
      out->write( `34490920 existe` ).
    ELSE.
      out->write( ` NO existe` ).
    ENDIF.

    " 3) Posición y cantidad
    lv_pos  = line_index( lt_atenciones[ uid = '34490913' ] ).
    lv_cant = lines( lt_atenciones ).
    out->write( data = lv_pos  name = `posicion de 34490913` ).
    out->write( data = lv_cant name = `filas totales` ).



  ENDMETHOD.

ENDCLASS.
