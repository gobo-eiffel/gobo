indexing

	description:

		"Class that accepts a C-like format string and parameters%
		%and returns the formatted output."

	usage: "Inherit from GF_SCIENTIFIC_FORMAT_ACCESSOR and use format.sprintf."

	library: "Gobo Eiffel Formatter Library"
	origins: "Based on code from Object Tools."
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class

	GF_SCIENTIFIC_FORMAT

inherit

	GF_FORMAT_ERROR_HANDLER_ACCESSOR


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
			exceptions: expanded EXCEPTIONS
			retried: BOOLEAN
			s: STRING
			i: INTEGER
		do
			if not retried then
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
							s /= Void and
							args.is_after
					end
				end
			else
				Result := False
				Result := True
			end
		rescue
			if exceptions.is_developer_exception then
				retried := True
				retry
			end
		end

	sprintf (a_format: STRING; a_para: ARRAY [ANY]): STRING is
		obsolete "sprintf has been renamed to format."
		do
			Result := do_sprintf (a_format, a_para)
		end

	to_string (a_format: STRING; a_para: ANY): STRING is
			-- String with single parameter in `a_format' replaced by
			-- `a_para'
		require
			non_void_parameters: a_format /= Void and a_para /= Void
		do
			Result := format (a_format, <<a_para>>)
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
			from
				Result := first (a_format)
				create args.make (a_para)
			until
				finish or else
				args.is_after
			loop
				Result.append_string (parse_escape_sequence)
				Result.append_string (forth)
				args.go_forth
			end
			if not finish and then args.is_after then
				raise_exception ("Not enough arguments")
			end
		end

	do_format (
			in: STRING;
			fmt_el: GF_TYPECHAR_FORMATTER;
			asterisk_allowed: BOOLEAN): STRING is
			-- Parse format string and interpret format specification.
			-- formatspec syntax: [?][flags][width] [.precision]
		require
			non_void_paramenters:
				in /= Void and
				fmt_el /= Void and
				args /= Void
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
			-- i points to begin of [width] [.precision]

			-- parse width
			k := in.index_of (Dot, 1)
			if k = 0 then -- '.' not found (no precision specified)
				found := true
				k := in.count
			else
				found := false
				k := k - 1
			end
			-- now k points to end of width

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
						raise_exception ("Width must conform to INTEGER")
					end
				else
					from j := 1 until j > substr.count loop
						if substr.item (j) < '0' or substr.item (j) > '9' then
							raise_exception ("Bad width (non digit character etc)")
						end
						j := j + 1
					end
					width := substr.to_integer
				end
			end

			-- parse precision
			if not found then -- k+1 points to '.'
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
							raise_exception ("Precision must conform to INTEGER")
						end
					else
						from
							j := 1
						until
							j > substr.count
						loop
							if substr.item (j) < '0' or substr.item (j) > '9' then
								raise_exception ("Bad precision (non digit character etc)")
							end
							j := j + 1
						end
						precision := substr.to_integer
					end
				else
					raise_exception ("Precision missed (after '.')")
				end
			end

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
			else
				if not args.current_item.conforms_to (fmt_el.fmt.anchor) then
					raise_exception ("Argument '" + args.current_item.out + "' does not conform to format specification " + default_escape.out + fmt_el.typechar.out + ". Really, it does not.")
				end
				fmt_el.fmt.set_value (args.current_item) -- initialize format object
			end

			if was_flags then
				from
					i := 1
				until i > parsed_flags.count
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

	set_flag (c: CHARACTER; fmt: GF_ABSTRACT_FORMATTER; parsed_flags: STRING) is
		require
			parsed_flags_not_void: parsed_flags /= Void
		do
			if not parsed_flags.has (c) then
				inspect c
				when Minus then
					if parsed_flags.has (Zero) then
						raise_exception ("Flag '-' incompatible with '0'")
					end
					if parsed_flags.has (Center) then
						raise_exception ("Flag '-' incompatible with '^'")
					end
					if fmt /= Void then fmt.set_align_left end
				when Center then
					if parsed_flags.has (Zero) then
						raise_exception ("Flag '^' incompatible with '0'")
					end
					if parsed_flags.has (Minus) then
						raise_exception ("Flag '^' incompatible with '-'")
					end
					if fmt /= Void then fmt.set_align_center end
				when Plus then
					if fmt /= Void then
						fmt.set_sign_always (True)
					end
				when Zero then
					if parsed_flags.has (Minus) then
						raise_exception ("Flag '0' incompatible with '-'")
					end
					if parsed_flags.has (Center) then
						raise_exception ("Flag '0' incompatible with '^'")
					end
					if fmt /= Void then fmt.set_align_char (c) end
				when Space then
					if parsed_flags.has (Plus) then
						raise_exception ("Flag ' ' incompatible with '+'")
					else
						if fmt /= Void then
							fmt.set_sign_always (False)
						end
					end
				else
					raise_exception ("Invalid flag")
				end
				parsed_flags.append_character (c)
			else
				raise_exception ("Flag already applied")
			end
		end

	formatters: DS_HASH_TABLE [GF_TYPECHAR_FORMATTER, CHARACTER] is
			-- Build the list of recognized type characters.
		local
			fmt: GF_TYPECHAR_FORMATTER
			type: GF_ABSTRACT_FORMATTER
		once
			create Result.make (64)

			create {GF_BOOLEAN_FORMATTER} type.make (True)
			create fmt.make ('b', type)
			Result.put (fmt, fmt.typechar)

			create {GF_BOOLEAN_FORMATTER} type.make (False)
			create fmt.make ('B', type)
			Result.put (fmt, fmt.typechar)

			create {GF_CHARACTER_FORMATTER} type.make
			create fmt.make ('c', type)
			Result.put (fmt, fmt.typechar)

			create {GF_FLOATING_POINT_FORMATTER} type.make (False)
			create fmt.make ('e', type)
			Result.put (fmt, fmt.typechar)

			create {GF_FLOATING_POINT_FORMATTER} type.make (True)
			create fmt.make ('E', type)
			Result.put (fmt, fmt.typechar)

			create {GF_FIXED_POINT_FORMATTER} type.make
			create fmt.make ('f', type)
			Result.put (fmt, fmt.typechar)

			create {GF_E_OR_F_FORMATTER} type.make (False)
			create fmt.make ('g', type)
			Result.put (fmt, fmt.typechar)

			create {GF_E_OR_F_FORMATTER} type.make (True)
			create fmt.make ('G', type)
			Result.put (fmt, fmt.typechar)

			create {GF_INTEGER_FORMATTER} type.make
			create fmt.make ('i', type)
			Result.put (fmt, fmt.typechar)

			-- synonym for i
			create fmt.make ('d', type)
			Result.put (fmt, fmt.typechar)

			create {GF_OCTAL_FORMATTER} type.make
			create fmt.make ('o', type)
			Result.put (fmt, fmt.typechar)

			create {GF_POINTER_FORMATTER} type.make
			create fmt.make ('p', type)
			Result.put (fmt, fmt.typechar)

			create {GF_STRING_FORMATTER} type.make
			create fmt.make ('s', type)
			Result.put (fmt, fmt.typechar)

			create {GF_UNSIGNED_DECIMAL_INTEGER_FORMATTER} type.make
			create fmt.make ('u', type)
			Result.put (fmt, fmt.typechar)

			create {GF_HEX_FORMATTER} type.make (False)
			create fmt.make ('x', type)
			Result.put (fmt, fmt.typechar)

			create {GF_HEX_FORMATTER} type.make (True)
			create fmt.make ('X', type)
			Result.put (fmt, fmt.typechar)
		ensure
			formatters_not_void: Result /= Void
		end


