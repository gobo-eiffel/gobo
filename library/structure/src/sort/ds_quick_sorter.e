note

	description:

		"Indexable data structure sorters using quick sort algorithm"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2000-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_QUICK_SORTER [G]

inherit

	DS_INDEXABLE_SORTER [G]

create

	make

feature -- Sort

	subsort_with_comparator (a_container: DS_INDEXABLE [G]; a_comparator: KL_PART_COMPARATOR [G]; lower, upper: INTEGER)
			-- Sort `a_container' according to `a_comparator''s
			-- comparison criterion within bounds `lower'..`upper'?
		local
			l, u, m, i, n: INTEGER
			pivot, lv, uv: G
			a_lower, a_upper: INTEGER
			lowers, uppers: ARRAY [INTEGER]
		do
			from
				n := upper - lower + 1
			until
				n = 0
			loop
				n := n // 2
				i := i + 1
			end
			i := i + 10
			from
				create lowers.make_filled (0, 1, i)
				create uppers.make_filled (0, 1, i)
				lowers.put (lower, 1)
				uppers.put (upper, 1)
				i := 1
			until
				i = 0
			loop
				a_lower := lowers.item (i)
				a_upper := uppers.item (i)
				i := i - 1
				l := a_lower
				u := a_upper
				if l < u then
					if u = l + 1 then
						lv := a_container.item (l)
						uv := a_container.item (u)
						if a_comparator.less_than (uv, lv) then
							a_container.replace (lv, u)
							a_container.replace (uv, l)
						end
					else
						m := (l + u) // 2
						pivot := a_container.item (m)
						a_container.replace (a_container.item (a_upper), m)
						from
						until
							l >= u
						loop
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
								a_container.swap (l, u)
								l := l + 1
							end
						end
						a_container.replace (a_container.item (l), a_upper)
						a_container.replace (pivot, l)
						if l - 1 > a_lower then
							i := i + 1
							lowers.force (a_lower, i)
							uppers.force (l - 1, i)
						end
						if l + 1 < a_upper then
							i := i + 1
							lowers.force (l + 1, i)
							uppers.force (a_upper, i)
						end
					end
				end
			end
		end

end
