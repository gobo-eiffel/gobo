note

	description:

		"Shared Eiffel class codes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: $"
	revision: "$Revision: $"

class ET_SHARED_CLASS_CODES

feature -- Access

	class_codes: ET_CLASS_CODES is
			-- Shared class codes
		once
			create Result
		ensure
			class_codes_not_void: Result /= Void
		end

end
