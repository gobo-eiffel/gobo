indexing

	description:

		"Indexable structure sorters using shell sort algorithm"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_SHELL_SORTER [G -> COMPARABLE]

inherit

	DS_INDEXABLE_SORTER [G]

feature -- Sort

	subsort (container: DS_INDEXABLE [G]; lower, upper: INTEGER) is
			-- Sort `container' in increasing order
			-- within bounds `lower'..`upper'.
		local
			i, j: INTEGER
			jg, gap: INTEGER
			v1, v2: G
		do
			if lower < upper then
				from gap := (upper - lower + 1) // 2 until gap <= 0 loop
					from i := lower + gap until i > upper loop
						from j := i - gap until j < lower loop
							jg := j + gap
							v1 := container.item (j)
							v2 := container.item (jg)
							if v2 < v1 then
								container.replace (v2, j)
								container.replace (v1, jg)
								j := j - gap
							else
								j := lower - 1
							end
						end
						i := i + 1
					end
					gap := gap // 2
				end
			end
		end
		
end -- class DS_SHELL_SORTER
