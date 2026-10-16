CLASS zeje_bloqiv_tablas_int DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES  if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zeje_bloqiv_tablas_int IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_pacientes,
             n_afiliado TYPE string,            "STRING PORQUE PUEDE VENIR CON CARACTERES APARTE DE NUMEROS"
             dni        TYPE string,            "CONSIDERANDO CARACTERES ESPECIALES DE DOC NUMEROS EXTRANJEROS"
             nombre     TYPE c LENGTH 30,       "POR SI TENEMOS UN TIPO CON NOMBRE Arnold Schwarzenegger O SIMILAR"
             cliente    TYPE c LENGTH 30,   "OSDE, SWISS MEDICAL, GALENO, ETC
           END OF ty_pacientes.

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

    TYPES: BEGIN OF ty_atencion,
             uid              TYPE string,
             fecha_inicio     TYPE d,
             fecha_fin        TYPE d,
             hora_inicio      TYPE t,
             centro_medico    TYPE string,
             estado_turno     TYPE string,
             n_afiliado       TYPE string,      " llave a ty_paciente
             cuit_profesional TYPE string,      " llave a ty_profesional
             practica_codigo  TYPE string,      " llave a ty_practica
           END OF ty_atencion.

    TYPES: BEGIN OF ty_envio_sap,               " el envio de las atenciones a SAP
             uid              TYPE string,
             fecha_inicio     TYPE d,
             fecha_fin        TYPE d,
             hora_inicio      TYPE t,
             hora_fin         TYPE t,
             cant_horas       TYPE string,            " ya redondeada en el cierre
             centro_medico    TYPE string,
             estado_turno     TYPE string,
             tipo_servicio    TYPE string,
             n_afiliado       TYPE string,
             dni              TYPE string,
             cuit_prefesional TYPE string,
             profesional      TYPE c LENGTH 30,
             especialidad     TYPE string,
             practica_codigo  TYPE string,
             practica_nombre  TYPE c LENGTH 30,
           END OF ty_envio_sap.


*_________ TABLA TIPO STANDART __________________*

    DATA lt_pacientes TYPE STANDARD TABLE OF ty_pacientes WITH EMPTY KEY.

    lt_pacientes = VALUE #(
                          ( n_afiliado = 'AF-001' dni = '98454785' nombre = ' FLORINDA MACAYO' cliente = 'SOCIAL OSDE' )
                          ( n_afiliado = 'AF-002' dni = '98454185' nombre = ' RAMON CAMACARO' cliente = 'SWISS MEDICA' )
                                        ).
    out->write( lt_pacientes ).

    out->write( | | ).

    DATA lt_profesional TYPE STANDARD TABLE OF ty_profesional WITH EMPTY KEY.

    lt_profesional = VALUE #(
                          ( cuit = '20-7845874' nombre = ' PACHECO ENMANUEL ' especialidad = 'GINECOLOGIA' modalidad_cobro = 'TRANSFERENCIA B' )
                          ( cuit = '20-589652' nombre = ' ABRAHAN QUERALES' especialidad = ' CARDIOLOGIA ' modalidad_cobro = 'CHEQUE' )
                                        ).
    out->write( lt_profesional ).



*_________ TABLA TIPO SORTED  _____________*






  ENDMETHOD.

ENDCLASS.
