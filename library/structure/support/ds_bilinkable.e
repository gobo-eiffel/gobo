indexing

	description:

		"Linkable cells with a reference to their left and right neighbors"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_BILINKABLE [G]

inherit

	DS_LINKABLE [G]
		redefine
			put_right
		end

creation

	make

feature -- Access

	left: like Current
			-- Left neighbor

feature -- Element change

	put_right (other: like Current) is
			-- Put `other' to right of cell.
			-- Make sure that link is bidirectional.
		do
			right := other
			other.attach_left (Current)
		ensure then
			bilinked: other.left = Current
		end

	put_left (other: like Current) is
			-- Put `other' to left of cell.
			-- Make sure that link is bidirectional.
		require
			other_not_void: other /= Void
		do
			left := other
			other.attach_right (Current)
		ensure
			linked: left = other
			bilinked: other.right = Current
		end

	forget_left is
			-- Remove left neighbor.
		do
			left := Void
		ensure
			forgotten: left = Void
		end

feature {DS_BILINKABLE} -- Implementation

	attach_right (other: like Current) is
			-- Put `other' to right of cell.
		do
			right := other
		ensure
			linked: right = other
		end

	attach_left (other: like Current) is
			-- Put `other' to left of cell.
		do
			left := other
		ensure
			linked: left = other
		end

end -- class DS_BILINKABLE
