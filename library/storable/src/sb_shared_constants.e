note

	description:

		"Shared constants used to read Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_SHARED_CONSTANTS

feature -- Access

	storable_constants: SB_CONSTANTS
			-- Constants used in the storable mechanism
		once
			create Result
		ensure
			constants_not_void: Result /= Void
		end

end
