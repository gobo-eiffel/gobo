indexing

	description:

		"Shared file systems"

	pattern:    "Singleton"
	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class KL_SHARED_FILE_SYSTEM

inherit

	KL_SHARED_OPERATING_SYSTEM
		export {NONE} all end

feature -- File systems

	file_system: KL_FILE_SYSTEM is
			-- Underlying file system
		once
			if operating_system.is_windows then
				Result := windows_file_system
			elseif operating_system.is_unix then
				Result := unix_file_system
			else
					-- Use Unix-like file system by default.
				Result := unix_file_system
			end
		ensure
			file_system_not_void: Result /= Void
			current_file_system: Result.is_current_file_system
		end

	windows_file_system: KL_WINDOWS_FILE_SYSTEM is
			-- Windows-like file system
		once
			!! Result.make
		ensure
			file_system_not_void: Result /= Void
		end

	unix_file_system: KL_UNIX_FILE_SYSTEM is
			-- Unix-like file system
		once
			!! Result.make
		ensure
			file_system_not_void: Result /= Void
		end

end -- class KL_SHARED_FILE_SYSTEM
