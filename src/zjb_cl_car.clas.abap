CLASS zjb_cl_car DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS set_type IMPORTING iv_marke TYPE string
                               iv_model TYPE string.
    METHODS set_production_date IMPORTING iv_production_date TYPE d.

    METHODS set_horsepower IMPORTING iv_horsepower TYPE i.

    METHODS set_price IMPORTING iv_price TYPE i.

    METHODS display_attributes RETURNING VALUE(attributes) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mv_marke TYPE string.
    DATA mv_model TYPE string.
    DATA mv_production_date TYPE d.
    DATA mv_horsepower TYPE i.
    DATA mv_price TYPE i.
ENDCLASS.



CLASS zjb_cl_car IMPLEMENTATION.

  METHOD set_type.
    mv_marke = iv_marke.
    mv_model = iv_model.
  ENDMETHOD.

  METHOD set_horsepower.
    mv_horsepower = iv_horsepower.
  ENDMETHOD.

  METHOD set_price.
    mv_price = iv_price.
  ENDMETHOD.

  METHOD set_production_date.
    mv_production_date = iv_production_date.
  ENDMETHOD.

  METHOD display_attributes.
    attributes = |{ 'Marke:' } { mv_marke } { 'Model:' } { mv_model } { 'Preis:' } { mv_price } { 'Produktionsdatum:' } { mv_production_date } { 'Leistung:' } { mv_horsepower }|.
  ENDMETHOD.

ENDCLASS.
