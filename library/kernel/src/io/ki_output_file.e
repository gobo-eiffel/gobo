note

	description:

		"Interface for output files containing extended ASCII %
		%characters (8-bit code between 0 and 255)"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"

deferred class KI_OUTPUT_FILE

inherit

	KI_FILE
		rename
			open as open_write,
			is_open as is_open_write
		end

	KI_CHARACTER_OUTPUT_STREAM
		undefine
			is_closable,
			close
		end

feature -- Basic operations

	open_append
			-- Open current file in append mode if it
			-- can be opened, let it closed otherwise.
			-- If the file is successfully opened, it is
			-- either created if it didn't exist or the
			-- data which will be written to the file will
			-- appear after its old content otherwise.
		require
			is_closed: is_closed
		deferred
		end

	recursive_open_write
			-- Open current file in write-only mode if
			-- it can be opened, let it closed otherwise.
			-- If the file is successfully opened, it is
			-- either created if it didn't exist or its
			-- old content is removed otherwise. Try to
			-- recursively create its parent directory
			-- if it does not exist yet.
		require
			is_closed: is_closed
		deferred
		end

	recursive_open_append
			-- Open current file in append mode if it
			-- can be opened, let it closed otherwise.
			-- If the file is successfully opened, it is
			-- either created if it didn't exist or the
			-- data which will be written to the file will
			-- appear after its old content otherwise.
			-- Try to recursively create its parent directory
			-- if it does not exist yet.
		require
			is_closed: is_closed
		deferred
		end

end
