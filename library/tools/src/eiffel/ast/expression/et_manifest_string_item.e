note

	description:

		"Eiffel manifest strings which appear in a comma-separated list of manifest strings"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"

deferred class ET_MANIFEST_STRING_ITEM

inherit

	ET_AST_NODE

feature -- Access

	manifest_string: ET_MANIFEST_STRING
			-- Manifest string in comma-separated list
		deferred
		ensure
			manifest_string_not_void: Result /= Void
		end

end
