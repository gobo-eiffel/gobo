note

	description:

		"Standard files"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"

class KL_STANDARD_FILES

feature -- Access

	input: KL_STDIN_FILE
			-- Standard input file
		once
			create Result.make
		ensure
			instance_free: class
			file_not_void: Result /= Void
			file_open_read: Result.is_open_read
		end

	output: KL_STDOUT_FILE
			-- Standard output file
		once
			create Result.make
		ensure
			instance_free: class
			file_not_void: Result /= Void
			file_open_write: Result.is_open_write
		end

	error: KL_STDERR_FILE
			-- Standard error file
		once
			create Result.make
		ensure
			instance_free: class
			file_not_void: Result /= Void
			file_open_write: Result.is_open_write
		end

end
