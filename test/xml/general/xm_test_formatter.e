note

	description:

		"Test XM_FORMATTER"

	test_status: "ok_to_run"
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_TEST_FORMATTER

inherit

	TS_TEST_CASE

	XM_MARKUP_CONSTANTS
		export {NONE} all end

create

	make_default

feature -- Tests

	test_no_namespaces is
			-- No namespaces.
		do
			assert_formatted ("no_namespaces",
						"<doc a='foo'/>", "<doc a=%"foo%"></doc>")
			assert_formatted ("simple_space",
						"<doc ></doc>","<doc></doc>")
			assert_formatted ("whitespace_out_of_content_ignored",
						"  <doc/>   ", "<doc></doc>")
			assert_formatted ("newline",
						"<doc>%N</doc>", "<doc>%N</doc>")
			assert_formatted ("empty_tag",
						"<doc/>", "<doc></doc>")
		end

	test_impplicit_namespace is
			-- Test xml:
		do
			assert_formatted ("xml",
				"<doc xml:space='default'/>",
				"<doc xml:space=%"default%"></doc>") -- stays undeclared
		end

	test_attribute is
			-- Namespaces and attributes.
		do
			assert_formatted ("simple_attribute",
						"<doc n1:a='foo' xmlns:n1='abc'/>",
						"<doc n1:a=%"foo%" xmlns:n1=%"abc%"></doc>")
			assert_formatted ("attribute_default",
						"<n1:doc n1:a='foo' xmlns:n1='abc'/>",
						"<n1:doc n1:a=%"foo%" xmlns:n1=%"abc%"></n1:doc>")
		end

feature {NONE} -- Implementation

	assert_formatted (a_tag: STRING; a_in: STRING; a_out: STRING) is
			-- Assert input XML is formatted as output.
		require
			a_tag_not_void: a_tag /= Void
			a_in_not_void: a_in /= Void
			a_out_not_void: a_out /= Void
		do
			make_parser
				-- Check formatted output is as expected.
			parser.parse_from_string (a_in)
			assert ("parsed_" + a_tag, not tree_pipe.error.has_error)

			tree_pipe.document.process (formatter)
			assert_equal (a_tag, a_out, output.string)

				-- Check output is valid XML and idempotent.
			output.string.wipe_out

			parser.parse_from_string (a_out)
			assert ("output_parsed_" + a_tag, not tree_pipe.error.has_error)

			tree_pipe.document.process (formatter)
			assert_equal ("output_idempotent_" + a_tag, a_out, output.string)
		end

feature {NONE} -- Implementation

	make_parser is
			-- Make parser.
		do
			create parser.make
			create tree_pipe.make
			parser.set_callbacks (tree_pipe.start)

			make_formatter
		end

	make_formatter is
			-- Make formatter
		do
			create formatter.make
			create output.make_empty
			formatter.set_output (output)
		end

	parser: XM_EIFFEL_PARSER
		-- Parser
	tree_pipe: XM_TREE_CALLBACKS_PIPE
		-- Tree builder

	formatter: XM_FORMATTER
		-- Formatter
	output: KL_STRING_OUTPUT_STREAM
		-- Formatter output

end
