note

	description:

		"Eiffel object-test local names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"

deferred class ET_OBJECT_TEST_LOCAL_NAME

inherit

	ET_EXPRESSION

feature -- Access

	identifier: ET_IDENTIFIER
			-- Identifier
		deferred
		ensure
			identifier_not_void: Result /= Void
		end

end
