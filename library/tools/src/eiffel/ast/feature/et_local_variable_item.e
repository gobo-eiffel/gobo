note

	description:

		"Eiffel local variables in semicolon-separated list of local variables"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"

deferred class ET_LOCAL_VARIABLE_ITEM

inherit

	ET_ENTITY_DECLARATION

feature -- Access

	local_variable: ET_LOCAL_VARIABLE
			-- Local variable in semicolon-separated list
		deferred
		ensure
			local_variable_not_void: Result /= Void
		end

end
