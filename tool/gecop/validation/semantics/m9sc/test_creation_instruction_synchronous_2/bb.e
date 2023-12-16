class BB

create

	make

feature

	make (a: separate STRING)
		do
			{EXECUTION_ENVIRONMENT}.sleep (1_000_000_000)
			print ("End of B.make%N")
		end

end
