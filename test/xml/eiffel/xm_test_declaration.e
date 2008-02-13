indexing

	description:

		"Test XML declaration events"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
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

	test_valid_utf8 is
		do
			assert_declaration ("<?xml version='1.0' encoding='utf-8'?><doc/>", "utf-8", True)
			assert_declaration ("<?xml version='1.0' encoding=%"utf-8%"?><doc/>", "utf-8", True)
		end
		
	test_valid_us_ascii is
		do
			assert_declaration ("<?xml version='1.0' encoding='us-ascii'?><doc/>", "us-ascii", True)
		end
		
	test_valid_standalone is
		do
			assert_declaration ("<?xml version='1.0' encoding='utf-8' standalone='no'?><doc/>",
					"utf-8", False)
			assert_declaration ("<?xml version='1.0' encoding='utf-8' standalone='yes'?><doc/>",
					"utf-8", True)
		end
		
feature -- Invalid

	test_invalid_noversion is
		do
			assert_invalid ("<?xml encoding='utf-8'?><doc/>")
			assert_invalid ("<?xml standalone='yes'?><doc/>")
		end

	test_invalid_wrong_version is
		do
			assert_invalid ("<?xml version='0.1'?>")
		end
		
	test_invalid_wrong_stand_alone is
		do
			assert_invalid ("<?xml version='1.0' standalone='maybe'?><doc/>")
		end
	
	test_invalid_wrong_encoding is
		do
			assert_invalid ("<?xml version='1.0' encoding='maybe'?><doc/>")
		end
		
	test_invalid_wrong_unbalanced is
		do
			assert_invalid ("<?xml version='1.0' encoding='utf-8%"?><doc/>")
			assert_invalid ("<?xml version=%"1.0' encoding='utf-8%'?><doc/>")
			assert_invalid ("<?xml version='1.0' encoding='utf-8' standalone=%"yes'?><doc/>")
		end

feature {NONE} -- Assert

	assert_declaration (a_in: STRING; expected_encoding: STRING; expected_standalone: BOOLEAN) is
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
			assert ("version", STRING_.same_string ("1.0", a_filter.version))
			assert ("encoding", STRING_.same_string (expected_encoding, a_filter.encoding))
			assert ("standalone", expected_standalone = a_filter.standalone)
		end
		
	assert_invalid (a_in: STRING) is
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
