indexing

	description:

		"Imported character class routines"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class UC_IMPORTED_CHARACTER_CLASS_ROUTINES

feature -- Access

	unicode_character_class: UC_CHARACTER_CLASS_ROUTINES is
			-- Unicode character class routines
		once
			create Result
		ensure
			unicode_character_class_not_void: Result /= Void
		end

end
