indexing

	description:

		"Interface for text output files"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class KI_TEXT_OUTPUT_FILE

inherit

	KI_OUTPUT_FILE

	KI_TEXT_OUTPUT_STREAM
		undefine
			is_closable, close
		end

end
