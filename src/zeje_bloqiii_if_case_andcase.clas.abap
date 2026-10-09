CLASS zeje_bloqiii_if_case_andcase DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zeje_bloqiii_if_case_andcase IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    " 1. Variable de prueba (Aquí cambias el valor para experimentar)
    DATA(lv_tipo_pedido) = 'NB'. " 'NB' = Estándar, 'FO' = Marco, 'UB' = Traslado

    " Variable para guardar el resultado del análisis
    DATA lv_estrategia TYPE string.


    " 2. Estructura CASE / WHEN / WHEN OTHERS / ENDCASE
    CASE lv_tipo_pedido.

      WHEN 'xx'.
        " Si la variable vale exactamente 'NB'
        lv_estrategia = 'Pedido Estándar: Requiere verificación de stock en almacén.'.

      WHEN 'FO' OR 'ZMAR'.
        " Puedes evaluar más de una opción fija separando con OR
        lv_estrategia = 'Pedido Marco: Controlar límite de presupuesto anual.'.

      WHEN 'UB'.
        " Si es un pedido de traslado entre centros
        lv_estrategia = 'Pedido de Traslado: Generar orden de entrega en depósito.'.

      WHEN OTHERS.
        " Equivale al ELSE del IF. Si no es ninguna de las anteriores, cae aquí:
        lv_estrategia = 'Tipo de pedido no identificado: Revisar parametrización de MM.'.

    ENDCASE. " Cierre obligatorio


    " 3. Imprimimos el resultado en la consola
    out->write( |Tipo de Pedido: { lv_tipo_pedido }| ).
    out->write( |Estrategia:    { lv_estrategia }| ).

    " En la vida real, el dato se lee de la base de datos o lo ingresa el usuario
    DATA(lv_tipo_material) = 'ROH'. " 'ROH' = Materia Prima, 'HALB' = Semielaborado, 'FERT' = Terminado

    CASE lv_tipo_material.

      WHEN 'ROH'.
        out->write( 'Logística MM: Materia Prima -> Enviar a control de calidad.' ).

      WHEN 'HALB'.
        out->write( 'Logística MM: Semielaborado -> Almacenar en rack intermedio.' ).

      WHEN 'FERT'.
        out->write( 'Logística MM: Producto Terminado -> Listo para despacho.' ).

      WHEN OTHERS.
        out->write( 'Logística MM: Tipo de material no controlado por esta lógica.' ).

    ENDCASE.



  ENDMETHOD.

ENDCLASS.
