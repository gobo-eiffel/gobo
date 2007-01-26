indexing

	description:

		"Indexable data structure sorters using shell sort algorithm"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_SHELL_SORTER [G]

inherit

	DS_INDEXABLE_SORTER [G]

create

	make

feature -- Sort

	subsort_with_comparator (a_container: DS_INDEXABLE [G]; a_comparator: KL_PART_COMPARATOR [G]; lower, upper: INTEGER) is
			-- Sort `a_container' according to `a_comparator''s
			-- comparison criterion within bounds `lower'..`upper'?
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
							if a_comparator.less_than (v2, v1) then
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

end
