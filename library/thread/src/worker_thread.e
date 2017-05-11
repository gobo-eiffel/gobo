note
	description: "Class defining an Eiffel thread of execution using an agent for its internal action."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2017-03-30 04:54:40 -0700 (Thu, 30 Mar 2017) $"
	revision: "$Revision: 100070 $"

class
	WORKER_THREAD

inherit
	THREAD
		rename
			make as thread_make,
			execute as execute_procedure
		end

create
	make, make_with_procedure

feature {NONE} -- Initialization

	make (a_action: PROCEDURE)
			-- Create worker thread for `a_action'.
		require
			thread_capable: {PLATFORM}.is_thread_capable
		do
			thread_make
			thread_procedure := a_action
		end

	make_with_procedure (a_action: PROCEDURE)
			-- Create worker thread for `a_action'.
		obsolete
			"Use `make' instead. [2017-05-31]"
		require
			thread_capable: {PLATFORM}.is_thread_capable
		do
			make (a_action)
		end

feature -- Initialization

	execute_procedure
		do
			thread_procedure.call (Void)
		end

feature {NONE} -- Implementation

	thread_procedure: PROCEDURE;
			-- Action executed when thread starts its execution.

note
	copyright: "Copyright (c) 1984-2017, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end

