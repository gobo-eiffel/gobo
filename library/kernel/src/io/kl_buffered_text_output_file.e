note

	description:

	"[
		Text output files containing extended ASCII characters
		(8-bit code between 0 and 255), with buffer.
		The character '%N' is automatically converted to the 
		line separtor of the underlying file system when written
		to the file.
	]"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_BUFFERED_TEXT_OUTPUT_FILE

inherit

	KL_TEXT_OUTPUT_FILE
		undefine
			make,
			reset,
			put_character,
			put_string,
			open_write,
			open_append,
			recursive_open_write,
			recursive_open_append,
			flush,
			close
		end

	KL_BUFFERED_OUTPUT_FILE

create

	make,
	make_with_buffer_size,
	make_with_buffer

end
