note

	description:

		"Linkable cells with a reference to their right neighbor"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_LINKABLE [G]

inherit

	KL_CELL [G]

create

	make

feature -- Access

	right: detachable like Current
			-- Right neighbor

feature -- Element change

	put_right (other: like Current)
			-- Put `other' to right of cell.
		require
			other_not_void: other /= Void
		do
			right := other
		ensure
			linked: right = other
		end

	forget_right
			-- Remove right neighbor.
		do
			right := Void
		ensure
			forgotten: right = Void
		end

end
