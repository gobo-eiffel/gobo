indexing

	description:

		"Imported routines that ought to be in class FIXED_ARRAY. %
		%A fixed array is a zero-based indexed sequence of values, %
		%equipped with features `put', `item' and `count'."

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_IMPORTED_FIXED_ARRAY_ROUTINES

obsolete

	"[041219] Use SPECIAL and KL_SPECIAL_ROUTINES instead."

feature -- Access

	FIXED_ANY_ARRAY_: KL_FIXED_ARRAY_ROUTINES [ANY] is
			-- Routines that ought to be in class FIXED_ARRAY
		once
			create Result
		ensure
			fixed_any_array_routines_not_void: Result /= Void
		end

	FIXED_BOOLEAN_ARRAY_: KL_FIXED_ARRAY_ROUTINES [BOOLEAN] is
			-- Routines that ought to be in class FIXED_ARRAY
		once
			create Result
		ensure
			fixed_boolean_array_routines_not_void: Result /= Void
		end

	FIXED_CHARACTER_ARRAY_: KL_FIXED_ARRAY_ROUTINES [CHARACTER] is
			-- Routines that ought to be in class FIXED_ARRAY
		once
			create Result
		ensure
			fixed_character_array_routines_not_void: Result /= Void
		end

	FIXED_INTEGER_ARRAY_: KL_FIXED_ARRAY_ROUTINES [INTEGER] is
			-- Routines that ought to be in class FIXED_ARRAY
		once
			create Result
		ensure
			fixed_integer_array_routines_not_void: Result /= Void
		end

	FIXED_STRING_ARRAY_: KL_FIXED_ARRAY_ROUTINES [STRING] is
			-- Routines that ought to be in class FIXED_ARRAY
		once
			create Result
		ensure
			fixed_string_array_routines_not_void: Result /= Void
		end

feature -- Type anchors


	FIXED_ANY_ARRAY_TYPE: SPECIAL [ANY] is do end
	FIXED_BOOLEAN_ARRAY_TYPE: SPECIAL [BOOLEAN] is do end
	FIXED_CHARACTER_ARRAY_TYPE: SPECIAL [CHARACTER] is do end
	FIXED_INTEGER_ARRAY_TYPE: SPECIAL [INTEGER] is do end
	FIXED_STRING_ARRAY_TYPE: SPECIAL [STRING] is do end















			-- Type anchors

end
