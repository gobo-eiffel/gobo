indexing

	description:

		"Shared input and output streams"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class KL_SHARED_STREAMS

feature -- Access

	null_output_stream: KL_NULL_TEXT_OUTPUT_STREAM is
			-- Null output stream
		once
			!! Result.make ("null")
		ensure
			null_output_stream_not_void: Result /= Void
		end

end -- class KL_SHARED_STREAMS
