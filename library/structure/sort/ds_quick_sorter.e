indexing

	description:

		"Indexable data structure sorters using quick sort algorithm"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2000, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_QUICK_SORTER [G -> COMPARABLE]

inherit

	DS_INDEXABLE_SORTER [G]

feature -- Sort

	subsort (a_container: DS_INDEXABLE [G]; lower, upper: INTEGER) is
			-- Sort `a_container' in increasing order
			-- within bounds `lower'..`upper'.
		local
			l, u, m: INTEGER
			pivot, lv, uv: G
		do
			l := lower
			u := upper
			if l < u then
				if u = l + 1 then
					lv := a_container.item (l)
					uv := a_container.item (u)
					if uv < lv then
						a_container.replace (lv, u)
						a_container.replace (uv, l)
					end
				else
					m := (lower + upper) // 2
					pivot := a_container.item (m)
					a_container.replace (a_container.item (upper), m)
					from until l >= u loop
						from
						until
							l >= u or else not (a_container.item (l) < pivot)
						loop
							l := l + 1
						end
						from
							u := u - 1
						until
							u <= l or else not (pivot < a_container.item (u))
						loop
							u := u - 1
						end
						if l < u then
							a_container.swap (l, u)
						end
					end
					a_container.replace (a_container.item (l), upper)
					a_container.replace (pivot, l)
					if l - 1 > lower then
						subsort (a_container, lower, l - 1)
					end
					if l + 1 < upper then
						subsort (a_container, l + 1, upper)
					end
				end
			end
		end

	reverse_subsort (a_container: DS_INDEXABLE [G]; lower, upper: INTEGER) is
			-- Sort `a_container' in decreasing order
			-- within bounds `lower'..`upper'.
		local
			l, u, m: INTEGER
			pivot, lv, uv: G
		do
			l := lower
			u := upper
			if l < u then
				if u = l + 1 then
					lv := a_container.item (l)
					uv := a_container.item (u)
					if lv < uv then
						a_container.replace (lv, u)
						a_container.replace (uv, l)
					end
				else
					m := (lower + upper) // 2
					pivot := a_container.item (m)
					a_container.replace (a_container.item (upper), m)
					from until l >= u loop
						from
						until
							l >= u or else not (pivot < a_container.item (l))
						loop
							l := l + 1
						end
						from
							u := u - 1
						until
							u <= l or else not (a_container.item (u) < pivot)
						loop
							u := u - 1
						end
						if l < u then
							a_container.swap (l, u)
						end
					end
					a_container.replace (a_container.item (l), upper)
					a_container.replace (pivot, l)
					if l - 1 > lower then
						reverse_subsort (a_container, lower, l - 1)
					end
					if l + 1 < upper then
						reverse_subsort (a_container, l + 1, upper)
					end
				end
			end
		end

end -- class DS_QUICK_SORTER
