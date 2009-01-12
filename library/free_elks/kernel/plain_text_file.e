note
	description: "Files viewed as persistent sequences of ASCII characters"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class PLAIN_TEXT_FILE

inherit
	FILE
		rename
			index as position
		redefine
			is_plain_text
		end

create

	make, make_open_read, make_open_write, make_open_append,
	make_open_read_write, make_create_read_write,
	make_open_read_append

feature -- Status report

	is_plain_text: BOOLEAN
			-- Is file reserved for text (character sequences)? (Yes)
		do
			Result := True
		end

	support_storable: BOOLEAN = False
			-- Can medium be used to store an Eiffel structure?

feature -- Output

	put_integer, putint, put_integer_32 (i: INTEGER)
			-- Write ASCII value of `i' at current position.
		do
			put_string (i.out)
		end

	put_integer_64 (i: INTEGER_64)
			-- Write ASCII value of `i' at current position.
		do
			put_string (i.out)
		end

	put_integer_16 (i: INTEGER_16)
			-- Write ASCII value of `i' at current position.
		do
			put_string (i.out)
		end

	put_integer_8 (i: INTEGER_8)
			-- Write ASCII value of `i' at current position.
		do
			put_string (i.out)
		end

	put_natural_64 (i: NATURAL_64)
			-- Write ASCII value of `i' at current position.
		do
			put_string (i.out)
		end

	put_natural, put_natural_32 (i: NATURAL_32)
			-- Write ASCII value of `i' at current position.
		do
			put_string (i.out)
		end

	put_natural_16 (i: NATURAL_16)
			-- Write ASCII value of `i' at current position.
		do
			put_string (i.out)
		end

	put_natural_8 (i: NATURAL_8)
			-- Write ASCII value of `i' at current position.
		do
			put_string (i.out)
		end

	put_boolean, putbool (b: BOOLEAN)
			-- Write ASCII value of `b' at current position.
		local
			ext_bool_str: ANY
		do
			if b then
				ext_bool_str := true_string.to_c
				file_ps (file_pointer, $ext_bool_str, true_string.count)
			else
				ext_bool_str := false_string.to_c
				file_ps (file_pointer, $ext_bool_str, false_string.count)
			end
		end

	put_real, putreal (r: REAL)
			-- Write ASCII value of `r' at current position.
		do
			file_pr (file_pointer, r)
		end

	put_double, putdouble (d: DOUBLE)
			-- Write ASCII value `d' at current position.
		do
			file_pd (file_pointer, d)
		end

feature -- Input

	read_integer_64
			--
		do
			read_integer_with_no_type
			last_integer_64 := ctoi_convertor.parsed_integer_64
		end

	read_integer, readint, read_integer_32
			-- Read the ASCII representation of a new 32-bit integer
			-- from file. Make result available in `last_integer'.
		do
			read_integer_with_no_type
			last_integer := ctoi_convertor.parsed_integer_32
		end

	read_integer_16
			-- Read the ASCII representation of a new 16-bit integer
			-- from file. Make result available in `last_integer_16'.
		do
			read_integer_with_no_type
			last_integer_16 := ctoi_convertor.parsed_integer_16
		end

	read_integer_8
			-- Read the ASCII representation of a new 8-bit integer
			-- from file. Make result available in `last_integer_8'.
		do
			read_integer_with_no_type
			last_integer_8 := ctoi_convertor.parsed_integer_8
		end

	read_natural_64
			-- Read the ASCII representation of a new 64-bit natural
			-- from file. Make result available in `last_natural_64'.
		do
			read_integer_with_no_type
			last_natural_64 := ctoi_convertor.parsed_natural_64

		end

	read_natural, read_natural_32
			-- Read the ASCII representation of a new 32-bit natural
			-- from file. Make result available in `last_natural'.
		do
			read_integer_with_no_type
			last_natural := ctoi_convertor.parsed_natural_32
		end

	read_natural_16
			-- Read the ASCII representation of a new 16-bit natural
			-- from file. Make result available in `last_natural_16'.
		do
			read_integer_with_no_type
			last_natural_16 := ctoi_convertor.parsed_natural_16
		end

	read_natural_8
			-- Read the ASCII representation of a new 8-bit natural
			-- from file. Make result available in `last_natural_8'.
		do
			read_integer_with_no_type
			last_natural_8 := ctoi_convertor.parsed_natural_8
		end

	read_real, readreal
			-- Read the ASCII representation of a new real
			-- from file. Make result available in `last_real'.
		do
			last_real := file_gr (file_pointer)
		end

	read_double, readdouble
			-- Read the ASCII representation of a new double
			-- from file. Make result available in `last_double'.
		do
			last_double := file_gd (file_pointer)
		end

