indexing

	description:

		"Imported case mapping routine for Unicode version 5.1.0s"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2008, Colin Adams and others"
	license: "MIT License"
	date: "$Date:  $"
	revision: "$Revision:  $"

class ST_IMPORTED_UNICODE_V510_FULL_CASE_MAPPING

feature -- Access

	case_mapping_v510: ST_UNICODE_V510_FULL_CASE_MAPPING is
			-- Unicode V5.1.0 full case mapping routines
		once
			create Result
		ensure
			case_mapping_v510_not_void: Result /= Void
		end

end
