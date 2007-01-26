indexing

	description:

		"Imported character class routines for Unicode version 5.0.0"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2006, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_IMPORTED_UNICODE_V500_CHARACTER_CLASS_ROUTINES

feature -- Access

	unicode_v500_character_class: ST_UNICODE_V500_CHARACTER_CLASS_ROUTINES is
			-- Unicode version 5.0.0 character class routines
		once
			create Result
		ensure
			unicode_character_class_not_void: Result /= Void
		end

end
