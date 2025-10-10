CLASS zjb_cl_abap_basics_main DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zjb_cl_abap_basics_main IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*    out->write( 'Hello, World!' ).

***** Variablen *****

    DATA lv_string TYPE string.
    lv_string = 'String'.
*    out->write( lv_string ).

    DATA lv_date TYPE d.
    lv_date = '20251009'.
*    out->write( lv_date ).

    DATA lv_time TYPE t.
    lv_time = '123456'.
*    out->write( lv_time ).

    DATA lv_integer TYPE i.
    lv_integer = 999.
*    out->write( lv_integer ).

    DATA lv_float TYPE f.
    lv_float = '1.23'.
*    out->write( lv_float ).

    DATA lv_char TYPE c LENGTH 4.
    lv_char = '1234'.
*    out->write( lv_char ).

***** Arithmetik *****

    DATA: lv_num1, lv_num2, lv_result TYPE i.
    lv_num1 = 6.
    lv_num2 = 3.

    lv_result = lv_num1 + lv_num2.
*    out->write( lv_result ).

    lv_result = lv_num1 - lv_num2.
*    out->write( lv_result ).

    lv_result = lv_num1 * lv_num2.
*   out->write( lv_result ).

    lv_result = lv_num1 / lv_num2.
*   out->write( lv_result ).

***** If-Else-Verzweigung *****

*    lv_result = 0.

    IF lv_result = 0.
*      out->write( 'Ist 0' ).
    ELSE.
*      out->write( 'Ist nicht 0' ).
    ENDIF.

***** Switch-Case *****

    DATA lv_string1 TYPE string.
    lv_string1 = 'DHBW'.

    CASE lv_string1.
      WHEN 'Hello World!'.
*        out->write( 'Hello World!' ).
      WHEN 'DHBW'.
*        out->write( 'DHBW' ).
      WHEN OTHERS.
*        out->write( 'Alles andere' ).
    ENDCASE.

***** Schleifen *****

    DATA lv_testnum1 TYPE i.
    lv_testnum1 = 1.

    DO.
      IF lv_testnum1 NOT BETWEEN 0 AND 10.
        EXIT.
      ENDIF.
*      out->write( lv_testnum1 ).
      lv_testnum1 = lv_testnum1 + 1.
    ENDDO.

    lv_testnum1 = 1.

    WHILE lv_testnum1 < 10.
      lv_testnum1 = lv_testnum1 + 2.
*      out->write( lv_testnum1 ).
    ENDWHILE.

***** Strukturierte Daten *****

    TYPES: BEGIN OF ts_meinstrukturtyp,
             carid            TYPE string,
             manufacturer     TYPE string,
             model            TYPE string,
             fuel_consumption TYPE p DECIMALS 2 LENGTH 2,
             price            TYPE i,
           END OF ts_meinstrukturtyp.

    DATA ls_meinestruktur TYPE ts_meinstrukturtyp.
    ls_meinestruktur-carid = '001'.
    ls_meinestruktur-manufacturer = 'Audi'.
    ls_meinestruktur-model = 'A4'.
    ls_meinestruktur-fuel_consumption = '7.55'.
    ls_meinestruktur-price = 50000.

*    out->write( ls_meinestruktur ).

* Interne Tabelle:
    TYPES tt_cars TYPE STANDARD TABLE OF ts_meinstrukturtyp WITH KEY carid.
    DATA lt_car TYPE tt_cars.

    DATA ls_car1 LIKE LINE OF lt_car.
    DATA ls_car2 LIKE LINE OF lt_car.
    DATA ls_car3 LIKE LINE OF lt_car.

    ls_car1-carid = '001'.
    ls_car1-manufacturer = 'Audi'.
    ls_car1-model = 'A4'.
    ls_car1-fuel_consumption = '7.55'.
    ls_car1-price = 50000.

    ls_car2-carid = '002'.
    ls_car2-manufacturer = 'BMW'.
    ls_car2-model = 'M3'.
    ls_car2-fuel_consumption = '9.99'.
    ls_car2-price = 74000.

    ls_car3-carid = '003'.
    ls_car3-manufacturer = 'Mercedes-Benz'.
    ls_car3-model = 'C-Klasse'.
    ls_car3-fuel_consumption = '7.8'.
    ls_car3-price = 60000.

    INSERT ls_car1 INTO TABLE lt_car.
    INSERT ls_car2 INTO TABLE lt_car.
    INSERT ls_car3 INTO TABLE lt_car.

*    out->write( lt_car ).

    DATA lo_car1 TYPE REF TO zjb_cl_car.
    CREATE OBJECT lo_car1.

    DATA lo_car2 LIKE lo_car1.
    CREATE OBJECT lo_car2.

    lo_car1->set_horsepower( 150 ).
    lo_car1->set_price( 10000 ).
    lo_car1->set_production_date( '20241010' ).
    lo_car1->set_type( iv_marke = 'BMW'
                       iv_model = 'iX' ).
    out->write( lo_car1->display_attributes( ) ).
  ENDMETHOD.
ENDCLASS.
