note

	description:

		"Test features of class ST_WORD_WRAPPER"

	test_status: "ok_to_run"
	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2006, Bernd Schoeller and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_TEST_WORD_WRAPPER

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

create

	make_default

feature -- Testing

	test_long_text is
			-- Test with a long string.
		local
			wrapper: ST_WORD_WRAPPER
			wrapped_text: STRING
		do
			create wrapper.make
			wrapped_text := wrapper.wrapped_string (long_text)
			assert_strings_equal ("long_text", all_whitespace_removed (long_text), all_whitespace_removed (wrapped_text))
		end

	test_original_not_modified is
			-- Test if the original string is not modified.
		local
			wrapper: ST_WORD_WRAPPER
			string_a: STRING
			string_b: STRING
			dummy_string: STRING
		do
			string_a := STRING_.cloned_string (short_text)
			string_b := STRING_.cloned_string (short_text)
			create wrapper.make
			dummy_string := wrapper.wrapped_string (string_b)
			assert_strings_equal ("original_not_modifed", string_a, string_b)
		end

	test_normal_text_wrapped is
			-- Test if a normal text is correctly wrapped.
		local
			wrapper: ST_WORD_WRAPPER
			wrapped_text: STRING
		do
			create wrapper.make
			wrapper.set_maximum_text_width (10)
			wrapped_text := wrapper.wrapped_string (short_text)
			assert_strings_equal ("normal_text_wrapped", short_text_width_ten, wrapped_text)
		end

	test_normal_text_wrapped_and_indented is
			-- Test if a normal text is correctly wrapped with indentation.
		local
			wrapper: ST_WORD_WRAPPER
			wrapped_text: STRING
		do
			create wrapper.make
			wrapper.set_maximum_text_width (10)
			wrapper.set_new_line_indentation (2)
			wrapped_text := wrapper.wrapped_string (short_text)
			assert_strings_equal ("normal_text_wrapped_and_indented", short_text_width_ten_indentation_two, wrapped_text)
		end

	test_spaced_text_wrapped is
			-- Test if a text is correctly wrapped that includes strange 
			-- space characters.
		local
			wrapper: ST_WORD_WRAPPER
			wrapped_text: STRING
		do
			create wrapper.make
			wrapper.set_maximum_text_width (10)
			wrapped_text := wrapper.wrapped_string (short_text_spaced)
			assert_strings_equal ("spaced_text_wrapped", short_text_width_ten, wrapped_text)
		end

	test_corner_cases is
			-- Test some of the corner cases.
		local
			wrapper: ST_WORD_WRAPPER
			wrapped_text: STRING
		do
			create wrapper.make
			wrapped_text := wrapper.wrapped_string ("")
			assert_strings_equal ("empty_string", "", wrapped_text)
			wrapper.set_maximum_text_width (1)
			wrapped_text := wrapper.wrapped_string ("hello")
			assert_strings_equal ("every_charcter_break", "h%Ne%Nl%Nl%No", wrapped_text)            
			wrapper.set_maximum_text_width (2)
			wrapper.set_new_line_indentation (1)
			wrapped_text := wrapper.wrapped_string ("hello")
			assert_strings_equal ("width_two_indention_one", "he%N l%N l%N o", wrapped_text)        
		end

	test_whitespace is
			-- Test the handling of whitespace.
		local
			wrapper: ST_WORD_WRAPPER
			wrapped_text: STRING
		do
			create wrapper.make
			wrapper.set_maximum_text_width (4)
			wrapped_text := wrapper.wrapped_string (" ")
			assert_strings_equal ("single_space", " ", wrapped_text)
			wrapped_text := wrapper.wrapped_string ("    ")
			assert_strings_equal ("full_space_line", "    ", wrapped_text)
			wrapped_text := wrapper.wrapped_string ("      ")
			assert_strings_equal ("whitespace break", "    %N ", wrapped_text)
		end

feature {NONE} -- Input strings

	long_text: STRING is "The tower stands 300 m (986 ft) high, %
		%which is about 75 stories. Including the 24-m (72-ft) antenna, %
		%the structure is 324 m (1058 ft) high. At the time of its construction %
		%in 1889, the tower was the tallest structure in the world, a title it %
		%retained until 1930, when New York City's Chrysler Building (319 m/1046 %
		%ft tall) was completed (although the tower was still taller if the %
		%respective spires of the two structures were excluded). The tower %
		%is the second-highest structure in France, after the 350-m %
		%Allouis longwave transmitter, built in 1939. It is the highest structure %
		%by far in Paris; the second-highest structure in Paris, and the %
		%third-highest in France, is the Tour Montparnasse (Montparnasse %
		%Tower), at 209 m." 

	short_text: STRING is "The metal structure weighs 7,300 t"

	short_text_spaced: STRING is "The metal%Nstructure weighs%T7,300 t"

	short_text_width_ten: STRING is "The metal%Nstructure%Nweighs%N7,300 t"

	short_text_width_ten_indentation_two: STRING is "The metal%N  structur%N  e weighs%N  7,300 t"

feature {NONE} -- Implementation

	all_whitespace_removed (a_text: STRING): STRING is
			-- `a_text' with all white-space removed
		local
			position: INTEGER
			length: INTEGER
			char: CHARACTER
		do
			from
				position := 1
				length := a_text.count
				Result := ""
			until
				position > length
			loop
				char := a_text.item (position)
				if not is_space (char) then
					Result.append_character (char)
				end
				position := position + 1
			end
		end

	is_space (a_character: CHARACTER):BOOLEAN is
			-- Is `a_character' a tab, a newline, a linefeed or a space?
		do
			Result := (a_character = ' ') or
				(a_character = '%T') or
				(a_character = '%N') or
				(a_character = '%R')
		end

end
