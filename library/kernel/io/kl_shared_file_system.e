indexing

	description:

		"Shared file system"

	pattern:    "Singleton"
	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class KL_SHARED_FILE_SYSTEM

feature -- Access

	file_system: KL_FILE_SYSTEM is
			-- File system
		once
			!! Result.make
		ensure
			file_system_not_void: Result /= Void
		end

end -- class KL_SHARED_FILE_SYSTEM
