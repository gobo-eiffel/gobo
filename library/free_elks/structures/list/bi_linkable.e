indexing

	description:
		"Linkable cells with a reference to the left and right neighbors"

	status: "See notice at end of class"
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

feature -- Access

	left: like Current
			-- Left neighbor

feature {CELL, CHAIN} -- Implementation

	put_right (other: like Current) is
			-- Put `other' to the right of current cell.
		do
			if right /= Void then
				right.simple_forget_left
			end
			right := other
			if (other /= Void) then
				other.simple_put_left (Current)
			end
		end

	put_left (other: like Current) is
			-- Put `other' to the left of current cell.
		do
			if left /= Void then
				left.simple_forget_right
			end
			left := other
			if (other /= Void) then
				other.simple_put_right (Current)
			end
		ensure
			chained: left = other
		end

	forget_right is
			-- Remove links with right neighbor.
		do
			if right /= Void then
				right.simple_forget_left
				right := Void
			end
		ensure then
	 		right_not_chained:
	 			(old right /= Void) implies ((old right).left = Void)
		end

	forget_left is
			-- Remove links with left neighbor.
		do
			if left /= Void then
				left.simple_forget_right
				left := Void
			end
		ensure
			left_not_chained:
			left = Void or else
	 			(old left /= Void) implies ((old left).right = Void)
		end

feature {BI_LINKABLE, TWO_WAY_LIST} -- Implementation

	simple_put_right (other: like Current) is
			-- set `right' to `other'
		do
			if right /= Void then
				right.simple_forget_left
			end
			right := other
		end

	simple_put_left (other: like Current) is
			-- set `left' to `other' is
		do
			if left /= Void then
				left.simple_forget_right
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
		(right /= Void) implies (right.left = Current)
	left_symmetry:
		(left /= Void) implies (left.right = Current)

indexing

	library: "[
			EiffelBase: Library of reusable components for Eiffel.
			]"

	status: "[
			Copyright 1986-2001 Interactive Software Engineering (ISE).
			For ISE customers the original versions are an ISE product
			covered by the ISE Eiffel license and support agreements.
			]"

	license: "[
			EiffelBase may now be used by anyone as FREE SOFTWARE to
			develop any product, public-domain or commercial, without
			payment to ISE, under the terms of the ISE Free Eiffel Library
			License (IFELL) at http://eiffel.com/products/base/license.html.
			]"

	source: "[
			Interactive Software Engineering Inc.
			ISE Building
			360 Storke Road, Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Electronic mail <info@eiffel.com>
			Customer support http://support.eiffel.com
			]"

	info: "[
			For latest info see award-winning pages: http://eiffel.com
			]"

end -- class BI_LINKABLE



