note

	description:

		"Imported normalization routines for Unicode version 5.1.0"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2008-2018, Colin Adams and others"
	license: "MIT License"

class ST_IMPORTED_UNICODE_V510_NORMALIZATION_ROUTINES

feature -- Access

	normalization_v510: ST_UNICODE_V510_NORMALIZATION_ROUTINES
			-- Unicode V510 normalization routines
		once
			create Result
		ensure
			instance_free: class
			normalization_v510_not_void: Result /= Void
		end

end
