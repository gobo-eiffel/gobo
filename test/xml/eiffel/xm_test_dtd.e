indexing

	description:

		"Test DTD parsing"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_TEST_DTD

inherit

	TS_TEST_CASE

feature -- Test

	test_declaration is
			-- DTD declaration.
		do
			assert_parsed ("<!DOCTYPE doc SYSTEM %"abc%"><doc/>",
				"<!DOCTYPE doc SYSTEM abc >%N")
			assert_parsed ("<!DOCTYPE doc PUBLIC 'uri' 'abc'><doc/>",
				"<!DOCTYPE doc PUBLIC uri abc >%N")
		end

	test_simple is
			-- Simple DTDs.
		do
			-- DOCTYPE at the end in result because on_doctype is after end
			-- of prolog declaration, so after the DTD body for internal DTDs.
			assert_parsed ("<!DOCTYPE doc [ <!ELEMENT  doc  EMPTY> ]><doc/>",
				"<!DOCTYPE doc>%N<!ELEMENT doc EMPTY>%N")
			assert_parsed ("<!DOCTYPE doc [ <!--comment --> <!ELEMENT  doc  EMPTY> ]><doc/>",
				"<!DOCTYPE doc>%N<!ELEMENT doc EMPTY>%N")
			assert_parsed ("<!DOCTYPE doc [ <!ELEMENT doc EMPTY> <!-- com -->]><doc/>",
				"<!DOCTYPE doc>%N<!ELEMENT doc EMPTY>%N")
		end

	test_attribute is
			-- Simple DTD with attributes.
		do
			assert_parsed (
				"<!DOCTYPE doc [ <!ELEMENT doc EMPTY><!ATTLIST doc a CDATA #IMPLIED>]><doc/>",
				"<!DOCTYPE doc>%N<!ELEMENT doc EMPTY>%N<!ATTLIST doc a CDATA #IMPLIED>%N")
			assert_parsed (
				"<!DOCTYPE doc [ <!ELEMENT doc EMPTY><!ATTLIST doc a CDATA #REQUIRED>]><doc a='a'/>",
				"<!DOCTYPE doc>%N<!ELEMENT doc EMPTY>%N<!ATTLIST doc a CDATA #REQUIRED>%N")
			assert_parsed (
				"<!DOCTYPE doc [ <!ELEMENT doc EMPTY><!ATTLIST doc a ID #IMPLIED>]><doc/>",
				"<!DOCTYPE doc>%N<!ELEMENT doc EMPTY>%N<!ATTLIST doc a ID #IMPLIED>%N")
			assert_parsed (
				"<!DOCTYPE doc [ <!ELEMENT doc EMPTY><!ATTLIST doc a IDREF #IMPLIED>]><doc/>",
				"<!DOCTYPE doc>%N<!ELEMENT doc EMPTY>%N<!ATTLIST doc a IDREF #IMPLIED>%N")
			assert_parsed (
				"<!DOCTYPE doc [ <!ELEMENT doc EMPTY><!ATTLIST doc a ENTITY #IMPLIED>]><doc/>",
				"<!DOCTYPE doc>%N<!ELEMENT doc EMPTY>%N<!ATTLIST doc a ENTITY #IMPLIED>%N")
			assert_parsed (
				"<!DOCTYPE doc [ <!ELEMENT doc EMPTY><!ATTLIST doc a NMTOKEN #IMPLIED>]><doc/>",
				"<!DOCTYPE doc>%N<!ELEMENT doc EMPTY>%N<!ATTLIST doc a NMTOKEN #IMPLIED>%N")
			assert_parsed (
				"<!DOCTYPE doc [ <!ELEMENT doc EMPTY><!ATTLIST doc a (x | y|z) #IMPLIED>]><doc/>",
				"<!DOCTYPE doc>%N<!ELEMENT doc EMPTY>%N<!ATTLIST doc a (x|y|z) #IMPLIED>%N")
		end

	test_element_repetition is
			-- Test sub element repetition.
		do
			assert_parsed (
				"<!DOCTYPE doc [<!ELEMENT doc (doc+)>]><doc/>",
				"<!DOCTYPE doc>%N<!ELEMENT doc (doc+)>%N")
			assert_parsed (
				"<!DOCTYPE doc [<!ELEMENT doc (doc*)>]><doc/>",
				"<!DOCTYPE doc>%N<!ELEMENT doc (doc*)>%N")
			assert_parsed (
				"<!DOCTYPE doc [<!ELEMENT doc (doc?)>]><doc/>",
				"<!DOCTYPE doc>%N<!ELEMENT doc (doc?)>%N")
		end

	test_element_group is
			-- Test sub element groups.
		do
			assert_parsed (
				"<!DOCTYPE doc [<!ELEMENT a1 EMPTY><!ELEMENT a2 EMPTY><!ELEMENT doc (a1|a2)>]><doc/>",
				"<!DOCTYPE doc>%N<!ELEMENT a1 EMPTY>%N<!ELEMENT a2 EMPTY>%N<!ELEMENT doc (a1|a2)>%N")
			assert_parsed (
				"<!DOCTYPE doc [<!ELEMENT a1 EMPTY><!ELEMENT a2 EMPTY><!ELEMENT doc (a1,a2)>]><doc/>",
				"<!DOCTYPE doc>%N<!ELEMENT a1 EMPTY>%N<!ELEMENT a2 EMPTY>%N<!ELEMENT doc (a1,a2)>%N")
			assert_parsed (
				"<!DOCTYPE doc [<!ELEMENT a1 EMPTY><!ELEMENT a2 EMPTY><!ELEMENT doc (a1,(a1|a2))>]><doc/>",
				"<!DOCTYPE doc>%N<!ELEMENT a1 EMPTY>%N<!ELEMENT a2 EMPTY>%N<!ELEMENT doc (a1,(a1|a2))>%N")
		end


feature {NONE} -- Assertions

	new_resolver: XM_STRING_EXTERNAL_RESOLVER is
			-- Dummy resolver for external DTD test.
		do
			create Result.make
			Result.strings.force ("", "abc")
		ensure
			not_void: Result /= Void
		end

	assert_parsed (a_in: STRING; a_out: STRING) is
			-- Assert that `a_in' can be parsed correctly
			-- and that the DTD parsed is equal to `a_out'.
		require
			a_in_not_void: a_in /= Void
			a_out_not_void: a_out /= Void
		local
			a_printer: XM_DTD_PRETTY_PRINT_FILTER
			a_parser: XM_EIFFEL_PARSER
		do
			create a_printer.make_null
			a_printer.set_output_to_string

			create a_parser.make
			a_parser.set_dtd_resolver (new_resolver)
			a_parser.set_dtd_callbacks (a_printer)
			a_parser.parse_from_string (a_in)

			assert ("parsed_ok", a_parser.is_correct)
			assert_equal ("dtd_as_expected", a_out, a_printer.last_output)
		end

end
