indexing

	description:

		"Indexable data structure sorters using quick sort algorithm"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1997, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_QUICK_SORTER [G -> COMPARABLE]

inherit

	DS_INDEXABLE_SORTER [G]

feature -- Sort

	subsort (container: DS_INDEXABLE [G]; lower, upper: INTEGER) is
			-- Sort `container' in increasing order
			-- within bounds `lower'..`upper'.
		local
			l, u, m: INTEGER
			pivot: G
		do
			l := lower
			u := upper
			if l < u then
				if u = l + 1 then
					if not (container.item (l) <= container.item (u)) then
						container.swap (l, u)
					end
				else
					m := (lower + upper) // 2
					pivot := container.item (m)
					container.replace (container.item (upper), m)
					from until l >= u loop
						from
						until
							l >= u or else pivot <= container.item (l)
						loop
							l := l + 1
						end
						from
							u := u - 1
						until
							u <= l or else container.item (u) <= pivot
						loop
							u := u - 1
						end
						if l < u then
							container.swap (l, u)
						end
					end
					container.replace (container.item (l), upper)
					container.replace (pivot, l)
					if l - 1 > lower then
						subsort (container, lower, l - 1)
					end
					if l + 1 < upper then
						subsort (container, l + 1, upper)
					end
				end
			end
		end

end -- class DS_QUICK_SORTER
