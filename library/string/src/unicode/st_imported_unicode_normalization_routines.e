note

	description:

		"Imported normalization routines"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2005-2018, Colin Adams and others"
	license: "MIT License"

class ST_IMPORTED_UNICODE_NORMALIZATION_ROUTINES

feature -- Access

	normalization: ST_UNICODE_NORMALIZATION_ROUTINES
			-- Unicode character class routines
		once
			create Result
		ensure
			instance_free: class
			normalization_not_void: Result /= Void
		end

end
