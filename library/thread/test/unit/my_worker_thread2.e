class MY_WORKER_THREAD2

inherit

	WORKER_THREAD
		rename
			terminated as thread_terminated
		end

create

	make

feature -- Access

	terminated: BOOLEAN
			-- New terminated attribute

feature -- Setting

	set_terminated (b: BOOLEAN)
			-- Set `terminated' to `b'.
		do
			terminated := b
		ensure
			terminated_set: terminated = b
		end

end
