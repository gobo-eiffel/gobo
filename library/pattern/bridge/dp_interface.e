indexing

	description:

		"Interface in the Bridge Pattern"

	library: "Gobo Eiffel Pattern Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DP_INTERFACE

inherit

	ANY -- Needed for SE 2.1b1.

feature {NONE} -- Initialization

	make_from_implementation (an_implementation: like implementation) is
			-- Create a new interface using
			-- `an_implementation' as implementation.
		require
			an_implementation_not_void: an_implementation /= Void
			valid_implementation: an_implementation.can_implement (Current)
		do
			implementation := an_implementation
			implementation.implement (Current)
		ensure
			implementation_set: implementation = an_implementation
		end

feature {DP_IMPLEMENTATION, DP_INTERFACE} -- Implementation

	implementation: DP_IMPLEMENTATION
			-- Implementation

invariant

	implementation_not_void: implementation /= Void
	valid_implementation: implementation.can_implement (Current)

end
