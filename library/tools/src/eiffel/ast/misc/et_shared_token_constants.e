note

	description:

		"Shared Eiffel token and symbol constants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2018, Eric Bezault and others"
	license: "MIT License"

class ET_SHARED_TOKEN_CONSTANTS

feature -- Access

	tokens: ET_TOKEN_CONSTANTS
			-- Shared token and symbol constants
		once
			create Result
		ensure
			instance_free: class
			tokens_not_void: Result /= Void
		end

end
