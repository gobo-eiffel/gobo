indexing

	description:

		"Shared file systems"

	pattern: "Singleton"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class KL_SHARED_FILE_SYSTEM

inherit

	ANY -- Export features of ANY.

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
			-- Windows-like file system which accepts both
			-- \ and / as directory separator
		once
			create Result.make
		ensure
			file_system_not_void: Result /= Void
		end

	windows_backslash_only_file_system: KL_WINDOWS_FILE_SYSTEM is
			-- Windows-like file system which accepts only \ as
			-- directory separator
		once
			create Result.make_backslash_only
		ensure
			file_system_not_void: Result /= Void
		end

	unix_file_system: KL_UNIX_FILE_SYSTEM is
			-- Unix-like file system
		once
			create Result.make
		ensure
			file_system_not_void: Result /= Void
		end

end
