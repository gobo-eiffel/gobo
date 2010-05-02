note

	description:

		"Positions in Eiffel texts"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_POSITION

inherit

	ANY
	KL_IMPORTED_STRING_ROUTINES
	KL_IMPORTED_INTEGER_ROUTINES

feature -- Access

	line: INTEGER
			-- Line number
			-- (0 means unknow line number or overflow)
		deferred
		ensure
			line_positive: Result >= 0
		end

	column: INTEGER
			-- Column number
			-- (0 means unknow column number or overflow)
		deferred
		ensure
			column_positive: Result >= 0
		end

feature -- Status report

	is_null: BOOLEAN
			-- Is current position null?
		do
			Result := (line = no_line)
		ensure
			definition: Result = (line = no_line)
		end

feature -- Comparison

	is_less alias "<" (other: ET_POSITION): BOOLEAN
			-- Is current position less than `other'?
		require
			other_not_void: other /= Void
		do
			if line < other.line then
				Result := True
			elseif line = other.line then
				Result := column < other.column
			end
		end

feature -- Constants

	no_line: INTEGER = 0
			-- Unknown line number or overflow

	no_column: INTEGER = 0
			-- Unknown column number or overflow

feature -- Output

	to_text: STRING
			-- Textual representation
		do
			create Result.make (50)
			append_to_string (Result)
		end

	append_to_string (a_string: STRING)
			-- Append `to_text' to `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			a_string.append_string ("line ")
			INTEGER_.append_decimal_integer (line, a_string)
			a_string.append_string (" column ")
			INTEGER_.append_decimal_integer (column, a_string)
		end

	append_to_string_with_filename (a_filename: STRING; a_string: STRING)
			-- Append `to_text' to `a_string'.
		require
			a_filename_not_void: a_filename /= Void
			a_string_not_void: a_string /= Void
		do
			a_string.append_string ("line ")
			INTEGER_.append_decimal_integer (line, a_string)
			a_string.append_string (" column ")
			INTEGER_.append_decimal_integer (column, a_string)
			a_string.append_string (" in ")
			a_string.append_string (a_filename)
			a_string.append_character ('%N')
			append_context_to_string (a_filename, a_string)
		end

	append_context_to_string (a_filename: STRING; a_string: STRING)
			-- Append position's context to `a_string'.
		require
			a_filename_not_void: a_filename /= Void
			a_string_not_void: a_string /= Void
		local
			a_file: KL_TEXT_INPUT_FILE
			an_arrow: STRING
			c: CHARACTER
			i, nb: INTEGER
			eol: BOOLEAN
		do
			nb := line
			if nb = no_line then
				-- No line specified.
			else
				create a_file.make (a_filename)
				a_file.open_read
				if a_file.is_open_read then
					if nb > 1 then
						skip_lines (a_file, nb - 2)
						append_line_to_string (a_file, a_string)
						a_string.append_character ('%N')
					end
					nb := column
					if nb = no_column then
							-- No column specified.
						append_line_to_string (a_file, a_string)
						a_string.append_character ('%N')
						a_string.append_character ('^')
						a_string.append_character ('%N')
						append_line_to_string (a_file, a_string)
						a_string.append_character ('%N')
					else
						from
							i := 1
							create an_arrow.make (80)
							a_file.read_character
						until
							a_file.end_of_file or eol
						loop
							c := a_file.last_character
							if c = '%N' then
								eol := True
							else
								a_string.append_character (c)
								a_file.read_character
							end
							if i < nb then
								if c = '%T' then
									an_arrow.append_character ('%T')
								else
									an_arrow.append_character (' ')
								end
							elseif i = nb then
								an_arrow.append_character ('^')
							end
							i := i + 1
						end
						a_string.append_character ('%N')
						a_string.append_string (an_arrow)
						if an_arrow.count = 0 or else an_arrow.item (an_arrow.count) /= '^' then
							a_string.append_character ('^')
						end
						a_string.append_character ('%N')
						append_line_to_string (a_file, a_string)
						a_string.append_character ('%N')
					end
					a_file.close
				end
			end
		end

feature {NONE} -- Implementation

	append_line_to_string (a_file: KI_CHARACTER_INPUT_STREAM; a_string: STRING)
			-- Append to `a_string' current line in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_string_not_void: a_string /= Void
		local
			c: CHARACTER
			eol: BOOLEAN
		do
			if not a_file.end_of_input then
				from
					a_file.read_character
				until
					a_file.end_of_input or eol
				loop
					c := a_file.last_character
					if c = '%N' then
						eol := True
					else
						a_string.append_character (c)
						a_file.read_character
					end
				end
			end
		end

	skip_lines (a_file: KI_CHARACTER_INPUT_STREAM; nb: INTEGER)
			-- Skip `nb' lines in `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			nb_positive: nb >= 0
		local
			i: INTEGER
		do
			if nb > 0 then
				from
					a_file.read_character
				until
					a_file.end_of_input or i = nb
				loop
					if a_file.last_character = '%N' then
						i := i + 1
						if i /= nb then
							a_file.read_character
						end
					else
						a_file.read_character
					end
				end
			end
		end

end
