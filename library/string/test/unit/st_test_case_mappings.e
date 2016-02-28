note

	description:

		"Test features of class ST_UNICODE_FULL_CASE_MAPPING"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2006-2012, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_TEST_CASE_MAPPINGS

inherit

	TS_TEST_CASE

	ST_UNICODE_FULL_CASE_MAPPING

create

	make_default

feature -- Test

	test_upper_case
			-- Test upper case mapping
		local
			l_unicode_string: UC_UTF8_STRING
		do
			l_unicode_string := upper_utf8_string (Lower_essen)
			assert ("Upper cased string not void", l_unicode_string /= Void)
			assert ("Correct upper form", STRING_.same_string (Upper_essen, l_unicode_string))
			l_unicode_string := lower_utf8_string (l_unicode_string)
			assert ("Lower cased string not void", l_unicode_string /= Void)
			assert ("No round trip", not STRING_.same_string (Lower_essen, l_unicode_string))
			assert ("Expected_result", STRING_.same_string (Unorthodox_essen, l_unicode_string))
		end

	test_lower_case
			-- Test lower case mapping
		local
			l_unicode: 	UC_UNICODE_ROUTINES
			l_unicode_string, l_expected: STRING
		do
			create l_unicode
			-- LATIN CAPITAL LETTER I WITH DOT ABOVE
			l_unicode_string := l_unicode.code_to_string (304)
			l_unicode_string := lower_utf8_string (l_unicode_string)
			assert ("Lower cased string not void", l_unicode_string /= Void)
			l_expected := STRING_.concat (l_unicode.code_to_string (105), l_unicode.code_to_string (775))
			assert ("Correct lower form", STRING_.same_string (l_expected, l_unicode_string))
		end

feature {NONE} -- Implementation

	Lower_essen: STRING = "e%/223/en"
			-- German verb meaning 'to eat'

	Upper_essen: STRING = "ESSEN"
			-- German verb meaning 'to eat'

	Unorthodox_essen: STRING = "essen"
			-- German verb meaning 'to eat' with unorthodox spelling

end
