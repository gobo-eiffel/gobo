indexing

	description:

		"Test xml:id processing"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	
deferred class XM_TEST_XMLID

inherit

	TS_TEST_CASE

feature -- Test

	test is
			-- Test ID.
		do
			make_parser
			
			parser.parse_from_string ("<doc xml:id='a'><c xml:id='a'/></doc>")
			assert ("duplicate_id", error.has_error)
			
			parser.parse_from_string ("<doc xml:id='123abc'/>")
			assert ("not_nc_name", error.has_error)

			parser.parse_from_string ("<doc xml:id='abc123'/>")
			assert ("valid", not error.has_error)
		end

	test_normalize is
			-- Test ID normalisation.
		do
			make_parser

			parser.parse_from_string ("<doc xml:id='  abc    '/>")
			assert ("valid", not error.has_error)
			assert_strings_equal ("normalized", pretty_print.last_output, "<doc xml:id=%"abc%"></doc>")
		
			pretty_print.set_output_to_string
			parser.parse_from_string ("<doc xml:id='  a   bc  '/>")
			assert ("parsed", parser.is_correct)
			assert ("has_space", error.has_error)
			assert_strings_equal ("normalized", pretty_print.last_output, "<doc xml:id=%"a bc%"></doc>")
		end

	test_dtd is
			-- Test DTD validation.
		do
			make_parser

			parser.parse_from_string ("<!DOCTYPE doc [ <!ELEMENT doc ANY><!ATTLIST doc xml:id ID #IMPLIED> ]><doc/>")
			assert ("parsed", parser.is_correct)
			assert ("dtd_ok", not dtd.has_error)

			parser.parse_from_string ("<!DOCTYPE doc [ <!ELEMENT doc ANY><!ATTLIST doc xml:id CDATA #IMPLIED> ]><doc/>")
			assert ("parsed", parser.is_correct)
			assert ("dtd_error", dtd.has_error)
		end

feature {NONE} -- Implementation

	make_parser is
			-- Set parser.
		local
			namespace_resolver: XM_NAMESPACE_RESOLVER
			xml_id: XM_XMLID_VALIDATOR
		do
			create {XM_EIFFEL_PARSER} parser.make
			
				-- filters: namespace_resolver -> xml_id -> pretty_print -> error
			create error.make_null
			create pretty_print.set_next (error)
			pretty_print.set_output_to_string
			create xml_id.set_next (pretty_print)
			create namespace_resolver.set_next (xml_id)
			parser.set_callbacks (namespace_resolver)

				-- DTD
			create dtd.make_null
			parser.set_dtd_callbacks (dtd)
		ensure
			parser_not_void: parser /= Void
			error_not_void: error /= Void
			pretty_print_not_void: pretty_print /= Void
			dtd_not_void: dtd /= Void
		end

	parser: XM_PARSER
			-- XML parser

	error: XM_STOP_ON_ERROR_FILTER
			-- Stop on error filter

	pretty_print: XM_PRETTY_PRINT_FILTER
			-- Pretty printer

	dtd: XM_DTD_XMLID_VALIDATOR
			-- DTD callbacks
			
end

