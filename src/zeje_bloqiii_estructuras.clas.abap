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

    TYPES: BEGIN OF ty_paciente,
             n_afiliado  TYPE string,            "STRING PORQUE PUEDE VENIR CON CARACTERES APARTE DE NUMEROS"
             dni         TYPE string,            "CONSIDERANDO CARACTERES ESPECIALES DE DOC NUMEROS EXTRANJEROS"
             nombre      TYPE c LENGTH 30,       "POR SI TENEMOS UN TIPO CON NOMBRE Arnold Schwarzenegger O SIMILAR"
             obra_social TYPE c LENGTH 30,   "OSDE, SWISS MEDICAL, GALENO, ETC
           END OF ty_paciente.

    TYPES: BEGIN OF ty_profesional,
             cuit            TYPE string, "STRING PORQUE DEBE ACEPTAR EL GUION DEL CUIT"
             nombre          TYPE c LENGTH 30,
             especialidad    TYPE string,
             modalidad_cobro TYPE string,
           END OF ty_profesional.

    TYPES: BEGIN OF ty_practica,
             codigo        TYPE string,
             nombre        TYPE c LENGTH 30,
             tipo_servicio TYPE string,
           END OF ty_practica.

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
*    ls_circuito-paciente-obra_social = 'OSDE'.
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
              n_afiliado   TYPE string   VALUE 'AF-99850',
              dni          TYPE string   VALUE 'EXT-442211',
              nombre       TYPE c LENGTH 30 VALUE 'Arnold Schwarzenegger',
              obra_social  TYPE c LENGTH 30 VALUE 'OSDE',
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


    " ========================================================
    " MOSTRAR EL RESULTADO (Usando la salida abreviada de la profe)
    " ========================================================
    " Tu profe en la línea 65 usó un truco genial de ADT: pasarle la estructura
    " completa al write para que la consola dibuje toda la ficha sola de un viaje.
    out->write( data = ls_circuito_directo name = 'Proceso Clinico Integrado' ).



  ENDMETHOD.

ENDCLASS.
