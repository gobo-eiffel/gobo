note

	description:

		"Shared instance of UT_URL_ENCODING"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2004-2018, Eric Bezault and others"
	license: "MIT License"

class UT_SHARED_URL_ENCODING

feature -- Access

	Url_encoding: UT_URL_ENCODING
			-- Shared instance of URL encoding routines
		once
			create Result
		ensure
			instance_free: class
			url_encoding_not_void: Result /= Void
		end

end
