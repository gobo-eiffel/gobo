note

	description:

		"Imported case mapping routine for Unicode version 5.0.0s"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2008, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_IMPORTED_UNICODE_V500_FULL_CASE_MAPPING

feature -- Access

	case_mapping_v500: ST_UNICODE_V500_FULL_CASE_MAPPING is
			-- Unicode V5.0.0 full case mapping routines
		once
			create Result
		ensure
			case_mapping_v500_not_void: Result /= Void
		end

end
