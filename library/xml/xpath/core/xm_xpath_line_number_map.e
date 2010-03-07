indexing

	description:

		"Map of sequence numbers to line numbers"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_LINE_NUMBER_MAP

create

	make

		-- Line numbers are not held in nodes in the tree, because they are not usually needed.

feature {NONE}  -- Initialization

	make is
			-- Establish invariant.
		do
			create sequence_numbers.make (1000)
			create line_numbers.make (1000)
		end

feature -- Access

	line_number (a_node_number: INTEGER): INTEGER is
			-- Line number
		require
			valid_node_number: True -- Can't check that here (?)
			at_least_one_line_number_allocated: number_allocated_line_numbers > 0
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
		do
			from
				a_cursor := sequence_numbers.new_cursor
				a_cursor.start
			until
				a_cursor.after
			loop
				if a_cursor.item > a_node_number then
					a_cursor.go_after
				else
					Result := line_numbers.item (a_cursor.index)
					a_cursor.forth
				end
			variant
				sequence_numbers.count + 1 - a_cursor.index
			end
		end

feature -- Measurement

	number_allocated_line_numbers: INTEGER is
			-- Number of line numbers allocated
		do
			Result := line_numbers.count
		end

	highest_sequence_number: INTEGER is
			-- Highest sequence number specifically allocated to a line number
		require
			at_least_one_allocation: number_allocated_line_numbers > 0
		do
			Result := sequence_numbers.item (number_allocated_line_numbers)
		end

feature -- Element change

	set_line_number (a_node_number: INTEGER; a_line_number: INTEGER) is
			-- Set line_number for `a_node_number' to `a_line_number'.
		require
			higher_node_number: number_allocated_line_numbers > 0 implies a_node_number > highest_sequence_number
		local
			a_size: INTEGER
		do
			if not sequence_numbers.extendible (1) then
				a_size := 2 * sequence_numbers.count
				sequence_numbers.resize (a_size)
				line_numbers.resize (a_size)
			end
			sequence_numbers.put_last (a_node_number)
			line_numbers.put_last (a_line_number)
		ensure
			set: line_number (a_node_number) = a_line_number
			one_more: line_numbers.count = old line_numbers.count + 1
		end

feature {NONE} -- Implementation

	sequence_numbers: DS_ARRAYED_LIST [INTEGER]
			-- Sequence numbers of initial nodes within an entity;
			-- Stored in ascending order

	line_numbers: DS_ARRAYED_LIST [INTEGER]
			-- Line numbers corresponding to the entries in `sequence_numbers'

invariant

	sequence_numbers: sequence_numbers /= Void
	line_numbers: line_numbers /= Void
	same_count: line_numbers.count = sequence_numbers.count

end
