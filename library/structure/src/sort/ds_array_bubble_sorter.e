note

	description:

		"Array sorters using bubble sort algorithm"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_ARRAY_BUBBLE_SORTER [G]

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
			flipped: BOOLEAN
			v1, v2: G
		do
			from
				i := upper
			until
				i <= lower
			loop
				from
					j := lower
				until
					j >= i
				loop
					v1 := a_container.item (j)
					v2 := a_container.item (j + 1)
					if a_comparator.less_than (v2, v1) then
						a_container.put (v2, j)
						a_container.put (v1, j + 1)
						flipped := True
					end
					j := j + 1
				end
				if flipped then
					i := i - 1
					flipped := False
				else
					i := lower
				end
			end
		end

end
