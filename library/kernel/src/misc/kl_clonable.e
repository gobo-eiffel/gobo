note

	description:

		"Clonable objects"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_CLONABLE

inherit

	ANY

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

feature -- Duplication

	cloned_object: like Current
			-- Clone of current object
		do
			Result := twin
		ensure
			cloned_not_void: Result /= Void
			same_type: ANY_.same_types (Result, Current)
			is_equal: Result.is_equal (Current)
		end

end
