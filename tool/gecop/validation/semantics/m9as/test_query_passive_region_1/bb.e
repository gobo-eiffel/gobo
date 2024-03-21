class BB

create

	make

feature

	make
		do
		end

	g: INTEGER
		do
			{EXECUTION_ENVIRONMENT}.sleep (500_000_000)
			print ("End of BB.g%N")
		end

end
