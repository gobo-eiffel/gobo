note

	description:

	"[
		Binary output files containing extended ASCII
		characters (8-bit code between 0 and 255), with buffer.
	]"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_BUFFERED_BINARY_OUTPUT_FILE

inherit

	KL_BINARY_OUTPUT_FILE
		undefine
			make,
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
