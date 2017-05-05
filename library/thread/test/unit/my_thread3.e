class MY_THREAD3

inherit

	THREAD
		rename
			terminated as thread_terminated
		end

create

	make

feature -- Access

	terminated: BOOLEAN
			-- New terminated attribute

	attr: INTEGER
			-- My attribute

feature -- Basic operations

	execute
			-- <Precursor>
		local
			i: INTEGER
		do
			terminated := True
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
