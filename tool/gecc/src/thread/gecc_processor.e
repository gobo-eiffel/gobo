note

	description:

		"[
			Call an agent on several threads.
		]"

	copyright: "Copyright (c) 2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GECC_PROCESSOR

feature -- Basic operations

	process (a_process: PROCEDURE; a_thread_count: INTEGER)
			-- Call `a_process' on `a_thread_count' threads.
		require
			a_process_not_void: a_process /= Void
			a_thread_count_positive: a_thread_count >= 1
		local
			i: INTEGER
			l_thread: WORKER_THREAD
			nb: INTEGER
		do
			from
				i := 1
				nb := a_thread_count - 1
			until
				i > nb
			loop
				create l_thread.make (a_process)
				l_thread.launch
					-- Sleep a little bit so that the first
					-- lines are executed in order.
				{EXECUTION_ENVIRONMENT}.sleep (1000)
				i := i + 1
			end
			a_process.call ([])
			{THREAD_CONTROL}.join_all
		end

end
