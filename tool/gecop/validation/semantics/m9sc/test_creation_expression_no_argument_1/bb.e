class BB

create

	make

feature

	make
		do
			{EXECUTION_ENVIRONMENT}.sleep (1_000_000_000)
			print ("End of B.make%N")
		end

end
