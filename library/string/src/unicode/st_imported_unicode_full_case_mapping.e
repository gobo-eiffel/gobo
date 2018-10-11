note

	description:

		"Imported case mapping routines"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2008-2018, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_IMPORTED_UNICODE_FULL_CASE_MAPPING

feature -- Access

	case_mapping: ST_UNICODE_FULL_CASE_MAPPING
			-- Unicode full case mapping routines
		once
			create Result
		ensure
			instance_free: class
			case_mapping_not_void: Result /= Void
		end

end
