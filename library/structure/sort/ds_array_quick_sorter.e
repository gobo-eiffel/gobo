indexing

	description:

		"Array sorters using quick sort algorithm"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_ARRAY_QUICK_SORTER [G]

inherit

	DS_ARRAY_SORTER [G]

creation

	make

feature -- Sort

	subsort_with_comparator (a_container: ARRAY [G]; a_comparator: DS_PART_COMPARATOR [G]; lower, upper: INTEGER) is
			-- Sort `a_container' according to `a_comparator''s
			-- comparison criterion within bounds `lower'..`upper'?
		local
			l, u, m: INTEGER
			pivot, lv, uv, tmp: G
		do
			l := lower
			u := upper
			if l < u then
				if u = l + 1 then
					lv := a_container.item (l)
					uv := a_container.item (u)
					if a_comparator.less_than (uv, lv) then
						a_container.put (lv, u)
						a_container.put (uv, l)
					end
				else
					m := (lower + upper) // 2
					pivot := a_container.item (m)
					a_container.put (a_container.item (upper), m)
					from until l >= u loop
						from
						until
							l >= u or else not a_comparator.less_than (a_container.item (l), pivot)
						loop
							l := l + 1
						end
						from
							u := u - 1
						until
							u <= l or else not a_comparator.less_than (pivot, a_container.item (u))
						loop
							u := u - 1
						end
						if l < u then
							tmp := a_container.item (l)
							a_container.put (a_container.item (u), l)
							a_container.put (tmp, u)
						end
					end
					a_container.put (a_container.item (l), upper)
					a_container.put (pivot, l)
					if l - 1 > lower then
						subsort_with_comparator (a_container, a_comparator, lower, l - 1)
					end
					if l + 1 < upper then
						subsort_with_comparator (a_container, a_comparator, l + 1, upper)
					end
				end
			end
		end

end -- class DS_ARRAY_QUICK_SORTER
