indexing

	description:

		"Class that accepts a C-like format string and parameters%
		%and returns the formatted output."

	usage: "Inherit from GF_FORMAT_ROUTINES and use its format routines."

	library: "Gobo Eiffel Formatter Library"
	origins: "Based on code from Object Tools."
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class ST_SCIENTIFIC_FORMAT

inherit

	ANY -- Needed for SE 2.1b1.

creation

	make

feature -- Initialization

	make is
			-- Initialize with default escape character '?'.
		do
			default_escape := '?'
		end

	set_escape (ch: CHARACTER) is
			-- Change the escape character.
		do
			default_escape := ch
		ensure
			escape_set: default_escape = ch
		end

feature -- Special characters

	default_escape: CHARACTER
			-- Escape character

	Asterisk: CHARACTER is '*'
			-- Take parameter from arguments array

	Dot: CHARACTER is '.'
			-- Character that separates width from precision

	Format_flags: STRING is "-^+0 "
			-- Available flags

	Minus: CHARACTER is '-'
	Plus: CHARACTER is '+'
	Zero: CHARACTER is '0'
	Space: CHARACTER is ' '
	Center: CHARACTER is '^'

feature -- Resolve format specifiers and return a string

	format (a_format: STRING; a_para: ARRAY [ANY]): STRING is
			-- String with parameters in `a_format' replaced by
			-- parameters in `a_para';
			-- `a_para' must be an array of references and should not
			-- contain expanded types. SmartEiffel will core dump if you
			-- try to do that. The solution is that SmartEiffel should
			-- make ARRAY [ANY] always an array of references, but it
			-- doesn't do that yet.
		require
			parameters_valid: is_correct_format_and_parameters (a_format, a_para)
		do
			Result := do_sprintf (a_format, a_para)
		ensure
			result_not_void: Result /= Void
			all_parameters_seen: args.is_after
		end

	is_correct_format_and_parameters (a_format: STRING; a_para: ARRAY [ANY]): BOOLEAN is
			-- Is `a_format' a correct format string and are all
			-- parameters in `a_para', 1) are used in `format', 2) have the
			-- correct type, 3) are not void?
		local
			s: STRING
			i: INTEGER
		do
			Result := a_format /= Void
			if Result then
				if a_para /= Void then
					from
						i := a_para.lower
					until
						not Result or i > a_para.upper
					loop
						Result := a_para.item (i) /= Void
						i := i + 1
					end
				end
				if Result then
					s := do_sprintf (a_format, a_para)
					Result :=
						is_correct and then
						s /= Void and then
						args.is_after
				end
			end
		end

	sprintf (a_format: STRING; a_para: ARRAY [ANY]): STRING is
		obsolete "sprintf has been renamed to format."
		do
			Result := do_sprintf (a_format, a_para)
		end

	format_single (a_format: STRING; a_para: ANY): STRING is
			-- String with single parameter in `a_format' replaced by
			-- `a_para'
		require
			parameters_valid: is_correct_format_and_parameters (a_format, <<a_para>>)
		do
			Result := do_sprintf (a_format, <<a_para>>)
		ensure
			result_not_void: Result /= Void
		end

