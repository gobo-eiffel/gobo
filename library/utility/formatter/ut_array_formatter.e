indexing

	description:

		"Array formatters"

	library:    "Gobo Eiffel Utility Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class UT_ARRAY_FORMATTER

inherit

	KL_IMPORTED_OUTPUT_STREAM_ROUTINES

feature -- File handling

	put_integer_array (a_file: like OUTPUT_STREAM_TYPE;
		an_array: ARRAY [INTEGER]; start_pos, end_pos: INTEGER) is
			-- Write code for `an_array''s items within bounds
			-- `start_pos' and `end_pos' to `a_file'.
		require
			an_array_not_void: an_array /= Void
			start_pos_large_enough: start_pos >= an_array.lower
			end_pos_small_enough: end_pos <= an_array.upper
			valid_bounds: start_pos <= end_pos + 1
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		local
			i, an_item: INTEGER
			nb_line, nb_colon: INTEGER
		do
			a_file.put_string (Indentation)
			nb_line := 1
			from i := start_pos until i > end_pos loop
				nb_colon := nb_colon + 1
				if nb_colon > Max_nb_colon then
					a_file.put_character ('%N')
					nb_colon := 1
					nb_line := nb_line + 1
					if nb_line > Max_nb_line then
						a_file.put_character ('%N')
						nb_line := 1
					end
					a_file.put_string (Indentation)
				end
				an_item := an_array.item (i)
				inspect an_item.out.count
				when 1 then
					a_file.put_string (Four_spaces)
				when 2 then
					a_file.put_string (Three_spaces)
				when 3 then
					a_file.put_string (Two_spaces)
				else
					a_file.put_character (' ')
				end
				a_file.put_integer (an_item)
				if i < end_pos then
					a_file.put_character (',')
				end
				i := i + 1
			end
		end

feature {NONE} -- Constants

	Two_spaces: STRING is "  "
	Three_spaces: STRING is "   "
	Four_spaces: STRING is "    "
	Indentation: STRING is "%T%T%T"

	Max_nb_line: INTEGER is 10
			-- Maximum number of lines before one is skipped

	Max_nb_colon: INTEGER is 10
			-- Maximum number of entries per line

end -- class UT_ARRAY_FORMATTER
