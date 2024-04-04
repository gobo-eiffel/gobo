class BB

create

	make

feature

	make
		do
		end

	f (s: separate STRING)
		do
			print (create {STRING}.make_from_separate (s) + " calling BB.f%N")
			{EXECUTION_ENVIRONMENT}.sleep (100_000_000)
		end

	other: BB
		do
			create Result.make
		end
		
end
