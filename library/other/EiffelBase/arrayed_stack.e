indexing

	description:

		"EiffelBase ARRAYED_STACK class interface"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ARRAYED_STACK [G]

inherit

	STACK [G]
		redefine
			compare_objects, compare_references
		end

	DS_ARRAYED_STACK [G]
		rename
			is_empty as empty,
			put as ds_put,
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

	put, extend (v: G) is
			-- Push `v' onto top.
		do
			force (v)
		end

	fill (other: LINEAR [G]) is
			-- Fill with as many items of `other' as possible.
			-- Fill items with greatest index from `other' first.
			-- Items inserted with lowest index (from `other') will
			-- always be on the top of stack.
			-- The representations of `other' and current structure
			-- need not be the same.
		local
			i, nb: INTEGER
		do
			nb := other.ds_count
			if not ds_extendible (nb) then
				resize (new_capacity (count + nb))
			end
			i := count + nb
			from other.start until other.after loop
				storage.put (other.item, i)
				i := i - 1
				other.forth
			end
			count := count + nb
		end

feature -- Conversion

	linear_representation: ARRAYED_LIST [G] is
			-- Representation as a linear structure
			-- (order is reverse of original order of insertion)
		local
			i, nb: INTEGER
		do
			!! Result.make (count)
			from i := count until i < 1 loop
				Result.put_last (storage.item (i))
				i := i - 1
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

end -- class ARRAYED_STACK
