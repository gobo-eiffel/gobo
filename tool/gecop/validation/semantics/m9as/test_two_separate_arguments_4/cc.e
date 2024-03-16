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
			print ((create {STRING}.make_from_separate (s)))
			print (" calling CC.f%N")
			{EXECUTION_ENVIRONMENT}.sleep (50_000_000)
		end

end
