class CC

create

	make

feature

	make
		do
		end

	f (i: INTEGER)
		do
			{EXECUTION_ENVIRONMENT}.sleep (200_000_000)
			if i = 1 then
				print ("DD calling CC.f%N")
			else
				print ("EE calling CC.f%N")
			end
		end

	g (s: separate STRING)
		do
			{EXECUTION_ENVIRONMENT}.sleep (50_000_000)
			print (create {STRING}.make_from_separate (s) + " calling CC.g%N")
			{EXECUTION_ENVIRONMENT}.sleep (50_000_000)
		end

end
