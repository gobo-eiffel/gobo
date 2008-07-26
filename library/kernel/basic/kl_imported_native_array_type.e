indexing

	description:

		"Imported type anchor for NATIVE_ARRAY [G]. %
		%A native array is a zero-based indexed sequence of values, %
		%equipped with features `put' and `item', but the clients %
		%have to keep track of `count'."

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2002-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_IMPORTED_NATIVE_ARRAY_TYPE [G]

obsolete

	"[041219] Use SPECIAL and KL_SPECIAL_ROUTINES instead."

feature -- Type anchors

	NATIVE_ARRAY_TYPE: SPECIAL [G] is do end
			-- Type anchor

end
