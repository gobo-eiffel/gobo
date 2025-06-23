note

	description:

		"Special objects  of references read from Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_SPECIAL_REFERENCE_OBJECT

inherit

	SB_COMPOSITE_SPECIAL_OBJECT
		redefine
			is_special_reference
		end

create

	make

feature -- Status report

	is_special_reference: BOOLEAN = True
			-- Is current object a SPECIAL object of references?

end
