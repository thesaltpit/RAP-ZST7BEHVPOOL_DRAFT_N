CLASS lhc_accountingheader DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_authorizations FOR AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR accountingheader RESULT result.

    METHODS get_features FOR FEATURES
      IMPORTING keys REQUEST requested_features FOR accountingheader RESULT result.

    METHODS generatedocnum FOR DETERMINE ON MODIFY
      IMPORTING values FOR accountingheader~generatedocnum.

ENDCLASS.

CLASS lhc_accountingheader IMPLEMENTATION.

  METHOD get_authorizations.
  ENDMETHOD.

  METHOD get_features.
  ENDMETHOD.

  METHOD generatedocnum.

*   First read entity using EML
    READ ENTITIES OF zst7_acchdr_root_pool_dft IN LOCAL MODE
    ENTITY accountingheader
    ALL FIELDS WITH CORRESPONDING #( values )
    RESULT DATA(lt_acchdr).

*   Then modify the entity using EML
    MODIFY ENTITIES OF zst7_acchdr_root_pool_dft IN LOCAL MODE
    ENTITY accountingheader
    UPDATE FIELDS ( cpudt cputm usnam )
    WITH VALUE #(  FOR ls_acchdr IN lt_acchdr INDEX INTO i  (
                   %tky = ls_acchdr-%tky
                   cpudt = sy-datum
                   cputm = sy-uzeit
                   usnam = sy-uname
*                   createddt_time = ls_acchdrt-createddt_time
*                   changeddt_time = ls_acchdrt-changeddt_time
                ) )
    MAPPED DATA(copied_data)
    FAILED DATA(failed_data)
    REPORTED DATA(reported_data).

* Moving to output
    reported = CORRESPONDING #( DEEP reported_data ).

  ENDMETHOD.

ENDCLASS.

*CLASS lhc_accountingitems DEFINITION INHERITING FROM cl_abap_behavior_handler.
*  PRIVATE SECTION.
*
*    METHODS get_authorizations FOR AUTHORIZATION
*      IMPORTING keys REQUEST requested_authorizations FOR accountingitems RESULT result.
*
*ENDCLASS.
*
*CLASS lhc_accountingitems IMPLEMENTATION.
*
*  METHOD get_authorizations.
*  ENDMETHOD.
*
*ENDCLASS.
