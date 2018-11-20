note

	description:

		"Test XML encoding with latin1"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_TEST_LATIN1

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	XM_CALLBACKS_FILTER_FACTORY
		export {NONE} all end

create

	make_default

feature -- Test

	test_valid_tag
			-- Test valid tag.
		do
			assert_output(
				"<?xml version='1.0' encoding='iso-8859-1'?><é></é>",
				"<%/195/%/169/></%/195/%/169/>")
			assert_output(
				"<?xml version='1.0' encoding='iso-8859-1'?><é/>",
				"<%/195/%/169/></%/195/%/169/>")
			assert_output(
				"<?xml version='1.0' encoding='iso-8859-1'?><doc é=''/>",
				"<doc %/195/%/169/=%"%"></doc>")
		end

	test_valid_content
			-- Test valid content.
		do
			assert_output(
				"<?xml version='1.0' encoding='iso-8859-1'?><doc>é</doc>",
				"<doc>%/195/%/169/</doc>")
			assert_output(
				"<?xml version='1.0' encoding='iso-8859-1'?><doc a='é'/>",
				"<doc a=%"%/195/%/169/%"></doc>")
		end

	test_invalid_latin1
			-- Test invalid Latin1.
		do
			assert_invalid ("<doc>%/195/</doc>") -- half of UTF8
		end

feature {NONE} -- Implementation

	assert_invalid (a_in: STRING)
			-- Assert parsing OK and standalone declaration correctly read.
		require
			a_in_not_void: a_in /= Void
		local
			a_parser: XM_EIFFEL_PARSER
			a_sink: XM_STOP_ON_ERROR_FILTER
			a_sink_2: XM_CALLBACKS_FILTER
		do
			a_sink := new_stop_on_error
			a_sink_2 := a_sink

			create a_parser.make
			a_parser.set_string_mode_mixed
			a_parser.set_callbacks (standard_callbacks_pipe (<<new_unicode_validation, a_sink_2>>))
			a_parser.parse_from_stream (literal_stream (a_in))
			assert ("parse_fails", a_sink.has_error)
		end

	assert_output (a_in: STRING; a_out_utf8: STRING)
			-- Assert parsing OK and standalone declaration correctly read.
		require
			a_in_not_void: a_in /= Void
			a_out_utf8_not_void: a_out_utf8 /= Void
		local
			a_parser: XM_EIFFEL_PARSER
			a_sink: XM_CANONICAL_PRETTY_PRINT_FILTER
			l_last_output: detachable STRING
		do
			create a_sink.make_null
			a_sink.set_output_to_string

			create a_parser.make
			a_parser.set_string_mode_mixed
			a_parser.set_callbacks (standard_callbacks_pipe (<<a_sink>>))

			a_parser.parse_from_stream (literal_stream (a_in))

			assert ("parsed_ok", a_parser.is_correct)
			l_last_output := a_sink.last_output
				-- Postcondition of 'set_output_to_string':
			assert ("last_output_not_void", l_last_output /= Void)
			check asserted_above: l_last_output /= Void then end
			assert_equal ("output", a_out_utf8, STRING_.as_string (l_last_output))
		end

	literal_stream (a_in: STRING): KL_STRING_INPUT_STREAM
			-- Create an input stream that is not interpreted.
		require
			a_in_not_void: a_in /= Void
		do
			create Result.make (a_in)
		ensure
			not_void: Result /= Void
		end

end
