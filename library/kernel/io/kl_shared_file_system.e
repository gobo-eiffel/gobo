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

	KL_OPERATING_SYSTEM
		export {NONE} all end

feature -- Access

	eol: STRING is
			-- Line separator on the underlying operating system
		once
			Result := file_system.eol
		ensure
			eol_not_void: Result /= Void
			eol_not_empty: Result.count > 0
		end

feature -- File systems

	file_system: KL_FILE_SYSTEM is
			-- Underlying file system
		once
			if is_windows then
				Result := windows_file_system
			elseif is_unix or is_linux then
				Result := unix_file_system
			elseif is_macos then
				Result := macos_file_system
			else
					-- Use Unix-like file system by default.
				Result := unix_file_system
			end
		ensure
			file_system_not_void: Result /= Void
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

	macos_file_system: KL_MACOS_FILE_SYSTEM is
			-- MacOS-like file system
		once
			!! Result.make
		ensure
			file_system_not_void: Result /= Void
		end

end -- class KL_SHARED_FILE_SYSTEM
