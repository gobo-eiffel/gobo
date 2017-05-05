class MY_THREAD4

inherit

	THREAD
		rename
			terminated as thread_terminated
		end

create

	make

feature -- Access

	terminated: INTEGER
			-- My attribute

feature -- Basic operations

	execute
			-- <Precursor>
		do
		end

end