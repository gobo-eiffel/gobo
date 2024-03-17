class BB

create

	make

feature

	make
		do
		end

	g (a: separate STRING)
		do
			{EXECUTION_ENVIRONMENT}.sleep (200_000_000)
			print ("End of BB.g%N")
		end

end
