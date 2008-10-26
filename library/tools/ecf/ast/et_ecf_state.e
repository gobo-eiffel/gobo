indexing

	description:

		"ECF states fulfilling or not conditions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_STATE

create

	make

feature {NONE} -- Initialization

	make (a_target: ET_ECF_TARGET) is
			-- Create a new ECF state based on information specified in `a_target'.
		require
			a_target_not_void: a_target /= Void
		do
			target := a_target
		ensure
			target_set: target = a_target
		end

feature -- Access

	target: ET_ECF_TARGET
			-- Target where information about current state are specified

invariant

	target_not_void: target /= Void

end
