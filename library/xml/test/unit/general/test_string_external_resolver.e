note

	description:

		"String resolver counting events for testing"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"

class TEST_STRING_EXTERNAL_RESOLVER

inherit

	XM_STRING_EXTERNAL_RESOLVER
		redefine
			resolve,
			resolve_finish
		end

create

	make

feature -- Access

	depth: INTEGER
			-- Resolve depth

feature -- Actions

	resolve (a: STRING)
			-- Resolve a system identifier to an input stream
			-- on behalf of an XML parser.
		do
			depth := depth + 1
			Precursor (a)
		end

	resolve_finish
			-- The parser has finished with the last resolved entity.
			-- The previously resolved entity becomes the last resolved one.
			-- Note: `last_stream' is not required to be restored accordingly.
		do
			depth := depth - 1
		end

end
