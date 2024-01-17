note

	description:

		"Comma-separated-value file handlers"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2008-2018, Eric Bezault and others"
	license: "MIT License"

class UT_CSV_HANDLER

inherit

	ANY

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make,
	make_with_separator

feature {NONE} -- Initialization

	make
			-- Create a new csv handler.
			-- Use comma as separator.
		do
			make_with_separator (',')
		ensure
			separator_set: separator = ','
		end

	make_with_separator (a_separator: like separator)
			-- Create a new csv handler.
			-- Use `a_separator' as separator.
		require
			valid_separator: a_separator /= '%"'
		do
			separator := a_separator
		ensure
			separator_set: separator = a_separator
		end

feature -- Access

	separator: CHARACTER
			-- Separator used between cells

feature -- Setting

	set_separator (a_separator: like separator)
			-- Set `separator' to `a_separator'.
		require
			valid_separator: a_separator /= '%"'
		do
			separator := a_separator
		ensure
			separator_set: separator = a_separator
		end

feature -- Input

	read_row (a_row: STRING; a_cells: DS_ARRAYED_LIST [STRING])
			-- Split `a_row' into cells using `separator' as separator,
			-- and append them at the end of `a_cells'.
			-- The cell strings added to `a_cells' are not shared objects and
			-- can be kept without the need to clone them.
		require
			a_row_not_void: a_row /= Void
			a_cells_not_void: a_cells /= Void
			no_void_cell: not a_cells.has_void
		local
			i, nb: INTEGER
			l_cell: STRING
			c: CHARACTER
			has_quote: BOOLEAN
		do
			nb := a_row.count
			create l_cell.make (100)
			from i := 1 until i > nb loop
				c := a_row.item (i)
				if c = '%"' then
					if has_quote then
						if i < nb and then a_row.item (i + 1) = '%"' then
							l_cell.append_character ('%"')
							i := i + 1
						else
							has_quote := False
						end
					elseif l_cell.is_empty then
						has_quote := True
					else
						l_cell.append_character ('%"')
					end
				elseif c = separator then
					if has_quote then
						l_cell.append_character (c)
					else
						a_cells.force_last (l_cell.substring (1, l_cell.count))
						STRING_.wipe_out (l_cell)
					end
				else
					l_cell.append_character (c)
				end
				i := i + 1
			end
			a_cells.force_last (l_cell.substring (1, l_cell.count))
		ensure
			no_void_cell: not a_cells.has_void
		end

	read_file (a_file: KI_TEXT_INPUT_STREAM; a_action: PROCEDURE [DS_ARRAYED_LIST [STRING]])
			-- Read csv file `a_file' and for each row, call `a_action' where the list
			-- passed as argument is the list of cells making up this row (using
			-- `separator' as separator). The list passed as argument is supposed to
			-- be non-void and contains no void strings. This list object is reused
			-- (and hence altered) between each call. The cell strings it contains
			-- are not altered and can be kept without the need to clone them.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_action_not_void: a_action /= Void
		local
			i, nb: INTEGER
			l_last_string: STRING
			l_cell: STRING
			c: CHARACTER
			has_quote: BOOLEAN
			l_cells: DS_ARRAYED_LIST [STRING]
			l_forth_done: BOOLEAN
		do
			if not a_file.end_of_input then
				create l_cells.make (512)
				create l_cell.make (100)
				from
					a_file.read_string (1024)
				until
					a_file.end_of_input
				loop
					l_forth_done := False
					l_last_string := a_file.last_string
					nb := l_last_string.count
					from i := 1 until i > nb loop
						l_forth_done := False
						c := l_last_string.item (i)
						if c = '%"' then
							if has_quote then
								i := i + 1
								if i > nb then
									a_file.read_string (1024)
									if not a_file.end_of_input then
										l_last_string := a_file.last_string
										i := 1
										nb := l_last_string.count
									end
								end
								if i <= nb and then l_last_string.item (i) = '%"' then
									l_cell.append_character ('%"')
								else
									l_forth_done := True
									has_quote := False
								end
							elseif l_cell.is_empty then
								has_quote := True
							else
								l_cell.append_character ('%"')
							end
						elseif c = separator then
							if has_quote then
								l_cell.append_character (c)
							else
								l_cells.force_last (l_cell.substring (1, l_cell.count))
								STRING_.wipe_out (l_cell)
							end
						elseif c = '%N' then
							if has_quote then
								l_cell.append_character (c)
							else
								l_cells.force_last (l_cell.substring (1, l_cell.count))
								STRING_.wipe_out (l_cell)
								a_action.call ([l_cells])
								l_cells.wipe_out
							end
						else
							l_cell.append_character (c)
						end
						if not l_forth_done then
							i := i + 1
						end
					end
					if not l_forth_done then
						a_file.read_string (1024)
					end
				end
				if not l_cell.is_empty then
					l_cells.force_last (l_cell.substring (1, l_cell.count))
				end
				if not l_cells.is_empty then
					a_action.call ([l_cells])
				end
			end
		end

feature -- Output

	put_cell (a_cell: STRING; a_row: STRING)
			-- Append `a_cell' to `a_row'. Add escape characters if needed.
			-- Do not add the separator character.
		require
			a_cell_not_void: a_cell /= Void
			a_row_not_void: a_row /= Void
		local
			i, nb: INTEGER
			c: CHARACTER
		do
			if not (a_cell.has (separator) or a_cell.has ('%N') or a_cell.has ('%"')) then
				a_row.append_string (a_cell)
			else
				a_row.append_character ('%"')
				nb := a_cell.count
				from i := 1 until i > nb loop
					c := a_cell.item (i)
					if c = '%"' then
						a_row.append_character ('%"')
					end
					a_row.append_character (c)
					i := i + 1
				end
				a_row.append_character ('%"')
			end
		end

invariant

	valid_separator: separator /= '%"'

end
