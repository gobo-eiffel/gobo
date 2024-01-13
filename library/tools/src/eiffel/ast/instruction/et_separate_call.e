note

	description:

		"Eiffel calls whose target type is separate"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2023-2024, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_SEPARATE_CALL

inherit

	ET_CALL_WITH_ACTUAL_ARGUMENTS

	HASHABLE

feature -- Access

	target: ET_EXPRESSION
			-- Target
		deferred
		ensure then
			target_not_void: Result /= Void
		end

	hash_code: INTEGER
			-- Hash code value
		do
			Result := name.hash_code
		end

end
