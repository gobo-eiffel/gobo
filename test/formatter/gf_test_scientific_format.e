indexing

	description: "GF_SCIENTIFIC_FORMAT test."

	library: "Gobo Eiffel Formatter Library"
	origins: "Based on code from Object Tools."
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


deferred class

	GF_TEST_SCIENTIFIC_FORMAT


inherit

	TS_TEST_CASE

	GF_FORMAT_ROUTINES


feature -- Basic tests

	test_string is
			-- Some basic format strings.
		do
			assert_equal (format_string_empty, "", format (format_string_empty, <<>>))
			assert_equal (format_string_1, "berend", format (format_string_1, <<"berend">>))
			assert_equal (format_string_1, "", format (format_string_1, <<"">>))
			assert_equal (format_string_2, "nothing", format (format_string_2, <<>>))
			assert_equal (format_string_2, "nothing", format (format_string_2, Void))
			assert_equal (format_string_3, "  a", format (format_string_3, <<"a">>))
			assert_equal (format_string_4, "a   ", format (format_string_4, <<"a">>))
			assert_equal (format_string_5, " a ", format (format_string_5, <<"a">>))
		end

	test_character is
		do
			assert_equal (format_string_c_1, "c", format (format_string_c_1, <<'c'>>))
		end

	test_boolean is
		local
			ref_true,
			ref_false: BOOLEAN_REF
		do
			create ref_true
			ref_true.set_item (True)
			create ref_false
			ref_false.set_item (False)
			assert_equal (format_string_b_1, "true", format (format_string_b_1, <<ref_true>>))
			assert_equal (format_string_b_1, "false", format (format_string_b_1, <<ref_false>>))
			assert_equal (format_string_b_2, "True", format (format_string_b_2, <<True>>))
			assert_equal (format_string_b_2, "False", format (format_string_b_2, <<False>>))
		end

	test_integer is
		do
			assert_equal (format_string_i_1, "0", format (format_string_i_1, <<0>>))
			assert_equal (format_string_i_1, "31", format (format_string_i_1, <<31>>))
			assert_equal (format_string_i_1, "-31", format (format_string_i_1, <<-31>>))
			assert_equal (format_string_i_2, " 31", format(format_string_i_2, <<31>>))
			assert_equal (format_string_i_3, " 31 ", format(format_string_i_3, <<31>>))
			assert_equal (format_string_i_4, "00031", format(format_string_i_4, <<31>>))
			assert_equal (format_string_i_5, "009", format(format_string_i_5, <<9>>))
			assert_equal (format_string_i_6, "5  ", format(format_string_i_6, <<5>>))
			assert_equal (format_string_i_7, "+12345678", format(format_string_i_7, <<+12345678>>))
			assert_equal (format_string_i_8, "12345678", format(format_string_i_8, <<+12345678>>))
			assert_equal (format_string_d_1, "31", format(format_string_d_1, <<31>>))
		end

	test_unsigned_decimal is
		do
			assert_equal (format_string_u_1, "1", format (format_string_u_1, <<1>>))
			assert_equal (format_string_u_2, "00031", format(format_string_u_2, <<31>>))
		end

	test_hex is
		do
			assert_equal (format_string_x_1, "0", format (format_string_x_1, <<0>>))
			assert_equal (format_string_x_1, "1", format (format_string_x_1, <<1>>))
			assert_equal (format_string_x_1, "a", format (format_string_x_1, <<10>>))
			assert_equal (format_string_X_2, "A", format (format_string_X_2, <<10>>))
			assert_equal (format_string_x_1, "ff", format (format_string_x_1, <<255>>))
			assert_equal (format_string_X_2, "FF", format (format_string_X_2, <<255>>))
			assert_equal (format_string_x_3, "", format (format_string_x_3, <<0>>))
		end

	test_octal is
		do
			assert_equal (format_string_o_1, "0", format (format_string_o_1, <<0>>))
			assert_equal (format_string_o_1, "1", format (format_string_o_1, <<1>>))
			assert_equal (format_string_o_1, "12", format (format_string_o_1, <<10>>))
		end

	test_floating_point is
		do
			assert_equal (format_string_e_1, "1.000000e+00", format (format_string_e_1, <<1.0>>))
			assert_equal (format_string_e_1, "0.000000e+00", format (format_string_e_1, <<0.0>>))
			assert_equal (format_string_e_1, "1.234568e+18", format (format_string_e_1, <<1234567890123456789.0>>))
			assert_equal (format_string_e_2, "1.00e+01", format (format_string_e_2, <<10.000>>))
			assert_equal (format_string_e_3, "1e+00", format (format_string_e_3, <<1.0>>))
			assert_equal (format_string_e_3, "6e+00", format (format_string_e_3, <<5.99>>))
			assert_equal (format_string_e_4, "   2.5e+01", format (format_string_e_4, <<25.000>>))
			assert_equal (format_string_e_5, "2.5e+01   ", format (format_string_e_5, <<25.000>>))
			assert_equal (format_string_E_6, "2.5E+01   ", format (format_string_E_6, <<25.000>>))
		end

	test_fixed_point is
		do
			assert_equal (format_string_f_1, "1.000000", format (format_string_f_1, <<1.0>>))
			assert_equal (format_string_f_1, "0.100000", format (format_string_f_1, <<0.1>>))
			assert_equal (format_string_f_2, "1.0", format (format_string_f_2, <<1.0>>))
			assert_equal (format_string_f_2, "-1.0", format (format_string_f_2, <<-1.0>>))
			assert_equal (format_string_f_1, "1.000000", format (format_string_f_1, <<1.0>>))
			assert_equal (format_string_f_3, " 3.14", format (format_string_f_3, <<3.14149>>))
			assert_equal (format_string_f_3, " 3.15", format (format_string_f_3, <<3.14501>>))
			assert_equal (format_string_f_4, "3", format (format_string_f_4, <<3.145>>))
			assert_equal (format_string_f_4, "4", format (format_string_f_4, <<3.6>>))
		end

	test_mixed_point is
		do
			assert_equal (format_string_g_1, "1.000000", format (format_string_g_1, <<1.0>>))
			assert_equal (format_string_g_1, "0.004500", format (format_string_g_1, <<0.0045>>))
			assert_equal (format_string_g_1, "4.500000e-05", format (format_string_g_1, <<0.000045>>))
			assert_equal (format_string_g_1, "4.500000e-06", format (format_string_g_1, <<0.0000045>>))
			assert_equal (format_string_g_1, "-4.500000e-06", format (format_string_g_1, <<-0.0000045>>))
			assert_equal (format_string_g_2, "1.00", format (format_string_g_2, <<1.0>>))
			assert_equal (format_string_g_2, "-1.00", format (format_string_g_2, <<-1.0>>))
			assert_equal (format_string_g_2, "4.50e-06", format (format_string_g_2, <<0.0000045>>))
			assert_equal (format_string_g_2, "-4.50e-06", format (format_string_g_2, <<-0.0000045>>))
			assert_equal (format_string_g_3, "1.0", format (format_string_g_3, <<1.0>>))
			assert_equal (format_string_G_4, "3.14", format (format_string_G_4, <<3.1415>>))
			assert_equal (format_string_G_4, "31.41", format (format_string_G_4, <<31.4149>>))
			assert_equal (format_string_G_4, "31.42", format (format_string_G_4, <<31.41501>>))
			assert_equal (format_string_G_4, "3.14E+02", format (format_string_G_4, <<314.15>>))
		end

	test_pointer is
		local
			p: POINTER_REF
			q: POINTER
		do
			-- for ISE it's a pointer, for SE it's a pointer_ref.
			-- and there is no portable routine to convert a pointer to an integer, so we can't print pointers.
			--assert_equal (format_string_p_1, "0x0", format (format_string_p_1, <<default_pointer>>))
			debug
				create p
				p.set_item ($my_dummy)
				-- This does not work with VE, maybe I get a POINTER in that case?
				--print (format (format_string_p_1, <<p>>))
				--print ("%N")
				-- does not work with se and ve, don't know why.
				--q := $my_dummy
				print ("test_pointer: ")
				print (format (format_string_p_1, <<q>>))
				print ("%N")
			end
		end

	test_other_examples is
			-- Examples taken from original Formatter library.
		local
			s, s1: STRING
		do
			s  := "programmer"
			s1 := "programmers"
			assert_equal (format_string_other_1, "       360_        -1_360       _       550_0000000550_168       _0000000168  ", format (format_string_other_1, <<360, -1, 360, 360, 360, 360, 360>>))
			assert_equal (format_string_other_2, " -3.141593_    -3.142_-3.142    _        -3_ -3.141593_-3.141593e+00_ -3.14e+00_  ", format (format_string_other_2, <<m_pi, m_pi, m_pi, m_pi, m_pi, m_pi, m_pi>>))
			assert_equal (format_string_other_3, " -3.141593_    -3.142_    -3.142_        -3_ -3.141593_-3.141593e+00_0-3.14e+00_  ", format (format_string_other_3, <<m_pi, m_pi, m_pi, m_pi, m_pi, m_pi, m_pi>>))
			assert_equal (format_string_other_4, "programmer_programmers_   program_program   _      prog_programmer_pro  ", format (format_string_other_4, <<s,  s1, s, s, s, s, s>>))

	------------------------------------------------------------
	-- You may mix-up several types in format string
	-- argument must conform to corresponding typechar
	------------------------------------------------------------

			assert_equal (format_string_other_5, "-123 100 400 123 c true some string 3.141593e+00 3.141593 ", format (format_string_other_5, <<-123, 256, 256, 123, 'c', true, "some string", 3.1415934563, 3.1415934563>>))

	------------------------------------------------------------
	-- Before typechar you may specify output width and precision
	--
	-- SYNTAX: ?[width][.precision]typechar
	--
	-- width - Minimum number of characters to print, padding
	--         with blanks or zeros
	--
	-- precision - Maximum number of characters to print; for
	--             integers, minimum number of digits to print
	--
	------------------------------------------------------------

			assert_equal (format_string_other_6, " -123  100    400 123 c true some string 3.141593e+00 4.41593451 ", format (format_string_other_6, <<-123, 256, 256, 123, 'c', true, "some string", 3.1415934563, 3.1415934563>>))

	-----------------------------------------------------------------------
	-- You may specify following format flags:
	-- =======================================
	-- '-' Means left alignment (by default value aligns to rigth)
	--
	-- '^' Means center alignment (by default value aligns to rigth)
	--
	-- '+' Prefix  the  output value with a sign (+ or -) if the output
	--     value is of a signed type. (by default only '-' printed)
	--
	-- ' ' Similar to '+' but add space chacacter instead of plus.
	--
	-- '0' If width is prefixed with 0, zeros are added until the
	--     minimum width is reached (by default added spaces)
	--
	-- Restrictions:
	--    (' ' after '+') and ('0' with '-','^') combinations are incorrect
	-----------------------------------------------------------------------

			assert_equal (format_string_other_7, "0123- 0100    400 123 c True som 3.14159e+00 4.41593451 ", format (format_string_other_7, <<-123, 256, 256, 123, 'c', true, "some string", 3.1415934563, 3.1415934563>>))
			assert_equal (format_string_other_8, "(   abc    ) (   123    ) (1.230000e+00) ", format (format_string_other_8, <<"abc", 123, 1.23>>))

	------------------------------------------------------------
	-- To output character same as default escape write it twice
	------------------------------------------------------------
			assert_equal (format_string_other_9, "Hello Frieder ?", format (format_string_other_9, <<"Frieder">>))

	------------------------------------------------------------
	-- Arguments array may be empty, in such cases format string
	-- must contain no escape sequences
	------------------------------------------------------------
			assert_equal (format_string_other_10, "Hello?", format (format_string_other_10, <<>>))

		end

	test_custom_formats is
		local
			width,
			precision: INTEGER
		do
			width := 10
			precision := 5
			assert_equal (format_string_custom_1, "     00123", format (format_string_custom_1, <<width, precision, 123>>))
			assert_equal (format_string_custom_2, "       123", format (format_string_custom_2, <<width,  123>>))
			assert_equal (format_string_custom_3, "00123", format (format_string_custom_3, <<precision, 123>>))
		end

	test_wrong_formats is
		do
			assert (format_string_2, not is_correct_format_and_parameters (format_string_2, <<"berend">>))
		end


