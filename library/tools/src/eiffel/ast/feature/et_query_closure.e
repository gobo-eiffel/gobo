note

	description:

		"Eiffel closures with components common to queries (functions or attributes)"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

deferred class ET_QUERY_CLOSURE

inherit

	ET_CLOSURE
		redefine
			type
		end

feature -- Access

	type: ET_TYPE
			-- Return type
		do
			Result := declared_type.type
		ensure then
			type_not_void: Result /= Void
		end

	declared_type: ET_DECLARED_TYPE
			-- Declared type (type preceded by a colon)

invariant

	declared_type_not_void: declared_type /= Void

end
