indexing

	description: "Test the examples mentioned in the Gobo Formatter documentation."

	library: "Gobo Eiffel Formatter Library"
	origins: "Based on code from Object Tools."
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


deferred class

	GF_TEST_EXAMPLES


inherit

	TS_TEST_CASE

	GF_FORMAT


feature -- Basic tests

	test_string_examples is
			-- Some basic format strings.
		local
			i: INTEGER
			format_string: STRING
		do
			from
				i := string_format_strings.lower
			variant
				string_format_strings.count - (i - string_format_strings.lower)
			until
				i > string_format_strings.upper
			loop
				format_string := "?" + string_format_strings.item (i)
				assert_equal (format_string, string_results.item (i), format (format_string, <<string_value>>))
				i := i + 1
			end
		end

	test_double_examples is
			-- Some basic format strings.
		local
			i: INTEGER
			format_string: STRING
		do
			from
				i := double_format_strings.lower
			variant
				double_format_strings.count - (i - double_format_strings.lower)
			until
				i > double_format_strings.upper
			loop
				format_string := "?" + double_format_strings.item (i)
				assert_equal (format_string, double_results.item (i), format (format_string, <<double_value>>))
				i := i + 1
			end
		end

feature {NONE} -- Format strings

	string_value: STRING is "Hello, John"

	string_format_strings: ARRAY [STRING] is
		once
			Result := <<"10s", "-10.5s", "^10.5s", "10.5s", "s">>
		end

	string_results: ARRAY [STRING] is
		once
			Result := <<"Hello, John", "Hello     ", "  Hello   ", "     Hello", "Hello, John">>
		end

	double_value: DOUBLE is 3.1245621

	double_format_strings: ARRAY [STRING] is
		once
			Result := <<"5.0f", "-3.0f", "6.3f", "8e">>
		end

	double_results: ARRAY [STRING] is
		once
			Result := <<"    3", "3  ", " 3.125", "3.124562e+00">>
		end

end
