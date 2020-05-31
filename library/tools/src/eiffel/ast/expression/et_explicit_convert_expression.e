note

	description:

		"Eiffel conversion expressions to be made explicit"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_EXPLICIT_CONVERT_EXPRESSION

inherit

	ET_CONVERT_EXPRESSION

feature -- Access

	source_type: ET_TYPE
			-- Type of `expression'
		deferred
		ensure
			source_type_not_void: Result /= Void
		end

	target_type: ET_TYPE
			-- Expected type for `expression' (after conversion)
		deferred
		ensure
			target_type_not_void: Result /= Void
		end

end
