﻿note

	description:

		"Imported UTF-8 encoding routines"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2018, Eric Bezault and others"
	license: "MIT License"

class UC_IMPORTED_UTF8_ROUTINES

feature -- Access

	utf8: UC_UTF8_ROUTINES
			-- UTF-8 encoding routines
		once
			create Result
		ensure
			instance_free: class
			utf8_not_void: Result /= Void
		end

end
