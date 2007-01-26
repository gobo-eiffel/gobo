indexing

	description:

		"Shared access to file: URI routines"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UT_SHARED_FILE_URI_ROUTINES

feature -- Access

	File_uri: UT_FILE_URI_ROUTINES is
			-- Shared file: URI routines
		once
			create Result
		ensure
			file_uri_not_void: Result /= Void
		end

end