feature {NONE} -- Argument parsing

	args: GF_ARGUMENTS_ITERATOR
			-- The arguments

	format_str: STRING
	cursor: INTEGER

	first (a_format: STRING): STRING is
			-- Put `cursor' on character after first occurrence of
			-- `default_escape'.
		require
			format_not_void: a_format /= Void
		do
			format_str := a_format
			cursor := 1
			Result := forth
		ensure
			format_str_set: format_str.is_equal (a_format)
		end

	finish: BOOLEAN is
		do
			Result := cursor > format_str.count
		end

	forth: STRING is
		require
			format_str_not_void: format_str /= Void
		local
			yet_another_argument: BOOLEAN
		do
			Result := ""
			from
			until
				cursor > format_str.count or yet_another_argument
			loop
				if format_str @ cursor = default_escape then
					-- check for double default_escape (!!)
					if cursor < format_str.count and then
						format_str @ (cursor+1) = default_escape then
						-- pass this char
						Result.append_character (default_escape)
						cursor := cursor + 1 -- skip it
					else
						yet_another_argument := true
					end
				else
					-- pass this char
					Result.append_character (format_str.item (cursor))
				end
				cursor := cursor + 1 -- go ahead
			end
		ensure
			Result /= Void and (cursor > format_str.count or else
			format_str @ (cursor - 1) = default_escape)
		end

	parse_escape_sequence: STRING is
			-- Parse escape sequence.
		require
			valid_format_str: format_str /= Void
			inside_escape:
				cursor > 1 and then
				cursor <= format_str.count and then
				format_str @ (cursor - 1) = default_escape
		local
			i: INTEGER
			end_of_escape_seq: BOOLEAN
		do
			Result := ""
			from
				i := cursor
			until
				i > format_str.count or else end_of_escape_seq
			loop
				formatters.search (format_str.item (i))
				if formatters.found then  -- it's valid typechar
					end_of_escape_seq := True
				elseif format_str @ i = default_escape then
					raise_exception ("Unknown format specification after '" + default_escape.out + "'")
				end
				i := i + 1
			end

			if end_of_escape_seq then
				Result.append_string (
					do_format (
						format_str.substring (cursor, i-2),
						formatters.found_item,
						True))
				cursor := i
			else
				raise_exception ("Unknown format specification after '" + default_escape.out + "'")
			end
		ensure
			not_void: Result /= Void
		end


feature {NONE} -- Error handling

	raise_exception (msg: STRING) is
		local
			m: STRING
		do
			m := "Bad format ("
			m.append_string (msg)
			m.append_character (')')
			the_error_handler.report ("GF_SCIENTIFIC_FORMAT",  m,  0,  Current)
		end

-- 	i_double: DOUBLE_REF is
-- 		once
-- 			create Result
-- 			Result.set_item (3.145)
-- 		end


end
