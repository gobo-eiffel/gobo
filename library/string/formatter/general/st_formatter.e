indexing

	description:

		"C-like formatters that receive a string and parameters %
		%as input and return the formatted output."

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004-2005, Object-Tools and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ST_FORMATTER

inherit

	ANY

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

	KL_IMPORTED_ARRAY_ROUTINES
		export {NONE} all end

	KL_SHARED_STREAMS
		export {NONE} all end

feature {NONE} -- Initialization

	make is
			-- Create new formatter with default escape character '$'.
		do
			make_with_escape ('$')
		ensure
			escape_character_set: escape_character = '$'
		end

	make_with_escape (c: CHARACTER) is
			-- Create new formatter with `c' as escape character.
		do
			escape_character := c
			create string_output_stream.make (empty_string)
			create single_parameter.make (1, 1)
		ensure
			escape_character_set: escape_character = c
		end

feature -- Status report

	valid_format_and_parameters (a_format: STRING; a_parameters: ?ARRAY [?ANY]): BOOLEAN is
			-- Does `a_format' contain valid formatting specifications and
			-- do `a_parameters' comply to these formatting specifications?
		require
			a_format_not_void: a_format /= Void
		do
			if a_parameters = Void or else not ANY_ARRAY_.has_void (a_parameters) then
				do_format_to (a_format, a_parameters, null_output_stream)
				Result := not has_error
			end
		ensure
			no_void_parameter: Result implies (a_parameters = Void or else not ANY_ARRAY_.has_void (a_parameters))
		end

feature -- Formatting

	format_to (a_format: STRING; a_parameters: ARRAY [ANY]; a_stream: KI_CHARACTER_OUTPUT_STREAM) is
			-- Append to `a_stream' the string `a_format' where the
			-- formatting specifications have been replaced by their
			-- corresponding formatted parameters from `a_parameters'.
			--
			-- (`a_parameters' must be an array of references and should
			-- not contain expanded types. SE will core dump if you try
			-- to do that. Furthermore, in SE 2.1 expanded types such as
			-- INTEGER do not conform to ANY anymore. So, instead of
			-- expanded parameters such as INTEGER we should pass a
			-- 'DS_CELL [INTEGER]'.)
		require
			a_format_not_void: a_format /= Void
			valid_format_and_parameters: valid_format_and_parameters (a_format, a_parameters)
			a_stream_not_void: a_stream /= Void
			a_stream_open_write: a_stream.is_open_write
		do
			do_format_to (a_format, a_parameters, a_stream)
		end

	format (a_format: STRING; a_parameters: ARRAY [ANY]): STRING is
			-- Copy of `a_format' where the formatting specifications
			-- have been replaced by their corresponding formatted
			-- parameters from `a_parameters'
			--
			-- (`a_parameters' must be an array of references and should
			-- not contain expanded types. SE will core dump if you try
			-- to do that. Furthermore, in SE 2.1 expanded types such as
			-- INTEGER do not conform to ANY anymore. So, instead of
			-- expanded parameters such as INTEGER we should pass a
			-- 'DS_CELL [INTEGER]'.)
		require
			a_format_not_void: a_format /= Void
			valid_format_and_parameters: valid_format_and_parameters (a_format, a_parameters)
		local
			a_stream: ?KI_CHARACTER_OUTPUT_STREAM
		do
			Result := STRING_.new_empty_string (a_format, a_format.count)
			a_stream ?= ANY_.to_any (Result)
			if a_stream /= Void then
				do_format_to (a_format, a_parameters, a_stream)
			else
				string_output_stream.set_string (Result)
				do_format_to (a_format, a_parameters, string_output_stream)
				string_output_stream.set_string (empty_string)
			end
		ensure
			formatted_string_not_void: Result /= Void
			same_type: ANY_.same_types (a_format, Result)
		end

	format_single (a_format: STRING; a_parameter: ANY): STRING is
			-- Copy of `a_format' where the single formatting specification
			-- have been replaced by formatted version of `a_parameter'
			--
			-- (In SE 2.1 expanded types such as INTEGER do not conform
			-- to ANY anymore. So, instead of expanded parameters such
			-- as INTEGER we should pass a 'DS_CELL [INTEGER]'.)
		require
			a_format_not_void: a_format /= Void
			valid_format_and_parameters: valid_format_and_parameters (a_format, <<a_parameter>>)
		local
			a_stream: ?KI_CHARACTER_OUTPUT_STREAM
		do
			single_parameter.put (a_parameter, 1)
			Result := STRING_.new_empty_string (a_format, a_format.count)
			a_stream ?= ANY_.to_any (Result)
			if a_stream /= Void then
				do_format_to (a_format, single_parameter, a_stream)
			else
				string_output_stream.set_string (Result)
				do_format_to (a_format, single_parameter, string_output_stream)
				string_output_stream.set_string (empty_string)
			end
			single_parameter.put (Void, 1)
		ensure
			formatted_string_not_void: Result /= Void
			same_type: ANY_.same_types (a_format, Result)
		end

feature {NONE} -- Formatting

	do_format_to (a_format: STRING; a_parameters: ?ARRAY [?ANY]; a_stream: KI_CHARACTER_OUTPUT_STREAM) is
			-- Append to `a_stream' the string `a_format' where the
			-- formatting specifications have been replaced by their
			-- corresponding formatted parameters from `a_parameters'.
			--
			-- (`a_parameters' must be an array of references and should
			-- not contain expanded types. SE will core dump if you try
			-- to do that. Furthermore, in SE 2.1 expanded types such as
			-- INTEGER do not conform to ANY anymore. So, instead of
			-- expanded parameters such as INTEGER we should pass a
			-- 'DS_CELL [INTEGER]'.)
		require
			a_format_not_void: a_format /= Void
			a_stream_not_void: a_stream /= Void
			a_stream_open_write: a_stream.is_open_write
		local
			i, nb: INTEGER
			s: INTEGER
			j, nb2: INTEGER
			a_formatter: ?ST_PARAMETER_FORMATTER
			no_more_flag: BOOLEAN
			a_left_align: BOOLEAN
			a_center_align: BOOLEAN
			a_zero_padding: BOOLEAN
			a_plus_sign: BOOLEAN
			a_space_prefix: BOOLEAN
			no_more_width: BOOLEAN
			a_width_found: BOOLEAN
			a_width: INTEGER
			a_parameter: ?ANY
			an_integer_parameter: ?DS_CELL [INTEGER]
			no_more_precision: BOOLEAN
			a_precision_found: BOOLEAN
			a_precision: INTEGER
			a_typechar: CHARACTER
		do
			reset_error
			if a_parameters /= Void then
				j := a_parameters.lower
				nb2 := a_parameters.upper
			else
				j := 1
				nb2 := 0
			end
			nb := a_format.count
			s := 1
			from
				i := 1
			until
				i > nb
			loop
				if a_format.item (i) = escape_character then
					if s < i then
						a_stream.put_substring (a_format, s, i - 1)
					end
					i := i + 1
					if i > nb then
							-- Escape character at end of format string.
						set_error ("Escape character at end of format string")
						a_stream.put_character (escape_character)
						s := nb + 1
					elseif a_format.item (i) = escape_character then
							-- Escaped escape character.
						a_stream.put_character (escape_character)
						i := i + 1
						s := i
					else
							-- Read flags.
						from
							no_more_flag := False
							a_left_align := False
							a_center_align := False
							a_zero_padding := False
							a_plus_sign := False
							a_space_prefix := False
						until
							i > nb or no_more_flag
						loop
							inspect a_format.item (i)
							when Left_flag then
								if a_left_align then
									set_error ("Flag '-' specified twice")
								elseif a_zero_padding then
									set_error ("Flag '-' incompatible with '0'")
								elseif a_center_align then
									set_error ("Flag '-' incompatible with '^'")
								else
									a_left_align := True
								end
							when Center_flag then
								if a_center_align then
									set_error ("Flag '^' specified twice")
								elseif a_zero_padding then
									set_error ("Flag '^' incompatible with '0'")
								elseif a_left_align then
									set_error ("Flag '^' incompatible with '-'")
								else
									a_center_align := True
								end
							when Zero_padding_flag then
								if a_zero_padding then
										-- This is the second '0' that we read.
										-- It should be part of the width part.
									no_more_flag := True
									i := i - 1
								elseif a_left_align then
									set_error ("Flag '0' incompatible with '-'")
								elseif a_center_align then
									set_error ("Flag '0' incompatible with '^'")
								else
									a_zero_padding := True
								end
							when Plus_sign_flag then
								if a_plus_sign then
									set_error ("Flag '+' specified twice")
								else
									a_plus_sign := True
								end
							when Space_flag then
								if a_space_prefix then
									set_error ("Flag ' ' specified twice")
								elseif a_plus_sign then
									set_error ("Flag ' ' incompatible with '+'")
								else
									a_space_prefix := True
								end
							else
									-- No more flags to read.
								no_more_flag := True
								i := i - 1
							end
							i := i + 1
						end
							-- Read width.
							-- (Does not test integer overflow.)
						from
							no_more_width := False
							a_width_found := False
							a_width := 0
						until
							i > nb or no_more_width
						loop
							inspect a_format.item (i)
							when '0' then
								a_width_found := True
								a_width := a_width * 10
							when '1' then
								a_width_found := True
								a_width := a_width * 10 + 1
							when '2' then
								a_width_found := True
								a_width := a_width * 10 + 2
							when '3' then
								a_width_found := True
								a_width := a_width * 10 + 3
							when '4' then
								a_width_found := True
								a_width := a_width * 10 + 4
							when '5' then
								a_width_found := True
								a_width := a_width * 10 + 5
							when '6' then
								a_width_found := True
								a_width := a_width * 10 + 6
							when '7' then
								a_width_found := True
								a_width := a_width * 10 + 7
							when '8' then
								a_width_found := True
								a_width := a_width * 10 + 8
							when '9' then
								a_width_found := True
								a_width := a_width * 10 + 9
							when '*' then
								if a_width_found then
									set_error ("Bad width (cannot combined '*' and digits)")
								elseif j > nb2 then
									set_error ("Not enough parameters")
								else
									check
											-- When j <= nb2 it means that we still have
											-- items in `a_parameters', and therefore that
											-- `a_parameters' is not Void.
										a_parameters_not_void: a_parameters /= Void
									end
									a_parameter := a_parameters.item (j)
									an_integer_parameter ?= a_parameter
									if an_integer_parameter /= Void then
										a_width := an_integer_parameter.item
										if a_width < 0 then
											set_error ("Width parameter must not be negative")
											a_width := 0
										end
									else
										set_error ("Width parameter must be a cell of INTEGER")
									end
									j := j + 1
								end
								a_width_found := True
								no_more_width := True
							else
									-- No more width digits.
								no_more_width := True
								i := i - 1
							end
							i := i + 1
						end
							-- Read precision.
							-- (Does not test integer overflow.)
						a_precision_found := False
						if i <= nb and then a_format.item (i) = Dot_marker then
							from
								i := i + 1
								no_more_precision := False
								a_precision := 0
							until
								i > nb or no_more_precision
							loop
								inspect a_format.item (i)
								when '0' then
									a_precision_found := True
									a_precision := a_precision * 10
								when '1' then
									a_precision_found := True
									a_precision := a_precision * 10 + 1
								when '2' then
									a_precision_found := True
									a_precision := a_precision * 10 + 2
								when '3' then
									a_precision_found := True
									a_precision := a_precision * 10 + 3
								when '4' then
									a_precision_found := True
									a_precision := a_precision * 10 + 4
								when '5' then
									a_precision_found := True
									a_precision := a_precision * 10 + 5
								when '6' then
									a_precision_found := True
									a_precision := a_precision * 10 + 6
								when '7' then
									a_precision_found := True
									a_precision := a_precision * 10 + 7
								when '8' then
									a_precision_found := True
									a_precision := a_precision * 10 + 8
								when '9' then
									a_precision_found := True
									a_precision := a_precision * 10 + 9
								when '*' then
									if a_precision_found then
										set_error ("Bad precision (cannot combined '*' and digits)")
									elseif j > nb2 then
										set_error ("Not enough parameters")
									else
										check
												-- When j <= nb2 it means that we still have
												-- items in `a_parameters', and therefore that
												-- `a_parameters' is not Void.
											a_parameters_not_void: a_parameters /= Void
										end
										a_parameter := a_parameters.item (j)
										an_integer_parameter ?= a_parameter
										if an_integer_parameter /= Void then
											a_precision := an_integer_parameter.item
											if a_precision < 0 then
												set_error ("Precision parameter must not be negative")
												a_precision := 0
											end
										else
											set_error ("Precision parameter must be a cell of INTEGER")
										end
										j := j + 1
									end
									a_precision_found := True
									no_more_precision := True
								else
										-- No more precision digits.
									no_more_precision := True
									i := i - 1
								end
								i := i + 1
							end
							if not a_precision_found then
								set_error ("Missing precision after '.'")
							end
						end
							-- Read character type.
						if i > nb then
							set_error ("Missing typechar")
						else
							a_typechar := a_format.item (i)
							a_formatter := internal_parameter_formatter (a_typechar)
							i := i + 1
							if a_formatter = Void then
								set_error ("Unknown typechar '" + a_typechar.out + "'")
							else
								if a_left_align then
									a_formatter.set_align_left
								elseif a_center_align then
									a_formatter.set_align_center
								end
								if a_zero_padding then
									a_formatter.set_padding_character ('0')
								end
								if a_space_prefix then
									a_formatter.set_space_sign_enabled (True)
								end
								if a_plus_sign then
									a_formatter.set_plus_sign_enabled (True)
								end
								if a_width_found then
									a_formatter.set_width (a_width)
								end
								if a_precision_found then
									a_formatter.set_precision (a_precision)
								end
								if j > nb2 then
									set_error ("Not enough parameters")
								else
									check
											-- When j <= nb2 it means that we still have
											-- items in `a_parameters', and therefore that
											-- `a_parameters' is not Void.
										a_parameters_not_void: a_parameters /= Void
									end
									a_parameter := a_parameters.item (j)
									if a_parameter = Void then
										set_error ("Invalid parameter Void for format specification " + escape_character.out + a_typechar.out)
									elseif a_formatter.valid_parameter (a_parameter) then
										a_formatter.format_to (a_parameter, a_stream)
									else
										set_error ("Invalid parameter " + a_parameter.out + " for format specification " + escape_character.out + a_typechar.out)
									end
									j := j + 1
								end
							end
						end
						s := i
					end
				else
					i := i + 1
				end
			end
				-- Append trailing sequence of characters.
			if s = 1 then
				a_stream.put_string (a_format)
			elseif s <= nb then
				a_stream.put_substring (a_format, s, nb)
			end
			if j <= nb2 then
					-- Too many parameters.
				set_error ("Too many parameters")
			end
		end

