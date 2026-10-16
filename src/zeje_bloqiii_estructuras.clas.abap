CLASS zeje_bloqiii_estructuras DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zeje_bloqiii_estructuras IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
*
*    TYPES: BEGIN OF ty_paciente,
*             n_afiliado TYPE string,            "STRING PORQUE PUEDE VENIR CON CARACTERES APARTE DE NUMEROS"
*             dni        TYPE string,            "CONSIDERANDO CARACTERES ESPECIALES DE DOC NUMEROS EXTRANJEROS"
*             nombre     TYPE c LENGTH 30,       "POR SI TENEMOS UN TIPO CON NOMBRE Arnold Schwarzenegger O SIMILAR"
*             cliente    TYPE c LENGTH 30,   "OSDE, SWISS MEDICAL, GALENO, ETC
*           END OF ty_paciente.
*
*    TYPES: BEGIN OF ty_profesional,
*             cuit            TYPE string, "STRING PORQUE DEBE ACEPTAR EL GUION DEL CUIT"
*             nombre          TYPE c LENGTH 30,
*             especialidad    TYPE string,
*             modalidad_cobro TYPE string,
*           END OF ty_profesional.
*
*    TYPES: BEGIN OF ty_practica,
*             codigo        TYPE string,
*             nombre        TYPE c LENGTH 30,
*             tipo_servicio TYPE string,
*           END OF ty_practica.

*__________________________________________________________________________________________________________

*    " ========================================================
*    " 1. EL PLANO DE LA MEGA ESTRUCTURA ANIDADA (NESTED)
*    " ========================================================
*    " Creamos un contenedor (ty) unificado que contiene tres estructuras adentro
*    TYPES: BEGIN OF ty_circuito_clinico,
*             paciente    TYPE ty_paciente,    " Compartimento 1
*             profesional TYPE ty_profesional, " Compartimento 2
*             practica    TYPE ty_practica,    " Compartimento 3
*           END OF ty_circuito_clinico.
*
*    " ========================================================
*    " 2. CONSTRUIMOS LA VARIABLE FÍSICA EN MEMORIA
*    " ========================================================
*    DATA ls_circuito TYPE ty_circuito_clinico.
*
*    " ========================================================
*    " 3. LLENADO DE DATOS (Navegando con dobles guiones)
*    " ========================================================
*    " Cada guion abre un compartimento de los planos de tu pantalla:
*
*    " --- Campos de ty_paciente ---
*    ls_circuito-paciente-n_afiliado = 'AF-99850'.
*    ls_circuito-paciente-dni        = 'EXT-442211'.
*    ls_circuito-paciente-nombre     = 'Arnold Schwarzenegger'.
*    ls_circuito-paciente-cliente    = 'OSDE'.
*
*    " --- Campos de ty_profesional  ---
*    ls_circuito-profesional-cuit            = '20-12345678-9'.
*    ls_circuito-profesional-nombre          = 'Dr. House'.
*    ls_circuito-profesional-especialidad    = 'Infectologia'.
*    ls_circuito-profesional-modalidad_cobro = 'Particular'.
*
*    " --- Campos de ty_practica  ---
*    ls_circuito-practica-codigo        = 'PRAC-04'.
*    ls_circuito-practica-nombre        = 'Laboratorio De Sangre'.
*    ls_circuito-practica-tipo_servicio = 'Analisis Clinico'.
*
*    " ========================================================
*    " 4. MOSTRAR EL RESULTADO DESDE LA ESTRUCTURA ANIDADA
*    " ========================================================
*    out->write( |--- PROCESO CLÍNICO INTEGRADO ---| ).
*    out->write( |Afiliado:   { ls_circuito-paciente-nombre } (DNI: { ls_circuito-paciente-dni })| ).


