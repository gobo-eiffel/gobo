indexing

	description:

		"EiffelBase LINKED_STACK class interface"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class LINKED_STACK [G]

inherit

	STACK [G]
		redefine
			compare_objects, compare_references
		end

	DS_LINKED_STACK [G]
		rename
			is_empty as empty,
			extend as ds_extend,
			append as ds_append,
			extendible as ds_extendible
		end

creation

	make

feature -- Status report

	extendible: BOOLEAN is True
			-- May new items be added?

	full: BOOLEAN is False
			-- Is structure filled to capacity?

	prunable: BOOLEAN is True
			-- May items be removed?

feature -- Element change

	extend (v: G) is
			-- Push `v' onto top.
		do
			put (v)
		end

	fill (other: LINEAR [G]) is
			-- Fill with as many items of `other' as possible.
			-- Fill items with greatest index from `other' first.
			-- Items inserted with lowest index (from `other') will
			-- always be on the top of stack.
			-- The representations of `other' and current structure
			-- need not be the same.
		local
			i: INTEGER
			a_cell, new_cell, new_first: like first_cell
		do
			if not other.empty then
				from
					other.start
					!! new_first.make (other.item)
					a_cell := new_first
					i := 1
					other.forth
				until
					other.after
				loop
					!! new_cell.make (other.item)
					a_cell.put_right (new_cell)
					a_cell := new_cell
					i := i + 1
					other.forth
				end
				a_cell.put_right (first_cell)
				first_cell := new_first
				count := count + i
			end
		end

feature -- Conversion

	linear_representation: ARRAYED_LIST [G] is
			-- Representation as a linear structure
			-- (order is reverse of original order of insertion)
		local
			a_cell: like first_cell
		do
			!! Result.make (count)
			from a_cell := first_cell until (a_cell = Void) loop
				Result.put_last (a_cell.item)
				a_cell := a_cell.right
			end
		end

feature -- Status setting

	compare_objects is
			-- Ensure that future search operations will use `equal'
			-- rather than `=' for comparing references.
		do
			object_comparison := True
			!! equality_tester
		end

	compare_references is
			-- Ensure that future search operations will use `='
			-- rather than `equal' for comparing references.
		do
			object_comparison := False
			equality_tester := Void
		end

end -- class LINKED_STACK
