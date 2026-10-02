CLASS zeje_bloqii_calc_operaciones DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zeje_bloqii_calc_operaciones IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

  DATA: LV_NUM_A TYPE I VALUE 35,
        LV_NUM_B TYPE I VALUE 45,
        LV_TOTAL TYPE P LENGTH 8 DECIMALS 2.

 " +
  LV_TOTAL = lv_num_a + lv_num_b.

 OUT->write( | NUMBER A = { lv_num_a } NUMBER B = { lv_num_b } TOTAL = { lv_total } | ).

"+=

LV_TOTAL += 10.

OUT->write( LV_TOTAL ).

CLEAR LV_TOTAL.


  ENDMETHOD.

ENDCLASS.
