indexing

	description:

		"EiffelBase LINKED_QUEUE class interface"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class LINKED_QUEUE [G]

inherit

	QUEUE [G]
		redefine
			compare_objects, compare_references
		end

	DS_LINKED_QUEUE [G]
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
			-- Add `v' to queue.
		do
			put (v)
		end

	append (s: LINEAR [G]) is
			-- Append a copy of `s'.
			-- (Synonym for `fill')
		local
			i: INTEGER
			a_cell, new_last, new_first: like first_cell
		do
			if not s.empty then
				from
					s.start
					!! a_cell.make (s.item)
					new_first := a_cell
					new_last := a_cell
					i := 1
					s.forth
				until
					s.after
				loop
					!! a_cell.make (s.item)
					new_last.put_right (a_cell)
					new_last := a_cell
					i := i + 1
					s.forth
				end
				if empty then
					first_cell := new_first
				else
					last_cell.put_right (new_first)
				end
				last_cell := new_last
				count := count + i
			end
		end

feature -- Conversion

	linear_representation: ARRAYED_LIST [G] is
			-- Representation as a linear structure
			-- (order is same as original order of insertion)
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

end -- class LINKED_QUEUE
