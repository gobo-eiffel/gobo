indexing

	description: 
	
		"Shared instance of UT_URL_ENCODING"

	library: "Gobo Eiffel Utility Library"
	author: "Copyright (c) 2004, Eric Bezault and others"
	date: "$Date$"
	revision: "$Revision$"

class UT_SHARED_URL_ENCODING

feature

	Url_encoding: UT_URL_ENCODING is
			-- Shared instance of URL encoding routines
		once
			create Result
		end

end

