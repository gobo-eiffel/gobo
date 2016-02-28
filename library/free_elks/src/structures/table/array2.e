note
	description: "Two-dimensional arrays"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: array2, matrix, table;
	representation: array;
	access: index, row_and_column, membership;
	size: resizable;
	contents: generic;
	date: "$Date: 2012-05-24 06:13:10 +0200 (Thu, 24 May 2012) $"
	revision: "$Revision: 559 $"

class ARRAY2 [G] inherit

	ARRAY [G]
		rename
			make as array_make,
			item as array_item,
			put as array_put,
			force as array_force,
			resize as array_resize,
			wipe_out as array_wipe_out,
			make_filled as array_make_filled
		export
			{NONE}
				array_make, array_force,
				array_resize, array_wipe_out, make_from_array,
				array_make_filled, make_from_special, make_from_cil,
				remove_head, remove_tail, keep_head, keep_tail,
				grow, conservative_resize, conservative_resize_with_default,
				automatic_grow
			{ARRAY2}
				array_put, array_item
			{ANY}
				copy, is_equal, area, to_c
		end

create
	make, make_filled

feature -- Initialization

	make (nb_rows, nb_columns: INTEGER)
			-- Create a two dimensional array which has `nb_rows'
			-- rows and `nb_columns' columns,
			-- with lower bounds starting at 1.
		obsolete
			"`make' is not void-safe statically. Use `make_filled' instead. [07-2010]"
		require
			nb_rows_non_negative: nb_rows >= 0
			nb_columns_non_negative: nb_columns >= 0
			both_zero_or_both_non_zero: not (nb_rows = 0 xor nb_columns = 0)
			has_default: (nb_rows * nb_columns) /= 0 implies ({G}).has_default
		do
			height := nb_rows
			width := nb_columns
			array_make (1, nb_rows * nb_columns)
		ensure
			new_count: count = height * width
		end

	make_filled (a_default_value: G; nb_rows, nb_columns: INTEGER)
			-- Create a two dimensional array which has `nb_rows'
			-- rows and `nb_columns' columns,
			-- with lower bounds starting at 1 filled with value `a_default_value'.
		require
			nb_rows_non_negative: nb_rows >= 0
			nb_columns_non_negative: nb_columns >= 0
			both_zero_or_both_non_zero: not (nb_rows = 0 xor nb_columns = 0)
		do
			height := nb_rows
			width := nb_columns
			array_make_filled (a_default_value, 1, nb_rows * nb_columns)
		ensure
			new_count: count = height * width
			filled: filled_with (a_default_value)
		end

	initialize (v: G)
			-- Make each entry have value `v'.
		do
			fill_with (v)
		end

feature -- Access

	item alias "[]" (row, column: INTEGER): G assign put
			-- Entry at coordinates (`row', `column')
		require
			valid_row: (1 <= row) and (row <= height)
			valid_column: (1 <= column) and (column <= width)
		do
			Result := array_item ((row - 1) * width + column)
		end

feature -- Measurement

	height: INTEGER
			-- Number of rows

	width: INTEGER
			-- Number of columns

feature -- Element change

	put (v: like item; row, column: INTEGER)
			-- Assign item `v' at coordinates (`row', `column').
		require
			valid_row: 1 <= row and row <= height
			valid_column: 1 <= column and column <= width
		do
			array_put (v, (row - 1) * width + column)
		end

	force (v: like item; row, column: INTEGER)
			-- Assign item `v' at coordinates (`row', `column').
			-- Resize if necessary.
		require
			row_large_enough: 1 <= row
			column_large_enough: 1 <= column
			has_default: ({G}).has_default
		do
			resize_with_default (({G}).default, row, column)
			put (v, row, column)
		end

feature -- Removal

	wipe_out
			-- Remove all items.
		do
			height := 0
			width := 0
			make_empty
		end

feature -- Resizing

	resize (nb_rows, nb_columns: INTEGER)
			-- Rearrange array so that it can accommodate
			-- `nb_rows' rows and `nb_columns' columns,
			-- without losing any previously
			-- entered items, nor changing their coordinates;
			-- do nothing if new values are smaller.
		obsolete
			"`resize' is not void-safe statically. Use `resize_with_default' instead. [07-2010]"
		require
			valid_row: nb_rows >= 1
			valid_column: nb_columns >= 1
			has_default: ({G}).has_default
		do
			if (nb_columns > width) or (nb_rows > height) then
				resize_with_default (({G}).default, nb_rows, nb_columns)
			end
		ensure
			no_smaller_height: height >= old height
			no_smaller_width: width >= old width
		end

	resize_with_default (a_default: G; nb_rows, nb_columns: INTEGER)
			-- Rearrange array so that it can accommodate
			-- `nb_rows' rows and `nb_columns' columns,
			-- without losing any previously
			-- entered items, nor changing their coordinates;
			-- do nothing if new values are smaller.
		require
			valid_row: nb_rows >= 1
			valid_column: nb_columns >= 1
		local
			i: INTEGER
			new_height: like height
			previous_width: like width
		do
			if nb_columns > width then
					-- Both rows and columns have been added. We resize `area' to the requested size.
				new_height := nb_rows.max (height)
				previous_width := width
				conservative_resize_with_default (a_default, 1, new_height * nb_columns)

					-- Go through all rows and shift items at their right place in the resized `area'.
				from
					i := height
				until
					i = 0
				loop
					area.move_data ((i - 1) * previous_width, (i - 1) * nb_columns, previous_width)
					area.fill_with (a_default, (i - 1) * nb_columns + previous_width, i * nb_columns - 1)
					i := i - 1
				end
				width := nb_columns
				height := new_height
			elseif nb_rows > height then
					-- Only a new row was added, we simply extend `area' by that many new rows.
				conservative_resize_with_default (a_default, 1, nb_rows * width)
				height := nb_rows
			end
		ensure
			no_smaller_height: height >= old height
			no_smaller_width: width >= old width
		end

invariant
	items_number: count = width * height

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"


end



