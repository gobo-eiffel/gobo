note

	description:

		"Test xml:id processing"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_TEST_XMLID

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test
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

	test_normalize
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

	test_dtd
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

feature -- Test

	test_conformance
			-- W3C test suite
		do
			make_parser
			parser.parse_from_string (xml_001_normalize)
			assert ("parsed", parser.is_correct)
			assert ("not_ncname", error.has_error)
			assert_strings_equal ("normalized", pretty_print.last_output, "<doc>%N  <para xml:id=%"te st%">MATCH</para>%N</doc>")

			parser.parse_from_string (xml_002_undecl)
			assert ("parsed", parser.is_correct)
			assert ("ok", not error.has_error)

			parser.parse_from_string (xml_003_dtd)
			assert ("parsed", parser.is_correct)
			assert ("ok", not error.has_error)
			assert ("dtd_ok", not dtd.has_error)

			-- test 004_schema does not apply without XML Schema

			parser.parse_from_string (xml_005_errdtdbad)
			assert ("parsed", parser.is_correct)
			assert ("ok", not error.has_error)
			assert ("dtd_not_id", dtd.has_error)

			parser.parse_from_string (xml_005_errdup)
			assert ("parsed", parser.is_correct)
			assert ("dupe", error.has_error)

			-- test 006_errschemabad does not apply without XML Schema

			-- test 007_errdup requires DTD collecting IDs and validating according to this

			parser.parse_from_string (xml_008_ok10)
			assert ("parsed", parser.is_correct)
			assert ("ok", not error.has_error)

			-- test 009_ok11 XML 1.1 not supported yet

			parser.parse_from_string (xml_010_okxref)
			assert ("parsed", parser.is_correct)
			assert ("ok", not error.has_error)
			-- could test IDREF validation when present

			pretty_print.last_output.wipe_out
			parser.parse_from_string (xml_011_oknormalize)
			assert ("parsed", parser.is_correct)
			assert ("ok", not error.has_error)
			assert_strings_equal ("normalized", pretty_print.last_output, "<doc>%N <p xml:id=%"anid%"></p>%N</doc>")

		end

feature {NONE} -- W3C test suite

	xml_001_normalize: STRING = "<doc>%N  <para xml:id=%" te  st %">MATCH</para>%N</doc>%N"
	xml_002_undecl: STRING = "<doc>%N  <para xml:id=%"test%">MATCH</para>%N</doc>%N"
	xml_003_dtd: STRING = "<!DOCTYPE doc [%N<!ATTLIST para%N xml:id	ID	#IMPLIED%N >%N ]>%N<doc>%N <para xml:id=%"id%">MATCH</para>%N</doc>%N"
	xml_005_errdtdbad: STRING = "<!DOCTYPE doc [%N <!ATTLIST para xml:id	NMTOKENS	#IMPLIED >%N]>%N<doc>%N <para xml:id=%"id%">BADDECL</para>%N</doc>%N"
	xml_005_errdup: STRING = "<doc> <para xml:id=%"dup%">DUPLICATE</para> <para xml:id=%"dup%">DUPLICATE</para> </doc>"
	xml_007_errdup: STRING = " <!DOCTYPE doc [%N <!ATTLIST para id ID #IMPLIED>%N]>%N<doc>%N <para id=%"id1%" xml:id=%"id1%"/>%N</doc>%N"
	xml_008_ok10: STRING = "<doc>%N <p xml:id=%"anid%"/>%N</doc>%N"
	xml_010_okxref: STRING = "<!DOCTYPE doc [%N <!ATTLIST para id ID #IMPLIED ref IDREF #IMPLIED >%N]>%N<doc>%N <para id=%"id1%" xml:id=%"id2%"/>%N <para ref=%"is2%"/>%N</doc>%N"
	xml_011_oknormalize: STRING = "<doc>%N <p xml:id=%"  anid  %"/>%N</doc>%N"

feature {NONE} -- Implementation

	make_parser
			-- Set parser.
		local
			namespace_resolver: XM_NAMESPACE_RESOLVER
			xml_id: XM_XMLID_VALIDATOR
		do
			create {XM_EIFFEL_PARSER} parser.make

				-- filters: namespace_resolver -> xml_id -> pretty_print -> error
			create error.make_null
			create pretty_print.make_next (error)
			pretty_print.set_output_to_string
			create xml_id.make_next (pretty_print)
			create namespace_resolver.make_next (xml_id)
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