feature {NONE} -- Format strings

	format_string_empty: STRING is ""
	format_string_1: STRING is "?s"
	format_string_2: STRING is "nothing"
	format_string_3: STRING is "?3s"
	format_string_4: STRING is "?-4s"
	format_string_5: STRING is "?^3s"

	format_string_c_1: STRING is "?c"

	format_string_b_1: STRING is "?b"
	format_string_b_2: STRING is "?B"

	format_string_i_1: STRING is "?i"
	format_string_i_2: STRING is "?3i"
	format_string_i_3: STRING is "?^4i"
	format_string_i_4: STRING is "?05i"
	format_string_i_5: STRING is "?.3i"
	format_string_i_6: STRING is "?-3i"
	format_string_i_7: STRING is "?+i"
	format_string_i_8: STRING is "?1i"

	format_string_d_1: STRING is "?d"

	format_string_e_1: STRING is "?e"
	format_string_e_2: STRING is "?.2e"
	format_string_e_3: STRING is "?.0e"
	format_string_e_4: STRING is "?10.1e"
	format_string_e_5: STRING is "?-10.1e"
	format_string_E_6: STRING is "?-10.1E"

	format_string_f_1: STRING is "?f"
	format_string_f_2: STRING is "?.1f"
	format_string_f_3: STRING is "?5.2f"
	format_string_f_4: STRING is "?.0f"

	format_string_g_1: STRING is "?g"
	format_string_g_2: STRING is "?.2g"
	format_string_g_3: STRING is "?.0g"
	format_string_G_4: STRING is "?.2G"

	format_string_o_1: STRING is "?o"

	format_string_p_1: STRING is "?p"

	format_string_u_1: STRING is "?u"
	format_string_u_2: STRING is "?05u"

	format_string_x_1: STRING is "?x"
	format_string_X_2: STRING is "?X"
	format_string_x_3: STRING is "?.0x"

	format_string_other_1: STRING is "?10d_?10d_?-10d_?10o_?010o_?-10x_?010x  "
	format_string_other_2: STRING is "?10f_?10.3f_?-10.3f_?10.0f_?10g_?10e_?10.2e_  "
	format_string_other_3: STRING is "? 010f_? 010.3f_? 010.3f_? 010.0f_? 010g_? 010e_? 010.2e_  "
	format_string_other_4: STRING is "?10s_?10s_?10.7s_?-10.7s_?10.4s_?10.0s_?.3s  "
	format_string_other_5: STRING is "?i ?x ?o ?u ?c ?b ?s ?e ?f "
	format_string_other_6: STRING is "?5i ?4x ?6o ?u ?c ?b ?3s ?8e ?7.8f "
	format_string_other_7: STRING is "?05i ?04x ?6o ?u ?c ?B ?-.3s ?00.5e ?+7.8f "
	format_string_other_8: STRING is "(?^10s) (?^10i) (?^10e) "
	format_string_other_9: STRING is "Hello ?s ??"
	format_string_other_10: STRING is "Hello??"

	format_string_custom_1: STRING is "?*.*i"
	format_string_custom_2: STRING is "?*i"
	format_string_custom_3: STRING is "?.*i"


feature {NONE} -- Implementation

	m_pi: DOUBLE is -3.14159265

	my_dummy: INTEGER
			-- Used for printing output of ?p.

end
