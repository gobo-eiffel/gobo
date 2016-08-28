note
	description: "Linkable cells with a reference to the left and right neighbors"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: bi_linkable, cell;
	representation: linked;
	contents: generic;
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

class BI_LINKABLE [G] inherit

	LINKABLE [G]
		redefine
			put_right, forget_right
		end

create {CHAIN}
	put

feature -- Access

	left: detachable like Current
			-- Left neighbor

feature {CELL, CHAIN} -- Implementation

	put_right (other: detachable like Current)
			-- Put `other' to the right of current cell.
		local
			l_right: like right
			l_other: like other
		do
			l_right := right
			if l_right /= Void then
				l_right.simple_forget_left
			end
			right := other
			l_other := other
			if l_other /= Void then
				l_other.simple_put_left (Current)
			end
		end

	put_left (other: detachable like Current)
			-- Put `other' to the left of current cell.
		local
			l: like left
		do
			l := left
			if l /= Void then
				l.simple_forget_right
			end
			left := other
			if other /= Void then
				other.simple_put_right (Current)
			end
		ensure
			chained: left = other
		end

	forget_right
			-- Remove links with right neighbor.
		local
			l_right: like right
		do
			l_right := right
			if l_right /= Void then
				l_right.simple_forget_left
				right := Void
			end
		ensure then
	 		right_not_chained:
	 			(attached {like right} old right as r) implies r.left = Void
		end

	forget_left
			-- Remove links with left neighbor.
		local
			l: like left
		do
			l := left
			if l /= Void then
				l.simple_forget_right
				left := Void
			end
		ensure
			left_not_chained:
			left = Void or else
				(attached {like left} old left as p implies p.right = Void)
		end

feature {BI_LINKABLE, TWO_WAY_LIST} -- Implementation

	simple_put_right (other: detachable like Current)
			-- Set `right' to `other'
		local
			l_right: like right
		do
			l_right := right
			if l_right /= Void then
				l_right.simple_forget_left
			end
			right := other
		end

	simple_put_left (other: detachable like Current)
			-- Set `left' to `other' is
		local
			l: like left
		do
			l := left
			if l /= Void then
				l.simple_forget_right
			end
			left := other
		end

	simple_forget_right
			-- Remove right link (do nothing to right neighbor).
		do
			right := Void
		end

	simple_forget_left
			-- Remove left link (do nothing to left neighbor).
		do
			left := Void
		ensure
			not_chained: left = Void
		end

invariant

	right_symmetry:
		attached right as r implies (r.left = Current)
	left_symmetry:
		attached left as l implies (l.right = Current)

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
