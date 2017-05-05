class MY_THREAD2

inherit

	THREAD
		rename
			terminated as thread_terminated
		end

create

	make

feature -- Access

	attr: INTEGER
			-- My attribute

feature -- Basic operations

	execute
			-- <Precursor>
		local
			i: INTEGER
		do
			sleep (1_000_000_000)
			from
				i := 1
			until
				i > 10_000
			loop
				attr := i
				i := i + 1
			end
		end

end
