indexing

	description:

		"Decimal number parsers, whose BNF syntax follows:  %N%
		% sign ::= '+' | '-' %N%
		% digit ::= '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' %N%
		% indicator ::= 'e' | 'E' %N%
		% digits ::= digit [digit]... %N%
		% point ::= '.' | ',' %N%
		% decimal-part ::= digits point [digits] | [point] digits %N%
		% exponent-part ::= indicator [sign] digits %N%
		% infinity ::= 'Infinity' | 'Inf' %N%
		% nan ::= 'NaN' | 'sNaN' %N%
		% numeric-value ::= decimal-part [exponent-part] | infinity %N%
		% numeric-string ::= [sign] numeric-value | nan%N"

	library: "Gobo Eiffel Decimal Arithmetic Library"
	copyright: "Copyright (c) 2004, Paul G. Crismer and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class MA_DECIMAL_TEXT_PARSER

inherit

	MA_DECIMAL_PARSER

	MA_SHARED_DECIMAL_CONTEXT
		export {NONE} all end

	KL_IMPORTED_CHARACTER_ROUTINES

	KL_IMPORTED_STRING_ROUTINES

create

	make

feature -- Access

	sign: INTEGER
			-- Sign of last parsed decimal

	exponent_sign: INTEGER
			-- Sign of exponent of last parsed decimal

	state: INTEGER
			-- Last state of parsing finite state automaton

	error_code: INTEGER
			-- Description of last error

	coefficient_begin: INTEGER
			-- Index of last parsed coefficient begin

	coefficient_end: INTEGER
			-- Index of last parsed coefficient end

	coefficient_count: INTEGER is
			-- Number of characters in coefficient part
		do
			Result := coefficient_end - coefficient_begin + 1
		end

	fractional_part_count: INTEGER is
			-- Number of characters in the fractional part
		do
			if decimal_point_index > 0 then
				Result := coefficient_end - decimal_point_index
			end
		end

	exponent_as_double: DOUBLE
			-- Exponent expressed as DOUBLE

	exponent_begin: INTEGER
			-- Index of last parsed first exponent character

	exponent_end: INTEGER
			-- Index of last parsed last exponent character

	exponent_significant_digits: INTEGER
			-- Count of significant digits in exponent

	exponent_count: INTEGER is
			-- Count of significant digits in exponent;
			-- Synonym of `exponent_significant_digits'
		do
			Result := exponent_significant_digits
		end

	decimal_point_index: INTEGER
			-- Index of decimal point if any

	last_parsed: STRING
			-- Last parsed string

feature -- Status report

	error: BOOLEAN is
			-- Has there been an error in last parse operation?
		do
			Result := state = State_error
		end

	is_comma_allowed: BOOLEAN
			-- Is ',' allowed as fractional part separator?

	is_infinity: BOOLEAN is
			-- Is last parsed number an 'Infinity'?
		do
			Result := not error and then state = State_infinity
		end

	is_nan: BOOLEAN is
			-- Is last parsed number a 'Not a Number'?
		do
			Result := not error and then state = State_nan
		end

	is_snan: BOOLEAN is
			-- Is last parsed number a 'Signaling NaN'?
		do
			Result := not error and then state = State_snan
		end

	has_point: BOOLEAN is
			-- Has last parsed number a fractional part?
		do
			Result := decimal_point_index /= 0
		end

	has_exponent: BOOLEAN is
			-- Has last parsed number an exponent?
		do
			Result := exponent_begin > 0
		end

	decimal_point_is_comma: BOOLEAN
			-- Has last parsed number a comma as decimal point?

feature -- Basic operations

	parse (s: STRING) is
			-- Parse `s'.
		do
			parse_ctx (s, shared_decimal_context, False)
		ensure then
			last_parsed_string_affected: last_parsed = s
		end

	parse_with_decimal_point_comma (s: STRING) is
			-- Parse `s' with comma as decimal point.
		require
			s_not_void: s /= Void
			s_not_empty: not s.is_empty
		do
			parse_ctx (s, shared_decimal_context, True)
		ensure
			no_mode_change: is_comma_allowed = old is_comma_allowed
			last_parsed_string_affected: last_parsed = s
			last_decimal_not_void_when_no_error: not error implies last_decimal /= Void
		end

	parse_ctx (s: STRING; ctx: MA_DECIMAL_CONTEXT; parse_comma_as_decimal_point: BOOLEAN) is
			-- Parse `s' using `ctx' wrt `parse_comma_as_decimal_point'.
		require
			s_not_void: s /= Void
			s_not_empty: not s.is_empty
		local
			old_allowed: BOOLEAN
		do
			old_allowed := is_comma_allowed
			is_comma_allowed := parse_comma_as_decimal_point
			parse_and_create_last_decimal (s, ctx)
			is_comma_allowed := old_allowed
		ensure
			no_mode_change: is_comma_allowed = old is_comma_allowed
			last_parsed_string_affected: last_parsed = s
			last_decimal_not_void_when_no_error: not error implies last_decimal /= Void
		end

feature {MA_DECIMAL} -- Basic operations

	parse_and_create_last_decimal (s: STRING; ctx: MA_DECIMAL_CONTEXT) is
			-- Parse `s' and create `last_decimal' using `ctx'.
		do
			decimal_parse (s)
			if not error then
				create last_decimal.make_from_parser (Current, ctx)
			else
				last_decimal := Void
			end
		ensure
			last_parsed_is_s: last_parsed = s
			last_decimal_created_if_no_error: not error implies last_decimal /= Void
		end

	decimal_parse (s: STRING) is
			-- Effective parse of `s'.
		require
			s_not_void: s /= Void
		local
			c: CHARACTER
			i, nb: INTEGER
		do
			from
					-- Initializations.
				state := State_start
				sign := 1
				exponent_sign := 1
				exponent_as_double := 0
				i := 1
				nb := s.count
				coefficient_begin := 0
				coefficient_end := 0
				exponent_begin := 0
				exponent_end := 0
				exponent_significant_digits := 0
				decimal_point_index := 0
				decimal_point_is_comma := False
			until
				state = State_error or else i > nb
			loop
				c := s.item (i)
				inspect state
				when State_start then
					process_start (c, i, s)
				when State_sign then
					process_sign (c, i, s)
				when State_integer_part then
					process_integer_part (c, i)
				when State_starting_point then
					process_starting_point (c, i)
				when State_point then
					process_point (c, i)
				when State_comma then
					process_comma (c, i)
				when State_fractional_part then
					process_fractional_part (c, i)
				when State_start_exponent then
					process_start_exponent (c, i)
				when State_exponent_sign then
					process_exponent_sign (c, i)
				when State_exponent then
					process_exponent (c, i)
				when State_infinity, State_snan, State_nan then
					i := nb
				else
					state := State_error
				end
				i := i + 1
			end
			inspect state
			when State_start, State_sign, State_comma, State_start_exponent, State_exponent_sign, State_starting_point then
				state := State_error
			else
				-- Do nothing.
			end
			if decimal_point_is_comma and then not is_comma_allowed then
				state := State_error
			end
			last_parsed := s
		ensure
			last_parsed_is_s: last_parsed = s
		end

	process_start (c: CHARACTER; index: INTEGER; s: STRING) is
			-- Process `c' at `index' in `s' when in `state_start'.
		require
			state_start: state = State_start
			s_not_void: s /= Void
			index_in_s: index > 0 and then index <= s.count
		do
			inspect c
			when '0'..'9' then
				coefficient_begin := index
				coefficient_end := index
				state := State_integer_part
			when '+', '-' then
				if c = '-' then
					sign := -1
				else
					sign := +1
				end
				state := State_sign
			when 'n', 'N' then
				if case_insensitive_substring_equal (s, index + 1, s.count, "an") then
					state := State_nan
				else
					state := State_error
					error_code := Error_invalid_value
				end
			when 's', 'S' then
				if case_insensitive_substring_equal (s, index + 1, s.count, "nan") then
					state := State_snan
				else
					state := State_error
					error_code := Error_invalid_value
				end
			when 'i', 'I' then
				handle_i (s, index)
			when '.' then
				coefficient_begin := index
				coefficient_end := index
				decimal_point_index := index
				state := State_starting_point
			else
				state := State_error
				error_code := Error_invalid_character
			end
		ensure
			next_state: error or else state /= State_start
		end

	handle_i (s: STRING; index: INTEGER) is
			-- Handle the case of 'i' or 'I' recognized in `s' at `index'.
		require
			s_not_void: s /= Void
			index_in_s: index > 0 and then index <= s.count
		do
			if case_insensitive_substring_equal (s, index + 1, index + 2, "nf") then
				if (s.count - index + 1) = 3 or else case_insensitive_substring_equal (s, index + 3, s.count, "inity") then
					state := State_infinity
				else
					state := State_error
					error_code := Error_invalid_value
				end
			else
				state := State_error
				error_code := Error_invalid_value
			end
		ensure
			definition: not error implies is_infinity and then state = State_infinity
		end

	process_sign (c: CHARACTER; index: INTEGER; s: STRING) is
			-- Process `c' at `index' in `s' when in `state_sign'.
		require
			state_sign: state = State_sign
			s_not_void: s /= Void
			index_in_s: index > 0 and then index <= s.count
		do
			inspect c
			when 'i', 'I' then
				handle_i (s, index)
			when '0'..'9' then
				coefficient_begin := index
				coefficient_end := index
				state := State_integer_part
			when '.' then
				coefficient_begin := index
				coefficient_end := index
				decimal_point_index := index
				state := State_starting_point
			else
				state := State_error
				error_code := Error_invalid_character
			end
		end

	process_integer_part (c: CHARACTER; index: INTEGER) is
			-- Process `c' at `index' when in `state_integer_part'.
		require
			state_integer_part: state = State_integer_part
		do
			inspect c
			when '0'..'9' then
				coefficient_end := coefficient_end + 1
			when 'e', 'E' then
				state := State_start_exponent
			when '.' then
				coefficient_end := coefficient_end + 1
				decimal_point_index := index
				state := State_point
			when ',' then
				coefficient_end := coefficient_end + 1
				decimal_point_index := index
				decimal_point_is_comma := True
				state := State_comma
			else
				state := State_error
				error_code := Error_invalid_character_in_integer_part
			end
		end

	process_starting_point (c: CHARACTER; index: INTEGER) is
			-- Process `c' at `index' when in `state_starting_point'.
		require
			state_starting_point: state = State_starting_point
		do
			inspect c
			when '0'..'9' then
				coefficient_begin := index
				coefficient_end := index
				state := State_fractional_part
			else
				state := State_error
				error_code := Error_invalid_character
			end
		end

	process_point (c: CHARACTER; index: INTEGER) is
			-- Process `c' at `index' when in `state_point'.
		require
			state_point: state = State_point
		do
			inspect c
			when '0'..'9' then
				coefficient_end := coefficient_end + 1
				state := State_fractional_part
			when 'e', 'E' then
				state := State_start_exponent
			else
				state := State_error
				error_code := Error_invalid_character
			end
		end

	process_comma (c: CHARACTER; index: INTEGER) is
			-- Process `c' at `index' when in `state_comma'.
		require
			state_comma: state = State_comma
		do
			inspect c
			when '0'..'9' then
				coefficient_end := coefficient_end + 1
				state := State_fractional_part
			else
				state := State_error
				error_code := Error_invalid_character
			end
		end

	process_fractional_part (c: CHARACTER; index: INTEGER) is
			-- Process `c' at `inddex' when in `state_fractional_part'.
		require
			state_fractional_part: state = State_fractional_part
		do
			inspect c
			when '0'..'9' then
				coefficient_end := coefficient_end + 1
			when 'e', 'E' then
				state := State_start_exponent
			else
				state := State_error
				error_code := Error_invalid_character_in_decimal_part
			end
		end

	process_start_exponent (c: CHARACTER; index: INTEGER) is
			-- Process `c' at `index' when in `state_start_exponent'.
		require
			state_start_exponent: state = State_start_exponent
		do
			inspect c
			when '0'..'9' then
				exponent_as_double := c.code - ('0').code
				exponent_begin := index
				exponent_end := index
				if exponent_as_double > 0 then
					exponent_significant_digits := 1
				end
				state := State_exponent
			when '+', '-' then
				if c = '-' then
					exponent_sign := -1
				else
					exponent_sign := 1
				end
				state := State_exponent_sign
			else
				state := State_error
				error_code := Error_invalid_character_in_exponent
			end
		end

	process_exponent_sign (c: CHARACTER; index: INTEGER) is
			-- Process `c' at `index' when in `state_exponent_sign'.
		require
			state_exponent_sign: state = State_exponent_sign
		do
			inspect c
			when '0'..'9' then
				exponent_as_double := c.code - ('0').code
				exponent_begin := index
				exponent_end := index
				if exponent_as_double > 0 then
					exponent_significant_digits := 1
				end
				state := State_exponent
			else
				state := State_error
				error_code := Error_invalid_character_in_exponent
			end
		end

	process_exponent (c: CHARACTER; index: INTEGER) is
			-- Process `c' at `index' when in `state_exponent'.
		require
			state_exponent: state = State_exponent
		do
			inspect c
			when '0'..'9' then
				exponent_as_double := exponent_as_double * 10 + (c.code - ('0').code)
				exponent_end := exponent_end + 1
				if exponent_as_double > 0 then
					exponent_significant_digits := exponent_significant_digits + 1
				end
				state := State_exponent
			else
				state := State_error
				error_code := Error_invalid_character_in_exponent
			end
		end

	case_insensitive_substring_equal (s: STRING; i_begin, i_end: INTEGER; t: STRING): BOOLEAN is
			-- Is s[i_begin, i_end] equal to t[1, tcount] - case insensitive?
		require
			s_not_void: s /= Void
			t_not_void: t /= Void
		local
			i, j: INTEGER
		do
			from
				i := i_begin
				j := 1
			until
				i > s.count or else j > t.count or else i > i_end or else CHARACTER_.as_lower (s.item (i)) /= CHARACTER_.as_lower (t.item (j))
			loop
				i := i + 1
				j := j + 1
			end
			Result := (i > i_end and then j > t.count)
		ensure
			definition: Result = (s.substring (i_begin, i_end).as_lower.is_equal (t.as_lower))
		end

feature -- Constants

	State_start: INTEGER is 1

	State_nan: INTEGER is 2

	State_snan: INTEGER is 3

	State_starting_point: INTEGER is 4

	State_infinity: INTEGER is 5

	State_integer_part: INTEGER is 6

	State_point: INTEGER is 7

	State_fractional_part: INTEGER is 8

	State_exponent: INTEGER is 9

	State_sign: INTEGER is 10

	State_comma: INTEGER is 11

	State_start_exponent: INTEGER is 12

	State_exponent_sign: INTEGER is 13

	State_error: INTEGER is 14

feature {NONE} -- Implementation

	Error_invalid_value: INTEGER is 101

	Error_invalid_character: INTEGER is 102

	Error_invalid_character_in_integer_part: INTEGER is 103

	Error_invalid_character_in_decimal_part: INTEGER is 104

	Error_invalid_character_in_exponent: INTEGER is 105

	Error_invalid_state: INTEGER is 106

invariant

	decimal_point_is_comma_implies_has_fractional_part: decimal_point_is_comma implies has_point

end
