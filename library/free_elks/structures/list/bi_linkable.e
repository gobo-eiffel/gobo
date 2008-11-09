indexing

	description:
		"Linkable cells with a reference to the left and right neighbors"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: bi_linkable, cell;
	representation: linked;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

class BI_LINKABLE [G] inherit

	LINKABLE [G]
		redefine
			put_right, forget_right
		end

create {CHAIN}
	put

feature -- Access

	left: ?like Current
			-- Left neighbor

feature {CELL, CHAIN} -- Implementation

	put_right (other: ?like Current) is
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

	put_left (other: ?like Current) is
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

	forget_right is
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
	 			({r: like right} old right) implies r.left = Void
		end

	forget_left is
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
				({p: like left} old left implies p.right = Void)
		end

feature {BI_LINKABLE, TWO_WAY_LIST} -- Implementation

	simple_put_right (other: ?like Current) is
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

	simple_put_left (other: ?like Current) is
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

	simple_forget_right is
			-- Remove right link (do nothing to right neighbor).
		do
			right := Void
		end

	simple_forget_left is
			-- Remove left link (do nothing to left neighbor).
		do
			left := Void
		ensure
			not_chained: left = Void
		end

invariant

	right_symmetry:
		{r: like right} right implies (r.left = Current)
	left_symmetry:
		{l: like left} left implies (l.right = Current)

indexing
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2008, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"

end -- class BI_LINKABLE



