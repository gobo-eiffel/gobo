indexing

	description:

		"Positions in Eiffel texts"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_POSITION

inherit

	KL_IMPORTED_STRING_ROUTINES
		redefine
			out
		end

	KL_IMPORTED_INPUT_STREAM_ROUTINES
		undefine
			out
		end

	UT_IMPORTED_FORMATTERS
		undefine
			out
		end

feature -- Access

	line: INTEGER
			-- Line number

	column: INTEGER
			-- Column number

	filename: STRING is
			-- Filename
		deferred
		ensure
			filename_not_void: Result /= Void
		end

feature -- Output

	out: STRING is
			-- Textual representation
		do
			Result := STRING_.make (50)
			append_to_string (Result)
		end

	append_to_string (a_string: STRING) is
			-- Append `out' to `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			a_string.append_string ("line ")
			INTEGER_FORMATTER_.append_decimal_integer (a_string, line)
			a_string.append_string (" column ")
			INTEGER_FORMATTER_.append_decimal_integer (a_string, column)
			a_string.append_string (" in ")
			a_string.append_string (filename)
			a_string.append_character ('%N')
			append_context_to_string (a_string)
		end


	append_context_to_string (a_string: STRING) is
			-- Append position's context to `a_string'.
		require
			a_string_not_void: a_string /= Void
		local
			a_file: like INPUT_STREAM_TYPE
			an_arrow: STRING
			c: CHARACTER
			i, nb: INTEGER
			eol: BOOLEAN
		do
			a_file := INPUT_STREAM_.make_file_open_read (filename)
			if INPUT_STREAM_.is_open_read (a_file) then
				nb := line
				if nb > 1 then
					skip_lines (a_file, nb - 2)
					append_line_to_string (a_file, a_string)
					a_string.append_character ('%N')
				end
				from
					i := 1
					nb := column
					an_arrow := STRING_.make (80)
					a_file.read_character
				until
					INPUT_STREAM_.end_of_input (a_file) or eol
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
				if an_arrow.item (an_arrow.count) /= '^' then
					a_string.append_character ('^')
				end
				a_string.append_character ('%N')
				append_line_to_string (a_file, a_string)
				a_string.append_character ('%N')
				INPUT_STREAM_.close (a_file)
			end
		end

feature {NONE} -- Implementation

	append_line_to_string (a_file: like INPUT_STREAM_TYPE; a_string: STRING) is
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: INPUT_STREAM_.is_open_read (a_file)
			a_string_not_void: a_string /= Void
		local
			c: CHARACTER
			eol: BOOLEAN
		do
			from
				a_file.read_character
			until
				INPUT_STREAM_.end_of_input (a_file) or eol
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

	skip_lines (a_file: like INPUT_STREAM_TYPE; nb: INTEGER) is
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: INPUT_STREAM_.is_open_read (a_file)
			nb_positive: nb >= 0
		local
			i: INTEGER
		do
			if nb > 0 then
				from
					a_file.read_character
				until
					INPUT_STREAM_.end_of_input (a_file) or i = nb
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

end -- class ET_POSITION