feature {NONE} -- Formatting implementation

	do_sprintf (a_format: STRING; a_para: ARRAY [ANY]): STRING is
			-- String with place holders in `a_format' replaced by
			-- parameters in `_a_para'
		require
			format_not_void: a_format /= Void
		do
			clear_error
			create Result.make (a_format.count)
			from
				first (a_format)
				create args.make (a_para)
			until
				not is_correct or else
				is_finished or else
				args.is_after
			loop
				Result.append_string (skipped)
				Result.append_string (parse_escape_sequence)
				forth
				args.go_forth
			end
			if is_correct then
				if
					not is_finished and then
					args.is_after
				then
					set_error ("Not enough arguments")
				elseif
					is_finished and then
					not args.is_after
				then
					set_error ("Too many arguments")
				else
					Result.append_string (skipped)
				end
			end
		ensure
			not_void: is_correct implies Result /= Void
			looked_at_entire_string: is_correct implies is_finished
			looked_at_all_arguments: is_correct implies args.is_after
		end

	do_format ( in: STRING; fmt_el: ST_TYPECHAR_FORMATTER; asterisk_allowed: BOOLEAN): STRING is
			-- Current argument(s) formatted according to format string
			-- `in' using formatter `fmt_el';
			-- Format specification syntax: [?][flags][width][.precision]
		require
			no_errors: is_correct
			non_void_paramenters: in /= Void and fmt_el /= Void and args /= Void
			not_after: not args.is_after
		local
			i, j, k, width, precision: INTEGER
			int_ref: INTEGER_REF
			substr, parsed_flags, set_flags: STRING
			found, was_flags, was_width, was_precision: BOOLEAN
			i_double_ref: DOUBLE_REF
			i_real_ref: REAL_REF
			integer_ref: INTEGER_REF
		do

			-- skip default_escape (if presents)
			if in.count > 0 and then in @ 1 = default_escape then
				k := 2
			else
				k := 1
			end

			-- parse flags
			parsed_flags := ""
			set_flags := ""
			from
				i := k  found := false
			until
				i > in.count or found
			loop
				if Format_flags.has (in.item (i)) and then
					not (in @ i = Zero and parsed_flags.has (in.item (i))) then
					-- if this is flag char but not second zero...
					was_flags := true
					set_flag (in @ i, Void, parsed_flags)
					i := i + 1
				else
					found := true -- it's not a flag char
				end
			end
			-- `i' points to begin of [width] [.precision]

			-- parse width
			k := in.index_of (Dot, 1)
			if k = 0 then -- '.' not found (no precision specified)
				found := true
				k := in.count
			else
				found := false
				k := k - 1
			end
			-- now `k' points to end of width

			if i <= k then
				substr := in.substring (i, k) -- width
				was_width := true

				if asterisk_allowed and then substr @ 1 = Asterisk and then
					substr.count = 1 then
					-- take width from arguments list

					int_ref ?= args.current_item
					args.go_forth
					if int_ref /= Void then
						width := int_ref.item
					else
						set_error ("Width must conform to INTEGER")
					end
				else
					from
						j := 1
					until
						not is_correct or else
						j > substr.count
					loop
						if substr.item (j) < '0' or substr.item (j) > '9' then
							set_error ("Bad width (non digit character etc)")
						end
						j := j + 1
					end
					if is_correct then
						width := substr.to_integer
					end
				end
			end

			if is_correct then

				-- parse precision
				if not found then -- `k'+1 points to '.'
					if k + 1 < in.count then
						substr := in.substring (k + 2, in.count)
						was_precision := true

						if substr @ 1 = Asterisk and then substr.count = 1 then
							-- take precision from arguments list
							int_ref ?= args.current_item
							args.go_forth
							if int_ref /= Void then
								precision := int_ref.item
							else
								set_error ("Precision must conform to INTEGER")
							end
						else
							from
								j := 1
							until
								not is_correct or else
								j > substr.count
							loop
								if substr.item (j) < '0' or substr.item (j) > '9' then
									set_error ("Bad precision (non digit character etc)")
								end
								j := j + 1
							end
							if is_correct then
								precision := substr.to_integer
							end
						end
					else
						set_error ("Precision missed (after '.')")
					end
				end
			end

			if is_correct then
				-- interpret format
				fmt_el.fmt.reset_options

				-- HACK! `DOUBLE' does not conform to `REAL', but we want to
				-- use the same formatting facilities therefore we treat it as
				-- special case (1999-07-14, frido).
				-- However, SmartEiffel 1.1 thinks REAL_REF conforms to
				-- INTEGER_REF, detect and avoid that pitfall (2003-12-10, berend).

				-- SmartEiffel will core dump here if args.current_item is an
				-- expanded item...
				integer_ref ?= args.current_item
				if integer_ref = Void then
					i_real_ref ?= args.current_item
				end
				if i_real_ref /= Void then
					-- promote REAL to DOUBLE
					create i_double_ref
					i_double_ref.set_item (i_real_ref.item)
					fmt_el.fmt.set_value (i_double_ref)
					if False then
							-- Bug workaround: forces SE 1.0 to generate C code
							-- for routine 'set_item' from 'reference REAL'.
						i_real_ref.set_item (i_real_ref.item)
					end
				else
					if args.current_item.conforms_to (fmt_el.fmt.anchor) then
						fmt_el.fmt.set_value (args.current_item) -- initialize format object
					else
						set_error ("Argument '" + args.current_item.out + "' does not conform to format specification " + default_escape.out + fmt_el.typechar.out + ". Really, it does not.")
					end
				end
			end

			if is_correct then
				if was_flags then
					from
						i := 1
					until
						i > parsed_flags.count
					loop
						set_flag (parsed_flags @ i, fmt_el.fmt, set_flags)
						i := i + 1
					end
				end
				if was_width then
					fmt_el.fmt.set_width (width)
				end
				if was_precision then
					fmt_el.fmt.set_precision (precision)
				end

				-- output
				Result := fmt_el.fmt.output
			end
		ensure
			not_void: is_correct implies Result /= Void
		end

	set_flag (c: CHARACTER; fmt: ST_ABSTRACT_FORMATTER; parsed_flags: STRING) is
			-- if `c' is not already present (it's not in `parsed_flags),
			-- check if it is compatible with flags already seen. If it
			-- is ok, append it to `parsed_flags'.
		require
			parsed_flags_not_void: parsed_flags /= Void
		do
			if not parsed_flags.has (c) then
				inspect c
				when Minus then
					if parsed_flags.has (Zero) then
						set_error ("Flag '-' incompatible with '0'")
					end
					if parsed_flags.has (Center) then
						set_error ("Flag '-' incompatible with '^'")
					end
					if fmt /= Void then fmt.set_align_left end
				when Center then
					if parsed_flags.has (Zero) then
						set_error ("Flag '^' incompatible with '0'")
					end
					if parsed_flags.has (Minus) then
						set_error ("Flag '^' incompatible with '-'")
					end
					if fmt /= Void then fmt.set_align_center end
				when Plus then
					if fmt /= Void then
						fmt.set_sign_always (True)
					end
				when Zero then
					if parsed_flags.has (Minus) then
						set_error ("Flag '0' incompatible with '-'")
					end
					if parsed_flags.has (Center) then
						set_error ("Flag '0' incompatible with '^'")
					end
					if fmt /= Void then fmt.set_align_char (c) end
				when Space then
					if parsed_flags.has (Plus) then
						set_error ("Flag ' ' incompatible with '+'")
					else
						if fmt /= Void then
							fmt.set_sign_always (False)
						end
					end
				else
					set_error ("Invalid flag")
				end
				if is_correct then
					parsed_flags.append_character (c)
				end
			else
				set_error ("Flag already applied")
			end
		ensure
			seen: is_correct implies parsed_flags.has (c)
		end

	formatters: DS_HASH_TABLE [ST_TYPECHAR_FORMATTER, CHARACTER] is
			-- The list of recognized type characters
		local
			fmt: ST_TYPECHAR_FORMATTER
			type: ST_ABSTRACT_FORMATTER
		once
			create Result.make (64)

			create {ST_BOOLEAN_FORMATTER} type.make (True)
			create fmt.make ('b', type)
			Result.put (fmt, fmt.typechar)

			create {ST_BOOLEAN_FORMATTER} type.make (False)
			create fmt.make ('B', type)
			Result.put (fmt, fmt.typechar)

			create {ST_CHARACTER_FORMATTER} type.make
			create fmt.make ('c', type)
			Result.put (fmt, fmt.typechar)

			create {ST_FLOATING_POINT_FORMATTER} type.make (False)
			create fmt.make ('e', type)
			Result.put (fmt, fmt.typechar)

			create {ST_FLOATING_POINT_FORMATTER} type.make (True)
			create fmt.make ('E', type)
			Result.put (fmt, fmt.typechar)

			create {ST_FIXED_POINT_FORMATTER} type.make
			create fmt.make ('f', type)
			Result.put (fmt, fmt.typechar)

			create {ST_E_OR_F_FORMATTER} type.make (False)
			create fmt.make ('g', type)
			Result.put (fmt, fmt.typechar)

			create {ST_E_OR_F_FORMATTER} type.make (True)
			create fmt.make ('G', type)
			Result.put (fmt, fmt.typechar)

			create {ST_INTEGER_FORMATTER} type.make
			create fmt.make ('i', type)
			Result.put (fmt, fmt.typechar)

			-- synonym for i
			create fmt.make ('d', type)
			Result.put (fmt, fmt.typechar)

			create {ST_OCTAL_FORMATTER} type.make
			create fmt.make ('o', type)
			Result.put (fmt, fmt.typechar)

			create {ST_POINTER_FORMATTER} type.make
			create fmt.make ('p', type)
			Result.put (fmt, fmt.typechar)

			create {ST_STRING_FORMATTER} type.make
			create fmt.make ('s', type)
			Result.put (fmt, fmt.typechar)

			create {ST_UNSIGNED_DECIMAL_INTEGER_FORMATTER} type.make
			create fmt.make ('u', type)
			Result.put (fmt, fmt.typechar)

			create {ST_HEX_FORMATTER} type.make (False)
			create fmt.make ('x', type)
			Result.put (fmt, fmt.typechar)

			create {ST_HEX_FORMATTER} type.make (True)
			create fmt.make ('X', type)
			Result.put (fmt, fmt.typechar)
		ensure
			formatters_not_void: Result /= Void
		end

feature {NONE} -- Argument parsing

	args: ST_ARGUMENTS_ITERATOR
			-- The arguments

	format_str: STRING
			-- String with the format specifications that is being parsed

	cursor: INTEGER
			-- Index into `format_str'

	first (a_format: STRING) is
			-- Put `cursor' on character after first occurrence of
			-- `default_escape'. Set `skipped' to the part that has been
			-- skipped up to occurrence of `default_escape'.
		require
			format_not_void: a_format /= Void
		do
			format_str := a_format
			cursor := 1
			forth
		ensure
			format_str_set: format_str.is_equal (a_format)
		end

	is_finished: BOOLEAN is
			-- Is `format_str' completely parsed?
		do
			Result := cursor > format_str.count
		end

	forth is
			-- Put `cursor' on the next occurrence of
			-- `default_escape'. Set `skipped' to characters skipped up
			-- to occurrence of next escape or end of string if there are
			-- no more escape characters present.
		require
			format_str_not_void: format_str /= Void
		local
			yet_another_argument: BOOLEAN
		do
			skipped := ""
			from
			until
				cursor > format_str.count or yet_another_argument
			loop
				if format_str @ cursor = default_escape then
					-- check for double default_escape (??)
					if
						cursor < format_str.count and then
						format_str @ (cursor+1) = default_escape
					then
						-- pass this char
						skipped.append_character (default_escape)
						cursor := cursor + 1 -- skip it
					else
						yet_another_argument := True
					end
				else
					-- pass this char
					skipped.append_character (format_str.item (cursor))
				end
				cursor := cursor + 1 -- go ahead
			end
		ensure
			skipped_not_void: skipped /= Void
			cursor_finished_or_at_escape:
				is_finished or else
				format_str @ (cursor - 1) = default_escape
		end

	parse_escape_sequence: STRING is
			-- Parsed escape sequence
		require
			no_errors: is_correct
			valid_format_str: format_str /= Void
			inside_escape:
				cursor > 1 and then
				cursor <= format_str.count and then
				format_str @ (cursor - 1) = default_escape
		local
			i: INTEGER
			end_of_escape_seq: BOOLEAN
			s: STRING
		do
			Result := ""
			from
				i := cursor
			until
				not is_correct or else
				i > format_str.count or else
				end_of_escape_seq
			loop
				formatters.search (format_str.item (i))
				if formatters.found then  -- it's a valid typechar
					end_of_escape_seq := True
				elseif format_str @ i = default_escape then
					set_error ("Unknown format specification after '" + default_escape.out + "'")
				end
				i := i + 1
			end

			if is_correct then
				if end_of_escape_seq then
					s := do_format (
						format_str.substring (cursor, i-2),
						formatters.found_item,
						True)
					if is_correct then
						Result.append_string (s)
					end
					cursor := i
				else
					set_error ("Unknown format specification after '" + default_escape.out + "'")
				end
			end
		ensure
			not_void: is_correct implies Result /= Void
		end

	skipped: STRING
			-- Characters skipped by `forth' with quoted escape sequences
			-- resolved

feature {NONE} -- Error handling

	error: STRING
			-- The error message if the format specification was
			-- incorrect or if the parameters did not conform to the
			-- specification;

	clear_error is
			-- Clear `error'.
		do
			error := Void
		ensure
			not_format_error: is_correct
		end

	is_correct: BOOLEAN is
			-- Has no error been detected?
		do
			Result := error = Void
		ensure
			definition: Result = (error = Void)
		end

	set_error (a_message: STRING) is
			-- Set `error'.
		require
			error_not_yet_set: is_correct
			a_message_not_empty: a_message /= Void and then not a_message.is_empty
		do
			error := a_message
		ensure
			format_error: not is_correct
		end

end
