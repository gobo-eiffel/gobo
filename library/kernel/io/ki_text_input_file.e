indexing

	description:

		"Interface for text input files containing extended ASCII %
		%characters (8-bit code between 0 and 255)"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KI_TEXT_INPUT_FILE

inherit

	KI_INPUT_FILE

	KI_TEXT_INPUT_STREAM
		undefine
			is_closable,
			close,
			read_to_string,
			valid_unread_character
		end

end