*_______________________________________________________________________________________________________

    " ========================================================
    " EL MÉTODO DE LA PROFE: DECLARACIÓN DIRECTA CON VALORES AL VUELO
    " ========================================================
    DATA: BEGIN OF ls_circuito_directo,

            BEGIN OF paciente,
              n_afiliado TYPE string   VALUE 'AF-99850',
              dni        TYPE string   VALUE 'EXT-442211',
              nombre     TYPE c LENGTH 30 VALUE 'Arnold Schwarzenegger',
              cliente    TYPE c LENGTH 30 VALUE 'OSDE',
            END OF paciente,

            BEGIN OF profesional,
              cuit            TYPE string   VALUE '20-12345678-9',
              nombre          TYPE c LENGTH 30 VALUE 'Dr. House',
              especialidad    TYPE string   VALUE 'Infectologia',
              modalidad_cobro TYPE string   VALUE 'Particular',
            END OF profesional,

            BEGIN OF practica,
              codigo        TYPE string   VALUE 'PRAC-04',
              nombre        TYPE c LENGTH 30 VALUE 'Laboratorio De Sangre',
              tipo_servicio TYPE string   VALUE 'Analisis Clinico',
            END OF practica,

          END OF ls_circuito_directo.

        out->write( ls_circuito_directo ).

    " ========================================================
    " MOSTRAR EL RESULTADO (Usando la salida abreviada de la profe)
    " ========================================================
    " Tu profe en la línea 65 usó un truco genial de ADT: pasarle la estructura
    " completa al write para que la consola dibuje toda la ficha sola de un viaje.
    "out->write( data = ls_circuito_directo name = 'Proceso Clinico Integrado' ).

*____________________________________________________________________________________

    """"Estructuras complejas (DEEP)""""""""""""""""""""""""""""""""""""""

*
*    TYPES: BEGIN OF ty_vuelo,
*             flight_date   TYPE /dmo/flight_date,            "SE DECLARA LA ESTRUCTURA CON UN TIPO DE TABLA TRANSPARENTE - CON SU ELEMENTO DE DATOS
*             price         TYPE /dmo/flight_price,           "ES DECIR, EL TYPE BUSCA EL TIPO DE REFERENCIA EN LA TABLA Y SE LO DEFINE
*             currency_code TYPE /dmo/flight-currency_code,   "ES UNA ASOCIACION, LE PIDE PRESTADO EL TYPO DE ORIGEN Y LO IMPACTA EN LA DECLARACION.
*           END OF ty_vuelo.
*
*    DATA: BEGIN OF ls_info_vuelo,
*            seats_occupied TYPE /dmo/flight-seats_occupied VALUE '204',
*            connection_id  TYPE /dmo/flight-connection_id VALUE '3449',
*            lt_vuelos      TYPE TABLE OF ty_vuelo WITH EMPTY KEY,
*          END OF ls_info_vuelo.
*
*
*    SELECT *
*    FROM /dmo/flight
*    WHERE seats_occupied       EQ '204'
*    INTO CORRESPONDING FIELDS OF TABLE @ls_info_vuelo-lt_vuelos.
*
*    out->write( data = ls_info_vuelo name = 'ls_info_vuelo' ).
**______________________________________________________________________________________________________________

    """""""""""""""""""""""""AÑADIR DATOS""""""""""""""""
*
*    ls_circuito_directo = VALUE #( BASE ls_circuito_directo
*                                 profesional   = VALUE #( BASE ls_circuito_directo-profesional
*                                                        nombre   = 'ENMANUEL PACHECO' especialidad = 'GINECOLOGO' cuit = '20-95775454-7' )
*                                 paciente      = VALUE #( BASE ls_circuito_directo-paciente
*                                                      nombre = 'PUNITORIA' dni = '95845478' cliente = 'GALENO' ) ).
*
*      CLEAR ls_circuito_directo.
*
*
*    out->write( data = ls_circuito_directo name = 'PROCESOS CLINICO' ).

*___________________USO DEL INCLUDE DENTRO DE UNA ESTRUCTURA______________________________________________

