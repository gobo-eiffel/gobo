indexing

	description:
	
		"Test DTD parsing"
		
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	
deferred class XM_TEST_DTD

inherit

	TS_TEST_CASE
	
feature

	test_simple is
			-- Simple DTDs.
		do
			-- DOCTYPE at the end in result because on_doctype is after end 
			-- of prolog declaration, so after the DTD body for internal DTDs.
			assert_parsed ("<!DOCTYPE doc [ <!ELEMENT  doc  EMPTY> ]><doc/>", 
				"<!ELEMENT doc EMPTY>%N<!DOCTYPE doc>%N")
			assert_parsed ("<!DOCTYPE doc [ <!--comment --> <!ELEMENT  doc  EMPTY> ]><doc/>",
				"<!ELEMENT doc EMPTY>%N<!DOCTYPE doc>%N")
			assert_parsed ("<!DOCTYPE doc [ <!ELEMENT doc EMPTY> <!-- com -->]><doc/>",
				"<!ELEMENT doc EMPTY>%N<!DOCTYPE doc>%N")
		end
	
	test_attribute is
			-- Simple DTD with attributes.
		do
			assert_parsed (
				"<!DOCTYPE doc [ <!ELEMENT doc EMPTY><!ATTLIST doc a CDATA #IMPLIED>]><doc/>",
				"<!ELEMENT doc EMPTY>%N<!ATTLIST doc a CDATA #IMPLIED>%N<!DOCTYPE doc>%N")
			assert_parsed (
				"<!DOCTYPE doc [ <!ELEMENT doc EMPTY><!ATTLIST doc a CDATA #REQUIRED>]><doc a='a'/>",
				"<!ELEMENT doc EMPTY>%N<!ATTLIST doc a CDATA #REQUIRED>%N<!DOCTYPE doc>%N")
			assert_parsed (
				"<!DOCTYPE doc [ <!ELEMENT doc EMPTY><!ATTLIST doc a ID #IMPLIED>]><doc/>",
				"<!ELEMENT doc EMPTY>%N<!ATTLIST doc a ID #IMPLIED>%N<!DOCTYPE doc>%N")
			assert_parsed (
				"<!DOCTYPE doc [ <!ELEMENT doc EMPTY><!ATTLIST doc a IDREF #IMPLIED>]><doc/>",
				"<!ELEMENT doc EMPTY>%N<!ATTLIST doc a IDREF #IMPLIED>%N<!DOCTYPE doc>%N")
			assert_parsed (
				"<!DOCTYPE doc [ <!ELEMENT doc EMPTY><!ATTLIST doc a ENTITY #IMPLIED>]><doc/>",
				"<!ELEMENT doc EMPTY>%N<!ATTLIST doc a ENTITY #IMPLIED>%N<!DOCTYPE doc>%N")
			assert_parsed (
				"<!DOCTYPE doc [ <!ELEMENT doc EMPTY><!ATTLIST doc a NMTOKEN #IMPLIED>]><doc/>",
				"<!ELEMENT doc EMPTY>%N<!ATTLIST doc a NMTOKEN #IMPLIED>%N<!DOCTYPE doc>%N")
		end
	
	test_element_repetition is
			-- Test sub element repetition.
		do
			assert_parsed (
				"<!DOCTYPE doc [<!ELEMENT doc (doc+)>]><doc/>",
				"<!ELEMENT doc (doc+)>%N<!DOCTYPE doc>%N")
			assert_parsed (
				"<!DOCTYPE doc [<!ELEMENT doc (doc*)>]><doc/>",
				"<!ELEMENT doc (doc*)>%N<!DOCTYPE doc>%N")
			assert_parsed (
				"<!DOCTYPE doc [<!ELEMENT doc (doc?)>]><doc/>",
				"<!ELEMENT doc (doc?)>%N<!DOCTYPE doc>%N")
		end
		
	test_element_group is
			-- Test sub element groups.
		do
			assert_parsed (
				"<!DOCTYPE doc [<!ELEMENT a1 EMPTY><!ELEMENT a2 EMPTY><!ELEMENT doc (a1|a2)>]><doc/>",
				"<!ELEMENT a1 EMPTY>%N<!ELEMENT a2 EMPTY>%N<!ELEMENT doc (a1|a2)>%N<!DOCTYPE doc>%N")
			assert_parsed (
				"<!DOCTYPE doc [<!ELEMENT a1 EMPTY><!ELEMENT a2 EMPTY><!ELEMENT doc (a1,a2)>]><doc/>",
				"<!ELEMENT a1 EMPTY>%N<!ELEMENT a2 EMPTY>%N<!ELEMENT doc (a1,a2)>%N<!DOCTYPE doc>%N")
			assert_parsed (
				"<!DOCTYPE doc [<!ELEMENT a1 EMPTY><!ELEMENT a2 EMPTY><!ELEMENT doc (a1,(a1|a2))>]><doc/>",
				"<!ELEMENT a1 EMPTY>%N<!ELEMENT a2 EMPTY>%N<!ELEMENT doc (a1,(a1|a2))>%N<!DOCTYPE doc>%N")
		end
		

feature {NONE} -- Assertions

	assert_parsed (a_in: STRING; a_out: STRING) is
		local
			a_printer: XM_DTD_PRETTY_PRINT_FILTER
			a_parser: XM_EIFFEL_PARSER
		do
			create a_printer.make_null
			a_printer.set_output_to_string
			
			create a_parser.make
			a_parser.set_dtd_callbacks (a_printer)
			a_parser.parse_from_string (a_in)

			assert ("parsed_ok", a_parser.is_correct)
			assert_equal ("dtd_as_expected", a_out, a_printer.last_output)			
		end
	
end
