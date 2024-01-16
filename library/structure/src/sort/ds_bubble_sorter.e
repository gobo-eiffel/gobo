note

	description:

		"Indexable data structure sorters using bubble sort algorithm"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"

class DS_BUBBLE_SORTER [G]

inherit

	DS_INDEXABLE_SORTER [G]

create

	make

feature -- Sort

	subsort_with_comparator (a_container: DS_INDEXABLE [G]; a_comparator: KL_PART_COMPARATOR [G]; lower, upper: INTEGER)
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
						a_container.replace (v2, j)
						a_container.replace (v1, j + 1)
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