*    " 1. Tres contenedores vacíos
*    TYPES: BEGIN OF ty_turno,
*             id_turno    TYPE i,
*             fecha_turno TYPE d,
*           END OF ty_turno,
*
*           BEGIN OF ty_medico,
*             id     TYPE i,
*             nombre TYPE string,
*           END OF ty_medico,
*
*           BEGIN OF ty_servicio,
*             id     TYPE i,
*             nombre TYPE string,
*           END OF ty_servicio.
*
*    " 2. Una estructura ya declarada, que sirve de modelo para el tercer INCLUDE
*    "HASTA EL MOMENTO SOLO ES UNA SIMPLE DECLARACION DE UNA ESTRUCTURA QUE TENDRE EL CONTENEDOR TY_SERVICIO
*    "ESE TY_SERVICIO ES UNO DE LOS QUE TIENE EL MEGA CONTENEDOR TY_TURNO, SOLO USAMOS ESE.
*    DATA ls_servicio TYPE ty_servicio.
*
*    " 3. El contenedor que junta los tres en UNA sola fila
*    " SE DECLARA UN GIGANTE CONTENEDOR HEREDA TODO DEL CONTENEDOR TY_TURNO,
*    " ES COMO SI FUESE UNA CAJA DE HERRAMIENTAS QUE DENTRO DE ELLA TIENE SUB-COMPARTIMENTOS
*    " Y COMO POR SI FUESE POCO, DENTRO DE ESE GIGANTE AÑADE 3 INCLUDES PARA ENCADENAR TODO DENTRO DE UNA SOLA LINEA
*
*    TYPES BEGIN OF ty_liquidacion.     "TY_LIQUIDACION (CONTENEDOR GIGANTE)
*
*    INCLUDE TYPE ty_turno AS turno.    "DENTRO DEL EL, SE AÑADE EL INCLUDE QUE TOMA LA FORMA DEL CONTENEDOR TY_TURNO Y ADEMAS SE RENOMBRA CON AS
*    "TOMANDO EL NUEVO NOMBRE TURNO, NO LE GUSTA SU NOMBRE CON TY, TIENE PROBLEMAS DE PERSONALIDAD O TRAUMAS.
*
*    INCLUDE TYPE ty_medico AS medico RENAMING WITH SUFFIX _medico. "TOMA LA FORMA TY_MEDICO, ESTE INCLUDE ES Mystique, UN X-MEN
*    "ESTE TAMBIEN NO QUIERE EL TY Y CAMBIA CON AS SU NOMBRE A MEDICO
*    "Y ADEMAS AGREGA UN SUFIJO _MEDICO PARA SER EL UNICO.
*
*    INCLUDE STRUCTURE ls_servicio AS servicio RENAMING WITH SUFFIX _servicio.
*    " CON STRUCTURE SACA UNA COPIA IGUAL A LA ACTUAL DECLARADA LS_SERVICIO
*    " Y ADEMAS SE CAMBIA EL NOMBRE A SERVICIO CON SU PREFIJO REMAMING _SERVICIO
*
*    TYPES END OF ty_liquidacion.
*
*    " 4. ACA ES DONDE EL DATA: CONVIERTE EN ESTRUCTURAS LOS CONTENEDORES TY_LIQUIDACION - TY_TURNO
*    " UNA COSA ES DECLARAR EL CONTENEDOR TYPE Y OTRA ES LUEGO A ESOS TYPES IGUALARLOS A UNA LS (LOCAL STRUCTURE)
*    DATA: ls_liquidacion TYPE ty_liquidacion,
*          ls_turno       TYPE ty_turno.
*
*    " 5. ACA SE LE DAN LOS VALORES A DICHAS ESTRUCTURAS
*    ls_turno = VALUE #( fecha_turno = '20261012' id_turno = 1234 ).
*
*    ls_liquidacion = VALUE #( turno           = ls_turno                "RESULTADO DEL AS
*                              medico-id       = 123
*                              medico-nombre   = 'DR ENMANUEL PACHECO'
*                              id_servicio     = 123
*                              nombre_servicio = 'GINECOLOGO'
*
*                               ).
*
*    out->write( data = ls_liquidacion name = 'ls_liquidacion' ).

*____________ OTRO EJERICIO DE DECLARACIONES DE INCLUDES _______________*


*    " 1. Tres contenedores vacíos
*    TYPES: BEGIN OF ty_turno,
*             id_turno    TYPE i,
*             fecha_turno TYPE d,
*           END OF ty_turno,
*
*           BEGIN OF ty_medico,
*             id     TYPE i,
*             nombre TYPE string,
*           END OF ty_medico,
*
*           BEGIN OF ty_servicio,
*             id     TYPE i,
*             nombre TYPE string,
*           END OF ty_servicio.
*
*    DATA ls_servicio TYPE ty_servicio.
*
*    TYPES BEGIN OF ty_liquidacion.
*
*    INCLUDE type TY_TURNO AS TURNO.
*    INCLUDE type TY_MEDICO AS MEDICO RENAMING WITH SUFFIX _medico.
*    INCLUDE STRUCTURE ls_servicio AS servicio RENAMING WITH SUFFIX _servicio.
*
*    TYPES END OF ty_liquidacion.
*
*
*    data: ls_liquidacion type ty_liquidacion,
*         ls_turno        type ty_turno.
*
*    ls_turno = VALUE #( FECHA_TURNO = '20261012' id_turno = '3449' ).
*
*    ls_liquidacion = value #( turno = ls_turno
*                              id_medico = 20466298
*                              nombre_medico = 'ENMANUEL PACHECO'
*                              id_servicio = 2046
*                              nombre_servicio = 'GINECOLOGO' ).
*
*                              CLEAR ls_liquidacion.
*
*
*    out->write( data = ls_liquidacion name = 'ls_liquidacion' ).


      endmethod.

ENDCLASS.
