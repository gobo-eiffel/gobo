class CC

create

	make

feature

	make
		do
		end

	f (s: separate STRING)
		do
			{EXECUTION_ENVIRONMENT}.sleep (50_000_000)
			print (create {STRING}.make_from_separate (s) + " calling CC.f%N")
			{EXECUTION_ENVIRONMENT}.sleep (50_000_000)
		end

	other: CC
		do
			create Result.make
		end

end
