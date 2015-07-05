note

	description:

		"Test XM_INDENT_PRETTY_PRINT_FILTER and XM_WHITESPACE_NORMALIZER"

	test_status: "ok_to_run"
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_TEST_INDENT_PRETTY_PRINT_FILTER

inherit

	TS_TEST_CASE

	XM_MARKUP_CONSTANTS
		export {NONE} all end

create

	make_default

feature -- Tests

	test_simple_indent
			-- No namespaces.
		do
			assert_output ("simple",
				"<doc> <a> <aa b='c'/>   </a><b/>   </doc>",
				"<doc>" + Lf_s +
				" <a>" + Lf_s +
				"  <aa b=%"c%">" + Lf_s +
				"  </aa>" + Lf_s +
				" </a>" + Lf_s +
				" <b>" + Lf_s +
				" </b>" + Lf_s +
				"</doc>")
		end

	test_space_preserve
			-- Test xml:space
		do
			assert_output ("preserve",
				"<doc><a xml:space='preserve'>  <c/> </a></doc>",
				"<doc>"  + Lf_s +
				" <a xml:space=%"preserve%">  <c></c> </a>" + Lf_s +
				"</doc>")
			assert_output ("top_preserve",
				"<doc xml:space='preserve'>  z <b> 1</b>x <c/> </doc>",
				"<doc xml:space=%"preserve%">  z <b> 1</b>x <c></c> </doc>")
		end

feature {NONE} -- Implementation

	indent_pretty_print: XM_INDENT_PRETTY_PRINT_FILTER
			-- Indent filter

	whitespace_normalizer: XM_WHITESPACE_NORMALIZER
			-- Whitespace normalizer

	parser: XM_EIFFEL_PARSER
			-- Parser

	assert_output (a_tag: STRING; a_in: STRING; a_out: STRING)
			-- Assert output as expected.
		require
			a_tag_not_void: a_tag /= Void
			a_in_not_void: a_in /= Void
			a_out_not_void: a_out /= Void
		do
			make_parser
			parser.parse_from_string (a_in)
			assert ("parsed", parser.is_correct)
			assert_equal (a_tag, a_out, indent_pretty_print.last_output)

			make_parser
			parser.parse_from_string (a_out)
			assert ("parsed_out_" + a_tag, parser.is_correct)
			assert_equal ("idempotent_" + a_tag, a_out, indent_pretty_print.last_output)
		end

	make_parser
			-- Make parser.
		do
			create indent_pretty_print.make_null
			indent_pretty_print.set_output_to_string
			create whitespace_normalizer.make_next (indent_pretty_print)

			create parser.make
			parser.set_callbacks (whitespace_normalizer)
		end

end
