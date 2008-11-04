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

	make (a_target: ET_ECF_TARGET; a_version: UT_VERSION) is
			-- Create a new ECF state based on information specified in `a_target'.
		require
			a_target_not_void: a_target /= Void
			a_version_not_void: a_version /= Void
		do
			target := a_target
			ise_version := a_version
		ensure
			target_set: target = a_target
			ise_version_set: ise_version = a_version
		end

feature -- Access

	target: ET_ECF_TARGET
			-- Target where information about current state are specified

	ise_version: UT_VERSION
			-- ISE version to be used when evaluating version conditions

invariant

	target_not_void: target /= Void
	ise_version_not_void: ise_version /= Void

end
