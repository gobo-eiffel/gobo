note

	description:

		"Imported character class routines for Unicode version 5.1.0"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2008-2018, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_IMPORTED_UNICODE_V510_CHARACTER_CLASS_ROUTINES

feature -- Access

	unicode_v510_character_class: ST_UNICODE_V510_CHARACTER_CLASS_ROUTINES
			-- Unicode version 5.1.0 character class routines
		once
			create Result
		ensure
			instance_free: class
			unicode_character_class_not_void: Result /= Void
		end

end
