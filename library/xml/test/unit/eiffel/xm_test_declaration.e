note

	description:

		"Test XML declaration events"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_TEST_DECLARATION

inherit

	TS_TEST_CASE

	XM_CALLBACKS_FILTER_FACTORY

create

	make_default

feature -- Test

	test_valid_utf8
			-- Test that we can handle UTF8 encoding.
		do
			assert_declaration ("<?xml version='1.0' encoding='utf-8'?><doc/>", "utf-8", True)
			assert_declaration ("<?xml version='1.0' encoding=%"utf-8%"?><doc/>", "utf-8", True)
		end

	test_valid_us_ascii
		do
			assert_declaration ("<?xml version='1.0' encoding='us-ascii'?><doc/>", "us-ascii", True)
		end

	test_valid_standalone
		do
			assert_declaration ("<?xml version='1.0' encoding='utf-8' standalone='no'?><doc/>",
					"utf-8", False)
			assert_declaration ("<?xml version='1.0' encoding='utf-8' standalone='yes'?><doc/>",
					"utf-8", True)
		end

feature -- Invalid

	test_invalid_noversion
		do
			assert_invalid ("<?xml encoding='utf-8'?><doc/>")
			assert_invalid ("<?xml standalone='yes'?><doc/>")
		end

	test_invalid_wrong_version
		do
			assert_invalid ("<?xml version='0.1'?>")
		end

	test_invalid_wrong_stand_alone
		do
			assert_invalid ("<?xml version='1.0' standalone='maybe'?><doc/>")
		end

	test_invalid_wrong_encoding
		do
			assert_invalid ("<?xml version='1.0' encoding='maybe'?><doc/>")
		end

	test_invalid_wrong_unbalanced
		do
			assert_invalid ("<?xml version='1.0' encoding='utf-8%"?><doc/>")
			assert_invalid ("<?xml version=%"1.0' encoding='utf-8%'?><doc/>")
			assert_invalid ("<?xml version='1.0' encoding='utf-8' standalone=%"yes'?><doc/>")
		end

feature {NONE} -- Assert

	assert_declaration (a_in: STRING; expected_encoding: STRING; expected_standalone: BOOLEAN)
			-- Assert parsing OK and standalone declaration correctly read.
		require
			a_in_not_void: a_in /= Void
			expected_encoding_not_void: expected_encoding /= Void
		local
			a_parser: XM_EIFFEL_PARSER
			a_filter: XM_DECLARATION_FILTER
		do
			create a_parser.make
			create a_filter.make_null
			a_parser.set_callbacks (standard_callbacks_pipe (<<a_filter>>))
			a_parser.parse_from_string (a_in)

			assert ("parsing ok", a_parser.is_correct)
			assert ("version", attached a_filter.version as l_version and then STRING_.same_string ("1.0", l_version))
			assert ("encoding", attached a_filter.encoding as l_encoding and then STRING_.same_string (expected_encoding, l_encoding))
			assert ("standalone", expected_standalone = a_filter.standalone)
		end

	assert_invalid (a_in: STRING)
			-- Assert parsing error.
		require
			a_in_not_void: a_in /= Void
		local
			a_parser: XM_EIFFEL_PARSER
		do
			create a_parser.make
			a_parser.parse_from_string (a_in)
			assert ("invalid", not a_parser.is_correct)
		end

end
