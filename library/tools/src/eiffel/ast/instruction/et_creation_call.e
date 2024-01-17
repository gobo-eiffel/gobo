note

	description:

		"Eiffel creation calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2016, Eric Bezault and others"
	license: "MIT License"

deferred class ET_CREATION_CALL

inherit

	ET_CALL_WITH_ACTUAL_ARGUMENTS
		redefine
			name
		end

feature -- Access

	name: ET_FEATURE_NAME
			-- Creation procedure name
		deferred
		end

end
