indexing

	description:

		"Indexable data structure sorters using shell sort algorithm"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2000, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_SHELL_SORTER [G -> COMPARABLE]

inherit

	DS_INDEXABLE_SORTER [G]

feature -- Sort

	subsort (a_container: DS_INDEXABLE [G]; lower, upper: INTEGER) is
			-- Sort `a_container' in increasing order
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
							v1 := a_container.item (j)
							v2 := a_container.item (jg)
							if v2 < v1 then
								a_container.replace (v2, j)
								a_container.replace (v1, jg)
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

	reverse_subsort (a_container: DS_INDEXABLE [G]; lower, upper: INTEGER) is
			-- Sort `a_container' in decreasing order
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
							v1 := a_container.item (j)
							v2 := a_container.item (jg)
							if v1 < v2 then
								a_container.replace (v2, j)
								a_container.replace (v1, jg)
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