feature {NONE} -- Parameter formatters

	internal_parameter_formatter (a_typechar: CHARACTER): ?ST_PARAMETER_FORMATTER is
			-- Formatter for parameter of type `a_typechar';
			-- Void if no such parameter formatter
		deferred
		end

feature {NONE} -- Constants

	Left_flag: CHARACTER is '-'
		-- Flag

	Center_flag: CHARACTER is '^'
		-- Flag

	Zero_padding_flag: CHARACTER is '0'
		-- Flag

	Plus_sign_flag: CHARACTER is '+'
		-- Flag

	Space_flag: CHARACTER is ' '
		-- Flag

	Dot_marker: CHARACTER is '.'
			-- Character that separates width from precision

	escape_character: CHARACTER
			-- Escape character

	string_output_stream: KL_STRING_OUTPUT_STREAM
			-- String output stream used by `format'

	single_parameter: ARRAY [?ANY]
			-- Single parameter holder

	empty_string: STRING is ""

feature {NONE} -- Error handling

	has_error: BOOLEAN is
			-- Has an error been detected?
		do
			Result := error /= Void
		ensure
			definition: Result = (error /= Void)
		end

	error: ?STRING
			-- Error message if the format specification was
			-- invalid or if the parameters did not conform to the
			-- specification

	set_error (a_message: STRING) is
			-- Set `error' to `a_message'.
		require
			a_message_not_void: a_message /= Void
			a_message_not_empty: not a_message.is_empty
		do
			if not has_error then
				error := a_message
			end
		ensure
			has_error: has_error
		end

	reset_error is
			-- Reset `error'.
		do
			error := Void
		ensure
			not_has_error: not has_error
		end

invariant

	string_output_stream_not_void: string_output_stream /= Void
	single_parameter_not_void: single_parameter /= Void
	single_parameter_count: single_parameter.count = 1
	single_parameter_lower: single_parameter.lower = 1

end
