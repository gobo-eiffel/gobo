indexing
	description: "[
		References to objects containing reference to object
		meant to be exchanged with non-Eiffel software.
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

expanded class TYPED_POINTER [G]

inherit
	POINTER_REF
		rename
			item as pointer_item
		export
			{TYPED_POINTER} pointer_item
		end

convert
	to_pointer: {POINTER},
	to_reference: {POINTER_REF, HASHABLE, ANY}

feature -- Conversion

	to_pointer: POINTER is
			-- Convert to POINTER instance.
		do
			Result := pointer_item
		end

end
