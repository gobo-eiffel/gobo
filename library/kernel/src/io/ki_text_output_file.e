note

	description:

		"Interface for text output files containing extended ASCII %
		%characters (8-bit code between 0 and 255)"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"

deferred class KI_TEXT_OUTPUT_FILE

inherit

	KI_OUTPUT_FILE

	KI_TEXT_OUTPUT_STREAM
		undefine
			is_closable,
			close
		end

end
