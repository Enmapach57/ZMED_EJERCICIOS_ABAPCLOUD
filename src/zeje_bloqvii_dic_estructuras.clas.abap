CLASS zeje_bloqvii_dic_estructuras DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zeje_bloqvii_dic_estructuras IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_envio_include.
             INCLUDE TYPE zmed_s_atencion_origen.
    TYPES:       cant_horas_text TYPE zmed_de_cant_horas_txt,
             tipo_servicio   TYPE zmed_de_tipo_servicio,
             dni             TYPE zmed_de_dni,
             profesional     TYPE zmed_de_nombre_profesional,
             especialidad    TYPE zmed_de_especialidad,
             practica_nombre TYPE zmed_de_practica_nombre,
           END OF ty_envio_include.

    TYPES: BEGIN OF ty_envio_anidada,
             origen          TYPE zmed_s_atencion_origen,
             cant_horas_text TYPE zmed_de_cant_horas_txt,
             tipo_servicio   TYPE zmed_de_tipo_servicio,
             dni             TYPE zmed_de_dni,
             profesional     TYPE zmed_de_nombre_profesional,
             especialidad    TYPE zmed_de_especialidad,
             practica_nombre TYPE zmed_de_practica_nombre,
           END OF ty_envio_anidada.

    DATA ls_inc  TYPE ty_envio_include.
    DATA ls_anid TYPE ty_envio_anidada.
    "DATA ls_grp  TYPE zeje_s_envio_grupo.

    ls_inc-uid_origen       = '34490914'.
    ls_inc-fecha_inicio     = '20261021'.
    ls_inc-fecha_fin        = '20261021'.
    ls_inc-hora_inicio      = '080000'.
    ls_inc-hora_fin         = '180000'.
    ls_inc-centro_medico    = 'Centro Palermo'.
    ls_inc-estado_turno     = 'Atendido'.
    ls_inc-n_afiliado       = '0012345/01'.
    ls_inc-cuit_profesional = '20-12345678-9'.
    ls_inc-practica_codigo  = 'PRAC-01'.
    ls_inc-cant_horas_text  = '5'.
    ls_inc-tipo_servicio    = 'TURNOSHORAS'.
    ls_inc-dni              = '30123456'.
    ls_inc-profesional      = 'Dr. House'.
    ls_inc-especialidad     = 'Clínica médica'.
    ls_inc-practica_nombre  = 'Consulta clínica'.

    " copia por nombre: los 10 campos del origen viajan juntos
    ls_anid-origen = CORRESPONDING #( ls_inc ).

    ls_anid-dni         = ls_inc-dni.
    ls_anid-profesional = ls_inc-profesional.


    out->write( ls_inc ).
    out->write( ls_anid ).


    out->write( ls_inc-uid_origen ).         " include: acceso directo
    out->write( ls_anid-origen-uid_origen ). " anidada: solo con el camino
       " ...o directo, es el mismo campo
    " out->write( ls_anid-uid_origen ).      " descoméntala: da error


  ENDMETHOD.

ENDCLASS.
