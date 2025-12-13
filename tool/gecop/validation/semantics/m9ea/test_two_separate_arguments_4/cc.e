class CC

create

	make

feature

	make
		do
		end

	fe (s: separate STRING)
		do
			print (create {STRING}.make_from_separate (s) + " calling CC.fe%N")
			{SCHEDULER}.set_value (1)
			{SCHEDULER}.wait_for_value (2)
			{SCHEDULER}.wait_for_value_with_timeout (3, 100_000_000)
		end

	fd (s: separate STRING)
		do
			print (create {STRING}.make_from_separate (s) + " calling CC.fd%N")
		end

end
