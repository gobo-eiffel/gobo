indexing

	description:

		"Indexable structure sorters using bubble sort algorithm"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_BUBBLE_SORTER [G -> COMPARABLE]

inherit

	DS_INDEXABLE_SORTER [G]

feature -- Sort

	subsort (container: DS_INDEXABLE [G]; lower, upper: INTEGER) is
			-- Sort `container' in increasing order
			-- within bounds `lower'..`upper'.
		local
			i, j, nb: INTEGER
			flipped: BOOLEAN
			v1, v2: G
		do
			from i := upper until i <= lower loop
				from j := lower until j >= i loop
					v1 := container.item (j)
					v2 := container.item (j + 1)
					if v2 < v1 then
						container.replace (v2, j)
						container.replace (v1, j + 1)
						flipped := True
					end
					j := j + 1
				end
				if flipped then
					i := i - 1
				else
					i := lower
				end
			end
		end
		
end -- class DS_BUBBLE_SORTER
