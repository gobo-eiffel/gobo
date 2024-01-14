note

	description:

		"Windows-like file systems which only accept backslash as directory separator."

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2018, Eric Bezault and others"
	license: "MIT License"

class KL_WINDOWS_FILE_SYSTEM_BACKSLASH_ONLY

inherit

	KL_WINDOWS_FILE_SYSTEM
		redefine
			secondary_directory_separator
		end

create

	make

feature -- Pathname handling

	secondary_directory_separator: CHARACTER
			-- Secondary directory separator
		once
			Result := '\'
		end

end
