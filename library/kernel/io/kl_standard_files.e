note

	description:

		"Standard files"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999-2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_STANDARD_FILES

feature -- Access

	input: KL_STDIN_FILE
			-- Standard input file
		once
			create Result.make
		ensure
			file_not_void: Result /= Void
			file_open_read: Result.is_open_read
		end

	output: KL_STDOUT_FILE
			-- Standard output file
		once
			create Result.make
		ensure
			file_not_void: Result /= Void
			file_open_write: Result.is_open_write
		end

	error: KL_STDERR_FILE
			-- Standard error file
		once
			create Result.make
		ensure
			file_not_void: Result /= Void
			file_open_write: Result.is_open_write
		end

end
