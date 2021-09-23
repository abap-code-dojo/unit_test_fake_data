
CLASS ltcl_code_dojo_sql_fake DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS
.
*?﻿<asx:abap xmlns:asx="http://www.sap.com/abapxml" version="1.0">
*?<asx:values>
*?<TESTCLASS_OPTIONS>
*?<TEST_CLASS>ltcl_Code_Dojo_Sql_Fake
*?</TEST_CLASS>
*?<TEST_MEMBER>f_Cut
*?</TEST_MEMBER>
*?<OBJECT_UNDER_TEST>ZCL_CODE_DOJO_SQL_FAKE
*?</OBJECT_UNDER_TEST>
*?<OBJECT_IS_LOCAL/>
*?<GENERATE_FIXTURE>X
*?</GENERATE_FIXTURE>
*?<GENERATE_CLASS_FIXTURE>X
*?</GENERATE_CLASS_FIXTURE>
*?<GENERATE_INVOCATION>X
*?</GENERATE_INVOCATION>
*?<GENERATE_ASSERT_EQUAL>X
*?</GENERATE_ASSERT_EQUAL>
*?</TESTCLASS_OPTIONS>
*?</asx:values>
*?</asx:abap>
  PRIVATE SECTION.
    CLASS-DATA: go_osql TYPE REF TO if_osql_test_environment.

    CLASS-METHODS: class_setup.
    CLASS-METHODS: class_teardown.
    METHODS: setup.
    METHODS: teardown.
    METHODS: check_if_table_true FOR TESTING.
    METHODS: check_if_table_false FOR TESTING.
ENDCLASS.       "ltcl_Code_Dojo_Sql_Fake


CLASS ltcl_code_dojo_sql_fake IMPLEMENTATION.

  METHOD class_setup.

    go_osql = cl_osql_test_environment=>create( VALUE #( ( 'DD02L' ) ) ).

  ENDMETHOD.


  METHOD class_teardown.

    go_osql->destroy( ).

  ENDMETHOD.


  METHOD setup.

    go_osql->clear_doubles( ).

    DATA(lt_data) = VALUE dd02ltab( ( tabname = 'NICO' as4local = 'A' as4vers = '0' tabclass = 'TRANSP' )
                                    ( tabname = 'ENNO' as4local = 'A' as4vers = '0' tabclass = 'INTTAB' )
                                  ).

    go_osql->insert_test_data( lt_data ).

  ENDMETHOD.


  METHOD teardown.



  ENDMETHOD.


  METHOD check_if_table_true.

    DATA r_is_table TYPE abap_bool.

    r_is_table = zcl_code_dojo_sql_fake=>check_if_table( 'NICO' ).

    cl_abap_unit_assert=>assert_equals(
      act   = r_is_table
      exp   = abap_true ).

  ENDMETHOD.

  METHOD check_if_table_false.

    DATA r_is_table TYPE abap_bool.

    r_is_table = zcl_code_dojo_sql_fake=>check_if_table( 'ENNO' ).

    cl_abap_unit_assert=>assert_equals(
      act   = r_is_table
      exp   = abap_false
      msg   = 'ENNO ist ein Holsteiner' ).

  ENDMETHOD.


ENDCLASS.


CLASS ltcl_code_dojo_injection DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS
.
*?﻿<asx:abap xmlns:asx="http://www.sap.com/abapxml" version="1.0">
*?<asx:values>
*?<TESTCLASS_OPTIONS>
*?<TEST_CLASS>ltcl_Code_Dojo_Sql_Fake
*?</TEST_CLASS>
*?<TEST_MEMBER>f_Cut
*?</TEST_MEMBER>
*?<OBJECT_UNDER_TEST>ZCL_CODE_DOJO_SQL_FAKE
*?</OBJECT_UNDER_TEST>
*?<OBJECT_IS_LOCAL/>
*?<GENERATE_FIXTURE>X
*?</GENERATE_FIXTURE>
*?<GENERATE_CLASS_FIXTURE>X
*?</GENERATE_CLASS_FIXTURE>
*?<GENERATE_INVOCATION>X
*?</GENERATE_INVOCATION>
*?<GENERATE_ASSERT_EQUAL>X
*?</GENERATE_ASSERT_EQUAL>
*?</TESTCLASS_OPTIONS>
*?</asx:values>
*?</asx:abap>
  PRIVATE SECTION.

    CLASS-METHODS: class_setup.
    CLASS-METHODS: class_teardown.
    METHODS: setup.
    METHODS: teardown.
    METHODS: check_if_table_true FOR TESTING.
    METHODS: check_if_table_false FOR TESTING.
ENDCLASS.       "ltcl_Code_Dojo_Sql_Fake


CLASS ltcl_code_dojo_injection IMPLEMENTATION.

  METHOD class_setup.

  ENDMETHOD.


  METHOD class_teardown.


  ENDMETHOD.


  METHOD setup.


  ENDMETHOD.


  METHOD teardown.



  ENDMETHOD.


  METHOD check_if_table_true.

    DATA r_is_table TYPE abap_bool.

    r_is_table = zcl_code_dojo_sql_fake=>check_if_table( '$ENNO' ).

    cl_abap_unit_assert=>assert_equals(
      act   = r_is_table
      exp   = abap_true ).

  ENDMETHOD.

  METHOD check_if_table_false.

    DATA r_is_table TYPE abap_bool.

    r_is_table = zcl_code_dojo_sql_fake=>check_if_table( '$NICO' ).

    cl_abap_unit_assert=>assert_equals(
      act   = r_is_table
      exp   = abap_false
      msg   = 'ENNO ist ein Holsteiner' ).

  ENDMETHOD.


ENDCLASS.
