indexing

	description:

		"Imported routines that ought to be in class OUTPUT_STREAM"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_IMPORTED_OUTPUT_STREAM_ROUTINES

obsolete

	"[020502] Use descendants of KI_OUTPUT_STREAM instead."

feature -- Access

	OUTPUT_STREAM_: KL_OUTPUT_STREAM_ROUTINES is
			-- Routines that ought to be in class OUTPUT_STREAM
		once
			create Result
		ensure
			output_stream_routines_not_void: Result /= Void
		end

feature -- Type anchors





	OUTPUT_STREAM_TYPE: OUTPUT_STREAM is do end




			-- Type anchor

end