feature {NONE} -- Implementation

	ctoi_convertor: STRING_TO_INTEGER_CONVERTOR
			-- Convertor used to parse string to integer or natural
		once
			create Result.make
			Result.set_leading_separators (internal_leading_separators)
			Result.set_leading_separators_acceptable (True)
			Result.set_trailing_separators_acceptable (False)
		end

	internal_leading_separators: STRING = " %N%R%T"
			-- Characters that are considered as leading separators

	is_sequence_an_expected_numeric: BOOLEAN
			-- Is last number sequence read by `read_number_sequence' an expected numeric?

	read_number_sequence (convertor: STRING_TO_NUMERIC_CONVERTOR; conversion_type: INTEGER)
			-- Read a number sequence from current position and parse this
			-- sequence using `convertor' to see if it is a valid numeric.
			-- Set `is_sequence_an_expected_numeric' with True if it is valid.
		do
			convertor.reset (conversion_type)
			from
				is_sequence_an_expected_numeric := True
			until
				end_of_file or else not is_sequence_an_expected_numeric
			loop
				read_character
				if not end_of_file then
					convertor.parse_character (last_character)
					is_sequence_an_expected_numeric := convertor.parse_successful
				end
			end
		end

	read_integer_with_no_type
			-- Read a ASCII representation of number of `type'
			-- at current position.
		do
			read_number_sequence (ctoi_convertor, {NUMERIC_INFORMATION}.type_no_limitation)
				-- Return character(s) if necessary.
			if not is_sequence_an_expected_numeric then
				return_characters
			end
		end

	return_characters
			-- Return character(s)
		do
			if last_character = '%N' and platform_indicator.is_windows then
				back
			end
			back
		end

	read_to_string (a_string: STRING; pos, nb: INTEGER): INTEGER
			-- Fill `a_string', starting at position `pos' with at
			-- most `nb' characters read from current file.
			-- Return the number of characters actually read.
		do
			Result := file_gss (file_pointer, a_string.area.item_address (pos - 1), nb)
		end

	file_gi (file: POINTER): INTEGER
			-- Get an integer from `file'
		external
			"C signature (FILE *): EIF_INTEGER use %"eif_file.h%""
		end

	file_gr (file: POINTER): REAL
			-- Read a real from `file'
		external
			"C signature (FILE *): EIF_REAL_32 use %"eif_file.h%""
		end

	file_gd (file: POINTER): DOUBLE
			-- Read a double from `file'
		external
			"C signature (FILE *): EIF_REAL_64 use %"eif_file.h%""
		end

	file_pi (file: POINTER; n: INTEGER)
			-- Put `n' to end of `file'.
		external
			"C signature (FILE *, EIF_INTEGER) use %"eif_file.h%""
		end

	file_pr (file: POINTER; r: REAL)
			-- Put `r' to end of `file'.
		external
			"C signature (FILE *, EIF_REAL_32) use %"eif_file.h%""
		end

	file_pd (file: POINTER; d: DOUBLE)
			-- Put `d' to end of `file'.
		external
			"C signature (FILE *, EIF_REAL_64) use %"eif_file.h%""
		end

invariant

	plain_text: is_plain_text

end
