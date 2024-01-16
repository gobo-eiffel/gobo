note

	description:

		"Array sorters using shell sort algorithm"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"

class DS_ARRAY_SHELL_SORTER [G]

inherit

	DS_ARRAY_SORTER [G]

create

	make

feature -- Sort

	subsort_with_comparator (a_container: ARRAY [G]; a_comparator: KL_PART_COMPARATOR [G]; lower, upper: INTEGER)
			-- Sort `a_container' according to `a_comparator''s
			-- comparison criterion within bounds `lower'..`upper'?
		local
			i, j: INTEGER
			jg, gap: INTEGER
			v1, v2: G
		do
			if lower < upper then
				from
					gap := (upper - lower + 1) // 2
				until
					gap <= 0
				loop
					from
						i := lower + gap
					until
						i > upper
					loop
						from
							j := i - gap
						until
							j < lower
						loop
							jg := j + gap
							v1 := a_container.item (j)
							v2 := a_container.item (jg)
							if a_comparator.less_than (v2, v1) then
								a_container.put (v2, j)
								a_container.put (v1, jg)
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
