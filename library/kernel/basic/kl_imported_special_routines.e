indexing

	description:

		"Imported routines that ought to be in class SPECIAL. %
		%A special object is a zero-based indexed sequence of values, %
		%equipped with features `put', `item' and `count'."

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_IMPORTED_SPECIAL_ROUTINES

feature -- Access

	SPECIAL_ANY_: KL_SPECIAL_ROUTINES [ANY] is
			-- Routines that ought to be in class SPECIAL
		once
			create Result
		ensure
			special_any_routines_not_void: Result /= Void
		end

	SPECIAL_BOOLEAN_: KL_SPECIAL_ROUTINES [BOOLEAN] is
			-- Routines that ought to be in class SPECIAL
		once
			create Result
		ensure
			special_boolean_routines_not_void: Result /= Void
		end

	SPECIAL_CHARACTER_: KL_SPECIAL_ROUTINES [CHARACTER] is
			-- Routines that ought to be in class SPECIAL
		once
			create Result
		ensure
			special_character_routines_not_void: Result /= Void
		end

	SPECIAL_INTEGER_: KL_SPECIAL_ROUTINES [INTEGER] is
			-- Routines that ought to be in class SPECIAL
		once
			create Result
		ensure
			special_integer_routines_not_void: Result /= Void
		end

	SPECIAL_STRING_: KL_SPECIAL_ROUTINES [STRING] is
			-- Routines that ought to be in class SPECIAL
		once
			create Result
		ensure
			special_string_routines_not_void: Result /= Void
		end

end
