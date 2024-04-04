class CC

create

	make

feature

	make
		do
		end

	f (s: separate STRING)
		do
			print (create {STRING}.make_from_separate (s) + " calling CC.f%N")
			{EXECUTION_ENVIRONMENT}.sleep (100_000_000)
		end

end
