note

	description:

		"Test features of class ST_SCIENTIFIC_FORMATTER"

	test_status: "ok_to_run"
	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004-2011, Object-Tools and others"
	license: "MIT License"

class ST_TEST_SCIENTIFIC_FORMATTER

inherit

	TS_TEST_CASE

	ST_FORMATTING_ROUTINES
		export {NONE} all end

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

create

	make_default

feature -- Test

	test_string
			-- Test string formatting.
		local
			empty_array: ARRAY [STRING]
		do
			create empty_array.make_filled ("", 1, 0)
			assert_equal ("test1", "", format ("", empty_array))
			assert_equal ("test2", "berend", format ("$s", <<"berend">>))
			assert_equal ("test3", "##", format ("#$s#", <<"">>))
			assert_equal ("test4", "nothing", format ("nothing", empty_array))
			assert_equal ("test6", "  a", format ("$3s", <<"a">>))
			assert_equal ("test7", "a   ", format ("$-4s", <<"a">>))
			assert_equal ("test8", " a ", format ("$^3s", <<"a">>))
			assert_equal ("test9", "#   #", format ("#$-3.3s#", <<"">>))
		end

	test_character
			-- Test character formatting.
		do
			assert_equal ("test1", "c", format ("$c", << character_cell ('c') >>))
		end

	test_boolean
			-- Test boolean formatting.
		do
			assert_equal ("test1", "True", format ("$B", << boolean_cell (True) >>))
			assert_equal ("test2", "False", format ("$B", << boolean_cell (False) >>))
			assert_equal ("test3", "true", format ("$b", << boolean_cell (True) >>))
			assert_equal ("test4", "false", format ("$b", << boolean_cell (False) >>))
		end

	test_integer
			-- Test integer formatting.
		do
			assert_equal ("test1", "0", format ("$i", << integer_cell (0) >>))
			assert_equal ("test2", "31", format ("$i", << integer_cell (31) >>))
			assert_equal ("test3", "-31", format ("$i", << integer_cell (-31) >>))
			assert_equal ("test4", " 31", format ("$3i", << integer_cell (31) >>))
			assert_equal ("test5", " 31 ", format ("$^4i", << integer_cell (31) >>))
			assert_equal ("test6", "00031", format ("$05i", << integer_cell (31) >>))
			assert_equal ("test7", "009", format ("$.3i", << integer_cell (9) >>))
			assert_equal ("test8", "5  ", format ("$-3i", << integer_cell (5) >>))
			assert_equal ("test9", "+12345678", format ("$+i", << integer_cell (+12345678) >>))
			assert_equal ("test10", "12345678", format ("$1i", << integer_cell (+12345678) >>))
			assert_equal ("test11", "31", format ("$d", << integer_cell (31) >>))
			assert_equal ("test12", "-0123", format ("$05i", << integer_cell (-123) >>))
				-- Minimum integer.
			assert_equal ("test13", "-2147483648", format ("$d", <<integer_cell (-2147483648)>>))
		end

	test_unsigned_decimal
			-- Test unsigned decimal formatting.
		do
			assert_equal ("test1", "1", format ("$u", << integer_cell (1) >>))
			assert_equal ("test2", "00031", format ("$05u", << integer_cell (31) >>))
		end

	test_hexadecimal
			-- Test hexadecimal formatting.
		do
			assert_equal ("test1", "0", format ("$x", << integer_cell (0) >>))
			assert_equal ("test2", "1", format ("$x", << integer_cell (1) >>))
			assert_equal ("test3", "a", format ("$x", << integer_cell (10) >>))
			assert_equal ("test4", "A", format ("$X", << integer_cell (10) >>))
			assert_equal ("test5", "ff", format ("$x", << integer_cell (255) >>))
			assert_equal ("test6", "FF", format ("$X", << integer_cell (255) >>))
			assert_equal ("test7", "", format ("$.0x", << integer_cell (0) >>))
		end

	test_octal
			-- Test octal formatting.
		do
			assert_equal ("test1", "0", format ("$o", << integer_cell (0) >>))
			assert_equal ("test2", "1", format ("$o", << integer_cell (1) >>))
			assert_equal ("test3", "12", format ("$o", << integer_cell (10) >>))
		end

	test_floating_point
			-- Test floating point formatting.
		do
			assert_equal ("test1", "1.000000e+00", format ("$e", << double_cell (1.0) >>))
			assert_equal ("test2", "0.000000e+00", format ("$e", << double_cell (0.0) >>))
			assert_equal ("test3", "1.234568e+18", format ("$e", << double_cell (1234567890123456789.0) >>))
			assert_equal ("test4", "1.00e+01", format ("$.2e", << double_cell (10.000) >>))
			assert_equal ("test5", "1e+00", format ("$.0e", << double_cell (1.0) >>))
			assert_equal ("test6", "6e+00", format ("$.0e", << double_cell (5.99) >>))
			assert_equal ("test7", "   2.5e+01", format ("$10.1e", << double_cell (25.000) >>))
			assert_equal ("test8", "2.5e+01   ", format ("$-10.1e", << double_cell (25.000) >>))
			assert_equal ("test9", "2.5E+01   ", format ("$-10.1E", << double_cell (25.000) >>))
			assert_equal ("test10", "-1.00e+00", format ("$.2e", << double_cell (-1.0) >>))
			assert_equal ("test11", "-2.00e-01", format ("$.2e", << double_cell (-0.2) >>))
		end

	test_fixed_point
			-- Test fixed point formatting.
		do
			assert_equal ("test1", "1.000000", format ("$f", << double_cell (1.0) >>))
			assert_equal ("test2", "0.100000", format ("$f", << double_cell (0.1) >>))
			assert_equal ("test3", "1.0", format ("$.1f", << double_cell (1.0) >>))
			assert_equal ("test4", "-1.0", format ("$.1f", << double_cell (-1.0) >>))
			assert_equal ("test5", "1.000000", format ("$f", << double_cell (1.0) >>))
			assert_equal ("test6", " 3.14", format ("$5.2f", << double_cell (3.14149) >>))
			assert_equal ("test7", " 3.15", format ("$5.2f", << double_cell (3.14501) >>))
			assert_equal ("test8", "3", format ("$.0f", << double_cell (3.145) >>))
			assert_equal ("test9", "4", format ("$.0f", << double_cell (3.6) >>))
			assert_equal ("test10", "-1.00", format ("$.2f", << double_cell (-1.0) >>))
			assert_equal ("test11", "-0.20", format ("$.2f", << double_cell (-0.2) >>))
			assert_equal ("test12", "941.659000000", format ("$11.9f", << double_cell (941.65899999999817) >>))
			assert_equal ("test13", "942.000000000", format ("$11.9f", << double_cell (941.99999999999817) >>))
		end

	test_mixed_point
			-- Test mixed point formatting.
		do
			assert_equal ("test1", "1.000000", format ("$g", << double_cell (1.0) >>))
			assert_equal ("test2", "0.004500", format ("$g", << double_cell (0.0045) >>))
			assert_equal ("test3", "4.500000e-05", format ("$g", << double_cell (0.000045) >>))
			assert_equal ("test4", "4.500000e-06", format ("$g", << double_cell (0.0000045) >>))
			assert_equal ("test5", "-4.500000e-06", format ("$g", << double_cell (-0.0000045) >>))
			assert_equal ("test6", "1.00", format ("$.2g", << double_cell (1.0) >>))
			assert_equal ("test7", "-1.00", format ("$.2g", << double_cell (-1.0) >>))
			assert_equal ("test8", "4.50e-06", format ("$.2g", << double_cell (0.0000045) >>))
			assert_equal ("test9", "-4.50e-06", format ("$.2g", << double_cell (-0.0000045) >>))
			assert_equal ("test10", "1.0", format ("$.0g", << double_cell (1.0) >>))
			assert_equal ("test11", "3.14", format ("$.2G", << double_cell (3.1415) >>))
			assert_equal ("test12", "31.41", format ("$.2G", << double_cell (31.4149) >>))
			assert_equal ("test13", "31.42", format ("$.2G", << double_cell (31.41501) >>))
			assert_equal ("test14", "3.14E+02", format ("$.2G", << double_cell (314.15) >>))
				-- Make sure that the + sign is displayed.
			assert_equal ("test15", "+1.000000", format ("$+G", << double_cell (1.0) >>))
		end

	test_other_examples
			-- Examples taken from original Formatter library.
		local
			s, s1: STRING
			empty_array: ARRAY [STRING]
			m_pi: DOUBLE
			pi_cell: DS_CELL [DOUBLE]
			a_format: STRING
		do
			create empty_array.make_filled ("", 1, 0)
			s := "programmer"
			s1 := "programmers"
			m_pi := -3.14159265
			pi_cell := double_cell (m_pi)

			a_format := "$10d_$10d_$-10d_$10o_$010o_$-10x_$010x  "
			assert_equal ("test1",
				"       360_        -1_360       _       550_0000000550_168       _0000000168  ",
				format (a_format, << integer_cell (360), integer_cell (-1), integer_cell (360), integer_cell (360), integer_cell (360), integer_cell (360), integer_cell (360) >>))

			a_format := "$10f_$10.3f_$-10.3f_$10.0f_$10g_$10e_$10.2e_  "
			assert_equal ("test2",
				" -3.141593_    -3.142_-3.142    _        -3_ -3.141593_-3.141593e+00_ -3.14e+00_  ",
				format (a_format, <<pi_cell, pi_cell, pi_cell, pi_cell, pi_cell, pi_cell, pi_cell>>))

			a_format := "$ 010f_$ 010.3f_$ 010.3f_$ 010.0f_$ 010g_$ 010e_$ 010.2e_  "
			assert_equal ("test3",
				" -3.141593_    -3.142_    -3.142_        -3_ -3.141593_-3.141593e+00_0-3.14e+00_  ",
				format (a_format, <<pi_cell, pi_cell, pi_cell, pi_cell, pi_cell, pi_cell, pi_cell>>))

			a_format := "$10s_$10s_$10.7s_$-10.7s_$10.4s_$10.0s_$.3s  "
			assert_equal ("test4",
				"programmer_programmers_   program_program   _      prog_programmer_pro  ",
				format (a_format, <<s,  s1, s, s, s, s, s>>))

				------------------------------------------------------------
				-- You may mix-up several types in format string
				-- argument must conform to corresponding typechar
				------------------------------------------------------------
			a_format := "$i $x $o $u $c $b $s $e $f "
			assert_equal ("test5",
				"-123 100 400 123 c true some string 3.141593e+00 3.141593 ",
				format (a_format, << integer_cell (-123), integer_cell (256), integer_cell (256), integer_cell (123), character_cell ('c'), boolean_cell (True), "some string", double_cell (3.1415934563), double_cell (3.1415934563)>>))

				------------------------------------------------------------
				-- Before typechar you may specify output width and precision
				--
				-- SYNTAX: $[width][.precision]typechar
				--
				-- width - Minimum number of characters to print, padding
				--         with blanks or zeros
				--
				-- precision - Maximum number of characters to print; for
				--             integers, minimum number of digits to print
				--
				------------------------------------------------------------
			a_format := "$5i $4x $6o $u $c $b $3s $8e $7.8f "
			assert_equal ("test6",
				" -123  100    400 123 c true some string 3.141593e+00 3.14159346 ",
				format (a_format, << integer_cell (-123), integer_cell (256), integer_cell (256), integer_cell (123), character_cell ('c'), boolean_cell (True), "some string", double_cell (3.1415934563), double_cell (3.1415934563)>>))

				-----------------------------------------------------------------------
				-- You may specify following format flags:
				-- =======================================
				-- '-' Means left alignment (by default value aligns to right)
				--
				-- '^' Means center alignment (by default value aligns to right)
				--
				-- '+' Prefix  the  output value with a sign (+ or -) if the output
				--     value is of a signed type. (by default only '-' printed)
				--
				-- ' ' Similar to '+' but add space character instead of plus.
				--
				-- '0' If width is prefixed with 0, zeros are added until the
				--     minimum width is reached (by default added spaces)
				--
				-- Restrictions:
				--    (' ' after '+') and ('0' with '-','^') combinations are incorrect
				-----------------------------------------------------------------------
			a_format := "$05i $+i gobo$ i $04x $6o $u $c $B $-.3s $00.5e $+7.8f gobo$ 7.8f"
			assert_equal ("test7",
				"-0123 +33 gobo 44 0100    400 123 c True som 3.14159e+00 +3.14159346 gobo 3.14159346",
				format (a_format, <<integer_cell (-123), integer_cell (33), integer_cell (44), integer_cell (256), integer_cell (256), integer_cell (123), character_cell ('c'), boolean_cell (True), "some string", double_cell (3.1415934563), double_cell (3.1415934563), double_cell (3.1415934563)>>))

			a_format := "($^10s) ($^10i) ($^10e) "
			assert_equal ("test8",
				"(   abc    ) (   123    ) (1.230000e+00) ",
				format (a_format, <<"abc", integer_cell (123), double_cell (1.23)>>))

				------------------------------------------------------------
				-- To output character same as default escape write it twice
				------------------------------------------------------------
			a_format := "Hello $s $$"
			assert_equal ("test9", "Hello Frieder $", format (a_format, <<"Frieder">>))

				------------------------------------------------------------
				-- Arguments array may be empty, in such cases format string
				-- must contain no escape sequences
				------------------------------------------------------------
			a_format := "Hello$$"
			assert_equal ("test10", "Hello$", format (a_format, empty_array))
		end

	test_custom_formats
			-- Test custom formatting.
		local
			width,
			precision: DS_CELL [INTEGER]
		do
			width := integer_cell (10)
			precision := integer_cell (5)
			assert_equal ("test1", "     00123", format ("$*.*i", <<width, precision, integer_cell (123) >>))
			assert_equal ("test2", "       123", format ("$*i", <<width,  integer_cell (123) >>))
			assert_equal ("test3", "00123", format ("$.*i", <<precision, integer_cell (123) >>))
		end

	test_unicode_format
			-- Test with Unicode formats.
		local
			uc_format_string_1: UC_STRING
			uc_parameter_1_utf8: STRING
			uc_parameter_1: UC_STRING
		do
			create uc_format_string_1.make_from_string ("$s")
			uc_parameter_1_utf8 := "RAVEL MÃÂBLE"
			create uc_parameter_1.make_from_utf8 (uc_parameter_1_utf8)
			assert ("test1", STRING_.same_string ("hello", format (uc_format_string_1, <<"hello">>)))
			assert ("test2", ANY_.same_types (uc_format_string_1, format (uc_format_string_1, <<"hello">>)))
			assert_equal ("test3", uc_parameter_1, format (uc_format_string_1, <<uc_parameter_1>>))
		end

	test_unicode_parameter
			-- Test if unicode strings in parameters are flattened to UTF8 encoded strings.
		local
			uc_parameter_1_utf8: STRING
			uc_parameter_1: UC_STRING
		do
			uc_parameter_1_utf8 := "RAVEL MÃÂBLE"
			create uc_parameter_1.make_from_utf8 (uc_parameter_1_utf8)
			assert ("test1", STRING_.same_string (uc_parameter_1_utf8, format ("$s", <<uc_parameter_1>>)))
		end

	test_wrong_formats
			-- Test erroneous format.
		do
			assert ("test1", not valid_format_and_parameters ("nothing", <<"berend">>))
		end

end
