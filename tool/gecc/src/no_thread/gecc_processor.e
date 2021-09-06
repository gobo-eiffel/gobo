note

	description:

		"[
			Do nothing.
		]"

	copyright: "Copyright (c) 2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GECC_PROCESSOR

feature -- Basic operations

	process (a_process: PROCEDURE; a_thread_count: INTEGER)
			-- Do nothing.
		require
			a_process_not_void: a_process /= Void
			a_thread_count_positive: a_thread_count >= 1
		do
		end

end
