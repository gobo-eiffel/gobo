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

	KL_SHARED_STANDARD_FILES

feature -- XML asserts

	assert_valid (a_name: STRING; in: STRING) is
			-- Assert valid.
		require
			name_not_void: a_name /= Void
			in_not_void: in /= Void
		do
			reset_parser
			parser.parse_from_string (new_unicode_string_from_utf8 (in))
			assert (a_name, not error.has_error)
		end

	assert_invalid (a_name: STRING; in: STRING) is
			-- Assert invalid.
		require
			name_not_void: a_name /= Void
			in_not_void: in /= Void
		do
			reset_parser
			parser.parse_from_string (new_unicode_string_from_utf8 (in))
			assert (a_name, error.has_error)
		end

	assert_output (a_name: STRING; in: STRING; an_out: STRING) is
			-- Assert valid and compare output with expected.
		require
			name_not_void: a_name /= Void
			in_not_void: in /= Void
			out_not_void: out /= Void
		do
			reset_parser
			parser.parse_from_string (new_unicode_string_from_utf8 (in))

			debug ("xml_parser")
				if not parser.is_correct then
					std.output.put_string (parser.last_error_description) 
					std.output.put_new_line
				end
			end
			assert (STRING_.concat ("Valid: ", a_name), parser.is_correct)

				-- Constants are in UTF8, so convert if UC_STRING.
			assert (STRING_.concat ("Output: ", a_name), STRING_.same_string (new_unicode_string_from_utf8 (an_out), output))
		end

	assert_output_utf16 (a_name: STRING; in_utf16: STRING; an_out: STRING) is
			-- Assert valid and compare output with expected.
		require
			name_not_void: a_name /= Void
			in_not_void: in_utf16 /= Void
			out_not_void: out /= Void
		do
			reset_parser
			parser.parse_from_string (new_unicode_string_from_utf16 (in_utf16))
			
			debug ("xml_parser")
				if not parser.is_correct then
					std.output.put_string (parser.last_error_description)
					std.output.put_new_line
				end
			end
			assert (STRING_.concat ("Valid: ", a_name), parser.is_correct)
			assert (STRING_.concat ("Output: ", a_name), STRING_.same_string (new_unicode_string_from_utf8 (an_out), output))
		end

feature {NONE} -- Parser

	parser: XM_PARSER
			-- XML parser

	output: STRING
			-- Output

	error: XM_STOP_ON_ERROR_FILTER
			-- Error collector

	new_parser: XM_PARSER is
			-- New parser
			-- (Can be redefined to test another parser.)
		do
			!XM_EIFFEL_PARSER! Result.make
		end

	reset_parser is
			-- Reset parser.
		local
			an_attribute: XM_ATTRIBUTE_DEFAULT_FILTER
			a_printer: XM_CANONICAL_PRETTY_PRINT_FILTER
		do
			output := new_unicode_string_empty

			parser := new_parser
			parser.set_string_mode_mixed

			error := new_stop_on_error
			a_printer := new_canonical_pretty_print
			a_printer.set_output_string (output)
			!! an_attribute.make_null
			parser.set_dtd_callbacks (an_attribute)
			parser.set_callbacks (callbacks_pipe (<<  
				new_end_tag_checker,
				new_unicode_validation,
				an_attribute,
				error,
				a_printer >>))
		ensure
			parser_not_void: parser /= Void
			output_not_void: output /= Void
		end

end
