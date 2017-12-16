class MY_WORKER_THREAD3

inherit

	WORKER_THREAD
		rename
			terminated as thread_terminated
		end

create

	make

feature -- Access

	terminated: INTEGER
			-- My attribute

end