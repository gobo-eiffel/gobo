note

	description:

		"Objects of basic types (INTEGER, etc.) read from Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class SB_BASIC_OBJECT

inherit

	SB_OBJECT
		redefine
			is_basic
		end

feature -- Status report

	is_basic: BOOLEAN = True
			-- Is current object an object of basic type?

end
