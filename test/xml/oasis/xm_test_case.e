indexing

	description:

		"Base class for XML parser test cases"

	library: "Gobo Eiffel XML Library test"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_TEST_CASE

inherit

	TS_TEST_CASE

	XM_CALLBACKS_FILTER_FACTORY

	UC_UNICODE_FACTORY

feature -- XML asserts

	assert_valid (a_name: STRING; in: STRING) is
			-- Assert valid.
		require
			name_not_void: a_name /= Void
			in_not_void: in /= Void
		do
			reset_parser
			parser.parse_from_string (in)
			assert (a_name, parser.is_correct)
		end

	assert_invalid (a_name: STRING; in: STRING) is
			-- Assert invalid.
		require
			name_not_void: a_name /= Void
			in_not_void: in /= Void
		do
			reset_parser
			parser.parse_from_string (in)
			assert (a_name, not parser.is_correct)
		end

	assert_output (a_name: STRING; in: STRING; an_out: STRING) is
			-- Assert valid and compare output with expected.
		require
			name_not_void: a_name /= Void
			in_not_void: in /= Void
			out_not_void: out /= Void
		do
			reset_parser
			parser.parse_from_string (in)

			debug ("xml_parser")
				if not parser.is_correct then 
					io.put_string (parser.last_error_description) 
				end
			end
			assert ("Valid: " + a_name, parser.is_correct)
			assert_equal ("Output: " + a_name, an_out, output.to_utf8)
		end

feature {NONE} -- Parser

	parser: XM_PARSER
			-- Parser.

	output: UC_STRING
			-- Output.

	new_parser: XM_PARSER is
			-- New parser, can be redefined to test another parser.
		do
			!XM_EIFFEL_PARSER! Result.make
		end

	reset_parser is
			-- Reset parser.
		local
			a_printer: XM_CANONICAL_PRETTY_PRINT_FILTER
		do
			output := new_unicode_string ("")
			parser := new_parser
			a_printer := new_canonical_pretty_print
			a_printer.set_output_string (output)
			
			parser.set_callbacks (callbacks_pipe (<<  
				new_end_tag_checker,
				new_stop_on_error,
				a_printer >>))
		ensure
			not_void: parser /= Void and output /= Void
		end

end
