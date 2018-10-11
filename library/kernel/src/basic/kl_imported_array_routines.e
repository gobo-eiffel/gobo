note

	description:

		"Imported routines that ought to be in class ARRAY"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_IMPORTED_ARRAY_ROUTINES

feature -- Access

	ANY_ARRAY_: KL_ARRAY_ROUTINES [detachable ANY]
			-- Routines that ought to be in class ARRAY
		once
			create Result
		ensure
			instance_free: class
			any_array_routines_not_void: Result /= Void
		end

	INTEGER_ARRAY_: KL_ARRAY_ROUTINES [INTEGER]
			-- Routines that ought to be in class ARRAY
		once
			create Result
		ensure
			instance_free: class
			integer_array_routines_not_void: Result /= Void
		end

	BOOLEAN_ARRAY_: KL_ARRAY_ROUTINES [BOOLEAN]
			-- Routines that ought to be in class ARRAY
		once
			create Result
		ensure
			instance_free: class
			boolean_array_routines_not_void: Result /= Void
		end

	STRING_ARRAY_: KL_ARRAY_ROUTINES [detachable STRING]
			-- Routines that ought to be in class ARRAY
		once
			create Result
		ensure
			instance_free: class
			string_array_routines_not_void: Result /= Void
		end

	string_array_routines: KL_ARRAY_ROUTINES [STRING]
			-- Routines that ought to be in class ARRAY
		once
			create Result
		ensure
			instance_free: class
			string_array_routines_not_void: Result /= Void
		end

	detachable_string_array_routines: KL_ARRAY_ROUTINES [detachable STRING]
			-- Routines that ought to be in class ARRAY
		once
			create Result
		ensure
			instance_free: class
			detachable_string_array_routines_not_void: Result /= Void
		end

	ARRAY_SPECIAL_INTEGER_: KL_ARRAY_ROUTINES [detachable SPECIAL [INTEGER]]
			-- Routines that ought to be in class ARRAY
		once
			create Result
		ensure
			instance_free: class
			special_integer_array_routines_not_void: Result /= Void
		end

end
